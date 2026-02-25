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

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(24, 80, 24, 120),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            const SizedBox(height: 32),
            _buildOverallProgress(context),
            const SizedBox(height: 32),
            _buildSubjectDistribution(context),
            const SizedBox(height: 32),
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
          'STATISTICS',
          style: SacredStyles.withColor(
            SacredStyles.mono12Bold.copyWith(letterSpacing: 2.0),
            AppColors.primary,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Your Growth',
          style: SacredStyles.withColor(
            SacredStyles.display32Bold,
            theme.colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 8),
        Divider(height: 1, color: theme.colorScheme.outline),
      ],
    );
  }

  Widget _buildOverallProgress(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return PremiumGlassContainer(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: SfRadialGauge(
                axes: <RadialAxis>[
                  RadialAxis(
                    minimum: 0,
                    maximum: 100,
                    showLabels: false,
                    showTicks: false,
                    startAngle: 180,
                    endAngle: 0,
                    radiusFactor: 1,
                    canScaleToFit: true,
                    axisLineStyle: AxisLineStyle(
                      thickness: 20,
                      color: isDark
                          ? Colors.white.withValues(alpha: 0.05)
                          : Colors.black.withValues(alpha: 0.05),
                      cornerStyle: CornerStyle.bothCurve,
                    ),
                    pointers: <GaugePointer>[
                      RangePointer(
                        value: MockData.dailyGoalProgress * 100,
                        width: 20,
                        sizeUnit: GaugeSizeUnit.logicalPixel,
                        color: AppColors.primary,
                        cornerStyle: CornerStyle.bothCurve,
                        gradient: const SweepGradient(
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
                                SacredStyles.display32Bold,
                                theme.colorScheme.onSurface,
                              ),
                            ),
                            Text(
                              'DAILY GOAL',
                              style: SacredStyles.withColor(
                                SacredStyles.inter12.copyWith(
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1),
                                isDark
                                    ? AppColors.textSecondary
                                    : AppColors.textSecondaryLight,
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
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatTile(context, 'Streak', '${MockData.userStreak}d'),
                _buildStatTile(context, 'XP Earned', '${MockData.userXP}'),
                _buildStatTile(context, 'Level', '${MockData.userLevel}'),
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
        Text(
          label.toUpperCase(),
          style: SacredStyles.withColor(
            SacredStyles.inter10Bold.copyWith(letterSpacing: 1),
            isDark ? AppColors.textSecondary : AppColors.textSecondaryLight,
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
          'Subject distribution',
          style: SacredStyles.withColor(
            SacredStyles.inter18Bold,
            theme.colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 16),
        ...MockData.subjects.map((s) => _buildSubjectBar(context, s)),
      ],
    );
  }

  Widget _buildSubjectBar(BuildContext context, Map<String, dynamic> subject) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(subject['icon'] as IconData,
                      color: subject['color'] as Color, size: 18),
                  const SizedBox(width: 12),
                  Text(
                    subject['name'] as String,
                    style: SacredStyles.withColor(
                      SacredStyles.inter14
                          .copyWith(fontWeight: FontWeight.w600),
                      theme.colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
              Text(
                '${((subject['progress'] as double) * 100).toInt()}%',
                style: SacredStyles.withColor(
                  SacredStyles.mono12,
                  isDark
                      ? AppColors.textSecondary
                      : AppColors.textSecondaryLight,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: subject['progress'] as double,
              backgroundColor: isDark
                  ? Colors.white.withValues(alpha: 0.05)
                  : Colors.black.withValues(alpha: 0.05),
              valueColor:
                  AlwaysStoppedAnimation<Color>(subject['color'] as Color),
              minHeight: 6,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActivityHeatmap(BuildContext context) {
    final theme = Theme.of(context);
    return PremiumGlassContainer(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Activity Heatmap',
              style: SacredStyles.withColor(
                SacredStyles.inter16.copyWith(fontWeight: FontWeight.bold),
                theme.colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: List.generate(28, (index) {
                return Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    color: index % 5 == 0
                        ? AppColors.primary
                        : theme.colorScheme.surface,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: theme.colorScheme.outline,
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
