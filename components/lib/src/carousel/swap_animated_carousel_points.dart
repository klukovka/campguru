import 'package:components/src/carousel/slider_point.dart';
import 'package:flutter/material.dart';

class SwapAnimatedCarouselPoints extends StatelessWidget {
  final PageController controller;
  final int itemCount;
  final Color? selectedColor;
  final Color? uselectedColor;

  const SwapAnimatedCarouselPoints({
    super.key,
    required this.controller,
    required this.itemCount,
    this.selectedColor,
    this.uselectedColor,
  });

  @override
  Widget build(BuildContext context) {
    const duration = Duration(milliseconds: 200);
    const pointSize = 16.0;
    return ListenableBuilder(
      listenable: controller,
      builder: (context, child) {
        final page = controller.page?.round() ?? 0;
        return Stack(
          alignment: Alignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 1; i < itemCount; i++)
                  AnimatedPadding(
                    duration: duration,
                    padding: const EdgeInsets.symmetric(horizontal: 4) +
                        EdgeInsets.only(
                          left: page == i - 1 ? pointSize : 0,
                          right: page == itemCount - 1 && i == page
                              ? pointSize
                              : 0,
                        ),
                    child: SliderPoint(
                      isCurrent: false,
                      color: uselectedColor,
                      onPressed: () => controller.animateToPage(
                        i > page ? i : i - 1,
                        duration: duration,
                        curve: Curves.linear,
                      ),
                    ),
                  ),
              ],
            ),
            AnimatedPadding(
              duration: duration,
              padding: const EdgeInsets.symmetric(horizontal: 4) +
                  EdgeInsets.only(
                    left: page * pointSize,
                    right: (itemCount - 1 - page) * pointSize,
                  ),
              child: SliderPoint(
                isCurrent: true,
                color: selectedColor,
                onPressed: () => controller.animateToPage(
                  page,
                  duration: duration,
                  curve: Curves.linear,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
