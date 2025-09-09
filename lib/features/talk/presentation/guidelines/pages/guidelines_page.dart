import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nwhco_app/core/widgets/app_tab_bar.dart';

import '../cubit/guidelines_cubit.dart';

class TalkGuidelinesPage extends StatefulWidget {
  const TalkGuidelinesPage({super.key});

  @override
  State<TalkGuidelinesPage> createState() => _GuidelinesPageState();
}

class _GuidelinesPageState extends State<TalkGuidelinesPage>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GuidelinesCubit(),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leadingWidth: 64,
          centerTitle: true,
          title: Text('Guidelines'.tr()),
          bottom: AppTabBar(
            controller: tabController,
            tabs: [
              Tab(child: Text('Users'.tr())),
              Tab(child: Text('Providers'.tr())),
            ],
          ),
        ),
        body: Center(
          child: Text('Guidelines'.tr()),
        ),
      ),
    );
  }
}
