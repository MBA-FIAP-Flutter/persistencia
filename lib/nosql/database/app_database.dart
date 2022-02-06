import 'dart:async';

import 'package:aula2_persistencia/nosql/dao/book_dao.dart';
import 'package:aula2_persistencia/nosql/model/book.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_database.g.dart';

@Database(version: 1, entities: [Book])
abstract class AppDatabase extends FloorDatabase {
  BookDao get bookDao;
}
