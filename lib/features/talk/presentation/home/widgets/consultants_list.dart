import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/user_home_cubit.dart';
import 'home_loading.dart';

class ConsultantsList extends StatelessWidget {
  const ConsultantsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserHomeCubit, UserHomeState>(
      builder: (context, state) {
        if (state.loading) {
          return HomeLoading();
        }

        // TODO: replace with consultants list
        final consultants = [];

        // if (consultants.isEmpty) {
        //   return const EmptyStateWidget();
        // }

        return ListView.separated(
          padding: EdgeInsets.all(16),
          itemCount: consultants.length,
          separatorBuilder: (_, i) => const SizedBox(height: 16),
          itemBuilder: (context, index) {
            // TODO: replace with consultant list item widget
            return SizedBox.shrink();
          },
        );
      },
    );
  }
}
