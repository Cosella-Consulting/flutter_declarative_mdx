import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_declarative_mdx/declarative_mdx_configuration.dart';
import 'package:flutter_declarative_mdx/hooks/use_configure_workflow.dart';
import 'package:flutter_declarative_mdx/layout/layout_workflow.dart';
import 'package:flutter_declarative_mdx/model/customizations.dart';
import 'package:flutter_declarative_mdx/model/workflow.dart';
import 'package:flutter_declarative_mdx/model/workflow_page.dart';
import 'package:flutter_declarative_mdx/model/workflow_step.dart';
import 'package:flutter_declarative_mdx/providers/customizations_provider.dart';
import 'package:flutter_declarative_mdx/providers/model_state_provider.dart';
import 'package:flutter_declarative_mdx/providers/workflow_provider.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class DeclarativeMdx extends HookWidget {
  final DeclarativeMdxConfiguration configuration;
  final Customizations? customizations;

  const DeclarativeMdx(this.configuration, {super.key, this.customizations});

  factory DeclarativeMdx.fromPageContent(
    String content, {
    Customizations? customizations,
  }) => DeclarativeMdx(
    DeclarativeMdxConfiguration(page: WorkflowPage(content: content)),
    customizations: customizations,
  );

  factory DeclarativeMdx.fromPageAsset(
    String assetName, {
    Customizations? customizations,
  }) => DeclarativeMdx(
    DeclarativeMdxConfiguration(
      page: WorkflowPage(contentLoader: () => rootBundle.loadString(assetName)),
    ),
    customizations: customizations,
  );

  factory DeclarativeMdx.fromStepList(
    List<WorkflowStep> steps, {
    Customizations? customizations,
  }) => DeclarativeMdx(
    DeclarativeMdxConfiguration(workflow: Workflow(steps: steps)),
    customizations: customizations,
  );

  factory DeclarativeMdx.fromWorkflow(
    Workflow workflow, {
    Customizations? customizations,
  }) => DeclarativeMdx(
    DeclarativeMdxConfiguration(workflow: workflow),
    customizations: customizations,
  );

  @override
  Widget build(BuildContext context) {
    final workflow = useConfigureWorkflow(configuration);

    final providers = <SingleChildWidget>[
      ChangeNotifierProvider(
        create:
            (_) => CustomizationsProvider(
              customizations ?? Customizations(customComponents: []),
            ),
      ),
      ChangeNotifierProvider(create: (_) => ModelStateProvider()),
    ];

    if (workflow != null) {
      providers.add(
        ChangeNotifierProvider(create: (_) => WorkflowProvider(workflow)),
      );
    }

    return MultiProvider(
      providers: providers,
      builder: (context, child) => LayoutWorkflow(),
    );
  }
}
