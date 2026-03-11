import 'package:flutter/material.dart';
import 'package:flutter_declarative_mdx/hooks/use_steps.dart';
import 'package:flutter_declarative_mdx/layout/layout_footer.dart';
import 'package:flutter_declarative_mdx/layout/layout_header.dart';
import 'package:flutter_declarative_mdx/layout/layout_page.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class LayoutWorkflow extends HookWidget {
  const LayoutWorkflow({super.key});

  @override
  Widget build(BuildContext context) {
    final steps = useSteps();

    final children = <Widget>[];

    if (steps.length > 1) {
      children.add(LayoutHeader());
    }

    children.add(LayoutPage());

    if (steps.length > 1) {
      children.add(LayoutFooter());
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.max,
      children: children,
    );
  }
}
