import 'package:flutter/widgets.dart';
import 'package:flutter_declarative_mdx/layout/extensible_markdown/tag_handler.dart';
import 'package:flutter_declarative_mdx/model/customizations.dart';

class CustomizationsProvider with ChangeNotifier {
  final Customizations customizations;

  CustomizationsProvider(this.customizations);

  List<TagHandler> get componentHandlers => customizations.customComponents;
  Widget Function()? get footerBuilder => customizations.footerBuilder;
  Widget Function()? get headerBuilder => customizations.headerBuilder;
  Widget Function(BuildContext context, Widget child)? get containerBuilder =>
      customizations.containerBuilder;

  void addCustomComponents(List<TagHandler> components) {
    customizations.customComponents = [
      ...customizations.customComponents,
      ...components,
    ];
    notifyListeners();
  }
}
