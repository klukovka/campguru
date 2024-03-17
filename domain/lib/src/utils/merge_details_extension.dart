import 'package:domain/domain.dart';

extension MergeDetailsExtension<T extends TableItem<T>> on List<T> {
  List<T> merge(T details) => map((item) {
        return item.id == details.id ? item.merge(details) : item;
      }).toList();
}
