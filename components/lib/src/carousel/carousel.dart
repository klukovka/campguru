import 'package:components/src/carousel/slide_animated_carousel_points.dart';
import 'package:components/src/carousel/swap_animated_carousel_points.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CarouselDecorator {
  final Color? selectedColor;
  final Color? uselectedColor;
  final BoxConstraints? itemConstraints;

  const CarouselDecorator({
    this.selectedColor,
    this.uselectedColor,
    this.itemConstraints,
  });

  CarouselDecorator copyWith({
    Color? selectedColor,
    Color? uselectedColor,
    BoxConstraints? itemConstraints,
  }) =>
      CarouselDecorator(
        selectedColor: selectedColor ?? this.selectedColor,
        uselectedColor: uselectedColor ?? this.uselectedColor,
        itemConstraints: itemConstraints ?? this.itemConstraints,
      );
}

class Carousel extends StatefulWidget {
  final List<Widget> children;
  final Clip clipBehavior;
  final bool padEnds;
  final double viewportFraction;
  final int itemCount;
  final CarouselDecorator? decorator;
  final void Function(int)? onPageChanged;
  final Widget Function(
    BuildContext context,
    Widget carousel,
    Widget points,
  )? builder;

  const Carousel({
    super.key,
    required this.children,
    this.clipBehavior = Clip.none,
    this.padEnds = true,
    this.viewportFraction = 1,
    this.decorator,
    this.onPageChanged,
    this.builder,
  }) : itemCount = children.length;

  factory Carousel.builder({
    Key? key,
    Clip clipBehavior = Clip.none,
    bool padEnds = true,
    double viewportFraction = 1,
    CarouselDecorator? decorator,
    void Function(int)? onPageChanged,
    required int itemCount,
    required Widget Function(int) itemBuilder,
    Widget Function(
      BuildContext context,
      Widget carousel,
      Widget points,
    )? builder,
  }) =>
      Carousel(
        key: key,
        clipBehavior: clipBehavior,
        padEnds: padEnds,
        viewportFraction: viewportFraction,
        decorator: decorator,
        onPageChanged: onPageChanged,
        builder: builder,
        children: List.generate(itemCount, itemBuilder),
      );

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  late final PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController(viewportFraction: widget.viewportFraction);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final carousel = ConstrainedBox(
      constraints: widget.decorator?.itemConstraints ?? const BoxConstraints(),
      child: PageView(
        clipBehavior: widget.clipBehavior,
        padEnds: widget.padEnds,
        controller: _controller,
        onPageChanged: widget.onPageChanged,
        children: widget.children,
      ),
    );
    final points = widget.itemCount > 4
        ? SlideAnimatedCarouselPoints(
            controller: _controller,
            itemCount: widget.itemCount,
            selectedColor: widget.decorator?.selectedColor,
            uselectedColor: widget.decorator?.uselectedColor,
          )
        : SwapAnimatedCarouselPoints(
            controller: _controller,
            itemCount: widget.itemCount,
            selectedColor: widget.decorator?.selectedColor,
            uselectedColor: widget.decorator?.uselectedColor,
          );
    return widget.builder?.call(context, carousel, points) ??
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(child: carousel),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: points,
            )
          ],
        );
  }
}
