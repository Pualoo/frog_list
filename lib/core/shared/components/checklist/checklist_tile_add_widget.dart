import 'package:flutter/material.dart';

class ChecklistTileAddWidget extends StatelessWidget {
  const ChecklistTileAddWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 55,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
        border: Border.all(width: 1, color: Colors.grey),
      ),
      child: const Center(
        child: Icon(
          Icons.add_rounded,
          color: Colors.white,
          size: 32,
        ),
      ),
    );
  }
}
