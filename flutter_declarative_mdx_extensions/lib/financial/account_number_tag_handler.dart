import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_declarative_mdx/hooks/use_model_state_provider.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_declarative_mdx/layout/extensible_markdown/tag_handler.dart';

final _inputTag = 'AccountNumber';

class AccountNumberTagHandler extends TagHandler {
  @override
  InlineSpan build(String content, Map<String, String> attributes) {
    final fieldName = attributes["name"] ?? "accountNumber";
    final label = attributes["label"] ?? "Account number";
    final required = attributes["required"] == "true";

    final modelProvider = useModelStateProvider();

    String digitsOnly(String input) => input.replaceAll(RegExp(r'\D'), '');

    String format(String input) {
      final d = digitsOnly(input);
      if (d.length <= 4) return d;
      final tailEnd = d.length.clamp(4, 8);
      return '${d.substring(0, 4)} ${d.substring(4, tailEnd)}';
    }

    String? validate(String raw) {
      if (required && raw.isEmpty) return "Account number is required";
      if (raw.isNotEmpty && raw.length != 8) {
        return "Account number must be 8 digits";
      }
      return null;
    }

    // Initial value from model (digits-only) -> formatted for display.
    final initialRaw = (modelProvider.model[fieldName]?.toString() ?? '');
    final controller = useTextEditingController(text: format(initialRaw));
    final error = useState<String?>(validate(digitsOnly(controller.text)));

    // Keep model + formatting + validation in sync with edits.
    useEffect(() {
      void listener() {
        final raw = digitsOnly(controller.text);

        // Reformat to XXXX XXXX (while preserving cursor reasonably)
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

        // Update model with digits-only value
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
              // Note: we also reformat in the controller listener to insert the space.
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(8),
            ],
            decoration: InputDecoration(
              hintText: "1234 5678",
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
  String get tag => _inputTag;
}
