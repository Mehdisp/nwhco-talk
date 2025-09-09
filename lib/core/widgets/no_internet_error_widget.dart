import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:nwhco_app/core/util/extensions/context_extensions.dart';
import 'package:nwhco_app/core/values/colors.dart';

class NoInternetErrorWidget extends StatelessWidget {
  final VoidCallback? onTryAgainTap;

  const NoInternetErrorWidget({
    this.onTryAgainTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (context.isDarkMode)
            SvgPicture.asset('assets/images/svg/disconnected-dark.svg')
          else
            SvgPicture.asset('assets/images/svg/disconnected.svg'),
          const SizedBox(height: 48),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'No Internet Connection !'.tr(),
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
              'Something went wrong. Try refreshing the page or check your internet connection'
                  .tr(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.grey3,
              ),
            ),
          ),
          const SizedBox(height: 24),
          if (onTryAgainTap != null)
            FilledButton.icon(
              style: FilledButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: AppColors.black,
                minimumSize: const Size(40, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onPressed: onTryAgainTap,
              icon: const Icon(
                Icons.refresh_rounded,
                color: AppColors.black,
              ),
              label: Text('Try Again'.tr()),
            ),
        ],
      ),
    );
  }
}
