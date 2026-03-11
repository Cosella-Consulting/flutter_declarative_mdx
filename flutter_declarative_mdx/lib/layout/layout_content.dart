import 'package:flutter/material.dart';
import 'package:flutter_declarative_mdx/hooks/use_current_page.dart';
import 'package:flutter_declarative_mdx/hooks/use_current_step.dart';
import 'package:flutter_declarative_mdx/hooks/use_customizations_provider.dart';
import 'package:flutter_declarative_mdx/layout/extensible_markdown/default_tag_handlers/select_tag_handler.dart';
import 'package:flutter_declarative_mdx/layout/extensible_markdown/tag_handler.dart';
import 'package:flutter_declarative_mdx/layout/extensible_markdown/default_tag_handlers/text_field_tag_handler.dart';
import 'package:flutter_declarative_mdx/layout/extensible_markdown/custom_node.dart';
import 'package:flutter_declarative_mdx/layout/extensible_markdown/default_tag_handlers/submit_model_tag_handler.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:markdown_widget/markdown_widget.dart' as md;

Widget wrapContent(
  BuildContext context,
  Widget child,
  Widget Function(BuildContext context, Widget child)? wrapper,
) {
  if (wrapper == null) return child;
  return wrapper(context, child);
}

class LayoutContent extends HookWidget {
  final String content;

  const LayoutContent(this.content, {super.key});

  @override
  Widget build(BuildContext context) {
    final customizations = useCustomizationsProvider();

    final currentStep = useCurrentStep();
    final currentPage = useCurrentPage();

    final baseTextStyle = GoogleFonts.roboto().copyWith(fontSize: 14.0);
    final fixedTextStyle = GoogleFonts.robotoMono().copyWith(fontSize: 14.0);
    final headingTextStyle = baseTextStyle.copyWith(
      fontWeight: FontWeight.bold,
    );

    final overrides = currentStep.style?.typography;

    TextStyle buildHeadingStyle(int depth, double size) =>
        overrides?.headings != null && overrides!.headings!.length > depth
            ? overrides.headings![depth]
            : headingTextStyle.copyWith(fontSize: size);

    final markdownConfiguration = md.MarkdownConfig.defaultConfig.copy(
      configs: [
        md.PConfig(
          textStyle:
              overrides?.paragraph == null
                  ? baseTextStyle
                  : overrides!.paragraph!,
        ),
        md.H1Config(style: buildHeadingStyle(0, 22)),
        md.H2Config(style: buildHeadingStyle(1, 20)),
        md.H3Config(style: buildHeadingStyle(2, 18)),
        md.H4Config(style: buildHeadingStyle(3, 16)),
        md.H5Config(style: buildHeadingStyle(4, 14)),
        md.H6Config(style: buildHeadingStyle(5, 12)),
        md.CodeConfig(
          style: overrides?.code == null ? fixedTextStyle : overrides!.code!,
        ),
        md.PreConfig(
          textStyle:
              overrides?.code == null ? fixedTextStyle : overrides!.code!,
        ),
        md.ListConfig(
          marker:
              currentPage.style?.listMarker ?? currentStep.style?.listMarker,
        ),
      ],
    );

    final tagHandlers = <TagHandler>[
      TextFieldTagHandler(),
      SelectTagHandler(),
      SubmitModelTagHandler(),
      ...(customizations?.componentHandlers ?? []),
    ];

    final contentWidget = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: md.MarkdownGenerator(
        textGenerator:
            (node, config, visitor) => CustomNode(
              tagHandlers: tagHandlers,
              text: node.textContent,
              config: config,
            ),
      ).buildWidgets(content, config: markdownConfiguration),
    );

    if (currentPage.style?.containerBuilder != null) {
      return currentPage.style!.containerBuilder!(context, contentWidget);
    } else if (currentStep.style?.containerBuilder != null) {
      return currentStep.style!.containerBuilder!(context, contentWidget);
    } else if (customizations?.containerBuilder != null) {
      return customizations!.containerBuilder!(context, contentWidget);
    }
    return contentWidget;
  }
}
