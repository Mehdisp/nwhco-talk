import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nwhco_app/core/widgets/no_internet_error_widget.dart';

import '../cubit/chat_cubit.dart';
import 'chat_list_view.dart';
import 'chat_loading_widget.dart';

class ChatStatesHandler extends StatelessWidget {
  const ChatStatesHandler({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        if (state.status == ChatStatus.failed) {
          return const NoInternetErrorWidget();
        }

        if (state.status == ChatStatus.loading) {
          return const LoadingChatWidget();
        }

        return const ChatListView();
      },
    );
  }
}
