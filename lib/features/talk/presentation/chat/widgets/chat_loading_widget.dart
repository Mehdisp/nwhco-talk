import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nwhco_app/core/widgets/app_shimmer.dart';

class LoadingChatWidget extends StatelessWidget {
  const LoadingChatWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppShimmer(
      child: ListView.builder(
        reverse: true,
        primary: false,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.all(16),
        itemCount: 10,
        itemBuilder: (context, index) {
          return _MessagePlaceholder();
        },
      ),
    );
  }
}

class _MessagePlaceholder extends StatelessWidget {
  const _MessagePlaceholder();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final sent = Random().nextBool();

    return Directionality(
      textDirection: sent ? TextDirection.rtl : TextDirection.ltr,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!sent) ...[
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
            ],
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Container(
                width: 100.0 + Random().nextInt(200),
                height: 56.0 + Random().nextInt(56),
                constraints: BoxConstraints(
                  minWidth: 120,
                  maxWidth: size.width - 128,
                  maxHeight: 350,
                  minHeight: 56,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    topLeft: sent ? const Radius.circular(20) : Radius.zero,
                    topRight: sent ? Radius.zero : const Radius.circular(20),
                    bottomRight: const Radius.circular(20),
                    bottomLeft: const Radius.circular(20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
