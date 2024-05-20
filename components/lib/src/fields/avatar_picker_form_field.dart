import 'package:components/components.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AvatarPickerFormField extends FormBuilderField<PickedImage> {
  AvatarPickerFormField({
    super.key,
    required super.name,
    super.validator,
    super.onChanged,
    super.autovalidateMode,
    String? imageUrl,
    double radius = 40,
  }) : super(
          builder: (state) => AvatarPicker(
            imageBytes: state.value?.bytes,
            onPick: state.didChange,
            imageUrl: imageUrl,
            radius: radius,
          ),
        );
}
