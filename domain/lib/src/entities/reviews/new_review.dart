import 'dart:typed_data';

import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';

class NewReview extends Equatable {
  final ReviewType reviewType;
  final String text;
  final int rating;
  final List<Uint8List>? photos;

  NewReview({
    required this.reviewType,
    required this.text,
    required this.rating,
    required this.photos,
  });

  @override
  List<Object?> get props => [reviewType, text, rating, photos];
}
