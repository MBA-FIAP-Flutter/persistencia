import 'package:floor/floor.dart';

@entity
class Book {
  @PrimaryKey(autoGenerate: true)
  int? id;

  final String name;
  final String author;

  Book(this.name, this.author, {this.id});
}
