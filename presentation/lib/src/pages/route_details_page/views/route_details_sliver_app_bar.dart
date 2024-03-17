import 'package:components/components.dart';
import 'package:domain/domain.dart' as domain;
import 'package:flutter/material.dart';
import 'package:presentation/src/utils/extensions/build_context_extension.dart';
import 'package:presentation/src/views/routes/route_favorite_button/route_favorite_button.dart';
import 'package:skeletonizer/skeletonizer.dart';

//TODO: Fix like and back actions visibility
class RouteDetailsSliverAppBar extends StatelessWidget {
  final domain.Route route;
  final double toolbarHeight;
  final Future<void> Function()? onStretch;

  const RouteDetailsSliverAppBar({
    super.key,
    required this.route,
    this.toolbarHeight = 48,
    this.onStretch,
  });

  @override
  Widget build(BuildContext context) {
    final safeTopPadding = MediaQuery.paddingOf(context).top;

    final image = LayoutBuilder(builder: (context, constraints) {
      return Image.network(
        route.mapUrl,
        fit: BoxFit.cover,
        height: constraints.maxHeight,
        width: constraints.maxWidth,
      );
    });
    return SliverAppBar(
      toolbarHeight: toolbarHeight,
      expandedHeight: MediaQuery.sizeOf(context).width - safeTopPadding,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Skeleton.ignore(
            child: ArrowCircleButton.back(
              onPressed: context.appRouter.pop,
            ),
          ),
          Skeleton.ignore(
            child: RouteFavoriteButton(route: route),
          ),
        ],
      ),
      pinned: true,
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(
        stretchModes: const [
          StretchMode.fadeTitle,
          StretchMode.blurBackground,
          StretchMode.zoomBackground,
        ],
        title: image,
        background: image,
      ),
      bottom: RatingInfoNameAppBar(
        mark: route.mark,
        name: route.name,
      ),
      onStretchTrigger: onStretch,
    );
  }
}
