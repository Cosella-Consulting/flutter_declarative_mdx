import 'package:flutter_declarative_mdx/layout/extensible_markdown/tag_handler.dart';
import 'package:flutter_declarative_mdx/model/workflow_step_style.dart';

class Customizations extends WorkflowStepStyle {
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
