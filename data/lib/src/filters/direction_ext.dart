import 'package:domain/domain.dart';

extension DirectionExt on Direction {
  String get apiValue => switch (this) {
        Direction.asc => 'ASC',
        Direction.desc => 'DESC',
      };
}
