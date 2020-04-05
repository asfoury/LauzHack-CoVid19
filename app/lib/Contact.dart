class Contact {
  int _pcode;
  String _city, _street, _aptFloor;
  String _firstName, _lastName;
  String _phone;
  String _email;

  Contact(this._pcode, this._city, this._street, this._aptFloor,
      this._firstName, this._lastName, this._phone, this._email);

  Contact.from(Contact contact) {
    this._pcode = contact._pcode;
    this._city = contact._city;
    this._street = contact._street;
    this._aptFloor = contact._aptFloor;
    this._firstName = contact._firstName;
    this._lastName = contact._lastName;
    this._phone = contact._phone;
    this._email = contact._email;
  }

  int getPCode() {
    return _pcode;
  }

  String getCity() {
    return _city;
  }

  String getStreet() {
    return _street;
  }

  String getAptFloor() {
    return _aptFloor;
  }

  String getFirstName() {
    return _firstName;
  }

  String getLastname() {
    return _lastName;
  }

  String getPhone() {
    return _phone;
  }

  String getEmail() {
    return _email;
  }

  int setPCode(int pcode) {
    _pcode = pcode;
  }

  String setCity(String city) {
    _city = city;
  }

  String setStreet(String street) {
    _street = street;
  }

  String setAptFloor(String aptFloor) {
    _aptFloor = aptFloor;
  }

  String setFirstName(String firstName) {
    _firstName = firstName;
  }

  String setLastname(String lastName) {
    _lastName = lastName;
  }

  String setPhone(String phone) {
    _phone = phone;
  }

  String setEmail(String email) {
    _email = email;
  }
}
