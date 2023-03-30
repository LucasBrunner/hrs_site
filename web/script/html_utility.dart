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
