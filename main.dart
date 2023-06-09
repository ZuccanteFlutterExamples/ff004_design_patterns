import 'my_list.dart';
import 'my_observable.dart';
import 'singleton.dart';

void main(List<String> args) {
  print("Hello world!");
  MyList<int> myList = new MyList();
  for (int i = 0; i < 10; i++) {
    myList.add(i);
  }
  myList.remove(9);
  myList.remove(0);

  for (int i = 0; i <= 10; i++) {
    print(myList.get(i));
  }
  print('-------------------------');
  for (int i in myList) {
    print(i);
  }
  myList.remove(0);
  print('-------------------------');
  for (int i in myList) {
    print(i);
  }
  myList.remove(5);
  print('-------------------------');
  for (int i in myList) {
    print(i);
  }
  print('Iterator: ');
  Iterator<int> iterator = myList.iterator;
  while (iterator.moveNext()) {
    print(iterator.current);
  }

  myList.clear();
  print('-------------------------');
  for (int i in myList) {
    print(i);
  }
  print('End');

  List<Singleton> singletons = [
    Singleton(),
    Singleton(),
    Singleton(),
  ];

  singletons[0].data = "Ciao";

  for (Singleton s in singletons) {
    print(s.data);
  }

  singletons.last.data = 'Hello world!';

  for (Singleton s in singletons) {
    print(s.data);
  }

  Observer bartender = Observer("Tyler");
  CoffeeMaker mrCoffee = CoffeeMaker(List.from([bartender]));
  Observer client = Observer("Kate");
  mrCoffee.registerObserver(client);
  mrCoffee.brew();
}
