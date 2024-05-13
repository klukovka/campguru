import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CacheProgressView extends StatefulWidget {
  final double progress;

  const CacheProgressView({
    super.key,
    required this.progress,
  });

  @override
  State<CacheProgressView> createState() => _CacheProgressViewState();
}

class _CacheProgressViewState extends State<CacheProgressView> {
  static const _animationDuration = Duration(milliseconds: 100);
  bool _isExpanded = true;

  @override
  Widget build(BuildContext context) {
    final progress = widget.progress;
    return Align(
      alignment: Alignment.centerLeft,
      child: LayoutBuilder(builder: (context, constraints) {
        return Stack(
          children: [
            AnimatedContainer(
              duration: _animationDuration,
              width: (_isExpanded ? constraints.maxWidth : 56) * progress / 100,
              height: 56,
              decoration: BoxDecoration(
                color:
                    Theme.of(context).colorScheme.onBackground.withOpacity(0.5),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            Material(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.7),
              borderRadius: BorderRadius.circular(12),
              clipBehavior: Clip.hardEdge,
              child: InkWell(
                onTap: () => setState(() => _isExpanded = !_isExpanded),
                child: AnimatedContainer(
                  duration: _animationDuration,
                  width: _isExpanded ? constraints.maxWidth : 56,
                  height: 56,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    children: [
                      SpinKitThreeBounce(
                        color: Theme.of(context).colorScheme.onPrimary,
                        size: 16,
                      ),
                      AnimatedSize(
                        alignment: Alignment.centerLeft,
                        duration: Duration(
                          milliseconds: _animationDuration.inMilliseconds ~/ 5,
                        ),
                        child: _isExpanded
                            ? Padding(
                                padding: const EdgeInsets.only(left: 12),
                                child: Text(
                                  //TODO: add localizations
                                  'Caching $progress%',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge
                                      ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimary,
                                      ),
                                ),
                              )
                            : null,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
