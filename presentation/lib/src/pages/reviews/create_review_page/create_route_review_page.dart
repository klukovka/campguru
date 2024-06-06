import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/presentation.dart';
import 'package:presentation/src/pages/reviews/create_review_page/create_review_page.dart';
import 'package:presentation/src/utils/extensions/build_context_extension.dart';

@RoutePage()
class CreateRouteReviewPage extends StatelessWidget {
  final int id;

  const CreateRouteReviewPage({
    super.key,
    @PathParam('id') required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.locator<CreateReviewPageCubit>(),
      child: CreateReviewPage(
        id: id,
        type: CreateReviewPageType.location,
      ),
    );
  }
}
