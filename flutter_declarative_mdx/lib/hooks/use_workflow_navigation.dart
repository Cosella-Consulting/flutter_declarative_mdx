import 'package:flutter_declarative_mdx/hooks/use_workflow_provider.dart';
import 'package:flutter_declarative_mdx/model/workflow_navigation.dart';

WorkflowNavigation useWorkflowNavigation() {
  final workflowProvider = useWorkflowProvider();

  return WorkflowNavigation(
    next: workflowProvider.navigateNext,
    previous: workflowProvider.navigatePrevious,
  );
}
