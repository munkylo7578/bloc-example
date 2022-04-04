import 'package:bloc_example_1/models/task.dart';
import 'package:hive/hive.dart';

class TodoService {
  late Box<Task> _tasks;
  Future<void> init() async {
    Hive.registerAdapter(TaskAdapter());
    _tasks = await Hive.openBox<Task>("tasks");

    await _tasks.add(Task("testuser1", "testtask1", true));
    await _tasks.add(Task("testuser2", "testtask2", false));
  }

  List<Task> getTasks(final String username) {
    final tasks = _tasks.values.where((element) => element.user == username);
    return tasks.toList();
  }

  void addTask(final String task, final String username) {
    _tasks.add(Task(username, task, false));
  }

  Future<void> removeTask(final String username, final String task) async {
    final taskToRemove = _tasks.values.firstWhere(
        (element) => element.user == username && element.task == task);
    await taskToRemove.delete();
  }

  Future<void> editTask(final String username, final String task,
      {final bool? completed}) async {
    final taskToEdit = _tasks.values.firstWhere(
        (element) => element.user == username && element.task == task);
    final index = taskToEdit.key as int;
    _tasks.put(index, Task(username, task, completed ?? taskToEdit.completed));
  }
}
