import 'package:components/components.dart';
import 'package:domain/domain.dart';

abstract class EntitiesSkeletonizerUtils {
  static final review = Review(
    id: -1,
    user: user,
    mark: 5,
    review: SkeletonUtils.longText,
    createdAt: DateTime(2, 2, 2002),
    photos: const ['', '', ''],
  );

  static const user = User(
    id: -1,
    email: 'somemockedemail@gmail.com',
    name: SkeletonUtils.shortText,
    surname: SkeletonUtils.shortText,
    photo: null,
  );
}
