import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import '../theme/app_theme.dart';
import '../utils/sacred_styles.dart';

class MockTestScreen extends StatelessWidget {
  const MockTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          'Mock Test: Quantum Mechanics',
          style: SacredStyles.withColor(
              SacredStyles.inter16.copyWith(fontWeight: FontWeight.bold),
              theme.colorScheme.onSurface),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            _buildResultCard(context),
            const SizedBox(height: 32),
            _buildSectionHeader(context, 'Subject Analysis'),
            const SizedBox(height: 20),
            _buildSubjectBreakdown(context),
            const SizedBox(height: 32),
            _buildActionButtons(context),
          ],
        ),
      ),
    );
  }

  Widget _buildResultCard(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: theme.colorScheme.outline),
      ),
      child: Column(
        children: [
          Text(
            'Overall Score',
            style: SacredStyles.withColor(
              SacredStyles.inter14.copyWith(fontWeight: FontWeight.bold),
              isDark ? AppColors.textSecondary : AppColors.textSecondaryLight,
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            height: 200,
            child: SfRadialGauge(
              axes: <RadialAxis>[
                RadialAxis(
                  minimum: 0,
                  maximum: 100,
                  showLabels: false,
                  showTicks: false,
                  startAngle: 270,
                  endAngle: 270,
                  axisLineStyle: AxisLineStyle(
                    thickness: 0.2,
                    color: AppColors.primary.withValues(alpha: 0.1),
                    thicknessUnit: GaugeSizeUnit.factor,
                  ),
                  pointers: const <GaugePointer>[
                    RangePointer(
                      value: 85,
                      width: 0.2,
                      sizeUnit: GaugeSizeUnit.factor,
                      color: AppColors.primary,
                      cornerStyle: CornerStyle.bothCurve,
                    )
                  ],
                  annotations: <GaugeAnnotation>[
                    GaugeAnnotation(
                      positionFactor: 0.1,
                      widget: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '85%',
                            style: SacredStyles.withColor(
                              SacredStyles.display32Bold.copyWith(fontSize: 36),
                              theme.colorScheme.onSurface,
                            ),
                          ),
                          Text(
                            'Excellent!',
                            style: SacredStyles.withColor(
                              SacredStyles.inter14
                                  .copyWith(fontWeight: FontWeight.bold),
                              AppColors.primary.withValues(alpha: 0.8),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: SacredStyles.withColor(
            SacredStyles.inter16
                .copyWith(fontSize: 20, fontWeight: FontWeight.bold),
            theme.colorScheme.onSurface,
          ),
        ),
      ],
    );
  }

  Widget _buildSubjectBreakdown(BuildContext context) {
    return Column(
      children: [
        _buildStatRow(context, 'Concept Clarity', 0.9, Colors.green),
        _buildStatRow(context, 'Numerical Accuracy', 0.75, Colors.blue),
        _buildStatRow(context, 'Speed', 0.82, Colors.orange),
      ],
    );
  }

  Widget _buildStatRow(
      BuildContext context, String label, double value, Color color) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: SacredStyles.withColor(
                  SacredStyles.inter14,
                  theme.colorScheme.onSurface,
                ),
              ),
              Text(
                '${(value * 100).toInt()}%',
                style: SacredStyles.withColor(
                  SacredStyles.inter14.copyWith(fontWeight: FontWeight.bold),
                  color,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: value,
              backgroundColor: color.withValues(alpha: 0.1),
              valueColor: AlwaysStoppedAnimation(color),
              minHeight: 8,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 60,
          child: ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
            ),
            child: Text(
              'Back to Unit',
              style: SacredStyles.withColor(
                  SacredStyles.inter16.copyWith(fontWeight: FontWeight.bold),
                  Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 12),
        TextButton(
          onPressed: () {},
          child: Text(
            'Review Mistakes',
            style: SacredStyles.withColor(
              SacredStyles.inter14.copyWith(fontWeight: FontWeight.bold),
              isDark ? AppColors.textSecondary : AppColors.textSecondaryLight,
            ),
          ),
        ),
      ],
    );
  }
}
