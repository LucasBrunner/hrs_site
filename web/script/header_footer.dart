import 'dart:html';

import 'authentication/authentication.dart';

const headerHtml = '''
    <h1 class="text-button" onclick="window.location.pathname = '/'">Home Renovation Systems</h1>
    <div id="header-right-content">
      <span class="div-button" onclick="window.location.pathname = '/products'">
        Products
      </span>
      <span class="div-button" onclick="window.location.pathname = '/services'">
        Services
      </span>
    </div>
''';

const footerHtml = '''
  <div id="footer-links">
    <span>
      <ul>
        <li>
          <p class="text-button" onclick="window.location.pathname = '/faq'">Frequently Asked Questions</a>
        </li>
      </ul>
    </span>
    <span>
      <ul>
        <li>
          <p class="text-button" onclick="window.location.pathname = '/products'">Products</a>
        </li>
        <li>
          <p class="text-button" onclick="window.location.pathname = '/services'">Services</a>
        </li>
      </ul>
    </span>
    <span>
      <ul id="account-links">
      </ul>
    </span>
  </div>
  <p><i>© 2023 Home Renovation Systems</i></p>
''';

const profileIcon = '''
  <img id="profile-icon" src="./icons/profile-icon.svg" alt="profile-icon"></iframe>
''';

final onclickValidator = NodeValidatorBuilder.common()
  ..allowElement(
    'h1',
    attributes: ['onclick'],
  )
  ..allowElement(
    'span',
    attributes: ['onclick'],
  )
  ..allowElement(
    'p',
    attributes: ['onclick'],
  );

void _placeHeader() {
  document.body?.children.insert(
      0,
      Element.header()
        ..setInnerHtml(
          headerHtml,
          validator: onclickValidator,
        ));

  if (document.cookie?.contains('session') ?? false) {
    querySelector('#header-left-content')?.children.add(ImageElement()
      ..id = 'profile-icon'
      ..src = '/icons/profile-icon.svg'
      ..onClick.listen((event) => window.location.pathname = '/account'));
  } else {
    querySelector('#header-left-content')?.children.addAll([
      SpanElement()
        ..className = 'text-button'
        ..innerText = "Sign in"
        ..onClick.listen((event) => window.location.pathname = '/signin'),
      SpanElement()
        ..className = 'text-button'
        ..innerText = "Sign up"
        ..onClick.listen((event) => window.location.pathname = '/signup'),
    ]);
  }
}

void _placeFooter() {
  document.body?.children.add(Element.footer()
    ..setInnerHtml(
      footerHtml,
      validator: onclickValidator,
    ));
  if (document.cookie?.contains('session') ?? false) {
    querySelector('#account-links')?.children.addAll([
      LIElement()
        ..children.add(ParagraphElement()
          ..innerText = 'View Account'
          ..className = 'text-button'
          ..onClick.listen((event) => window.location.pathname = '/account')),
      LIElement()
        ..children.add(ParagraphElement()
          ..innerText = 'View Orders'
          ..className = 'text-button'
          ..onClick.listen((event) => window.location.pathname = '/account/orders')),
      LIElement()
        ..children.add(ParagraphElement()
          ..innerText = 'View Statements'
          ..className = 'text-button'
          ..onClick.listen((event) => window.location.pathname = '/signup')),
      LIElement()
        ..children.add(ParagraphElement()
          ..innerText = 'Sign Out'
          ..className = 'text-button'
          ..onClick.listen((event) => signOut())),
    ]);
  } else {
    querySelector('#account-links')?.children.addAll([
      LIElement()
        ..children.add(ParagraphElement()
          ..innerText = 'Sign In'
          ..className = 'text-button'
          ..onClick.listen((event) => window.location.pathname = '/signin')),
      LIElement()
        ..children.add(ParagraphElement()
          ..innerText = 'Sign Up'
          ..className = 'text-button'
          ..onClick.listen((event) => window.location.pathname = '/signup')),
    ]);
  }
}

void setup() {
  _placeHeader();
  _placeFooter();
}
