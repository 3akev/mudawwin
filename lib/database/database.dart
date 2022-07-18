import 'dart:async';

import 'package:mudawwin/database/tables.dart';
import 'package:drift/drift.dart';

import 'dart:io';

import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'database.g.dart';

const numCharsHeader = Variable<int>(100);

@DriftDatabase(tables: [Poems], queries: {'contentLimit': ''})
class PoetryDatabase extends _$PoetryDatabase {
  // we tell the database where to store the data with this constructor
  PoetryDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<Poem>> allPoems() async {
    return customSelect(
        "SELECT id, title, SUBSTR(content, 1, ?) AS 'content' FROM poems",
        variables: [numCharsHeader]
    ).map((e) => Poem.fromData(e.data))
        .get();
  }

  Future<Poem> getPoem(int id) =>
      (select(poems)..where((tbl) => tbl.id.equals(id))).getSingle();

  Future<Poem> createPoem() => into(poems).insertReturning(
      const PoemsCompanion(title: Value(''), content: Value('')));

  Future updatePoem(PoemsCompanion poem) =>
      (update(poems)..where((tbl) => tbl.id.equals(poem.id.value))).write(poem);

  Future removePoem(Poem poem) =>
      (delete(poems)..where((poem2) => poem2.id.equals(poem.id))).go();
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
