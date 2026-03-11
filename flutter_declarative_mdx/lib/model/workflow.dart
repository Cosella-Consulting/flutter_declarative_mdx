import 'package:flutter/material.dart';
import 'package:flutter_declarative_mdx/utilities/map_dynamic_to_list_of_typed_objects.dart';
import 'package:flutter_declarative_mdx/model/workflow_step.dart';

class Workflow {
  final List<WorkflowStep> steps;
  final VoidCallback? onCancelled;
  final VoidCallback? onComplete;

  Workflow({required this.steps, this.onCancelled, this.onComplete});

  static Workflow? fromJson(Map<String, dynamic> workflowJson) =>
      Workflow(steps: mapDynamicToListOfTypedObjects(workflowJson["steps"]));
}
