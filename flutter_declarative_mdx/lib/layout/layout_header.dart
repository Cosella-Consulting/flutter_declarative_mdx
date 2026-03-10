import 'package:flutter/material.dart';
import 'package:flutter_declarative_mdx/hooks/use_current_step.dart';
import 'package:flutter_declarative_mdx/hooks/use_steps.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class LayoutHeader extends HookWidget {
  final Widget Function(int number, String? label)? buildLabel;

  const LayoutHeader({super.key, this.buildLabel});

  Widget buildDefaultLabel(int index, String? label, Widget divider) {
    final children = <Widget>[];

    if (index > 0) {
      children.add(divider);
    }

    children.add(Text((index + 1).toString()));

    if (label != null) {
      children.add(SizedBox(width: 10));
      children.add(Text(label));
    }

    return Row(children: children);
  }

  Widget buildDefaultDivider() {
    return Text(" ... ");
  }

  @override
  Widget build(BuildContext context) {
    final steps = useSteps();
    final currentStep = useCurrentStep();

    final shouldHide = currentStep.style?.hideHeader ?? false;
    if (shouldHide) return Container();

    if (currentStep.style?.headerBuilder != null) {
      return currentStep.style!.headerBuilder!();
    }

    final divider =
        currentStep.style?.stepDividerBuilder == null
            ? buildDefaultDivider()
            : currentStep.style!.stepDividerBuilder!();

    final children = <Widget>[];
    for (var entry in steps.asMap().entries) {
      children.add(
        currentStep.style?.stepLabelBuilder == null
            ? buildDefaultLabel(entry.key, entry.value.label, divider)
            : currentStep.style!.stepLabelBuilder!(),
      );
    }

    return Row(mainAxisAlignment: MainAxisAlignment.center, children: children);
  }
}
