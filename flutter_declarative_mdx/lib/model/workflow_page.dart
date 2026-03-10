import 'package:flutter_declarative_mdx/model/styled_workflow_page.dart';

class WorkflowPage {
  final String? content;
  final Future<String> Function()? contentLoader;

  final StyledWorkflowPage? style;

  WorkflowPage({this.content, this.contentLoader, this.style});
}
