import 'package:components/components.dart';
import 'package:domain/domain.dart' as domain;
import 'package:flutter/material.dart';
import 'package:presentation/src/pages/routes/views/route_favorite_button/route_favorite_button.dart';
import 'package:presentation/src/utils/extensions/build_context_extension.dart';
import 'package:skeletonizer/skeletonizer.dart';

//TODO: Fix like and back actions visibility
class RouteDetailsSliverAppBar extends StatelessWidget {
  final domain.Route route;
  final double toolbarHeight;
  final Future<void> Function()? onStretch;
  final Widget? rightButton;

  const RouteDetailsSliverAppBar({
    super.key,
    required this.route,
    this.toolbarHeight = 48,
    this.onStretch,
    this.rightButton,
  });

  @override
  Widget build(BuildContext context) {
    final safeTopPadding = MediaQuery.paddingOf(context).top;

    final image = LayoutBuilder(builder: (context, constraints) {
      return GestureDetector(
        onTap: onStretch,
        child: CustomNetworkImage(
          imageUrl: route.mapUrl,
          height: constraints.maxHeight,
          width: constraints.maxWidth,
        ),
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
            child: IconCircleButton.arrowBack(
              onPressed: context.appRouter.pop,
            ),
          ),
          Skeleton.ignore(
            child: rightButton ?? RouteFavoriteButton(route: route),
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
