import 'dart:html';

const headerHtml = '''
    <h1>Home Renovation Systems</h1>
    <div id="header-left-content">
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
        <li>
          <p class="text-button" onclick="window.location.pathname = '/about_us'">About Us</a>
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
      ..onClick.listen((event) => window.location.pathname = '/customer/account'));
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
          ..onClick.listen((event) => window.location.pathname = '/customer/account')),
      LIElement()
        ..children.add(ParagraphElement()
          ..innerText = 'View Orders'
          ..className = 'text-button'
          ..onClick.listen((event) => window.location.pathname = '/customer/orders')),
      LIElement()
        ..children.add(ParagraphElement()
          ..innerText = 'View Statements'
          ..className = 'text-button'
          ..onClick.listen((event) => window.location.pathname = '/signup')),
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