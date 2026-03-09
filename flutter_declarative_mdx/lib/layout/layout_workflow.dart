import 'package:flutter/material.dart';
import 'package:flutter_declarative_mdx/hooks/use_actions.dart';
import 'package:flutter_declarative_mdx/hooks/use_current_step.dart';
import 'package:flutter_declarative_mdx/hooks/use_customization_provider.dart';
import 'package:flutter_declarative_mdx/hooks/use_page_status.dart';
import 'package:flutter_declarative_mdx/hooks/use_steps.dart';
import 'package:flutter_declarative_mdx/layout/layout_actions.dart';
import 'package:flutter_declarative_mdx/layout/layout_header.dart';
import 'package:flutter_declarative_mdx/layout/layout_page.dart';
import 'package:flutter_declarative_mdx/model/styled_workflow_step.dart';
import 'package:flutter_declarative_mdx/model/workflow_status.dart';
import 'package:flutter_declarative_mdx/model/workflow_step.dart';
import 'package:flutter_declarative_mdx/model/workflow_step_info.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class LayoutWorkflow extends HookWidget {
  final bool isHorizontal;

  const LayoutWorkflow({super.key, this.isHorizontal = false});

  @override
  Widget build(BuildContext context) {
    final customizations = useCustomizationProvider();
    final actions = useActions();
    final steps = useSteps();
    final pageStatus = usePageStatus();
    final currentStep = useCurrentStep();

    WorkflowStepInfo mapWorkflowStepToWorkflowStepInfo(
      MapEntry<int, WorkflowStep> entry,
    ) => WorkflowStepInfo(
      entry.key,
      entry.value.label,
      entry.value.pages.length,
      false,
    );

    final status = WorkflowStatus(
      steps:
          steps.asMap().entries.map(mapWorkflowStepToWorkflowStepInfo).toList(),
      pageStatus: pageStatus,
      actions: actions,
    );

    final children = <Widget>[];
    final stepStyle = currentStep.style ?? StyledWorkflowStep();

    final hideFooter = stepStyle.hideFooter ?? false;
    final hideHeader = stepStyle.hideHeader ?? false;

    if (steps.length > 1 && !hideHeader) {
      final header =
          customizations?.headerBuilder != null
              ? customizations!.headerBuilder!(status)
              : LayoutHeader();
      children.add(header);
    }

    children.add(LayoutPage());

    if (steps.length > 1 && !hideFooter) {
      final footer =
          customizations?.footerBuilder != null
              ? customizations!.footerBuilder!(status)
              : LayoutActions();
      children.add(footer);
    }

    return isHorizontal
        ? Row(children: children)
        : Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: children,
        );
  }
}
