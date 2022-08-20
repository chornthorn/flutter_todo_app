/*
* Create database connection class with sqlite
* With base 4 operation
* - Read
* - Write
* - Update
* - Delete
*
* Table: users
* - id -> primary key auto increment
* - name -> text
* - email -> text unique
* - password -> text
* - created_at -> datetime default current_timestamp
* - updated_at -> datetime default current_timestamp
*
* Table: todos
* - id -> primary key auto increment
* - user_id (foreign key) - users.id (primary key) - user_id is the foreign key
* - title -> text
* - description -> text nullable
* - created_at -> datetime default current_timestamp
* - updated_at -> datetime default current_timestamp
* - completed -> boolean default false
*
* Query:
* - Read all users
* - Read all todos of a user
* - Read a todo of a user by id (todo_id) - join table users and todos
* - Create a user
* - Update a user by id (user_id)
* - Create a todo of a user (user_id) - join table users and todos
* - Update a todo of a user (todo_id) - join table users and todos
* - Delete a todo of a user (todo_id) - join table users and todos
* - Delete a user
* - Delete all todos of a user (user_id) - join table users and todos
* - Delete all users
* - Delete all todos
* - Delete all users and todos
* - Delete all users and todos with cascade
* */

import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

// User model class
class User {
  int? id;
  String name;
  String email;
  String password;
  DateTime? createdAt;
  DateTime? updatedAt;

  User({
    this.id,
    required this.name,
    required this.email,
    required this.password,
    this.createdAt,
    this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'created_at': createdAt?.millisecondsSinceEpoch,
      'updated_at': updatedAt?.millisecondsSinceEpoch,
    };
  }

  static User fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      password: map['password'],
      createdAt: map['created_at'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['created_at'])
          : null,
      updatedAt: map['updated_at'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['updated_at'])
          : null,
    );
  }

  @override
  String toString() {
    return 'User{id: $id, name: $name, email: $email, password: $password, createdAt: $createdAt, updatedAt: $updatedAt}';
  }
}

// Todo model class
class Todo {
  int? id;
  int? userId;
  String title;
  String? description;
  DateTime? createdAt;
  DateTime? updatedAt;
  bool completed;

  Todo({
    this.id,
    this.userId,
    required this.title,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.completed = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'user_id': userId,
      'title': title,
      'description': description,
      'created_at': createdAt?.millisecondsSinceEpoch,
      'updated_at': updatedAt?.millisecondsSinceEpoch,
      'completed': completed,
    };
  }

  static Todo fromMap(Map<String, dynamic> map) {

    return Todo(
      id: map['id'],
      userId: map['user_id'],
      title: map['title'],
      description: map['description'],
      createdAt: map['created_at'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['created_at'])
          : null,
      updatedAt: map['updated_at'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['updated_at'])
          : null,
      completed: map['completed'],
    );
  }
}

class MyDatabase {
  static final MyDatabase _myDatabase = MyDatabase._internal();
  static Database? _database;

  MyDatabase._internal();

