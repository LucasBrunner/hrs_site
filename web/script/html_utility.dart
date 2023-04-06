import 'dart:html';

extension ToSpecificElement on Element {
  T? toElement<T extends Element>() {
    try {
      return this as T;
    } catch (e) {
      return null;
    }
  }
}

extension WrapElement on Element {
  T? wrap<T extends Element>(T parent) {
    return parent..children.add(this);
  }
}

extension ToSpecificElementList on List<Element> {
  List<T>? toElements<T extends Element>() {
    try {
      return List.from(this);
    } catch (e) {
      return null;
    }
  }
}
