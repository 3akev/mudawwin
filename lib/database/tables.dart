import 'package:drift/drift.dart';

@DataClassName('Poem')
class Poems extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withDefault(const Constant(''))();
  TextColumn get content => text().withDefault(const Constant(''))();
}
