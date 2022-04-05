import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import 'dart:io';

part 'db.g.dart';

@DriftDatabase(tables: [DBUser])
@singleton
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}

class DBUser extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get email => text().withLength(min: 6, max: 100)();

  TextColumn get password => text().withLength(min: 1, max: 100)();

  DateTimeColumn get registerTime => dateTime()();
}
