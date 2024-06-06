import 'package:auto_route/auto_route.dart';
import 'package:presentation/src/pages/reviews/create_review_page/create_review_page.dart';

@RoutePage()
class CreateRouteReviewPage extends CreateReviewPage {
  final int id;

  const CreateRouteReviewPage({
    super.key,
    @PathParam('id') required this.id,
  });

  @override
  CreateReviewPageType get type => CreateReviewPageType.route;
}
