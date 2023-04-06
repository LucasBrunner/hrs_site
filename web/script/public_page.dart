import 'dart:html';

const headerHtml = '''
    <h1>Home Renovation Systems</h1>
    <div id="header-left-content">
      <span>
        Products
      </span>
      <span>
        Services
      </span>
      <img id="profile-icon" src="./icons/profile-icon.svg" alt="profile-icon"></iframe>
    </div>
''';

const footerHtml = '''
    <div id="footer-links">
      <span>
        <ul>
          <li>
            <a href="">Frequently Asked Questions</a>
          </li>
          <li>
            <a href="">About Us</a>
          </li>
        </ul>
      </span>
      <span>
        <ul>
          <li>
            <a href="">Products</a>
          </li>
          <li>
            <a href="">Services</a>
          </li>
        </ul>
      </span>
      <span>
        <ul>
          <li>
            <a href="">Sign In</a>
          </li>
        </ul>
      </span>
    </div>
    <p><i>© 2023 Home Renovation Systems</i></p>
''';

void _placeHeader() {
  document.body?.children.insert(0, Element.header()..innerHtml = headerHtml);
}

void _placeFooter() {
  document.body?.children.add(Element.footer()..innerHtml = footerHtml);
}

void setup() {
  _placeHeader();
  _placeFooter();
}
