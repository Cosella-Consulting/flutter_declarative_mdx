import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_declarative_mdx/declarative_mdx.dart';
import 'package:flutter_declarative_mdx/model/workflow_page.dart';
import 'package:flutter_declarative_mdx/model/workflow_step.dart';
import 'package:flutter_declarative_mdx_examples/main_layout.dart';

class SimpleWorkflowExample extends StatelessWidget {
  const SimpleWorkflowExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: DeclarativeMdx.fromStepList([
        WorkflowStep(
          pages: [
            WorkflowPage(
              content: '''
# This is a simple workflow example

## Step 1 : Page 1

This page is a simple markdown with a title, subtitle and a table shown below.
Use the next button to see the next page.

| Col 1  | Col 2  |
| ------ | ------ |
| Row 1, Item 1 | Row 1, Item 2 |
| Row 2, Item 1 | Row 2, Item 2 |
| Row 3, Item 1 | Row 3, Item 2 |
''',
            ),
            WorkflowPage(
              contentLoader:
                  () => rootBundle.loadString("assets/markdown/vision.md"),
            ),
          ],
        ),
        WorkflowStep(
          pages: [
            WorkflowPage(
              content: '''
# This is a simple example

## Step 2 : Page 1

This is the first page of step 2, see that the step indicator above has changed. 
This is the last page in the flow so there is no next button, also because there is no model associated with this example the button says 'Done' and not 'Submit'.
''',
            ),
          ],
        ),
      ]),
    );
  }
}
