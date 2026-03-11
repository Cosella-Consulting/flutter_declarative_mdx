import 'package:flutter/material.dart';

abstract class TagHandler {
  String get tag;
  InlineSpan build(String content, Map<String, String> attributes);
}
