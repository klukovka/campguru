import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class SearchField extends StatefulWidget {
  final ValueSetter<String> search;

  const SearchField({super.key, required this.search});

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  late final TextEditingController _controller;
  late final PublishSubject<String> _subject;

  @override
  void initState() {
    super.initState();
    _subject = PublishSubject<String>();
    _controller = TextEditingController()
      ..addListener(() => _subject.add(_controller.text));
    _subject.stream
        .debounce((_) => TimerStream(_, const Duration(seconds: 1)))
        .listen((event) => widget.search(event));
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        prefixIcon:
            Icon(Theme.of(context).extension<SearchFieldThemeData>()?.magnify),
        //TODO: Localizations
        hintText: 'Search Locations',
        suffixIcon: IconButton(
          onPressed: () => _controller.text = '',
          icon: Icon(
            Theme.of(context).extension<SearchFieldThemeData>()?.clear,
          ),
        ),
      ),
    );
  }
}

class SearchFieldThemeData extends ThemeExtension<SearchFieldThemeData> {
  final IconData magnify;
  final IconData clear;

  SearchFieldThemeData({
    required this.magnify,
    required this.clear,
  });

  @override
  SearchFieldThemeData copyWith({
    IconData? magnify,
    IconData? clear,
  }) {
    return SearchFieldThemeData(
      magnify: magnify ?? this.magnify,
      clear: clear ?? this.clear,
    );
  }

  @override
  ThemeExtension<SearchFieldThemeData> lerp(
          covariant ThemeExtension<SearchFieldThemeData>? other, double t) =>
      this;
}