import 'package:flutter_declarative_mdx/model/workflow_page_style.dart';

class WorkflowPage {
  final String? content;
  final Future<String> Function()? contentLoader;

  final WorkflowPageStyle? style;

  WorkflowPage({this.content, this.contentLoader, this.style});
}
