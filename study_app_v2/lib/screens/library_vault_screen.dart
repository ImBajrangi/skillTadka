import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../widgets/bento_card.dart';
import '../utils/mock_data.dart';

class LibraryVaultScreen extends StatelessWidget {
  const LibraryVaultScreen({super.key});

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
            const SizedBox(height: 40),
            _buildSectionHeader('Quick Access'),
            const SizedBox(height: 20),
            _buildQuickAccessBento(),
            const SizedBox(height: 40),
            _buildSectionHeader('Categories'),
            const SizedBox(height: 20),
            _buildCategoriesList(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.border),
                image: const DecorationImage(
                  image: NetworkImage(
                      'https://lh3.googleusercontent.com/aida-public/AB6AXuBqUWP7HM6rEHnI5McRApJipQP5ABiMvZt7lTycq939qkZCO7NM8Aqb-aAmcIPCUpm0pib7oQMJh-xCec7v8lpVmCegcqW75UA30TXPusU062bT4alEykfyED8stqFy_Y7Chq8To4Zxt0owfMK2OWN4eKYDqr2Vm786b5CGPWn8jFPboyVUnCR2cgAsIM-11WNXF-IzViRvMVZRIfIO0DopIp_Zwkit7O8FeztCOoD-FmZfx-HxSkdIfIQBv7jp-Q_tUtg5N7GReo4'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'ALEX',
                      style: GoogleFonts.robotoMono(
                        color: AppColors.textMain,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
                Text(
                  'GRADE 11 • SCIENCE STREAM',
                  style: GoogleFonts.robotoMono(
                    color: AppColors.textSecondary,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                  ),
                ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            _buildHeaderAction(Icons.search_rounded),
            const SizedBox(width: 8),
            _buildHeaderAction(Icons.notifications_none_rounded),
          ],
        ),
      ],
    );
  }

  Widget _buildHeaderAction(IconData icon) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.border),
      ),
      child: Icon(icon, color: AppColors.textSecondary, size: 20),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title.toUpperCase(),
              style: GoogleFonts.robotoMono(
                color: AppColors.textSecondary,
                fontSize: 12,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
              ),
            ),
            const Icon(Icons.manage_search_rounded,
                color: AppColors.textSecondary, size: 18),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          height: 1,
          color: AppColors.border.withValues(alpha: 0.5),
        ),
      ],
    );
  }

  Widget _buildQuickAccessBento() {
    return Row(
      children: [
        Expanded(
          child: BentoCard(
            title: 'Downloads',
            subtitle: '12 Files',
            icon: Icons.download_for_offline_rounded,
            accentColor: AppColors.accentBlue,
            height: 120,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: BentoCard(
            title: 'Saved',
            subtitle: '45 Resources',
            icon: Icons.bookmark_rounded,
            accentColor: AppColors.primaryAction,
            height: 120,
          ),
        ),
      ],
    );
  }

  Widget _buildCategoriesList() {
    return Column(
      children: MockData.libraryCategories
          .map((cat) => _buildCategoryItem(
                cat['title'] as String,
                '${cat['count']} Materials',
                cat['icon'] as IconData,
                cat['color'] as Color,
              ))
          .toList(),
    );
  }

  Widget _buildCategoryItem(
      String title, String count, IconData icon, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.textMain,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  count,
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_right_rounded,
              color: AppColors.textSecondary),
        ],
      ),
    );
  }
}
