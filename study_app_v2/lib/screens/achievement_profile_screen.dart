import 'package:flutter/material.dart';
import 'package:study_app/theme/app_theme.dart';
import 'package:study_app/widgets/premium_effects.dart';
import 'dart:ui';

class AchievementProfileScreen extends StatelessWidget {
  const AchievementProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgCream,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textMain),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
              icon: const Icon(Icons.settings_outlined,
                  color: AppColors.textMain),
              onPressed: () {}),
        ],
      ),
      body: Stack(
        children: [
          const GrainyTextureOverlay(opacity: 0.04),
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 100),
                _buildXPSphere(),
                const SizedBox(height: 40),
                _buildStatsBentoGrid(),
                const SizedBox(height: 40),
                _buildBadgesSection(),
                const SizedBox(height: 40),
                _buildLeaderboardPreview(),
                const SizedBox(height: 120),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildXPSphere() {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Outer Glow
          Container(
            width: 280,
            height: 280,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  AppColors.primary.withOpacity(0.4),
                  Colors.transparent
                ],
              ),
            ),
          ),
          // 3D Sphere Effect (Layered)
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const RadialGradient(
                center: Alignment(-0.3, -0.3),
                colors: [
                  Color(0xFFFEF9C4),
                  Color(0xFFFACC15),
                  Color(0xFFD97706),
                ],
                stops: [0.0, 0.6, 1.0],
              ),
              boxShadow: [
                BoxShadow(
                    color: AppColors.primary.withOpacity(0.5),
                    blurRadius: 40,
                    offset: const Offset(0, 20)),
                BoxShadow(
                    color: Colors.white.withOpacity(0.5),
                    blurRadius: 15,
                    offset: const Offset(-8, -8),
                    spreadRadius: -2),
              ],
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Inner Shine Overlay
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: Colors.white.withOpacity(0.3), width: 3),
                  ),
                ),
                const Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('2,450',
                          style: TextStyle(
                              fontSize: 48,
                              fontWeight: FontWeight.w900,
                              color: AppColors.textMain,
                              letterSpacing: -2)),
                      Text('TOTAL XP',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w900,
                              color: Color(0xFF92400E),
                              letterSpacing: 1)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Floating Icon Elements
          const Positioned(
              top: 20,
              right: 30,
              child: Text('⚡', style: TextStyle(fontSize: 24))),
          const Positioned(
              bottom: 20,
              left: 30,
              child: Text('🔥', style: TextStyle(fontSize: 24))),
        ],
      ),
    );
  }

  Widget _buildStatsBentoGrid() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Performance',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textMain)),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: _buildBentoCard('14 Days', 'STREAK',
                    Icons.local_fire_department, AppColors.primaryAction),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildBentoCard('Level 12', 'RANK', Icons.military_tech,
                    AppColors.accentPurple),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildBentoCardFull(
              'Active Learner',
              'You are in the top 5% of grade 11 students.',
              Icons.trending_up,
              AppColors.accentBlue),
        ],
      ),
    );
  }

  Widget _buildBentoCard(
      String val, String label, IconData icon, Color accent) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 15)
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: accent, size: 28),
          const SizedBox(height: 16),
          Text(val,
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                  color: AppColors.textMain)),
          Text(label,
              style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w900,
                  color: AppColors.textSecondary,
                  letterSpacing: 1)),
        ],
      ),
    );
  }

  Widget _buildBentoCardFull(
      String title, String desc, IconData icon, Color accent) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 15)
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: accent.withOpacity(0.1), shape: BoxShape.circle),
            child: Icon(icon, color: accent, size: 28),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textMain)),
                Text(desc,
                    style: const TextStyle(
                        fontSize: 12, color: AppColors.textSecondary)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBadgesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Text('Achievements',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textMain)),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 140,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            children: [
              _buildBadgeCard('Early Bird', '🕒', AppColors.accentPurple),
              _buildBadgeCard('Master', '🎓', AppColors.primary),
              _buildBadgeCard('Notes King', '📝', AppColors.accentBlue),
              _buildBadgeCard('Quiz Whiz', '🧠', AppColors.accentOrange),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBadgeCard(String name, String emoji, Color color) {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(right: 16),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: color.withOpacity(0.1)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(emoji, style: const TextStyle(fontSize: 28)),
          const SizedBox(height: 8),
          Flexible(
            child: Text(name,
                style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textMain),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis),
          ),
        ],
      ),
    );
  }

  Widget _buildLeaderboardPreview() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Leaderboard',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textMain)),
              TextButton(
                  onPressed: () {},
                  child: const Text('View Rankings',
                      style: TextStyle(
                          color: AppColors.primaryAction,
                          fontWeight: FontWeight.bold))),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.textMain,
              borderRadius: BorderRadius.circular(32),
            ),
            child: Row(
              children: [
                const Text('#4',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        color: AppColors.primary)),
                const SizedBox(width: 20),
                const CircleAvatar(
                    radius: 20,
                    backgroundImage:
                        NetworkImage('https://i.pravatar.cc/100?u=alex')),
                const SizedBox(width: 16),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('You',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                    Text('Top 100 in Grade 11',
                        style: TextStyle(color: Colors.white54, fontSize: 11)),
                  ],
                ),
                const Spacer(),
                const Text('980',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 18)),
                const SizedBox(width: 4),
                Icon(Icons.bolt, color: AppColors.primary, size: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
