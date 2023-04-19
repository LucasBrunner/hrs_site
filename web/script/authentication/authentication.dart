import 'dart:html';

void signOut() async {
  document.cookie = 'session=; max-age=0;';
  await Future.delayed(Duration(milliseconds: 25));
  window.location.pathname = '/';
}
