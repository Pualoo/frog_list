import 'package:flutter/material.dart';

class GenericListTileWidget extends StatelessWidget {
  const GenericListTileWidget({super.key, this.leading, this.title, this.onTap});
  final Widget? leading;
  final Widget? title;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
        border: Border.all(width: 1, color: Colors.grey),
      ),
      child: ListTile(
        leading: leading,
        title: title,
        onTap: onTap,
      ),
    );
  }
}
