import 'package:flutter_declarative_mdx/hooks/use_workflow_provider.dart';
import 'package:flutter_declarative_mdx/model/workflow_step.dart';

WorkflowStep useCurrentStep() {
  try {
    final workflowProvider = useWorkflowProvider();
    return workflowProvider.currentStep;
  } catch (_) {
    throw Exception(
      "The current workflow step could not be determined, either you have no steps or the current step is hidden. If you use conditional steps then consider if all conditions are false.",
    );
  }
}
