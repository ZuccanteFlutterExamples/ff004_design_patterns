class Notification {
  String message;
  late DateTime timestamp;
  Notification(this.message, {DateTime? timestamp}) {
    this.timestamp = timestamp ?? DateTime.now();
  }
}

class Observable {
  late List<Observer> _observers;

  Observable([List<Observer>? observers]) {
    _observers = observers ?? [];
  }

  void registerObserver(Observer observer) {
    _observers.add(observer);
  }

  void notify_observers(Notification notification) {
    for (var observer in _observers) {
      observer.notify(notification);
    }
  }
}

class Observer {
  String name;

  Observer(this.name);

  void notify(Notification notification) {
    print(
      "[${notification.timestamp.toIso8601String()}] Hey $name, ${notification.message}!",
    );
  }
}

class CoffeeMaker extends Observable {
  CoffeeMaker([List<Observer>? observers]) : super(observers);
  void brew() {
    print("Brewing the coffee...");
    notify_observers(Notification("coffee's done"));
  }
}
