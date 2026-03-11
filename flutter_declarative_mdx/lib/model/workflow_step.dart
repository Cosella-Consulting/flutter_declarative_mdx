import 'package:flutter_declarative_mdx/model/workflow_step_style.dart';
import 'package:flutter_declarative_mdx/model/workflow_page.dart';

class WorkflowStep {
  final String? label;
  final List<WorkflowPage> pages;

  final WorkflowStepStyle? style;

  WorkflowStep({required this.pages, this.label, this.style});
}
