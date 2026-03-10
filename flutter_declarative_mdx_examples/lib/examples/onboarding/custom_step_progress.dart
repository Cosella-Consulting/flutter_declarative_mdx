import 'package:flutter/material.dart';
import 'package:flutter_declarative_mdx/hooks/use_page_status.dart';
import 'package:flutter_declarative_mdx/hooks/use_steps.dart';

class CustomStepProgress extends StatelessWidget {
  const CustomStepProgress({super.key});

  @override
  Widget build(BuildContext context) {
    final pageStatus = usePageStatus();
    final steps = useSteps();

    mapEntryToProgressLabel(entry) => Text(
      entry.value.label ?? "N/A",
      style: TextStyle(
        fontWeight:
            pageStatus.currentStep == entry.key
                ? FontWeight.bold
                : FontWeight.normal,
      ),
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: steps.asMap().entries.map(mapEntryToProgressLabel).toList(),
    );
  }
}
