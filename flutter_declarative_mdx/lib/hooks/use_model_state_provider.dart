import 'package:flutter_declarative_mdx/providers/model_state_provider.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

ModelStateProvider useModelStateProvider() {
  final context = useContext();
  final modelStateProvider = context.read<ModelStateProvider>();
  return useListenable(modelStateProvider);
}
