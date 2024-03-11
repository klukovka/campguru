import 'package:equatable/equatable.dart';

class Chunk<T> extends Equatable {
  final int fullCount;
  final List<T> values;

  Chunk({
    required this.fullCount,
    required this.values,
  });

  @override
  List<Object?> get props => [fullCount, values];
}
