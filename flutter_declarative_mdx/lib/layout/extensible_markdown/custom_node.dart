import 'package:flutter/material.dart';
import 'package:flutter_declarative_mdx/layout/extensible_markdown/tag_handler.dart';
import 'package:markdown_widget/markdown_widget.dart';

class CustomNode extends ElementNode {
  final List<TagHandler>? tagHandlers;
  final String text;
  final MarkdownConfig config;

  String? customTag;
  String? customContent;
  Map<String, String>? customAttributes;

  CustomNode({this.tagHandlers, required this.text, required this.config});

  Map<String, String> attributesFromText(String tag, String parseTarget) {
    final RegExp attrRegExp = RegExp(
      '([a-zA-Z_:][-a-zA-Z0-9_:.]*)\\s*=\\s*("([^"]*)"|\'([^\']*)\')',
      caseSensitive: false,
    );

    final attributes = <String, String>{};

    for (final match in attrRegExp.allMatches(parseTarget)) {
      final attrName = match.group(1);
      final attrValue =
          match.group(3) ??
          match.group(4); // 3 = double-quoted, 4 = single-quoted
      if (attrName != null && attrValue != null) {
        attributes[attrName] = attrValue;
      }
    }

    return attributes;
  }

  String contentFromText(String tag, String parseTarget) {
    final RegExp attrRegExp = RegExp(
      '\\s*<([\\w\\W\\s]+)>\\s*([\\w\\W\\s]+)\\s*<\\/([\\w\\W\\s]+)>\\s*',
      caseSensitive: false,
    );

    for (final match in attrRegExp.allMatches(parseTarget)) {
      final attrContent = match.group(2);
      if (attrContent != null) {
        return attrContent;
      }
    }

    return "";
  }

  @override
  InlineSpan build() {
    if (customTag == null) {
      return super.build();
    }

    return (tagHandlers ?? [])
        .firstWhere((handler) => handler.tag == customTag)
        .build(customContent ?? "", customAttributes!);
  }

  @override
  void onAccepted(SpanNode parent) {
    final textStyle = config.p.textStyle.merge(parentStyle);

    // Handle special tags
    for (var handler in (tagHandlers ?? [])) {
      if (text.contains(RegExp('<${handler.tag}[^>]*>'))) {
        customTag = handler.tag;
        customContent = contentFromText(handler.tag, text);
        customAttributes = attributesFromText(handler.tag, text);
        accept(ConcreteElementNode(tag: handler.tag));
        return;
      }
    }

    // Handle everything else
    accept(TextNode(text: text, style: textStyle));
  }
}
