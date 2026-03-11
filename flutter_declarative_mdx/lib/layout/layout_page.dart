import 'package:flutter/material.dart';
import 'package:flutter_declarative_mdx/hooks/use_current_page.dart';
import 'package:flutter_declarative_mdx/layout/layout_content.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class LayoutPage extends HookWidget {
  const LayoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final content = useState("");
    final page = useCurrentPage();

    useEffect(() {
      if (page.content != null) {
        content.value = page.content!;
      } else if (page.contentLoader != null) {
        page.contentLoader!().then((markdown) => content.value = markdown);
      }

      return () {};
    }, [page]);

    return Expanded(
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: LayoutContent(content.value),
          ),
        ],
      ),
    );
  }
}
