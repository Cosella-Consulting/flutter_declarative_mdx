import 'package:flutter/widgets.dart';
import 'package:flutter_declarative_mdx/model/styled_typography.dart';

class StyledWorkflowPage {
  final Widget Function(BuildContext context, Widget pageContent)?
  containerBuilder;
  final StyledTypography? typography;

  StyledWorkflowPage({this.containerBuilder, this.typography});
}
