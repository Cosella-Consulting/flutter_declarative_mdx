import 'package:flutter/material.dart';
import 'package:flutter_declarative_mdx/layout/extensible_markdown/tag_handler.dart';

final _inputTag = 'Callout';

class CalloutType {
  static final info = "info";
}

class CalloutTagHandler extends TagHandler {
  final Map<String, Color> colors = {CalloutType.info: Colors.blue};

  @override
  InlineSpan build(String content, Map<String, String> attributes) {
    final String type = attributes["type"] ?? CalloutType.info;

    return WidgetSpan(
      child: Text(
        content,
        style: TextStyle(color: colors[type], fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  String get tag => _inputTag;
}
