import 'package:flutter/material.dart';
import 'package:flutter_declarative_mdx/layout/extensible_markdown/tag_handler.dart';

final _submitModelTag = 'SubmitModel';

class SubmitModelType {
  static final text = "text";
}

class SubmitModelTagHandler extends TagHandler {
  @override
  InlineSpan build(String content, Map<String, String> attributes) {
    final String label = attributes["label"] ?? "Submit model";

    onSubmitModelPressed() {
      print("Submit Model.");
    }

    return WidgetSpan(
      child: TextButton(onPressed: onSubmitModelPressed, child: Text(label)),
    );
  }

  @override
  String get tag => _submitModelTag;
}
