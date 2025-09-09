import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nwhco_app/core/util/extensions/context_extensions.dart';
import 'package:nwhco_app/core/widgets/app_alert_dialog.dart';

import '../cubit/chat_cubit.dart';

class ChatListView extends StatefulWidget {
  const ChatListView({super.key});

  @override
  State<ChatListView> createState() => _ChatListViewState();
}

class _ChatListViewState extends State<ChatListView> {
  final dateFormat = DateFormat('yyyy MMM dd');

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        return Center(
          child: Text('Chat'.tr()),
        );
      },
    );
  }

  void _copyMessage() {
    // TODO: Copy message
    context.showSnackBar('Copied'.tr());
  }

  void _deleteMessage() async {
    final result = await AppAlertDialog(
      title: 'Delete message?'.tr(),
      message: 'Are you sure want to delete this message?'.tr(),
      positiveButtonText: 'Delete'.tr(),
    ).show(context);

    if (mounted && result == true) {
      // TODO: Delete message
    }
  }
}
