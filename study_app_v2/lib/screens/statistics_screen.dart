import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import '../theme/app_theme.dart';
import '../utils/mock_data.dart';
import '../widgets/premium_effects.dart';
import '../utils/sacred_styles.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final topPadding = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(24, topPadding + 80, 24, 160),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            const SizedBox(height: 48),
            _buildOverallProgress(context),
            const SizedBox(height: 40),
            _buildSubjectDistribution(context),
            const SizedBox(height: 40),
            _buildActivityHeatmap(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'ANALYTICS & GROWTH',
          style: SacredStyles.withColor(
            SacredStyles.mono12Bold.copyWith(letterSpacing: 2.0),
            AppColors.primary,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Progress Metrics',
          style: SacredStyles.withColor(
            SacredStyles.display32Bold.copyWith(letterSpacing: -1.0),
            theme.colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 16),
        Divider(color: theme.colorScheme.outline.withValues(alpha: 0.3)),
      ],
    );
  }

  Widget _buildOverallProgress(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return PremiumGlassContainer(
      showShimmer: true,
      borderRadius: BorderRadius.circular(40),
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            SizedBox(
              height: 220,
              child: SfRadialGauge(
                axes: <RadialAxis>[
                  RadialAxis(
                    minimum: 0,
                    maximum: 100,
                    showLabels: false,
                    showTicks: false,
                    startAngle: 180,
                    endAngle: 0,
                    radiusFactor: 1.1,
                    canScaleToFit: true,
                    axisLineStyle: AxisLineStyle(
                      thickness: 24,
                      color:
                          theme.colorScheme.onSurface.withValues(alpha: 0.05),
                      cornerStyle: CornerStyle.bothCurve,
                    ),
                    pointers: const <GaugePointer>[
                      RangePointer(
                        value: MockData.dailyGoalProgress * 100,
                        width: 24,
                        sizeUnit: GaugeSizeUnit.logicalPixel,
                        color: AppColors.primary,
                        cornerStyle: CornerStyle.bothCurve,
                        gradient: SweepGradient(
                          colors: <Color>[
                            AppColors.primaryAction,
                            AppColors.primary
                          ],
                        ),
                      ),
                    ],
                    annotations: <GaugeAnnotation>[
                      GaugeAnnotation(
                        widget: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '${(MockData.dailyGoalProgress * 100).toInt()}%',
                              style: SacredStyles.withColor(
                                SacredStyles.display32Bold
                                    .copyWith(fontSize: 48),
                                theme.colorScheme.onSurface,
                              ),
                            ),
                            Text(
                              'DAILY GOAL',
                              style: SacredStyles.withColor(
                                SacredStyles.mono10Bold
                                    .copyWith(letterSpacing: 2.0),
                                isDark
                                    ? AppColors.textSecondary
                                    : theme.colorScheme.onSurface
                                        .withValues(alpha: 0.6),
                              ),
                            ),
                          ],
                        ),
                        angle: 90,
                        positionFactor: 0.1,
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatTile(context, 'STREAK', '${MockData.userStreak}D'),
                _buildStatTile(context, 'XP EARNED', '${MockData.userXP}'),
                _buildStatTile(context, 'LEVEL', '${MockData.userLevel}'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatTile(BuildContext context, String label, String value) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Column(
      children: [
        Text(
          value,
          style: SacredStyles.withColor(
            SacredStyles.inter20Bold,
            theme.colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label.toUpperCase(),
          style: SacredStyles.withColor(
            SacredStyles.mono10Bold.copyWith(letterSpacing: 1.0),
            isDark
                ? AppColors.textSecondary
                : theme.colorScheme.onSurface.withValues(alpha: 0.6),
          ),
        ),
      ],
    );
  }

  Widget _buildSubjectDistribution(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'SUBJECT PROFICIENCY',
          style: SacredStyles.withColor(
            SacredStyles.mono12Bold.copyWith(letterSpacing: 1.5),
            theme.colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 24),
        ...MockData.subjects.map((s) => _buildSubjectBar(context, s)),
      ],
    );
  }

  Widget _buildSubjectBar(BuildContext context, Map<String, dynamic> subject) {
    final theme = Theme.of(context);
    final color = subject['color'] as Color;

    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: color.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(subject['icon'] as IconData,
                        color: color, size: 16),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    subject['name'] as String,
                    style: SacredStyles.withColor(
                      SacredStyles.inter16
                          .copyWith(fontWeight: FontWeight.bold),
                      theme.colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
              Text(
                '${((subject['progress'] as double) * 100).toInt()}%',
                style: SacredStyles.withColor(
                  SacredStyles.mono12Bold,
                  color,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: LinearProgressIndicator(
              value: subject['progress'] as double,
              backgroundColor: color.withValues(alpha: 0.1),
              valueColor: AlwaysStoppedAnimation<Color>(color),
              minHeight: 10,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActivityHeatmap(BuildContext context) {
    final theme = Theme.of(context);
    return PremiumGlassContainer(
      borderRadius: BorderRadius.circular(32),
      child: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'STUDY ACTIVITY HEATMAP',
              style: SacredStyles.withColor(
                SacredStyles.mono12Bold.copyWith(letterSpacing: 1.5),
                theme.colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 24),
            LayoutBuilder(builder: (context, constraints) {
              final itemSize = (constraints.maxWidth - (8 * 6)) / 7;
              return Wrap(
                spacing: 8,
                runSpacing: 8,
                children: List.generate(28, (index) {
                  final intensities = [0.1, 0.4, 0.2, 0.8, 0.5, 0.9, 0.3];
                  final intensity = intensities[index % intensities.length];
                  return Container(
                    width: itemSize,
                    height: itemSize,
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: intensity),
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        color: AppColors.primary.withValues(alpha: 0.2),
                        width: 0.5,
                      ),
                    ),
                  );
                }),
              );
            }),
          ],
        ),
      ),
    );
  }
}
