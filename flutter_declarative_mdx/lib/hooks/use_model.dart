import 'package:flutter_declarative_mdx/hooks/use_model_state_provider.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

dynamic useModel() {
  final modelProvider = useModelStateProvider();
  useListenable(modelProvider);
  return modelProvider.model;
}
