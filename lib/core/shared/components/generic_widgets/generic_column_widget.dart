import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class GenericColumnWidget extends StatelessWidget {
  GenericColumnWidget({super.key, required this.children});
  final List<Widget> children;

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Scrollbar(
        controller: _scrollController,
        thumbVisibility: true,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: AnimationLimiter(
            child: Column(
              children: AnimationConfiguration.toStaggeredList(
                duration: const Duration(milliseconds: 750),
                delay: const Duration(milliseconds: 400),
                childAnimationBuilder: (widget) => SlideAnimation(
                  verticalOffset: 30,
                  delay: const Duration(milliseconds: 400),
                  curve: Curves.bounceOut,
                  child: FadeInAnimation(
                    child: widget,
                  ),
                ),
                children: children,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
