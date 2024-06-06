import 'package:auto_route/auto_route.dart';
import 'package:presentation/src/pages/reviews/create_review_page/create_review_page.dart';

@RoutePage()
class CreateLocationReviewPage extends CreateReviewPage {
  final int id;

  const CreateLocationReviewPage({
    super.key,
    @PathParam('id') required this.id,
  });

  @override
  CreateReviewPageType get type => CreateReviewPageType.location;
}
