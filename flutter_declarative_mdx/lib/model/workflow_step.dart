import 'package:flutter_declarative_mdx/model/styled_workflow_step.dart';
import 'package:flutter_declarative_mdx/model/workflow_page.dart';

class WorkflowStep {
  final String? label;
  final List<WorkflowPage> pages;

  final StyledWorkflowStep? style;

  WorkflowStep({required this.pages, this.label, this.style});
}
