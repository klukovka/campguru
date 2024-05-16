import 'package:auto_route/auto_route.dart';
import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/presentation.dart';
import 'package:presentation/src/pages/routes/views/route_tile.dart';
import 'package:presentation/src/utils/extensions/build_context_extension.dart';

@RoutePage()
class CachedRoutesTab extends StatefulWidget implements AutoRouteWrapper {
  const CachedRoutesTab({
    super.key,
  });

  @override
  State<CachedRoutesTab> createState() => _CachedRoutesTabState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider.value(
      value: context.locator<CachedRoutesTabCubit>(),
      child: this,
    );
  }
}

class _CachedRoutesTabState extends State<CachedRoutesTab> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.locator<CachedRoutesTabController>().initialLoading();
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.locator<CachedRoutesTabController>();
    return BlocBuilder<CachedRoutesTabCubit, CachedRoutesTabState>(
      builder: (context, state) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SearchField(
                isLoading: false,
                //TODO: Localizations
                hintText: 'Search Routes',
                search: controller.search,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => RouteTile(
                  route: state.routes[index],
                  buttonBelow: DeleteCircleButton(onPressed: () {
                    //TODO: Delete
                  }),
                  onPressed: () {
                    //TODO: Open cached location map
                  },
                ),
                itemCount: state.routes.length,
              ),
            ),
          ],
        );
      },
    );
  }
}
