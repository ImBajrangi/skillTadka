import 'package:flutter/material.dart';
import 'dart:ui';
import '../theme/app_theme.dart';

class PremiumShineEffect extends StatefulWidget {
  final Widget child;
  final bool enabled;

  const PremiumShineEffect(
      {super.key, required this.child, this.enabled = true});

  @override
  State<PremiumShineEffect> createState() => _PremiumShineEffectState();
}

class _PremiumShineEffectState extends State<PremiumShineEffect>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6), // Slower animation is cheaper
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.enabled) return widget.child;

    return RepaintBoundary(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return ShaderMask(
            shaderCallback: (rect) {
              return LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [
                  _controller.value - 0.2,
                  _controller.value,
                  _controller.value + 0.2,
                ],
                colors: [
                  Colors.white.withValues(alpha: 0.0),
                  Colors.white.withValues(alpha: 0.15), // Reduced intensity
                  Colors.white.withValues(alpha: 0.0),
                ],
              ).createShader(rect);
            },
            child: child,
          );
        },
        child: widget.child,
      ),
    );
  }
}

class GrainyTextureOverlay extends StatelessWidget {
  final double opacity;
  const GrainyTextureOverlay({super.key, this.opacity = 0.05});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: opacity * 0.5),
        ),
      ),
    );
  }
}

class PremiumGlassContainer extends StatelessWidget {
  final Widget child;
  final double blur;
  final double opacity;
  final BorderRadius? borderRadius;
  final bool showShimmer;
  final Color? borderColor;
  final bool useBlur;
  final Gradient? gradient; // Added gradient support
  final List<BoxShadow>? boxShadow; // Added boxShadow support
  final Color? fillColor; // Added fillColor support

  const PremiumGlassContainer({
    super.key,
    required this.child,
    this.blur = 7.0, // Reduced default sigma
    this.opacity = 0.08,
    this.borderRadius,
    this.showShimmer = false,
    this.borderColor,
    this.useBlur = true,
    this.gradient,
    this.boxShadow,
    this.fillColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final effectiveRadius =
        borderRadius ?? BorderRadius.circular(AppTheme.borderRadius);

    Widget container = Container(
      decoration: BoxDecoration(
        color: gradient != null
            ? null
            : (fillColor ?? (isDark ? Colors.black : Colors.white))
                .withValues(alpha: opacity),
        gradient: gradient,
        boxShadow: boxShadow,
        borderRadius: effectiveRadius,
        border: Border.all(
          color:
              borderColor ?? theme.colorScheme.outline.withValues(alpha: 0.3),
          width: 0.5,
        ),
      ),
      child: Stack(
        children: [
          if (showShimmer)
            Positioned.fill(
              child: PremiumShineEffect(
                enabled: true,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.white.withValues(alpha: 0.0),
                        Colors.white.withValues(alpha: 0.03),
                        Colors.white.withValues(alpha: 0.0),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          child,
        ],
      ),
    );

    if (useBlur && blur > 0) {
      return ClipRRect(
        borderRadius: effectiveRadius,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
          child: container,
        ),
      );
    }

    return container;
  }
}

class BouncyButton extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final double scaleFactor;

  const BouncyButton({
    super.key,
    required this.child,
    this.onTap,
    this.scaleFactor = 0.95,
  });

  @override
  State<BouncyButton> createState() => _BouncyButtonState();
}

class _BouncyButtonState extends State<BouncyButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: widget.scaleFactor)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => widget.onTap != null ? _controller.forward() : null,
      onTapUp: (_) => widget.onTap != null ? _controller.reverse() : null,
      onTapCancel: () => widget.onTap != null ? _controller.reverse() : null,
      onTap: widget.onTap,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: widget.child,
      ),
    );
  }
}
