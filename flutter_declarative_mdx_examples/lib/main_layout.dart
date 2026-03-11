import 'package:flutter/material.dart';
import 'package:flutter_declarative_mdx_examples/main_menu.dart';
import 'package:flutter_declarative_mdx_examples/model_state_view.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class MainLayout extends HookWidget {
  final Widget child;

  const MainLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    const String appTitle = "Flutter Declarative MDX";
    final GlobalKey<ScaffoldState> key = GlobalKey();
    final showCode = useState(false);

    final children = <Widget>[
      Expanded(child: Container(margin: EdgeInsets.all(20), child: child)),
    ];

    if (showCode.value) {
      children.add(ModelStateView());
    }

    return Scaffold(
      key: key,
      appBar: AppBar(
        title: const Text(appTitle),
        leading: IconButton(
          onPressed: () {
            key.currentState!.openDrawer();
          },
          icon: Icon(Icons.menu),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showCode.value = !showCode.value;
            },
            icon: Icon(Icons.code),
          ),
        ],
      ),
      drawer: MainMenu(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children,
      ),
    );
  }
}
