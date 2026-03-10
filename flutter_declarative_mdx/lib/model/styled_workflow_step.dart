import 'package:flutter/material.dart';
import 'package:flutter_declarative_mdx/model/styled_workflow_page.dart';

class StyledWorkflowStep extends StyledWorkflowPage {
  final Widget Function()? headerBuilder;
  final Widget Function()? footerBuilder;
  final bool? hideHeader;
  final bool? hideFooter;

  final Widget Function()? stepDividerBuilder;
  final Widget Function()? stepLabelBuilder;

  StyledWorkflowStep({
    this.headerBuilder,
    this.footerBuilder,
    this.hideHeader,
    this.hideFooter,
    this.stepDividerBuilder,
    this.stepLabelBuilder,
    super.containerBuilder,
    super.typography,
    super.listMarker,
  });
}