  factory MyDatabase() => _myDatabase;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "my_database.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE users ("
          "id INTEGER PRIMARY KEY AUTOINCREMENT,"
          "name TEXT,"
          "email TEXT UNIQUE,"
          "password TEXT,"
          "created_at DATETIME DEFAULT CURRENT_TIMESTAMP,"
          "updated_at DATETIME DEFAULT CURRENT_TIMESTAMP"
          ")");
      await db.execute("CREATE TABLE todos ("
          "id INTEGER PRIMARY KEY AUTOINCREMENT,"
          "user_id INTEGER,"
          "title TEXT,"
          "description TEXT NULL,"
          "created_at DATETIME DEFAULT CURRENT_TIMESTAMP,"
          "updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,"
          "completed BOOLEAN DEFAULT false"
          ")");
    });
  }

  Future<int> insertUser(User user) async {
    try {
      Database db = await database;
      return await db.insert("users", user.toMap());
    } catch (e) {
      print(e);
      throw Exception("Error inserting user");
    }
  }

  Future<int> insertTodo(Todo todo) async {
    try {
      Database db = await database;
      return await db.insert("todos", todo.toMap());
    } catch (e) {
      print(e);
      throw Exception("Error inserting todo");
    }
  }

  // find user email
  Future<User?> findUserByEmail(String email) async {
    try {
      Database db = await database;
      List<Map<String,dynamic>> maps = await db.query("users",
          columns: ["id", "name", "email", "password", "created_at", "updated_at"],
          where: "email = ?",
          whereArgs: [email]);
      if (maps.length > 0) {
        return User.fromMap(maps.first);
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      throw Exception("Error finding user");
    }
  }

  Future<int> updateUser(User user) async {
    try {
      Database db = await database;
      return await db.update("users", user.toMap(),
          where: "id = ?", whereArgs: [user.id]);
    } catch (e) {
      print(e);
      throw Exception("Error updating user");
    }
  }

  Future<int> updateTodo(Todo todo) async {
    try {
      Database db = await database;
      return await db.update("todos", todo.toMap(),
          where: "id = ?", whereArgs: [todo.id]);
    } catch (e) {
      print(e);
      throw Exception("Error updating todo");
    }
  }

  Future<int> deleteUser(int id) async {
    try {
      Database db = await database;
      return await db.delete("users", where: "id = ?", whereArgs: [id]);
    } catch (e) {
      print(e);
      throw Exception("Error deleting user");
    }
  }

  Future<int> deleteTodo(int id) async {
    try {
      Database db = await database;
      return await db.delete("todos", where: "id = ?", whereArgs: [id]);
    } catch (e) {
      print(e);
      throw Exception("Error deleting todo");
    }
  }

  Future<List<User>> getUsers() async {
    try {
      Database db = await database;
      List<Map<String,dynamic>> maps = await db.query("users");
      return List.generate(maps.length, (i) {
        return User.fromMap(maps[i]);
      });
    } catch (e) {
      print(e);
      throw Exception("Error getting users");
    }
  }

  Future<List<Todo>> getTodos() async {
    try {
      Database db = await database;
      List<Map<String,dynamic>> maps = await db.query("todos");
      return List.generate(maps.length, (i) {
        return Todo.fromMap(maps[i]);
      });
    } catch (e) {
      print(e);
      throw Exception("Error getting todos");
    }
  }

  Future<List<Todo>> getTodosByUserId(int userId) async {
    try {
      Database db = await database;
      List<Map<String,dynamic>> maps = await db.query("todos", where: "user_id = ?", whereArgs: [userId]);
      return List.generate(maps.length, (i) {
        return Todo.fromMap(maps[i]);
      });
    } catch (e) {
      print(e);
      throw Exception("Error getting todos");
    }
  }

  Future<User> getUserById(int id) async {
    try {
      Database db = await database;
      List<Map<String,dynamic>> maps = await db.query("users", where: "id = ?", whereArgs: [id]);
      return User.fromMap(maps[0]);
    } catch (e) {
      print(e);
      throw Exception("Error getting user");
    }
  }

  Future<Todo> getTodoById(int id) async {
    try {
      Database db = await database;
      List<Map<String,dynamic>> maps = await db.query("todos", where: "id = ?", whereArgs: [id]);
      return Todo.fromMap(maps[0]);
    } catch (e) {
      print(e);
      throw Exception("Error getting todo");
    }
  }

  // update todo completed status
  Future<int> updateTodoCompleted(int id, bool completed) async {
    try {
      Database db = await database;
      return await db.update("todos", {"completed": completed},
          where: "id = ?", whereArgs: [id]);
    } catch (e) {
      print(e);
      throw Exception("Error updating todo");
    }
  }

  // delete all todos by user id
  Future<int> deleteTodosByUserId(int userId) async {
    try {
      Database db = await database;
      return await db.delete("todos", where: "user_id = ?", whereArgs: [userId]);
    } catch (e) {
      print(e);
      throw Exception("Error deleting todos");
    }
  }

  // update user name and password
  Future<int> updateUserNameAndPassword(int id, String name, String password) async {
    try {
      Database db = await database;
      return await db.update("users", {"name": name, "password": password},
          where: "id = ?", whereArgs: [id]);
    } catch (e) {
      print(e);
      throw Exception("Error updating user");
    }
  }
}
