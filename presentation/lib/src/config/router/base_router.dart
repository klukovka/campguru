import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

abstract class BaseRouter {
  final StackRouter stackRouter;

  const BaseRouter(this.stackRouter);

  T? getObserver<T extends AutoRouteObserver>(BuildContext context) {
    return RouterScope.of(context).firstObserverOfType<T>();
  }

  @visibleForTesting
  void popToRoot() => stackRouter.popUntilRoot();

  Future<void> pushByPath(String path) => stackRouter.pushNamed(path);

  Future<void> pop<T>([T? result]) => stackRouter.pop<T>(result);

  void popUntilPath(String path) => stackRouter.popUntilRouteWithName(path);

  Future<T?> push<T>(PageRouteInfo<dynamic> route) =>
      stackRouter.push<T?>(route);

  Future<void> pushAll(List<PageRouteInfo<dynamic>> routes) =>
      stackRouter.pushAll(routes);

  Future<void> replaceLast(List<PageRouteInfo<dynamic>> routes) =>
      stackRouter.popAndPushAll(routes);

  Future<void> replace(PageRouteInfo<dynamic> route) =>
      stackRouter.replace(route);

  Future<void> replacePath(String path) => stackRouter.replaceNamed(path);

  Future<void> pushAndClearStack(PageRouteInfo<dynamic> route) {
    return stackRouter.pushAndPopUntil(route, predicate: (_) => false);
  }
}
