import 'package:flutter_declarative_mdx/providers/customizations_provider.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

CustomizationsProvider? useCustomizationsProvider() {
  final context = useContext();
  try {
    final customizationsProvider = context.read<CustomizationsProvider>();
    return useListenable(customizationsProvider);
  } catch (_) {}
  return null;
}
