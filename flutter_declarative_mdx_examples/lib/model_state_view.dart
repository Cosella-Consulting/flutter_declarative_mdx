import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_declarative_mdx/hooks/use_model.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ModelStateView extends HookWidget {
  const ModelStateView({super.key});

  @override
  Widget build(BuildContext context) {
    final model = useModel();

    return Container(
      color: Colors.black.withAlpha(32),
      height: 100,
      padding: EdgeInsets.all(10),
      child: Text(json.encode(model)),
    );
  }
}
