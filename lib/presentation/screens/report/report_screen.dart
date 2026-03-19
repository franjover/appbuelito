import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:printing/printing.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/large_button.dart';
import '../../../core/widgets/large_card.dart';
import '../../providers/app_providers.dart';

/// Screen for generating, previewing, and sharing PDF health reports.
class ReportScreen extends ConsumerStatefulWidget {
  const ReportScreen({super.key});

  @override
  ConsumerState<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends ConsumerState<ReportScreen> {
  String _selectedRange = 'week';
  DateTimeRange? _customRange;
  Uint8List? _pdfBytes;
  bool _isGenerating = false;

  DateTimeRange _getDateRange() {
    final now = DateTime.now();
    switch (_selectedRange) {
      case 'week':
        return DateTimeRange(
          start: now.subtract(const Duration(days: 7)),
          end: now,
        );
      case 'month':
        return DateTimeRange(
          start: DateTime(now.year, now.month - 1, now.day),
          end: now,
        );
      case 'custom':
        return _customRange ??
            DateTimeRange(
              start: now.subtract(const Duration(days: 7)),
              end: now,
            );
      default:
        return DateTimeRange(
          start: now.subtract(const Duration(days: 7)),
          end: now,
        );
    }
  }

  Future<void> _generateReport() async {
    setState(() => _isGenerating = true);

    try {
      final range = _getDateRange();
      final service = ref.read(reportGeneratorServiceProvider);
      final bytes = await service.generateReport(range.start, range.end);
      if (mounted) {
        setState(() => _pdfBytes = bytes);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error generando informe: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _isGenerating = false);
    }
  }

  Future<void> _shareReport() async {
    if (_pdfBytes == null) return;

    final dir = await getTemporaryDirectory();
    final file = File('${dir.path}/informe_appbuelito.pdf');
    await file.writeAsBytes(_pdfBytes!);

    await Share.shareXFiles(
      [XFile(file.path)],
      subject: 'Informe de salud - Appbuelito',
      text: 'Adjunto el informe de salud generado por Appbuelito.',
    );
  }

  Future<void> _selectCustomRange() async {
    final now = DateTime.now();
    final picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(now.year - 1),
      lastDate: now,
      initialDateRange: _customRange ??
          DateTimeRange(
            start: now.subtract(const Duration(days: 7)),
            end: now,
          ),
      locale: const Locale('es'),
    );

    if (picked != null) {
      setState(() {
        _selectedRange = 'custom';
        _customRange = picked;
        _pdfBytes = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Informe para la familia')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Periodo del informe',
                style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 12),

            // Range selector
            Wrap(
              spacing: 8,
              children: [
                ChoiceChip(
                  label: const Text('Ultima semana'),
                  selected: _selectedRange == 'week',
                  onSelected: (_) => setState(() {
                    _selectedRange = 'week';
                    _pdfBytes = null;
                  }),
                ),
                ChoiceChip(
                  label: const Text('Ultimo mes'),
                  selected: _selectedRange == 'month',
                  onSelected: (_) => setState(() {
                    _selectedRange = 'month';
                    _pdfBytes = null;
                  }),
                ),
                ChoiceChip(
                  label: const Text('Personalizado'),
                  selected: _selectedRange == 'custom',
                  onSelected: (_) => _selectCustomRange(),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Generate button
            LargeButton(
              text: _isGenerating ? 'Generando...' : 'Generar informe',
              icon: Icons.picture_as_pdf,
              onPressed: _isGenerating ? null : _generateReport,
            ),

            const SizedBox(height: 24),

            // PDF preview
            if (_pdfBytes != null) ...[
              Text('Vista previa',
                  style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 12),

              SizedBox(
                height: 400,
                child: PdfPreview(
                  build: (_) async => _pdfBytes!,
                  canChangePageFormat: false,
                  canChangeOrientation: false,
                  canDebug: false,
                  allowPrinting: true,
                  allowSharing: false,
                  pdfFileName: 'informe_appbuelito.pdf',
                ),
              ),

              const SizedBox(height: 16),

              // Share button
              LargeButton(
                text: 'Compartir informe',
                icon: Icons.share,
                variant: LargeButtonVariant.success,
                onPressed: _shareReport,
              ),

              const SizedBox(height: 8),

              LargeCard(
                backgroundColor: AppColors.primaryLight.withValues(alpha: 0.1),
                child: Row(
                  children: [
                    const Icon(Icons.info_outline, color: AppColors.primary),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Puedes enviar este informe por WhatsApp, email o cualquier otra app.',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
