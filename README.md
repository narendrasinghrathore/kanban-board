# mynoteapp

A Kanban Board & Note taking application using Flutter.

## References

The pubspec.yaml file manages the assets and dependencies for a Flutter app.

Stateless widgets are immutable, meaning that their properties can’t change—all values are final.

Stateful widgets maintain state that might change during the lifetime of the widget. Implementing a stateful widget requires at least two classes: 1) a StatefulWidget class that creates an instance of 2) a State class. The StatefulWidget class is, itself, immutable, but the State class persists over the lifetime of the widget.

ListView’s builder factory constructor allows you to build a list view lazily, on demand. The ListView class provides a builder property, itemBuilder, that’s a factory builder and callback function specified as an anonymous function. Two parameters are passed to the function—the BuildContext, and the row iterator, i. The iterator begins at 0 and increments each time the function is called. It increments twice for every suggested word pairing: once for the ListTile, and once for the Divider. This model allows the suggested list to grow infinitely as the user scrolls.

    Note: Prefixing an identifier with an underscore enforces privacy in the Dart language.

Tip: In Flutter's reactive style framework, calling setState() triggers a call to the build() method for the State object, resulting in an update to the UI.

### Routing

In Flutter, the Navigator manages a stack containing the app's routes. Pushing a route onto the Navigator's stack, updates the display to that route. Popping a route from the Navigator's stack, returns the display to the previous route.

Tip: Some widget properties take a single widget (child), and other properties, such as action, take an array of widgets (children), as indicated by the square brackets ([]).

The divideTiles() method of ListTile adds horizontal spacing between each ListTile. The divided variable holds the final rows, converted to a list by the convenience function, toList().

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
