import 'package:hive/hive.dart';
import 'package:todo/todo.dart';

class TodoService {
  Future<Box<Todo>> get _box async => await Hive.openBox<Todo>('todos');

  Future<void> addTodo(Todo todo) async {
    var box = await _box;
    await box.add(todo);
  }

  Future<List<Todo>> getAllTodos() async {
    var box = await _box;
    return box.values.toList();
  }

  Future<void> deleteTodo(Todo todo) async {
    var box = await _box;
    await box.delete(todo);
  }

  Future<void> toggleDone(int index, Todo todo) async {
    var box = await _box;
    todo.done = !todo.done;
    await box.putAt(index, todo);
  }
}
