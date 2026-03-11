import 'package:flutter/foundation.dart';
import 'package:flutter_declarative_mdx/model/workflow.dart';
import 'package:flutter_declarative_mdx/model/workflow_action.dart';
import 'package:flutter_declarative_mdx/model/workflow_page.dart';
import 'package:flutter_declarative_mdx/model/workflow_page_status.dart';
import 'package:flutter_declarative_mdx/model/workflow_step.dart';

class WorkflowProvider with ChangeNotifier {
  final Workflow workflow;

  int _currentStepIndex = 0;
  int _currentPageIndex = 0;

  WorkflowProvider(this.workflow);

  WorkflowStep get currentStep => evaluateCurrentSteps()[_currentStepIndex];
  WorkflowPage get currentPage => evaluateCurrentPages()[_currentPageIndex];
  WorkflowPageStatus get currentPageStatus => WorkflowPageStatus(
    currentStep: _currentStepIndex,
    currentPage: _currentPageIndex,
  );

  List<WorkflowAction> get currentActions {
    final actions = <WorkflowAction>[];
    final steps = evaluateCurrentSteps();
    final pages = evaluateCurrentPages();

    if (_currentPageIndex > 0 || _currentStepIndex > 0) {
      actions.add(WorkflowAction(label: "Previous", onTap: navigatePrevious));
    }

    if (_currentStepIndex < steps.length - 1 ||
        _currentPageIndex < pages.length - 1) {
      actions.add(WorkflowAction(label: "Next", onTap: navigateNext));
    } else {
      actions.add(
        WorkflowAction(label: "Complete", onTap: workflow.onComplete ?? () {}),
      );
    }

    actions.add(
      WorkflowAction(label: "Cancel", onTap: workflow.onCancelled ?? () {}),
    );

    return actions;
  }

  List<WorkflowStep> get steps => evaluateCurrentSteps();

  List<WorkflowStep> evaluateCurrentSteps() {
    return workflow.steps;
  }

  List<WorkflowPage> evaluateCurrentPages() {
    return currentStep.pages;
  }

  void navigateNext() {
    final steps = evaluateCurrentSteps();
    var pages = evaluateCurrentPages();

    if (_currentPageIndex < pages.length - 1) {
      _currentPageIndex++;
    } else if (_currentStepIndex < steps.length - 1) {
      _currentStepIndex++;

      pages = evaluateCurrentPages();
      _currentPageIndex = 0;
    }
    notifyListeners();
  }

  void navigatePrevious() {
    var pages = evaluateCurrentPages();

    if (_currentPageIndex > 0) {
      _currentPageIndex--;
    } else if (_currentStepIndex > 0) {
      _currentStepIndex--;
      pages = evaluateCurrentPages();
      _currentPageIndex = pages.length - 1;
    }
    notifyListeners();
  }
}
