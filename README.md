# todo_app

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