import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

/// A card with large text and clear visual states, designed for elderly users.
class LargeCard extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final Widget? child;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final Color? borderColor;
  final IconData? leadingIcon;
  final Widget? trailing;
  final EdgeInsets? padding;

  const LargeCard({
    super.key,
    this.title,
    this.subtitle,
    this.child,
    this.onTap,
    this.backgroundColor,
    this.borderColor,
    this.leadingIcon,
    this.trailing,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor ?? AppColors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: borderColor != null
            ? BorderSide(color: borderColor!, width: 2)
            : BorderSide.none,
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: padding ?? const EdgeInsets.all(20),
          child: child ??
              Row(
                children: [
                  if (leadingIcon != null) ...[
                    Icon(leadingIcon, size: 32, color: AppColors.primary),
                    const SizedBox(width: 16),
                  ],
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (title != null)
                          Text(
                            title!,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        if (subtitle != null) ...[
                          const SizedBox(height: 4),
                          Text(
                            subtitle!,
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: AppColors.textSecondary,
                                ),
                          ),
                        ],
                      ],
                    ),
                  ),
                  if (trailing != null) trailing!,
                ],
              ),
        ),
      ),
    );
  }
}
