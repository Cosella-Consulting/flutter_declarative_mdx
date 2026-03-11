import 'package:flutter/material.dart';
import 'package:flutter_declarative_mdx/model/workflow_page_style.dart';

class WorkflowStepStyle extends WorkflowPageStyle {
  final Widget Function()? headerBuilder;
  final Widget Function()? footerBuilder;
  final bool? hideHeader;
  final bool? hideFooter;

  final Widget Function()? stepDividerBuilder;
  final Widget Function()? stepLabelBuilder;

  WorkflowStepStyle({
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
