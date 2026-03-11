# Creating Custom Components

`flutter_declarative_mdx` allows you to extend Markdown by defining your own custom components. Custom components let you render domain-specific UI directly from MDX content while still using native Flutter widgets. This guide shows how to create and register a simple custom component.

## Step 1: Create a Class that extends TagHandler

To create a custom component, define a class that extends `TagHandler`. Each handler is responsible for rendering a specific tag and returning a Flutter `InlineSpan`.

Example:

```dart
import 'package:flutter/material.dart';
import 'package:flutter_declarative_mdx/layout/extensible_markdown/tag_handler.dart';
import 'package:flutter_declarative_mdx/providers/model_state_provider.dart';

final _inputTag = 'Callout';

class CalloutType {
  static final info = "info";
}

class CalloutTagHandler extends TagHandler {
  final Map<String, Color> colors = {
    CalloutType.info: Colors.blue,
  };

  @override
  InlineSpan build(
    String content,
    Map<String, String> attributes,
  ) {
    final String type = attributes["type"] ?? CalloutType.info;

    return WidgetSpan(
      child: Text(
        content,
        style: TextStyle(
          color: colors[type],
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  String get tag => _inputTag;
}
```

# Step 2: Register your Tag Handler

When you call your factory method you can pass an array of TagHandlers to the customisations argument. These will be applied when rendering the MDX. For the Callout handler above you can register it as shown below.

```dart
DeclarativeMdx.fromPageAsset(
        'assets/markdown/custom-components.md',
        customizations: Customizations(
            customComponents: [
                CalloutTagHandler()
            ]
        ),
      )
```

# Step 3: Use the tag in your MDX content

You can then use the custom tags in your MDX content as shown below.

```markdown
<Callout type="info">
This content will be rendered in the Callout Widget as blue text.
</Callout>
```

...which will be rendered as:
<Callout type="info">
This content will be rendered in the Callout Widget as blue text.
</Callout>
