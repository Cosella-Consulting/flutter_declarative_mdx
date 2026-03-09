import 'package:flutter/widgets.dart';
import 'package:flutter_declarative_mdx/layout/extensible_markdown/tag_handler.dart';
import 'package:flutter_declarative_mdx/model/styled_typography.dart';
import 'package:flutter_declarative_mdx/model/workflow_status.dart';

class Customizations {
  List<TagHandler> customComponents = [];
  Widget Function(WorkflowStatus status)? headerBuilder;
  Widget Function(WorkflowStatus status)? footerBuilder;
  StyledTypography? typography;

  Customizations({required this.customComponents, this.headerBuilder});
}
