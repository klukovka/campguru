import 'package:components/components.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:presentation/src/pages/trips/trip_details_page/views/trip_chat_button.dart';
import 'package:presentation/src/utils/extensions/build_context_extension.dart';
import 'package:skeletonizer/skeletonizer.dart';

class TripDetailsSliverAppBar extends StatelessWidget {
  final Trip trip;
  final double toolbarHeight;
  final VoidCallback? onStretch;

  const TripDetailsSliverAppBar({
    super.key,
    required this.trip,
    this.toolbarHeight = 48,
    this.onStretch,
  });

  @override
  Widget build(BuildContext context) {
    final safeTopPadding = MediaQuery.paddingOf(context).top;

    final image = LayoutBuilder(builder: (context, constraints) {
      return Image.network(
        trip.route.mapUrl,
        fit: BoxFit.cover,
        height: constraints.maxHeight,
        width: constraints.maxWidth,
      );
    });
    return SliverAppBar(
      toolbarHeight: toolbarHeight,
      expandedHeight: MediaQuery.sizeOf(context).width - safeTopPadding,
      stretchTriggerOffset: 10,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Skeleton.ignore(
            child: ArrowCircleButton.back(
              onPressed: context.appRouter.pop,
            ),
          ),
          TripChatButton(tripId: trip.id),
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
        name: trip.name,
      ),
      onStretchTrigger: () async => onStretch?.call(),
    );
  }
}
