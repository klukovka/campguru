import 'package:data/src/filters/direction_ext.dart';
import 'package:data/src/filters/sort_by_ext.dart';
import 'package:domain/domain.dart';

class FilterSerializer {
  final Filter filter;

  FilterSerializer(this.filter);

  @override
  String toString() {
    final direction = filter.direction != null
        ? '&direction=${filter.direction?.apiValue}'
        : '';
    final sortBy =
        filter.sortBy != null ? '&sort_by=${filter.sortBy?.apiValue}' : '';
    final labels = (filter.labels?.isNotEmpty ?? false)
        ? filter.labels!.map((e) => '&labels=${e.id}').join()
        : '';
    final search =
        (filter.search?.isNotEmpty ?? false) ? '&search=${filter.search}' : '';
    return 'page=${filter.page}&size=${filter.size}$direction$sortBy$labels$search';
  }
}
