import 'package:flutter/material.dart';
import 'package:flutter_declarative_mdx/hooks/use_actions.dart';
import 'package:flutter_declarative_mdx/hooks/use_current_step.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class LayoutFooter extends HookWidget {
  const LayoutFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final actions = useActions();
    final currentStep = useCurrentStep();

    final shouldHide = currentStep.style?.hideFooter ?? false;
    if (shouldHide) return Container();

    if (currentStep.style?.footerBuilder != null) {
      return currentStep.style!.footerBuilder!();
    }

    return Row(
      children:
          actions
              .map(
                (action) => TextButton(
                  onPressed: action.onTap,
                  child: Text(action.label),
                ),
              )
              .toList(),
    );
  }
}
