class Singleton {
  static final Singleton _instance = Singleton._internal();
  late String _data;
  factory Singleton() {
    return _instance;
  }

  Singleton._internal() {
    _data = "";
  }

  String get data => _data;

  void set data(String value) {
    _data = value;
  }
}
