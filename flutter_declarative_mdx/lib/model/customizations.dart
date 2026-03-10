import 'package:flutter_declarative_mdx/layout/extensible_markdown/tag_handler.dart';
import 'package:flutter_declarative_mdx/model/styled_workflow_step.dart';

class Customizations extends StyledWorkflowStep {
  List<TagHandler> customComponents = [];

  Customizations({
    required this.customComponents,
    super.headerBuilder,
    super.footerBuilder,
    super.hideFooter,
    super.hideHeader,
    super.containerBuilder,
    super.typography,
    super.listMarker,
  });
}
