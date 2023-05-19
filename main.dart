import 'my_list.dart';

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
  myList.clear();
  print('-------------------------');
  for (int i in myList) {
    print(i);
  }
  print('End');
}
