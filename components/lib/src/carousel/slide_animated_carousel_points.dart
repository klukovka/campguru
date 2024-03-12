import 'package:components/src/carousel/slider_point.dart';
import 'package:flutter/material.dart';

class SlideAnimatedCarouselPoints extends StatelessWidget {
  final PageController controller;
  final int itemCount;
  final Color? selectedColor;
  final Color? uselectedColor;

  const SlideAnimatedCarouselPoints({
    super.key,
    required this.controller,
    required this.itemCount,
    this.selectedColor,
    this.uselectedColor,
  });

  @override
  Widget build(BuildContext context) {
    const duration = Duration(milliseconds: 200);

    return ListenableBuilder(
      listenable: controller,
      builder: (context, child) {
        final page = controller.page?.round() ?? 0;
        return SizedBox(
          height: 8,
          width: 104,
          child: Stack(
            alignment: Alignment.center,
            children: List.generate(itemCount, (index) {
              final isCurrent = page == index;

              final pageCoefficient = page == 0
                  ? 1
                  : (page == itemCount - 1)
                      ? -1
                      : 0;

              const shiftCoefficient = 16.0;
              final shift = (index - page - pageCoefficient) * shiftCoefficient;
              final double size = switch (shift.abs() / shiftCoefficient) {
                2 => 6,
                3 => 4,
                _ => 8,
              };

              return AnimatedPositioned(
                duration: duration,
                left: shift + 48,
                width: 8,
                child: SliderPoint(
                  isCurrent: isCurrent,
                  onPressed: () => controller.animateToPage(
                    index > page ? index : index - 1,
                    duration: duration,
                    curve: Curves.linear,
                  ),
                  size: size,
                  color: isCurrent ? selectedColor : uselectedColor,
                ),
              );
            }),
          ),
        );
      },
    );
  }
}
