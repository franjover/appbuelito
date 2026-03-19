import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

/// Always-visible red FAB for the "Me ahogo" (I'm choking) flow.
/// Placed on all screens via ShellRoute.
class ChokingFab extends StatefulWidget {
  final VoidCallback onPressed;

  const ChokingFab({super.key, required this.onPressed});

  @override
  State<ChokingFab> createState() => _ChokingFabState();
}

class _ChokingFabState extends State<ChokingFab>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.08).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: SizedBox(
        width: 72,
        height: 72,
        child: FloatingActionButton(
          heroTag: 'choking_fab',
          onPressed: widget.onPressed,
          backgroundColor: AppColors.chokingFab,
          elevation: 8,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.air, size: 28, color: Colors.white),
              Text(
                'RESPIRAR',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
