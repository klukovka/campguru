import 'package:data/src/core/dto.dart';
import 'package:data/src/filters/filter_label_ext.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'premium_based_filter_label_dto.g.dart';

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class PremiumBasedFilterLabelDto extends Dto<PremiumBasedFilterLabel> {
  final int id;
  final String name;
  final bool premium;

  PremiumBasedFilterLabelDto({
    required this.id,
    required this.name,
    required this.premium,
  });

  factory PremiumBasedFilterLabelDto.fromJson(Map<String, dynamic> json) =>
      _$PremiumBasedFilterLabelDtoFromJson(json);

  @override
  PremiumBasedFilterLabel toDomain() => PremiumBasedFilterLabel(
        id: id,
        name: FilterLabel.values
            .firstWhere((element) => element.apiValue == name),
        isPremium: premium,
      );
}
