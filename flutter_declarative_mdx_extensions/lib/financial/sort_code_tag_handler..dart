import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_declarative_mdx/hooks/use_model_state_provider.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_declarative_mdx/layout/extensible_markdown/tag_handler.dart';

final _sortCodeTag = 'SortCode';

class SortCodeTagHandler extends TagHandler {
  @override
  InlineSpan build(String content, Map<String, String> attributes) {
    final fieldName = attributes["name"] ?? "sortCode";
    final label = attributes["label"] ?? "Sort code";
    final required = attributes["required"] == "true";

    final modelProvider = useModelStateProvider();

    String digitsOnly(String input) => input.replaceAll(RegExp(r'\D'), '');

    String format(String input) {
      final d = digitsOnly(input);
      if (d.isEmpty) return '';
      if (d.length <= 2) return d;
      if (d.length <= 4) return '${d.substring(0, 2)}-${d.substring(2)}';
      final end = d.length.clamp(0, 6);
      return '${d.substring(0, 2)}-${d.substring(2, 4)}-${d.substring(4, end)}';
    }

    String? validate(String raw) {
      if (required && raw.isEmpty) return "Sort code is required";
      if (raw.isNotEmpty && raw.length != 6) {
        return "Sort code must be 6 digits";
      }
      return null;
    }

    final initialRaw = (modelProvider.model[fieldName]?.toString() ?? '');
    final controller = useTextEditingController(text: format(initialRaw));
    final error = useState<String?>(validate(digitsOnly(controller.text)));

    useEffect(() {
      void listener() {
        final raw = digitsOnly(controller.text);

        // Reformat to 00-00-00
        final formatted = format(raw);
        if (controller.text != formatted) {
          controller.value = TextEditingValue(
            text: formatted,
            selection: TextSelection.collapsed(offset: formatted.length),
          );
        }

        // Validate
        final nextError = validate(raw);
        if (error.value != nextError) error.value = nextError;

        // Update model with digits-only value (e.g. "112233")
        modelProvider.updateModel(fieldName, raw);
      }

      controller.addListener(listener);
      return () => controller.removeListener(listener);
    }, [controller, modelProvider, fieldName, required]);

    return WidgetSpan(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label),
          TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(6),
            ],
            decoration: InputDecoration(
              hintText: "00-00-00",
              errorText: error.value,
              border: const OutlineInputBorder(),
              isDense: true,
            ),
          ),
        ],
      ),
    );
  }

  @override
  String get tag => _sortCodeTag;
}
