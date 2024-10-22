import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

({Path path, Paint paint}) barTooltipArrowPathAndPosition({
  required double tooltipLeft,
  required double tooltipWidth,
  required Rect rect,
  required BarTouchTooltipData tooltipData,
  required BarChartGroupData showOnBarGroup,
}) {
  const positionWidth = 8.0;
  const arrowHeight = 3.0;
  final startLeft = tooltipLeft + (tooltipWidth / 2 - positionWidth / 2);

  final tooptipPositionRect = Rect.fromLTWH(
    startLeft,
    rect.bottom - 2,
    positionWidth,
    tooltipData.tooltipMargin - 4 - arrowHeight,
  );

  final tooltipPositionPath = Path()
    ..addRect(tooptipPositionRect)
    ..moveTo(startLeft, tooptipPositionRect.bottom)
    ..lineTo(
      startLeft + positionWidth / 2,
      tooptipPositionRect.bottom + arrowHeight,
    )
    ..lineTo(startLeft + positionWidth, tooptipPositionRect.bottom)
    ..close();

  final gradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      tooltipData.getTooltipColor(showOnBarGroup),
      tooltipData.tooltipArrowColor,
    ],
  );

  final tooltipPositionPaint = Paint()
    ..style = PaintingStyle.fill
    ..shader = gradient.createShader(tooltipPositionPath.getBounds());
  //..color = tooltipData.tooltipBgColor;

  return (path: tooltipPositionPath, paint: tooltipPositionPaint);
}
