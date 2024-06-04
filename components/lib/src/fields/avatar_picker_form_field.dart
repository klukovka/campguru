import 'dart:typed_data';

import 'package:components/components.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AvatarPickerFormField extends FormBuilderField<Uint8List> {
  AvatarPickerFormField({
    super.key,
    required super.name,
    super.validator,
    super.onChanged,
    super.autovalidateMode,
    super.initialValue,
    String? imageUrl,
    double radius = 40,
  }) : super(
          builder: (state) => AvatarPicker(
            imageBytes: state.value,
            onPick: state.didChange,
            imageUrl: imageUrl,
            radius: radius,
          ),
        );
}
