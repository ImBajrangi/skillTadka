import 'package:flutter/material.dart';
import 'package:study_app/theme/app_theme.dart';
import 'dart:ui';

class ResourceDetailScreen extends StatelessWidget {
  const ResourceDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Base for the hero image
      body: Stack(
        children: [
          // 1. Hero Image Section (55% height)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.55,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.network(
                    'https://lh3.googleusercontent.com/aida-public/AB6AXuDrNu3SbwIs2-GLuV5TOLh-MdBpzaFYGRRvRsGBNUX6NF2wyWr5MQB3NhQgUy-eTgliK87hHTFp1vY_M3xCW0n7li6mBpYNerZat15zFq3yM4x1qA5A2jl8xNw2FyC5CO8_34G3PMn8zRXA5NqH_2glb-9DAy8Na6uNZiNtdUBN9XkKe68_gid87jiMZ3zmG_MGGjox2rVX-jmQAfiIeGyd8VVH0KVGAXbTnnMorhrKGCh5teehMPILFm2Wd6q0S7VrU_BOU14VFIs',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withValues(alpha: 0.4),
                          Colors.transparent,
                          Colors.black.withValues(alpha: 0.6),
                        ],
                      ),
                    ),
                  ),
                ),
                // Header Actions
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildCircleAction(context, Icons.arrow_back,
                            () => Navigator.pop(context)),
                        _buildCircleAction(context, Icons.more_horiz, () {}),
                      ],
                    ),
                  ),
                ),
                // Title Info (Bottom of hero)
                Positioned(
                  bottom: 60,
                  left: 24,
                  right: 24,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.4),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              color: Colors.white.withValues(alpha: 0.1)),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                                width: 8,
                                height: 8,
                                decoration: const BoxDecoration(
                                    color: AppColors.primary,
                                    shape: BoxShape.circle)),
                            const SizedBox(width: 8),
                            const Text('GRADE 11 PHYSICS',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Advanced Mechanics &\nMotion Study Notes',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          height: 1.1,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // 2. Content Card (Overlapping)
          Positioned.fill(
            top: MediaQuery.of(context).size.height * 0.5,
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 40,
                      offset: Offset(0, -10)),
                ],
              ),
              child: SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Handle bar
                    Center(
                      child: Container(
                        width: 48,
                        height: 6,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    // Stats grid
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildDetailStat('24', 'Pages', Icons.description,
                            AppColors.primary),
                        _buildDetailStat('4.2', 'MB Size', Icons.sd_storage,
                            AppColors.accentBlue),
                        _buildDetailStat('4.9', 'Rating', Icons.star,
                            AppColors.accentOrange),
                      ],
                    ),
                    const SizedBox(height: 40),
                    // CTA Button
                    SizedBox(
                      width: double.infinity,
                      height: 64,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: AppColors.textMain,
                          elevation: 8,
                          shadowColor: AppColors.primary.withValues(alpha: 0.5),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32)),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.lock_open, size: 20),
                            SizedBox(width: 12),
                            Text('Unlock Full Access',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    // Learners section
                    const Text('Current Learners',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    const Text('Students studying this topic right now',
                        style: TextStyle(
                            color: AppColors.textSecondary, fontSize: 14)),
                    const SizedBox(height: 20),
                    _buildLearnersRow(),
                    const SizedBox(height: 40),
                    // Tags
                    const Text('Topic Tags',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 16),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        _buildTag('#Kinematics'),
                        _buildTag('#Dynamics'),
                        _buildTag('#NewtonLaws'),
                        _buildTag('#Energy'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCircleAction(
      BuildContext context, IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white.withValues(alpha: 0.3)),
            ),
            child: Icon(icon, color: Colors.white, size: 24),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailStat(
      String value, String label, IconData icon, Color accent) {
    return Container(
      width: 100,
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.bgLight,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.grey[100]!),
      ),
      child: Column(
        children: [
          Icon(icon, color: accent, size: 20),
          const SizedBox(height: 8),
          Text(value,
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Text(label,
              style: const TextStyle(
                  fontSize: 12, color: AppColors.textSecondary)),
        ],
      ),
    );
  }

  Widget _buildLearnersRow() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.bgLight,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 110,
            child: Stack(
              children: [
                _buildAvatar(0, 'https://i.pravatar.cc/100?u=1'),
                _buildAvatar(28, 'https://i.pravatar.cc/100?u=2'),
                _buildAvatar(56, 'https://i.pravatar.cc/100?u=3'),
                Positioned(
                  left: 84,
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.bgLight, width: 2),
                    ),
                    child: const Center(
                        child: Text('+128',
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.bold))),
                  ),
                ),
              ],
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _buildBar(16, AppColors.accentBlue.withValues(alpha: 0.3)),
              const SizedBox(width: 4),
              _buildBar(24, AppColors.accentBlue.withValues(alpha: 0.5)),
              const SizedBox(width: 4),
              _buildBar(12, AppColors.accentBlue.withValues(alpha: 0.3)),
              const SizedBox(width: 4),
              _buildBar(32, AppColors.accentBlue),
              const SizedBox(width: 4),
              _buildBar(40, AppColors.primary),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAvatar(double left, String url) {
    return Positioned(
      left: left,
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.bgLight, width: 2),
          image: DecorationImage(image: NetworkImage(url), fit: BoxFit.cover),
        ),
      ),
    );
  }

  Widget _buildBar(double height, Color color) {
    return Container(
      width: 6,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(2), topRight: Radius.circular(2)),
      ),
    );
  }

  Widget _buildTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(text,
          style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 12,
              fontWeight: FontWeight.w500)),
    );
  }
}
