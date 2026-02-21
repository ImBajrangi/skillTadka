import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import '../theme/app_theme.dart';
import '../utils/mock_data.dart';
import '../widgets/premium_effects.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgDark,
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(24, 80, 24, 120),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 32),
            _buildOverallProgress(),
            const SizedBox(height: 32),
            _buildSubjectDistribution(context),
            const SizedBox(height: 32),
            _buildActivityHeatmap(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'STATISTICS',
          style: GoogleFonts.robotoMono(
            color: AppColors.primary,
            fontSize: 12,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Your Growth',
          style: TextStyle(
            color: AppColors.textMain,
            fontSize: 32,
            fontWeight: FontWeight.bold,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 1,
          color: AppColors.border.withValues(alpha: 0.5),
        ),
      ],
    );
  }

  Widget _buildOverallProgress() {
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
                      color: Colors.white.withValues(alpha: 0.05),
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
                              style: const TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const Text(
                              'DAILY GOAL',
                              style: TextStyle(
                                fontSize: 12,
                                color: AppColors.textSecondary,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
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
                _buildStatTile('Streak', '${MockData.userStreak}d'),
                _buildStatTile('XP Earned', '${MockData.userXP}'),
                _buildStatTile('Level', '${MockData.userLevel}'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatTile(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label.toUpperCase(),
          style: const TextStyle(
            color: AppColors.textSecondary,
            fontSize: 10,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
      ],
    );
  }

  Widget _buildSubjectDistribution(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Subject distribution',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        ...MockData.subjects.map((s) => _buildSubjectBar(s)),
      ],
    );
  }

  Widget _buildSubjectBar(Map<String, dynamic> subject) {
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
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Text(
                '${((subject['progress'] as double) * 100).toInt()}%',
                style: GoogleFonts.robotoMono(
                  color: AppColors.textSecondary,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: subject['progress'] as double,
              backgroundColor: Colors.white.withValues(alpha: 0.05),
              valueColor:
                  AlwaysStoppedAnimation<Color>(subject['color'] as Color),
              minHeight: 6,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActivityHeatmap() {
    return PremiumGlassContainer(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Activity Heatmap',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            // Simplied heatmap visualization for brevity
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: List.generate(28, (index) {
                return Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    color:
                        index % 5 == 0 ? AppColors.primary : AppColors.surface,
                    borderRadius: BorderRadius.circular(4),
                    border:
                        Border.all(color: Colors.white.withValues(alpha: 0.05)),
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
