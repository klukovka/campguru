import 'dart:typed_data';

import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';

class Review extends Equatable {
  final int id;
  final User user;
  final double mark;
  final String review;
  final DateTime createdAt;
  final List<Uint8List> photos;

  Review({
    required this.id,
    required this.user,
    required this.mark,
    required this.review,
    required this.createdAt,
    required this.photos,
  });

  @override
  List<Object> get props {
    return [
      id,
      user,
      mark,
      review,
      createdAt,
      photos,
    ];
  }
}
