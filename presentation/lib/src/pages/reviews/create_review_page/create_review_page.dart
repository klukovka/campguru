import 'package:components/components.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:localizations/localizations.dart';
import 'package:presentation/presentation.dart';
import 'package:presentation/src/utils/extensions/build_context_extension.dart';

enum CreateReviewPageField {
  text,
  rating,
  photos,
}

class CreateReviewPage extends StatefulWidget {
  final ReviewType type;
  final int id;

  const CreateReviewPage({
    super.key,
    required this.id,
    required this.type,
  });

  @override
  State<CreateReviewPage> createState() => _CreateReviewPageState();
}

class _CreateReviewPageState extends State<CreateReviewPage> {
  final _fbKey = GlobalKey<FormBuilderState>();
  bool _buttonPressed = false;

  FormBuilderState? get _fbState => _fbKey.currentState;
  Map<String, dynamic> get _fbValues => _fbState?.value ?? {};

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateReviewPageCubit, CreateReviewPageState>(
      listener: (context, state) {
        if (_buttonPressed && !state.isLoading && !state.hasError) {
          _buttonPressed = false;
          context.appRouter.pop();
        } else if (_buttonPressed && !state.isLoading && state.hasError) {
          _buttonPressed = false;
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: DefaultAppBar(onPop: context.appRouter.pop),
          body: AutovalidateModeNotificationBuilder(
            builder: (context, autovalidateMode, child) => FormBuilder(
              key: _fbKey,
              autovalidateMode: autovalidateMode,
              child: CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 24, horizontal: 16),
                    sliver: SliverFillRemaining(
                      hasScrollBody: false,
                      child: Column(
                        children: [
                          FormBuilderTextField(
                            name: CreateReviewPageField.text.name,
                            validator: FormBuilderValidators.required(),
                            maxLength: 200,
                            maxLines: 4,
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
                          const Spacer(),
                          Builder(builder: (context) {
                            return _buildSaveButton(context, state);
                          }),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildSaveButton(
    BuildContext context,
    CreateReviewPageState state,
  ) {
    return Container(
      margin: EdgeInsets.only(
        top: 20,
        bottom: MediaQuery.paddingOf(context).bottom,
      ),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          AutovalidateModeNotification(
            AutovalidateMode.onUserInteraction,
          ).dispatch(context);
          if (_fbState?.saveAndValidate() ?? false) {
            _buttonPressed = true;
            final controller = context.locator<CreateReviewPageController>();
            controller(
              NewReview(
                reviewType: widget.type,
                text: _fbValues[CreateReviewPageField.text.name],
                rating: _fbValues[CreateReviewPageField.rating.name],
                photos: _fbValues[CreateReviewPageField.photos.name],
              ),
            );
          }
        },
        child: state.isLoading
            ? const Padding(
                padding: EdgeInsets.all(4),
                child: CircularProgressIndicator(),
              )
            : Text(context.strings.save),
      ),
    );
  }
}
