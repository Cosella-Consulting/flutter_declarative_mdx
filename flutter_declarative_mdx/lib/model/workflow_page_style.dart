import 'package:flutter/widgets.dart';
import 'package:flutter_declarative_mdx/model/styled_typography.dart';
import 'package:markdown_widget/widget/blocks/container/list.dart';

class WorkflowPageStyle {
  final Widget Function(BuildContext context, Widget pageContent)?
  containerBuilder;

  final StyledTypography? typography;
  final ListMarker? listMarker;

  WorkflowPageStyle({this.containerBuilder, this.typography, this.listMarker});
}
