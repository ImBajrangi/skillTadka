import 'package:flutter/material.dart';
import 'package:study_app/theme/app_theme.dart';
import 'package:study_app/widgets/premium_effects.dart';
import 'dart:ui';

class SubscriptionPlansScreen extends StatelessWidget {
  const SubscriptionPlansScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgCream,
      body: Stack(
        children: [
          const GrainyTextureOverlay(opacity: 0.04),
          // Background Gradient Orbs
          Positioned(
            top: -50,
            right: -50,
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primary.withOpacity(0.15),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
                child: Container(color: Colors.transparent),
              ),
            ),
          ),

          SafeArea(
            child: Column(
              children: [
                _buildAppBar(context),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 12),
                        _buildMainHeroCard(),
                        const SizedBox(height: 40),
                        const Text('Premium Benefits',
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: AppColors.textMain)),
                        const SizedBox(height: 24),
                        _buildBenefitsGrid(),
                        const SizedBox(height: 40),
                        _buildSocialProof(),
                        const SizedBox(
                            height: 120), // Padding for sticky bottom
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          _buildStickyCTA(),
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildCircleIcon(Icons.close, () => Navigator.pop(context)),
          const Text('PRO ACCESS',
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w900,
                  color: AppColors.textSecondary,
                  letterSpacing: 2)),
          const Text('RESTORE',
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryAction)),
        ],
      ),
    );
  }

  Widget _buildCircleIcon(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)
          ],
        ),
        child: Icon(icon, color: AppColors.textMain, size: 20),
      ),
    );
  }

  Widget _buildMainHeroCard() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.7),
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: Colors.white.withOpacity(0.5)),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 30,
              offset: const Offset(0, 10)),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Stack(
          children: [
            Positioned(
              right: -20,
              top: -20,
              child: Container(
                  width: 140,
                  height: 140,
                  decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.1),
                      shape: BoxShape.circle)),
            ),
            Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 20)
                      ],
                    ),
                    child: const Icon(Icons.workspace_premium,
                        color: AppColors.primary, size: 48),
                  ),
                  const SizedBox(height: 24),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text('BEST VALUE • SAVE 40%',
                        style: TextStyle(
                            color: AppColors.secondary,
                            fontSize: 10,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 0.5)),
                  ),
                  const SizedBox(height: 16),
                  const Text('Annual Pro',
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w900,
                          color: AppColors.textMain,
                          letterSpacing: -1)),
                  const SizedBox(height: 8),
                  const Text('Full access to all grade 8-12 resources',
                      style: TextStyle(
                          color: AppColors.textSecondary, fontSize: 14)),
                  const SizedBox(height: 32),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text('\$49.99',
                          style: TextStyle(
                              fontSize: 48,
                              fontWeight: FontWeight.w900,
                              color: AppColors.textMain,
                              letterSpacing: -2)),
                      Text('/year',
                          style: TextStyle(
                              fontSize: 18,
                              color: AppColors.textSecondary,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text('ONLY \$4.16 PER MONTH',
                      style: TextStyle(
                          color: AppColors.primaryAction,
                          fontSize: 13,
                          fontWeight: FontWeight.w900,
                          letterSpacing: -0.5)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBenefitsGrid() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      childAspectRatio: 1.1,
      children: [
        _buildBenefitCard('Offline PDFs', 'Study without active internet.',
            Icons.picture_as_pdf),
        _buildBenefitCard(
            'Expert Help', '24/7 priority support.', Icons.psychology),
        _buildBenefitCard('Ad-Free', 'Zero interruptions.', Icons.block),
        _buildBenefitCard('Analytics', 'Visual insights.', Icons.analytics),
      ],
    );
  }

  Widget _buildBenefitCard(String title, String desc, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10)
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.1),
                shape: BoxShape.circle),
            child: Icon(icon, color: AppColors.primary, size: 20),
          ),
          const Spacer(),
          Text(title,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.textMain,
                  fontSize: 15)),
          const SizedBox(height: 4),
          Text(desc,
              style: const TextStyle(
                  color: AppColors.textSecondary, fontSize: 11, height: 1.2)),
        ],
      ),
    );
  }

  Widget _buildSocialProof() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.bgCream,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
            color: Colors.grey[200]!,
            style: BorderStyle
                .none), // Using dashed manually if needed, but solid for simplicity
      ),
      child: Row(
        children: [
          SizedBox(
            width: 80,
            height: 32,
            child: Stack(
              children: [
                _buildMiniAvatar(0, 'https://i.pravatar.cc/100?u=a'),
                _buildMiniAvatar(20, 'https://i.pravatar.cc/100?u=b'),
                _buildMiniAvatar(40, 'https://i.pravatar.cc/100?u=c'),
              ],
            ),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Text.rich(
              TextSpan(
                text: 'Joined by ',
                style: TextStyle(fontSize: 12, color: AppColors.textSecondary),
                children: [
                  TextSpan(
                      text: '12,000+ students',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.textMain)),
                  TextSpan(text: ' this week'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMiniAvatar(double left, String url) {
    return Positioned(
      left: left,
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 2),
          image: DecorationImage(image: NetworkImage(url), fit: BoxFit.cover),
        ),
      ),
    );
  }

  Widget _buildStickyCTA() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            padding: const EdgeInsets.fromLTRB(24, 16, 24, 40),
            decoration: BoxDecoration(
              color: AppColors.bgCream.withOpacity(0.8),
              border: Border(top: BorderSide(color: Colors.grey[200]!)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                PremiumShineEffect(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: AppColors.textMain,
                      elevation: 10,
                      shadowColor: AppColors.primary.withOpacity(0.5),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32)),
                    ),
                    child: const Text('GO PRO NOW',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 1)),
                  ),
                ),
                const SizedBox(height: 16),
                const Text('Cancel anytime. Automatic renewal.',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1)),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Terms of Use',
                        style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 10,
                            decoration: TextDecoration.underline)),
                    const SizedBox(width: 24),
                    Text('Privacy Policy',
                        style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 10,
                            decoration: TextDecoration.underline)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
