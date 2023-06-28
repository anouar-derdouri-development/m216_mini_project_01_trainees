class Operation {
  late String _text;
  late  String _value;

  String get text => _text;

  set text(String value) {
    _text = value;
  }

  String get value => _value;

  set value(String value) {
    _value = value;
  }

  Operation(String text, String value) {
    _text = text;
    _value = value;
  }

  @override
  String toString() {
    return "$_text → $_value";
  }

  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'value': value,
    };
  }
}

