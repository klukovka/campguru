import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:localizations/localizations.dart';
import 'package:presentation/src/utils/extensions/build_context_extension.dart';

enum CreateReviewPageType {
  location,
  route;
}

enum CreateReviewPageField {
  text,
  rating,
  photos,
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
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  FormBuilderTextField(
                    name: CreateReviewPageField.text.name,
                    validator: FormBuilderValidators.required(),
                    decoration: InputDecoration(
                      labelText: context.strings.review,
                    ),
                  ),
                  const SizedBox(height: 12),
                  RatingField(
                    name: CreateReviewPageField.rating.name,
                    validator: FormBuilderValidators.required(),
                  ),
                  const SizedBox(height: 12),
                  ImagesPickerField(
                    name: CreateReviewPageField.photos.name,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
