import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nwhco_app/core/values/colors.dart';

import '../cubit/chat_cubit.dart';
import '../widgets/chat_states_handler.dart';

class TalkChatPage extends StatelessWidget {
  const TalkChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatCubit(),
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 64,
          title: Text(
            'Chat',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
          ),
        ),
        body: const ChatStatesHandler(),
      ),
    );
  }
}
