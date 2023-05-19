class MyList<T> extends Iterable<T> {
  _MyNode<T>? _first;
  _MyNode<T>? _last;
  late int _length;

  MyList() {
    _length = 0;
  }

  int get length => _length;

  void add(T info) {
    _MyNode<T> myNode = _MyNode(info: info, previous: _last);
    _first ??= myNode;
    _last?.next = myNode;
    _last = myNode;
    _length++;
  }

  void clear() {
    _first = null;
    _last = null;
    _length = 0;
  }

  void remove(int index) {
    _MyNode<T>? node = _getNode(index);
    _MyNode<T>? prev = node?.previous;
    _MyNode<T>? next = node?.next;
    prev?.next = next;
    next?.previous = prev;
    _first = switch (index) {
      0 => node?.next,
      _ => _first,
    };
    _last = switch (index) {
      int a when a == length - 1 => node?.previous,
      _ => _last,
    };
    _length = switch (node) {
      null => _length,
      _ => _length - 1,
    };
  }

  _MyNode<T>? _getNode(int index, {_MyNode<T>? node}) {
    node ??= index < length ? _first : null;
    return switch (index) {
      int i when i < _length && i > 0 => _getNode(index - 1, node: node!.next),
      _ => node,
    };
  }

  T? get(int index) {
    return _getNode(index)?.info;
  }

  @override
  Iterator<T> get iterator => _MyListIterator(_first);
}

class _MyNode<T> {
  _MyNode<T>? _prev;
  _MyNode<T>? _next;
  final T info;

  _MyNode({required this.info, _MyNode<T>? previous, _MyNode<T>? next}) {
    this._next = next;
    this._prev = previous;
  }

  _MyNode<T>? get previous => _prev;
  _MyNode<T>? get next => _next;

  void set previous(_MyNode<T>? previous) => this._prev = previous;
  void set next(_MyNode<T>? next) => this._next = next;
}

class _MyListIterator<T> implements Iterator<T> {
  _MyNode<T>? _current;
  _MyListIterator(_MyNode<T>? first) {
    _current = first;
  }

  @override
  T get current {
    T info = _current!.info;
    _current = _current!.next;
    return info;
  }

  @override
  bool moveNext() {
    return _current != null;
  }
}
