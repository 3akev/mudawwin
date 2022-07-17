// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Poem extends DataClass implements Insertable<Poem> {
  final int id;
  final String title;
  final String content;
  Poem({required this.id, required this.title, required this.content});
  factory Poem.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Poem(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      content: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}content'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['content'] = Variable<String>(content);
    return map;
  }

  PoemsCompanion toCompanion(bool nullToAbsent) {
    return PoemsCompanion(
      id: Value(id),
      title: Value(title),
      content: Value(content),
    );
  }

  factory Poem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Poem(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      content: serializer.fromJson<String>(json['content']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'content': serializer.toJson<String>(content),
    };
  }

  Poem copyWith({int? id, String? title, String? content}) => Poem(
        id: id ?? this.id,
        title: title ?? this.title,
        content: content ?? this.content,
      );
  @override
  String toString() {
    return (StringBuffer('Poem(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, content);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Poem &&
          other.id == this.id &&
          other.title == this.title &&
          other.content == this.content);
}

class PoemsCompanion extends UpdateCompanion<Poem> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> content;
  const PoemsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.content = const Value.absent(),
  });
  PoemsCompanion.insert({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.content = const Value.absent(),
  });
  static Insertable<Poem> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? content,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (content != null) 'content': content,
    });
  }

  PoemsCompanion copyWith(
      {Value<int>? id, Value<String>? title, Value<String>? content}) {
    return PoemsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PoemsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content')
          ..write(')'))
        .toString();
  }
}

class $PoemsTable extends Poems with TableInfo<$PoemsTable, Poem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PoemsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  final VerificationMeta _contentMeta = const VerificationMeta('content');
  @override
  late final GeneratedColumn<String?> content = GeneratedColumn<String?>(
      'content', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  @override
  List<GeneratedColumn> get $columns => [id, title, content];
  @override
  String get aliasedName => _alias ?? 'poems';
  @override
  String get actualTableName => 'poems';
  @override
  VerificationContext validateIntegrity(Insertable<Poem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Poem map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Poem.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $PoemsTable createAlias(String alias) {
    return $PoemsTable(attachedDatabase, alias);
  }
}

abstract class _$PoetryDatabase extends GeneratedDatabase {
  _$PoetryDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $PoemsTable poems = $PoemsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [poems];
}
