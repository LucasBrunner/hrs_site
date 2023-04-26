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

extension ToTableRow on List<Element> {
  TableRowElement toTableRow() {
    return TableRowElement()..children.addAll(this);
  }
}

extension ClearOptions on Element {
  void clearOptions([List<String>? removeIds]) {
    for (Element option in children) {
      option.toElement<OptionElement>()?.selected = false;
      if (removeIds != null && removeIds.contains(option.id)) {
        option.remove();
      }
    }
  }
}
