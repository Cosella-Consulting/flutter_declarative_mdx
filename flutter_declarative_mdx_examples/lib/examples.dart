import 'package:flutter/material.dart';
import 'package:flutter_declarative_mdx_examples/examples/basic_components.dart';
import 'package:flutter_declarative_mdx_examples/examples/custom_components.dart';
import 'package:flutter_declarative_mdx_examples/examples/from_markdown_asset.dart';
import 'package:flutter_declarative_mdx_examples/examples/from_markdown_server.dart';
import 'package:flutter_declarative_mdx_examples/examples/simple_markdown.dart';
import 'package:flutter_declarative_mdx_examples/examples/simple_workflow.dart';

class Example {
  final String path;
  final String name;
  final Widget Function(BuildContext) builder;

  const Example(this.path, this.name, this.builder);
}

class Examples {
  static List<Example> get all => [
    Example(
      "/simple-markdown",
      "A simple MDX page",
      (context) => SimpleMarkdownExample(),
    ),
    Example(
      "/simple-workflow",
      "A simple MDX workflow",
      (context) => SimpleWorkflowExample(),
    ),
    Example(
      "/from-markdown-asset",
      "MDX loaded from Assets",
      (context) => FromMarkdownAssetExample(),
    ),
    Example(
      "/from-markdown-server",
      "MDX loaded over HTTP",
      (context) => FromMarkdownServerExample(),
    ),
    Example(
      "/basic-components",
      "Built in components",
      (context) => BasicComponentsExample(),
    ),
    Example(
      "/custom-components",
      "Custom components",
      (context) => CustomComponentsExample(),
    ),
  ];
}
