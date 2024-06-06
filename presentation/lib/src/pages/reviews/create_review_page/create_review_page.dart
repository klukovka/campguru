import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:presentation/src/utils/extensions/build_context_extension.dart';

enum CreateReviewPageType {
  location,
  route;
}

abstract class CreateReviewPage extends StatelessWidget {
  const CreateReviewPage({
    super.key,
  });

  CreateReviewPageType get type;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(onPop: context.appRouter.pop),
    );
  }
}
