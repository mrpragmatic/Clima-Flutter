import 'dart:io';

void main() {
  performTask();
}

void performTask() async {
  task1();
  task2();
  task3();
  print('Task 4 res $task4()');
  String data = await task4();
  task5(data);
}

void task1() {
  String result = 'Task 1 data';
  print('Task 1 Complete');
}

void task2() {
  String result = 'Task 2 data';
  Duration duration = Duration(seconds: 3);
  // sleep(duration); //synchronous method
  Future.delayed(duration, () {
    //async method
    print('Task 2 Complete');
  });
}

void task3() {
  String result = 'Task 3 data';
  print('Task 3 Complete');
}

Future<String> task4() async {
  String result;
  Duration duration = Duration(seconds: 3);
  // sleep(duration); //synchronous method
  await Future.delayed(duration, () {
    //async method
    result = 'Task 4 data';
    print('Task 4 Complete');
  });
  return result;
}

void task5(String task4Data) {
  print('Data from task $task4Data');
}
