import 'package:domain/domain.dart';

extension UpdateFavoriteStatusExtension<T extends FavoriteTableItem<T>>
    on List<T> {
  List<T> updateFavoriteStatus(int id, bool isFavorite) => map((item) {
        return item.id == id ? item.copyWith(isFavorite: isFavorite) : item;
      }).toList();
}
