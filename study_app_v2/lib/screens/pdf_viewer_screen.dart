import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../utils/sacred_styles.dart';

class PDFViewerScreen extends StatelessWidget {
  final String title;
  const PDFViewerScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          title,
          style: SacredStyles.withColor(
            SacredStyles.inter16.copyWith(fontWeight: FontWeight.bold),
            theme.colorScheme.onSurface,
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.share_rounded)),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.more_vert_rounded)),
        ],
      ),
      body: Stack(
        children: [
          // PDF Content Placeholder
          Container(
            color: theme.colorScheme.surface,
            width: double.infinity,
            height: double.infinity,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.picture_as_pdf_rounded,
                      size: 64,
                      color: theme.brightness == Brightness.dark
                          ? AppColors.textSecondary
                          : AppColors.textSecondaryLight),
                  const SizedBox(height: 16),
                  Text(
                    'PDF Rendering Engine Active',
                    style: SacredStyles.withColor(
                      SacredStyles.inter14,
                      theme.brightness == Brightness.dark
                          ? AppColors.textSecondary
                          : AppColors.textSecondaryLight,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Floating Toolbar
          Positioned(
            bottom: 40,
            left: 24,
            right: 24,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: theme.colorScheme.surface.withValues(alpha: 0.95),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: theme.colorScheme.outline),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.3),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildToolIcon(context, Icons.draw_rounded, 'Annotate'),
                  _buildToolIcon(
                      context, Icons.text_fields_rounded, 'Highlight'),
                  _buildToolIcon(
                      context, Icons.bookmark_add_rounded, 'Bookmark'),
                  _buildToolIcon(context, Icons.search_rounded, 'Search'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildToolIcon(BuildContext context, IconData icon, String label) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: theme.colorScheme.onSurface, size: 24),
        const SizedBox(height: 4),
        Text(
          label,
          style: SacredStyles.withColor(
            SacredStyles.inter10Bold,
            theme.colorScheme.onSurface,
          ),
        ),
      ],
    );
  }
}
