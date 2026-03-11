import 'package:flutter/material.dart';
import 'package:flutter_declarative_mdx/layout/extensible_markdown/tag_handler.dart';

final _inputTag = 'NiNumber';

class NiNumberTagHandler extends TagHandler {
  @override
  InlineSpan build(String content, Map<String, String> attributes) {
    return WidgetSpan(child: Text("NI Number"));
  }

  @override
  String get tag => _inputTag;
}
