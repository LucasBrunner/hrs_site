import 'dart:html';

extension ToSpecificElement on Element {
  T? toElement<T>() {
    try {
      return this as T;
    } catch (e) {
      return null;
    }
  }
}

extension ToSpecificElementList on List<Element> {
  List<T>? toElements<T>() {
    try {
      return List.from(this);
    } catch (e) {
      return null;
    }
  }
}
