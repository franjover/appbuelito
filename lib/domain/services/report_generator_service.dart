import 'dart:typed_data';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import '../../data/local/database/app_database.dart';

/// Generates PDF reports from local patient data.
class ReportGeneratorService {
  final AppDatabase _db;

  ReportGeneratorService(this._db);

  /// Generate a PDF report for the given date range.
  Future<Uint8List> generateReport(DateTime start, DateTime end) async {
    // Fetch data
    final flows = await _db.reportDao.getFlowsForReport(start, end);
    final inhalerCount = await _db.reportDao.countInhalerUsesInRange(start, end);
    final episodeCount = await _db.reportDao.countEpisodesInRange(start, end);
    final classification = await _db.reportDao.countDaysByClassification(start, end);
    final emergencyEvents = await _db.reportDao.getEmergencyEventsInRange(start, end);
    final profile = await _db.userDao.getProfile();

    final patientName = profile?.name ?? 'Paciente';
    final dateFormat = DateFormat('dd/MM/yyyy');
    final now = DateTime.now();

    final pdf = pw.Document();

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(40),
        header: (context) => _buildHeader(
          patientName,
          dateFormat.format(start),
          dateFormat.format(end),
          dateFormat.format(now),
        ),
        footer: (context) => _buildFooter(context),
        build: (context) => [
          // Summary section
          _sectionTitle('Resumen del periodo'),
          pw.SizedBox(height: 8),
          _summaryTable(flows.length, classification, inhalerCount, episodeCount),
          pw.SizedBox(height: 20),

          // Day by day table
          if (flows.isNotEmpty) ...[
            _sectionTitle('Detalle dia a dia'),
            pw.SizedBox(height: 8),
            _flowsTable(flows, dateFormat),
            pw.SizedBox(height: 20),
          ],

          // Emergency events
          if (emergencyEvents.isNotEmpty) ...[
            _sectionTitle('Eventos de emergencia'),
            pw.SizedBox(height: 8),
            _emergencyTable(emergencyEvents, DateFormat('dd/MM HH:mm')),
          ],

          // Interpretation guide
          pw.SizedBox(height: 20),
          _sectionTitle('Como leer este informe'),
          pw.SizedBox(height: 8),
          _interpretationSection(),
          pw.SizedBox(height: 20),

          // No data message
          if (flows.isEmpty)
            pw.Center(
              child: pw.Padding(
                padding: const pw.EdgeInsets.all(40),
                child: pw.Text(
                  'No hay datos registrados en este periodo.',
                  style: pw.TextStyle(fontSize: 14, fontStyle: pw.FontStyle.italic),
                ),
              ),
            ),
        ],
      ),
    );

    return pdf.save();
  }

  pw.Widget _buildHeader(
      String name, String startDate, String endDate, String generated) {
    return pw.Container(
      margin: const pw.EdgeInsets.only(bottom: 20),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text('Informe de salud - Appbuelito',
              style: pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold)),
          pw.SizedBox(height: 4),
          pw.Text('Paciente: $name', style: const pw.TextStyle(fontSize: 12)),
          pw.Text('Periodo: $startDate — $endDate',
              style: const pw.TextStyle(fontSize: 12)),
          pw.Text('Generado: $generated',
              style: const pw.TextStyle(fontSize: 10, color: PdfColors.grey600)),
          pw.Divider(),
        ],
      ),
    );
  }

  pw.Widget _buildFooter(pw.Context context) {
    return pw.Container(
      margin: const pw.EdgeInsets.only(top: 10),
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          pw.Text('Generado por Appbuelito',
              style: const pw.TextStyle(fontSize: 8, color: PdfColors.grey500)),
          pw.Text('Pagina ${context.pageNumber} de ${context.pagesCount}',
              style: const pw.TextStyle(fontSize: 8, color: PdfColors.grey500)),
        ],
      ),
    );
  }

  pw.Widget _sectionTitle(String title) {
    return pw.Text(title,
        style: pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold));
  }

  pw.Widget _summaryTable(
    int totalDays,
    Map<String, int> classification,
    int inhalerUses,
    int episodes,
  ) {
    return pw.TableHelper.fromTextArray(
      headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 11),
      cellStyle: const pw.TextStyle(fontSize: 11),
      cellAlignment: pw.Alignment.center,
      headerDecoration: const pw.BoxDecoration(color: PdfColors.grey200),
      headers: ['Metrica', 'Valor'],
      data: [
        ['Dias registrados', '$totalDays'],
        ['Dias verdes (estable)', '${classification['green'] ?? 0}'],
        ['Dias amarillos (regular)', '${classification['yellow'] ?? 0}'],
        ['Dias rojos (mal dia)', '${classification['red'] ?? 0}'],
        ['Usos inhalador rescate', '$inhalerUses'],
        ['Episodios de ahogo', '$episodes'],
      ],
    );
  }

  pw.Widget _flowsTable(List<DailyFlow> flows, DateFormat dateFormat) {
    return pw.TableHelper.fromTextArray(
      headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 9),
      cellStyle: const pw.TextStyle(fontSize: 9),
      cellAlignment: pw.Alignment.center,
      headerDecoration: const pw.BoxDecoration(color: PdfColors.grey200),
      headers: ['Fecha', 'Clasificacion', 'Puntuacion', 'Estabilidad', 'Notas'],
      data: flows.map((flow) {
        final classLabel = switch (flow.dayClassification) {
          'green' => 'Verde',
          'yellow' => 'Amarillo',
          'red' => 'Rojo',
          _ => '-',
        };
        return [
          dateFormat.format(flow.flowDate),
          classLabel,
          flow.morningScore?.toStringAsFixed(0) ?? '-',
          flow.respiratoryStabilityScore?.toStringAsFixed(0) ?? '-',
          flow.eveningNotes ?? '',
        ];
      }).toList(),
    );
  }

  pw.Widget _interpretationSection() {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.TableHelper.fromTextArray(
          headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 10),
          cellStyle: const pw.TextStyle(fontSize: 10),
          headerDecoration: const pw.BoxDecoration(color: PdfColors.grey200),
          headers: ['Concepto', 'Significado'],
          data: [
            ['Dia verde (<=10 pts)', 'Dia estable. El paciente respira bien, duerme bien y tiene poca tos. Se realizan ejercicios completos.'],
            ['Dia amarillo (11-17 pts)', 'Dia regular. Algunos sintomas moderados. Se reduce la intensidad de los ejercicios.'],
            ['Dia rojo (>17 pts)', 'Mal dia. Sintomas importantes. Solo se hacen ejercicios de respiracion y relajacion suaves.'],
            ['Puntuacion (5-25)', 'Suma de 5 preguntas matutinas (respiracion, sueno, fatiga, tos, flema). Cada una de 1 (muy bien) a 5 (muy mal).'],
            ['Escala de sintomas (1-5)', '1 = muy bien / nada, 2 = bien / poco, 3 = normal, 4 = mal / bastante, 5 = muy mal / mucho.'],
            ['Inhalador de rescate', 'Cada uso registrado indica un momento de dificultad respiratoria. Mas usos = peor control.'],
            ['Episodio de ahogo', 'Activacion del flujo de emergencia "Me ahogo". Indica crisis respiratoria aguda.'],
          ],
        ),
        pw.SizedBox(height: 8),
        pw.Text(
          'Que vigilar: aumento progresivo de la puntuacion diaria, dias rojos consecutivos, '
          'aumento de uso del inhalador de rescate, o episodios de ahogo frecuentes. '
          'Ante cualquier cambio significativo, consulte con su medico.',
          style: const pw.TextStyle(fontSize: 9, color: PdfColors.grey700),
        ),
        pw.SizedBox(height: 4),
        pw.Text(
          'Este informe es orientativo y no sustituye la valoracion medica profesional.',
          style: pw.TextStyle(fontSize: 9, fontWeight: pw.FontWeight.bold, color: PdfColors.red800),
        ),
      ],
    );
  }

  pw.Widget _emergencyTable(
      List<EmergencyEvent> events, DateFormat dateFormat) {
    return pw.TableHelper.fromTextArray(
      headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 10),
      cellStyle: const pw.TextStyle(fontSize: 10),
      headerDecoration: const pw.BoxDecoration(color: PdfColors.red50),
      headers: ['Fecha/Hora', 'Tipo', 'Contacto', 'Resultado'],
      data: events.map((e) {
        return [
          dateFormat.format(e.timestamp),
          e.type,
          e.contactCalled ?? '-',
          e.result ?? '-',
        ];
      }).toList(),
    );
  }
}
