import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';

abstract class FavoriteTableItem<T extends TableItem<T>> extends Equatable
    with TableItem<T> {
  @override
  final int id;
  final bool isFavorite;

  const FavoriteTableItem({
    required this.id,
    required this.isFavorite,
  });

  T copyWith({int? id, bool? isFavorite});
}
