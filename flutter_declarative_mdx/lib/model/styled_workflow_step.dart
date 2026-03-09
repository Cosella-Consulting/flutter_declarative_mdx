import 'package:flutter_declarative_mdx/model/styled_workflow_page.dart';

class StyledWorkflowStep extends StyledWorkflowPage {
  final bool? hideHeader;
  final bool? hideFooter;

  StyledWorkflowStep({
    this.hideHeader,
    this.hideFooter,
    super.containerBuilder,
    super.typography,
  });
}
