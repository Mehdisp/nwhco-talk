import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nwhco_app/core/values/colors.dart';
import 'package:nwhco_app/core/widgets/app_bottom_navigation_bar.dart';
import 'package:nwhco_app/core/widgets/service_main_page.dart';

import 'guidelines/cubit/guidelines_cubit.dart';
import 'guidelines/pages/guidelines_page.dart';

import 'home/cubit/user_home_cubit.dart';
import 'home/pages/user_home_page.dart';

class TalkScreen extends StatelessWidget {
  const TalkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UserHomeCubit()),
        BlocProvider(create: (context) => GuidelinesCubit()),
      ],
      child: ServiceMainPage(
        pages: [
          const UserHomePage(),
          const TalkGuidelinesPage(),
          // const TalkProfilePage(),
        ],
        navigationBarItems: [
          NavigationBarItem(
            label: Text('Home'.tr()),
            icon: SvgPicture.asset('assets/icons/home.svg'),
            iconFilled: SvgPicture.asset(
              'assets/icons/home-fill.svg',
              colorFilter: const ColorFilter.mode(
                AppColors.talkPrimary,
                BlendMode.srcIn,
              ),
            ),
          ),
          NavigationBarItem(
            label: Text('Guidelines'.tr()),
            icon: SvgPicture.asset('assets/icons/guidelines.svg'),
            iconFilled: SvgPicture.asset(
              'assets/icons/guidelines-fill.svg',
              colorFilter: const ColorFilter.mode(
                AppColors.talkPrimary,
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
