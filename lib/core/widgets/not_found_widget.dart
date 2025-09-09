import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:nwhco_app/core/util/extensions/context_extensions.dart';
import 'package:nwhco_app/core/values/colors.dart';

class NotFoundWidget extends StatelessWidget {
  final VoidCallback? onBackTap;
  final String? description;

  const NotFoundWidget({
    this.onBackTap,
    this.description,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 56),
        if (context.isDarkMode)
          Image.asset(
            'assets/images/png/not-found-dark.png',
            width: double.infinity,
            fit: BoxFit.contain,
          )
        else
          Image.asset(
            'assets/images/png/not-found.png',
            width: double.infinity,
            fit: BoxFit.contain,
          ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Oh No!'.tr(),
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.normal,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            description ?? 'Something went wrong.'.tr(),
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.grey3,
            ),
          ),
        ),
        const SizedBox(height: 24),
        if (onBackTap != null)
          FilledButton.icon(
            style: FilledButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: AppColors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            onPressed: onBackTap,
            icon: const Icon(Icons.refresh_rounded),
            label: Text('Back to Home Page'.tr()),
          ),
      ],
    );
  }
}
