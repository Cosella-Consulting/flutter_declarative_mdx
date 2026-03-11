## Purpose

`flutter_declarative_mdx` explores a simple idea:

> Common application UI can be described declaratively and delivered from a server, while still rendering as fully native Flutter widgets.

The library provides a structured, extensible Markdown (MDX) approach to defining UI such as documents, forms, and workflows that can be rendered dynamically inside Flutter apps.

This project aims to make server-driven UI in Flutter:

* Predictable
* Extensible
* Testable
* Native-feeling
* Easy to reason about

## Problem Statement

Modern mobile applications frequently need to ship UI and content changes without requiring a full app release.

Common approaches include:

* Hardcoded Flutter UI
* Remote config flags
* CMS-rendered HTML/WebViews
* JSON-driven UI schemas
* Full low-code platforms

Each has tradeoffs.

Hardcoded UI:

* Requires app releases for structural changes
* Slows iteration for content and workflow changes

WebView/HTML rendering:

* Breaks native UX consistency
* Hard to integrate with app state and navigation
* Limited access to native components

JSON-driven UI:

* Often verbose and difficult to read
* Reinvents layout and text semantics
* Can become schema-heavy and rigid

Low-code platforms:

* Heavyweight
* Opinionated
* Often disconnected from native engineering workflows

There is space for a simpler, developer-centric approach.

## Core Idea

Use **Markdown as the baseline language**, extended with structured components, to define UI declaratively.

Markdown provides:

* Readability
* Familiarity
* Strong text semantics
* Easy storage and transport
* Good tooling support

Extensible components provide:

* Structure
* Interactivity
* Forms and workflows
* Domain-specific UI
* Integration with native Flutter widgets

Flutter renders the result natively.

This creates a clear separation:

**Server defines structure and content**
**Client renders and executes behaviour**

## Design Goals

### 1. Native-first rendering

All output should render as native Flutter widgets.

This is not an HTML renderer or WebView abstraction.
The goal is native performance, accessibility, and theming.

### 2. Declarative over imperative

Documents describe *what* should be rendered, not *how* to render it.

Rendering logic lives in Flutter components.
Documents describe structure, content, and intent.

### 3. Extensibility as a first-class concept

Different apps require different components.

The system must allow:

* Custom components
* Domain-specific widgets
* Design system integration
* Custom workflow primitives

Without modifying core library code.

### 4. Composability

Documents should be:

* Modular
* Nestable
* Reusable
* Easy to reason about

Components should compose cleanly without hidden coupling.

### 5. Server-driven, not server-controlled

The server defines documents and flows.
The client retains control over:

* Rendering
* Security
* Navigation
* State integration
* Component implementation

This avoids turning the client into a thin runtime shell.

### 6. Readability and debuggability

Documents should remain human-readable.

A developer should be able to:

* Inspect a document
* Understand its structure quickly
* Debug rendering issues without specialised tooling

Markdown provides a strong foundation for this.

## Non-Goals

To maintain clarity and focus, this project intentionally avoids becoming:

### A full low-code/no-code platform

The library provides primitives, not a visual builder or hosted platform.

### A layout engine replacement

Flutter remains responsible for layout and rendering.
MDX describes structure and components, not pixel-perfect layout systems.

### A web content renderer

This is not intended to render arbitrary HTML or replicate browser behaviour.

### A CMS

Content management and authoring tools are out of scope for the core library.

### A complete workflow engine

The library supports workflows and step-based UI, but does not aim to replace backend orchestration systems.

## Tradeoffs

### Flexibility vs control

Server-driven UI increases flexibility but requires strong component contracts and versioning discipline.

### Simplicity vs completeness

The project prioritises a small, understandable core over covering every UI scenario.

### Markdown vs strict schema

Markdown improves readability and authoring experience, but requires careful extension design to avoid ambiguity.

## Long-Term Direction

This project may evolve toward:

* A consistent pattern for server-driven Flutter UI
* A shared component model for MDX-based UI
* Clear document/component contracts
* Tooling for previewing and validating documents
* Potential interoperability across apps and teams

The focus will remain on:

* Keeping the core lightweight
* Maintaining architectural clarity
* Supporting real-world production usage

## Intended Audience

This project is primarily for:

* Flutter engineers building complex apps
* Teams needing server-driven content or workflows
* Product teams wanting faster iteration without constant releases
* Developers interested in declarative UI patterns

## Status

The project is evolving.
APIs and patterns may change as real-world usage informs design.

Feedback, discussion, and contributions are welcome from teams exploring similar approaches.
