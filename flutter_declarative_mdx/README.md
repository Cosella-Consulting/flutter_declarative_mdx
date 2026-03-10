# flutter_declarative_mdx (pre-release)

> **Version 1.0.0 is imminent**, until version 1.0.0 is available we recommend you don't use this package in any production systems. All versions before v1.0.0 may have breaking changes.

![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)

A Flutter library for rendering **Extensible Markdown (MDX)** as native UI.

`flutter_declarative_mdx` enables server-driven pages, forms, documents, and workflows to be defined using structured markdown and rendered directly inside a Flutter app.

The goal is simple: make it easy to describe common app UI declaratively and deliver it from a server without rebuilding the app.

## Documentation
[https://cosella-consulting.github.io/flutter_declarative_mdx/](https://cosella-consulting.github.io/flutter_declarative_mdx/)

## What it does

The library renders MDX documents into Flutter widgets and allows custom components to be registered and composed.

Typical use cases:

* Content and document rendering
* Forms and data capture
* Step-by-step workflows
* Server-driven pages
* Rich text with embedded components

Read more about the [Problem space and Vision](docs/vision.md) for this library.

## Installation

Add to `pubspec.yaml`:

```yaml
dependencies:
  flutter_declarative_mdx: <latest_version>
```

Run:

```bash
flutter pub get
```

## Basic usage

```dart
DeclarativeMdxView(
  document: mdxString,
)
```

Example MDX:

```mdx
# Profile

<Form>
  <TextField name="firstName" label="First name" />
  <TextField name="lastName" label="Last name" />
  <Button action="submit">Continue</Button>
</Form>
```

## Extending with custom components

Custom components can be registered and rendered from MDX:

```dart
DeclarativeMdx.registerComponent(
  'MyComponent',
  (context, node) => MyWidget(),
);
```

This allows integration with your own design system and domain widgets.

## Contributing

Contributions are welcome.

If you’d like to help:

1. Fork the repository
2. Create a branch
3. Make your change
4. Open a pull request

Please keep changes focused and include documentation updates where useful.

Issues and discussions are also welcome for:

* Bugs
* Feature requests
* Design questions
* Real-world usage feedback

## Status

This project is evolving and APIs may change.
Feedback and collaboration are encouraged.

## Acknowledgements

`flutter_declarative_mdx` builds on the work of several excellent open-source libraries in the Flutter ecosystem:

* Flutter — the underlying UI framework.
* flutter_hooks — functional widget patterns inspired by React Hooks.
* provider — simple and pragmatic state management.
* markdown_widget — Markdown rendering foundation extended by this project.
* google_fonts — font integration and typography support.

The maintainers and contributors of these projects make libraries like this possible.

## License

See LICENSE file in this repository.
