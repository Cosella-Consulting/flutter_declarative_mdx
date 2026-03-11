import 'package:flutter/material.dart';
import 'package:flutter_declarative_mdx/declarative_mdx.dart';
import 'package:flutter_declarative_mdx_examples/main_layout.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class BasicComponentsExample extends HookWidget {
  const BasicComponentsExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: DeclarativeMdx.fromPageContent('''
*Toggle the code view by tapping the <> above*

# This is a basic components example
The flutter_declarative_mdx package supports input as well as formatted MDX documents. The output of these components can be validated locally using some common validations or validated remotely via API calls.

#### Plain Text Input
An input control that allows for free text to be input and sent to the model. All of the Flutter TextField types are supported via the `type` attribute.

<input type="text" label="Input Label" propertyName="example_input_1" />

```
<input
  type="text" 
  label="Input Label" 
  propertyName="example_1_text" 
/>
```

#### Selection Dropdown
<Select label="Input Label" options="{
  'Option 1': 1,
  'Option 2': 2,
  'Option 3': 3
}" propertyName="example_2_selection" />

```
<Select 
  label="Input Label"
  options="{
    'Option 1': 1,
    'Option 2': 2,
    'Option 3': 3,
  }"
  propertyName="example_2_selection"
/>
```
*Note that inside the options attribute any strings in the map must use a single quote, unlike true JSON.*

#### Model submission
<SubmitModel label="Submit Model" url="https://my.api/submissions" />

```
<SubmitModel
  label="Submit Model" 
  url="https://my.api/submissions" 
/>
```
'''),
    );
  }
}
