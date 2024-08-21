
import 'package:flutter/cupertino.dart';
import '../../core/resources/themes.dart';
import 'custom_divider.dart';

class QuickAnnouncment extends StatelessWidget {
  final String assets;
  final String title;
  final double imageSize;
  final String? subtitle;
  final Color? textColor;
  final List<Widget>? actions;
  const QuickAnnouncment({super.key, required this.assets, required this.title, this.subtitle, this.imageSize = 150, this.actions, this.textColor});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Image.asset(
          assets,
          fit: BoxFit.contain,
          width: imageSize,
          height: imageSize,
        ),
        const ColumnDivider(space: 15),
        Text(title, style: textTheme(context).headlineSmall!.copyWith(color: textColor), textAlign: TextAlign.center),
        const ColumnDivider(space: 5),
        if (subtitle != null) Text(subtitle!, style: textTheme(context).bodySmall!.copyWith(color: textColor), textAlign: TextAlign.center),
        if (actions != null) ...[const ColumnDivider(), ...actions!],
      ],
    );
  }
}
