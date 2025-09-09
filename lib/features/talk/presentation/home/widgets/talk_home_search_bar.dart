import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nwhco_app/core/widgets/app_text_from_field.dart';
import 'package:nwhco_app/core/widgets/app_bar_buttons.dart';

class TalkHomeSearchBar extends StatelessWidget implements PreferredSizeWidget {
  const TalkHomeSearchBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(72);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: Row(
        children: [
          Expanded(
            child: AppTextFormField(
              canRequestFocus: false,
              readOnly: true,
              filled: true,
              fillColor: Colors.white,
              hint: 'Search in Names or Specialties'.tr(),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(15),
              ),
              prefixIcon: SizedBox(
                height: 40,
                width: 40,
                child: Center(
                  child: SvgPicture.asset('assets/icons/search.svg'),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          AppActionButton(
            style: FilledButton.styleFrom(
              padding: EdgeInsets.zero,
              minimumSize: const Size(52, 52),
            ),
            onPressed: () {},
            child: SvgPicture.asset('assets/icons/web.svg'),
          ),
          const SizedBox(width: 8),
          AppActionButton(
            style: FilledButton.styleFrom(
              padding: EdgeInsets.zero,
              minimumSize: const Size(52, 52),
            ),
            onPressed: () {},
            child: SvgPicture.asset('assets/icons/filter.svg'),
          ),
        ],
      ),
    );
  }
}
