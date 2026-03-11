## 0.0.4

- Refactored model state provider so it does not need to be passed and appears on the context
- Workflow content now scrolls with the bottom actions being sticky (Opinionated layout)
- Horizontal layout is no longer supported
- Container, Header and Footer customizations are no longer additive and most granular is selected
- Better naming of style classes
- Added more extension components and fixed casing of existing components (Pascal case)

## 0.0.3

- Added useWorkflowNavigation hook to allow navigation from custom components
- Allow custom markers for ordered and unordered lists
- Moves logic for header and footer components in to the components themselves
- Allows customizable header and/or footer components at workflow, step and page levels
- Can hide the header and/or footers at workflow, step and page levels
- Customizable markdown typography at workflow, step and page levels

## 0.0.2

- Lots more working examples available in the repo
- Workflows now make the progress status available to all components and customizations
- Ability to customize the workflow header
- Ability to customize the workflow footer
- In custom components you can now access the raw content (children)


## 0.0.1

- Simple extensible markdown rendering
- Simple factory methods
- Custom TagHandler support through the `customization` property
