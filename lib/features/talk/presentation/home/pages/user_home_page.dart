import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:nwhco_app/core/widgets/feature_background.dart';
import 'package:nwhco_app/core/widgets/logo_name.dart';

import 'package:nwhco_app/features/habib_coin/presentation/widgets/habib_coins_button.dart';

import '../widgets/talk_home_search_bar.dart';
import '../widgets/consultants_list.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({super.key});

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  @override
  Widget build(BuildContext context) {
    return FeatureBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leadingWidth: 64,
          title: LogoName(title: 'Habib Talk'.tr()),
          actions: const [
            HabibCoinsButton(),
            SizedBox(width: 16),
          ],
          bottom: const TalkHomeSearchBar(),
        ),
        body: const ConsultantsList(),
      ),
    );
  }
}
