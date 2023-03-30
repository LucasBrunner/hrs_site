import 'dart:html';

import '../script/authentication/signin.dart' as signin;
import '../script/authentication/signup.dart' as signup;

const scriptElements = {
  'signin': signin.setup,
  'signup': signup.setup,
};

void main(List<String> args) {
  final scriptElementsToLoad = querySelector('#script-elements');
  if (scriptElementsToLoad == null) return;

  for (var scriptElement in scriptElementsToLoad.children) {
    try {
      scriptElements[(scriptElement as OptionElement).value]?.call();
    } finally {}
  }
}
