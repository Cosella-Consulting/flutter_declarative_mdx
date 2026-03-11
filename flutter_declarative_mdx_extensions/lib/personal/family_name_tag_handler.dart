import 'package:flutter/material.dart';
import 'package:flutter_declarative_mdx/hooks/use_model_state_provider.dart';
import 'package:flutter_declarative_mdx/layout/extensible_markdown/tag_handler.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

final _selectTag = 'FamilyName';

class FamilyNameTagHandler extends TagHandler {
  @override
  InlineSpan build(String content, Map<String, String> attributes) {
    final String? label = attributes["label"];
    final String? propertyName = attributes["propertyName"];

    final modelProvider = useModelStateProvider();
    final controller = useTextEditingController(
      text: modelProvider.model[propertyName],
    );

    onInputChanged(String value) {
      modelProvider.updateModel(propertyName, value);
    }

    final children = <Widget>[];

    if (label != null) {
      children.add(Text(label));
    }

    children.add(TextField(controller: controller, onChanged: onInputChanged));

    return WidgetSpan(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }

  @override
  String get tag => _selectTag;
}
