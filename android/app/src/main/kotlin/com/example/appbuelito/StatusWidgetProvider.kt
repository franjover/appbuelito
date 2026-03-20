package com.example.appbuelito

import android.appwidget.AppWidgetManager
import android.content.Context
import android.content.SharedPreferences
import android.widget.RemoteViews
import es.antonborri.home_widget.HomeWidgetProvider

class StatusWidgetProvider : HomeWidgetProvider() {
    override fun onUpdate(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetIds: IntArray,
        widgetData: SharedPreferences
    ) {
        appWidgetIds.forEach { widgetId ->
            val views = RemoteViews(context.packageName, R.layout.widget_status)

            val patientName = widgetData.getString("widget_patient_name", "Paciente") ?: "Paciente"
            val classification = widgetData.getString("widget_classification", "--") ?: "--"
            val nextAction = widgetData.getString("widget_next_action", "Sin actividad pendiente") ?: "Sin actividad pendiente"

            views.setTextViewText(R.id.widget_patient_name, patientName)
            views.setTextViewText(R.id.widget_classification, classification)
            views.setTextViewText(R.id.widget_next_action, nextAction)

            appWidgetManager.updateAppWidget(widgetId, views)
        }
    }
}
