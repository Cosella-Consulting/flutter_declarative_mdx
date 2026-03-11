import 'package:flutter/material.dart';
import 'package:flutter_declarative_mdx/layout/extensible_markdown/tag_handler.dart';
import 'package:flutter_declarative_mdx/hooks/use_model_state_provider.dart';

final _selectTag = 'PersonalTitle';

class PersonalTitleTagHandler extends TagHandler {
  @override
  InlineSpan build(String content, Map<String, String> attributes) {
    final String? label = attributes["label"];
    final String? propertyName = attributes["propertyName"];

    final modelProvider = useModelStateProvider();

    final Map<String, String> options = {
      "Mr": "mr",
      "Mrs": "mrs",
      "Miss": "miss",
      "Ms": "ms",
      "Dr": "dr",
      "Prof.": "prof",
      "Rev.": "rev",
    };

    onSelectChanged(dynamic value) {
      modelProvider.updateModel(propertyName, value);
    }

    final children = <Widget>[];

    if (label != null) {
      children.add(Text(label));
    }

    children.add(
      DropdownButton(
        isExpanded: true,
        value: modelProvider.model[propertyName],
        onChanged: onSelectChanged,
        items:
            options.entries
                .map(
                  (entry) => DropdownMenuItem(
                    value: entry.value,
                    child: Text(entry.key),
                  ),
                )
                .toList(),
      ),
    );

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
