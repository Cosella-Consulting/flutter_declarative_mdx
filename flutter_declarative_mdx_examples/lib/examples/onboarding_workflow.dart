import 'package:flutter/material.dart';
import 'package:flutter_declarative_mdx/declarative_mdx.dart';
import 'package:flutter_declarative_mdx/model/customizations.dart';
import 'package:flutter_declarative_mdx/model/workflow.dart';
import 'package:flutter_declarative_mdx/model/workflow_page.dart';
import 'package:flutter_declarative_mdx/model/workflow_step.dart';
import 'package:flutter_declarative_mdx_examples/examples/onboarding/custom_step_progress.dart';
import 'package:flutter_declarative_mdx_examples/main_layout.dart';
import 'package:flutter_declarative_mdx_extensions/financial/account_number_tag_handler.dart';
import 'package:flutter_declarative_mdx_extensions/financial/sort_code_tag_handler..dart';
import 'package:flutter_declarative_mdx_extensions/personal/ni_number_tag_handler..dart';

class OnboardingWorkflowExample extends StatelessWidget {
  const OnboardingWorkflowExample({super.key});

  @override
  Widget build(BuildContext context) {
    final workflow = Workflow(
      steps: [
        WorkflowStep(
          label: "Your Details",
          pages: [
            WorkflowPage(content: 'Basic screens'),
            WorkflowPage(
              content: '''
# National Insurance Number

We need your National Insurance (NI) number in order to proceed.

<NiNumber></NiNumber>
''',
            ),
            WorkflowPage(content: 'Nationality details'),
            WorkflowPage(content: 'Address'),
          ],
        ),
        WorkflowStep(
          label: "Bank Details",
          pages: [
            WorkflowPage(
              content: '''
# Bank Details

Which bank account will you use to fund this account?

<AccountNumber></AccountNumber>

<SortCode></SortCode>
''',
            ),
          ],
        ),
        WorkflowStep(
          label: "Security",
          pages: [WorkflowPage(content: 'Step 3')],
        ),
        WorkflowStep(
          label: "Confirmation",
          pages: [WorkflowPage(content: 'Step 4')],
        ),
      ],
    );

    final customizations = Customizations(
      customComponents: [
        AccountNumberTagHandler(),
        NiNumberTagHandler(),
        SortCodeTagHandler(),
      ],
      headerBuilder: () => CustomStepProgress(),
    );

    return MainLayout(
      child: DeclarativeMdx.fromWorkflow(
        workflow,
        customizations: customizations,
      ),
    );
  }
}
