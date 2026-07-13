// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $AreasTable extends Areas with TableInfo<$AreasTable, Area> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AreasTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _customerCountMeta = const VerificationMeta(
    'customerCount',
  );
  @override
  late final GeneratedColumn<int> customerCount = GeneratedColumn<int>(
    'customer_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    createdAt,
    updatedAt,
    name,
    customerCount,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'areas';
  @override
  VerificationContext validateIntegrity(
    Insertable<Area> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('customer_count')) {
      context.handle(
        _customerCountMeta,
        customerCount.isAcceptableOrUnknown(
          data['customer_count']!,
          _customerCountMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Area map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Area(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      customerCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}customer_count'],
      )!,
    );
  }

  @override
  $AreasTable createAlias(String alias) {
    return $AreasTable(attachedDatabase, alias);
  }
}

class Area extends DataClass implements Insertable<Area> {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String name;
  final int customerCount;
  const Area({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.customerCount,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['name'] = Variable<String>(name);
    map['customer_count'] = Variable<int>(customerCount);
    return map;
  }

  AreasCompanion toCompanion(bool nullToAbsent) {
    return AreasCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      name: Value(name),
      customerCount: Value(customerCount),
    );
  }

  factory Area.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Area(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      name: serializer.fromJson<String>(json['name']),
      customerCount: serializer.fromJson<int>(json['customerCount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'name': serializer.toJson<String>(name),
      'customerCount': serializer.toJson<int>(customerCount),
    };
  }

  Area copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? name,
    int? customerCount,
  }) => Area(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    name: name ?? this.name,
    customerCount: customerCount ?? this.customerCount,
  );
  Area copyWithCompanion(AreasCompanion data) {
    return Area(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      name: data.name.present ? data.name.value : this.name,
      customerCount: data.customerCount.present
          ? data.customerCount.value
          : this.customerCount,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Area(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('name: $name, ')
          ..write('customerCount: $customerCount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, createdAt, updatedAt, name, customerCount);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Area &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.name == this.name &&
          other.customerCount == this.customerCount);
}

class AreasCompanion extends UpdateCompanion<Area> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<String> name;
  final Value<int> customerCount;
  final Value<int> rowid;
  const AreasCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.name = const Value.absent(),
    this.customerCount = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AreasCompanion.insert({
    required String id,
    required DateTime createdAt,
    required DateTime updatedAt,
    required String name,
    this.customerCount = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt),
       name = Value(name);
  static Insertable<Area> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? name,
    Expression<int>? customerCount,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (name != null) 'name': name,
      if (customerCount != null) 'customer_count': customerCount,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AreasCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<String>? name,
    Value<int>? customerCount,
    Value<int>? rowid,
  }) {
    return AreasCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      name: name ?? this.name,
      customerCount: customerCount ?? this.customerCount,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (customerCount.present) {
      map['customer_count'] = Variable<int>(customerCount.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AreasCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('name: $name, ')
          ..write('customerCount: $customerCount, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DistributionBoxesTable extends DistributionBoxes
    with TableInfo<$DistributionBoxesTable, DistributionBox> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DistributionBoxesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _areaIdMeta = const VerificationMeta('areaId');
  @override
  late final GeneratedColumn<String> areaId = GeneratedColumn<String>(
    'area_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES areas (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _areaNameMeta = const VerificationMeta(
    'areaName',
  );
  @override
  late final GeneratedColumn<String> areaName = GeneratedColumn<String>(
    'area_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _locationNoteMeta = const VerificationMeta(
    'locationNote',
  );
  @override
  late final GeneratedColumn<String> locationNote = GeneratedColumn<String>(
    'location_note',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _customerCountMeta = const VerificationMeta(
    'customerCount',
  );
  @override
  late final GeneratedColumn<int> customerCount = GeneratedColumn<int>(
    'customer_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    areaId,
    areaName,
    locationNote,
    notes,
    customerCount,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'distribution_boxes';
  @override
  VerificationContext validateIntegrity(
    Insertable<DistributionBox> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('area_id')) {
      context.handle(
        _areaIdMeta,
        areaId.isAcceptableOrUnknown(data['area_id']!, _areaIdMeta),
      );
    } else if (isInserting) {
      context.missing(_areaIdMeta);
    }
    if (data.containsKey('area_name')) {
      context.handle(
        _areaNameMeta,
        areaName.isAcceptableOrUnknown(data['area_name']!, _areaNameMeta),
      );
    } else if (isInserting) {
      context.missing(_areaNameMeta);
    }
    if (data.containsKey('location_note')) {
      context.handle(
        _locationNoteMeta,
        locationNote.isAcceptableOrUnknown(
          data['location_note']!,
          _locationNoteMeta,
        ),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('customer_count')) {
      context.handle(
        _customerCountMeta,
        customerCount.isAcceptableOrUnknown(
          data['customer_count']!,
          _customerCountMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DistributionBox map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DistributionBox(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      areaId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}area_id'],
      )!,
      areaName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}area_name'],
      )!,
      locationNote: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}location_note'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      customerCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}customer_count'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $DistributionBoxesTable createAlias(String alias) {
    return $DistributionBoxesTable(attachedDatabase, alias);
  }
}

class DistributionBox extends DataClass implements Insertable<DistributionBox> {
  final String id;
  final String name;
  final String areaId;
  final String areaName;
  final String? locationNote;
  final String? notes;
  final int customerCount;
  final DateTime createdAt;
  const DistributionBox({
    required this.id,
    required this.name,
    required this.areaId,
    required this.areaName,
    this.locationNote,
    this.notes,
    required this.customerCount,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['area_id'] = Variable<String>(areaId);
    map['area_name'] = Variable<String>(areaName);
    if (!nullToAbsent || locationNote != null) {
      map['location_note'] = Variable<String>(locationNote);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['customer_count'] = Variable<int>(customerCount);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  DistributionBoxesCompanion toCompanion(bool nullToAbsent) {
    return DistributionBoxesCompanion(
      id: Value(id),
      name: Value(name),
      areaId: Value(areaId),
      areaName: Value(areaName),
      locationNote: locationNote == null && nullToAbsent
          ? const Value.absent()
          : Value(locationNote),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      customerCount: Value(customerCount),
      createdAt: Value(createdAt),
    );
  }

  factory DistributionBox.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DistributionBox(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      areaId: serializer.fromJson<String>(json['areaId']),
      areaName: serializer.fromJson<String>(json['areaName']),
      locationNote: serializer.fromJson<String?>(json['locationNote']),
      notes: serializer.fromJson<String?>(json['notes']),
      customerCount: serializer.fromJson<int>(json['customerCount']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'areaId': serializer.toJson<String>(areaId),
      'areaName': serializer.toJson<String>(areaName),
      'locationNote': serializer.toJson<String?>(locationNote),
      'notes': serializer.toJson<String?>(notes),
      'customerCount': serializer.toJson<int>(customerCount),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  DistributionBox copyWith({
    String? id,
    String? name,
    String? areaId,
    String? areaName,
    Value<String?> locationNote = const Value.absent(),
    Value<String?> notes = const Value.absent(),
    int? customerCount,
    DateTime? createdAt,
  }) => DistributionBox(
    id: id ?? this.id,
    name: name ?? this.name,
    areaId: areaId ?? this.areaId,
    areaName: areaName ?? this.areaName,
    locationNote: locationNote.present ? locationNote.value : this.locationNote,
    notes: notes.present ? notes.value : this.notes,
    customerCount: customerCount ?? this.customerCount,
    createdAt: createdAt ?? this.createdAt,
  );
  DistributionBox copyWithCompanion(DistributionBoxesCompanion data) {
    return DistributionBox(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      areaId: data.areaId.present ? data.areaId.value : this.areaId,
      areaName: data.areaName.present ? data.areaName.value : this.areaName,
      locationNote: data.locationNote.present
          ? data.locationNote.value
          : this.locationNote,
      notes: data.notes.present ? data.notes.value : this.notes,
      customerCount: data.customerCount.present
          ? data.customerCount.value
          : this.customerCount,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DistributionBox(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('areaId: $areaId, ')
          ..write('areaName: $areaName, ')
          ..write('locationNote: $locationNote, ')
          ..write('notes: $notes, ')
          ..write('customerCount: $customerCount, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    areaId,
    areaName,
    locationNote,
    notes,
    customerCount,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DistributionBox &&
          other.id == this.id &&
          other.name == this.name &&
          other.areaId == this.areaId &&
          other.areaName == this.areaName &&
          other.locationNote == this.locationNote &&
          other.notes == this.notes &&
          other.customerCount == this.customerCount &&
          other.createdAt == this.createdAt);
}

class DistributionBoxesCompanion extends UpdateCompanion<DistributionBox> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> areaId;
  final Value<String> areaName;
  final Value<String?> locationNote;
  final Value<String?> notes;
  final Value<int> customerCount;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const DistributionBoxesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.areaId = const Value.absent(),
    this.areaName = const Value.absent(),
    this.locationNote = const Value.absent(),
    this.notes = const Value.absent(),
    this.customerCount = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DistributionBoxesCompanion.insert({
    required String id,
    required String name,
    required String areaId,
    required String areaName,
    this.locationNote = const Value.absent(),
    this.notes = const Value.absent(),
    this.customerCount = const Value.absent(),
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       areaId = Value(areaId),
       areaName = Value(areaName),
       createdAt = Value(createdAt);
  static Insertable<DistributionBox> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? areaId,
    Expression<String>? areaName,
    Expression<String>? locationNote,
    Expression<String>? notes,
    Expression<int>? customerCount,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (areaId != null) 'area_id': areaId,
      if (areaName != null) 'area_name': areaName,
      if (locationNote != null) 'location_note': locationNote,
      if (notes != null) 'notes': notes,
      if (customerCount != null) 'customer_count': customerCount,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DistributionBoxesCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? areaId,
    Value<String>? areaName,
    Value<String?>? locationNote,
    Value<String?>? notes,
    Value<int>? customerCount,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return DistributionBoxesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      areaId: areaId ?? this.areaId,
      areaName: areaName ?? this.areaName,
      locationNote: locationNote ?? this.locationNote,
      notes: notes ?? this.notes,
      customerCount: customerCount ?? this.customerCount,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (areaId.present) {
      map['area_id'] = Variable<String>(areaId.value);
    }
    if (areaName.present) {
      map['area_name'] = Variable<String>(areaName.value);
    }
    if (locationNote.present) {
      map['location_note'] = Variable<String>(locationNote.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (customerCount.present) {
      map['customer_count'] = Variable<int>(customerCount.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DistributionBoxesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('areaId: $areaId, ')
          ..write('areaName: $areaName, ')
          ..write('locationNote: $locationNote, ')
          ..write('notes: $notes, ')
          ..write('customerCount: $customerCount, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CustomersTable extends Customers
    with TableInfo<$CustomersTable, Customer> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CustomersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _totalBilledMeta = const VerificationMeta(
    'totalBilled',
  );
  @override
  late final GeneratedColumn<double> totalBilled = GeneratedColumn<double>(
    'total_billed',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _totalPaidMeta = const VerificationMeta(
    'totalPaid',
  );
  @override
  late final GeneratedColumn<double> totalPaid = GeneratedColumn<double>(
    'total_paid',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _totalOutstandingMeta = const VerificationMeta(
    'totalOutstanding',
  );
  @override
  late final GeneratedColumn<double> totalOutstanding = GeneratedColumn<double>(
    'total_outstanding',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
    'phone',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _addressMeta = const VerificationMeta(
    'address',
  );
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
    'address',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _buildingMeta = const VerificationMeta(
    'building',
  );
  @override
  late final GeneratedColumn<String> building = GeneratedColumn<String>(
    'building',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _floorMeta = const VerificationMeta('floor');
  @override
  late final GeneratedColumn<String> floor = GeneratedColumn<String>(
    'floor',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _cableNameMeta = const VerificationMeta(
    'cableName',
  );
  @override
  late final GeneratedColumn<String> cableName = GeneratedColumn<String>(
    'cable_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _boxIdMeta = const VerificationMeta('boxId');
  @override
  late final GeneratedColumn<String> boxId = GeneratedColumn<String>(
    'box_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES distribution_boxes (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _boxNameMeta = const VerificationMeta(
    'boxName',
  );
  @override
  late final GeneratedColumn<String> boxName = GeneratedColumn<String>(
    'box_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ampereScheduleIdMeta = const VerificationMeta(
    'ampereScheduleId',
  );
  @override
  late final GeneratedColumn<String> ampereScheduleId = GeneratedColumn<String>(
    'ampere_schedule_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ampereScheduleNameMeta =
      const VerificationMeta('ampereScheduleName');
  @override
  late final GeneratedColumn<String> ampereScheduleName =
      GeneratedColumn<String>(
        'ampere_schedule_name',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _areaNameMeta = const VerificationMeta(
    'areaName',
  );
  @override
  late final GeneratedColumn<String> areaName = GeneratedColumn<String>(
    'area_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _areaIdMeta = const VerificationMeta('areaId');
  @override
  late final GeneratedColumn<String> areaId = GeneratedColumn<String>(
    'area_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES areas (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _customerTypeMeta = const VerificationMeta(
    'customerType',
  );
  @override
  late final GeneratedColumn<String> customerType = GeneratedColumn<String>(
    'customer_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _customerRelationMeta = const VerificationMeta(
    'customerRelation',
  );
  @override
  late final GeneratedColumn<String> customerRelation = GeneratedColumn<String>(
    'customer_relation',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _subscriptionDateMeta = const VerificationMeta(
    'subscriptionDate',
  );
  @override
  late final GeneratedColumn<DateTime> subscriptionDate =
      GeneratedColumn<DateTime>(
        'subscription_date',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _priceOverrideMeta = const VerificationMeta(
    'priceOverride',
  );
  @override
  late final GeneratedColumn<double> priceOverride = GeneratedColumn<double>(
    'price_override',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _fixedChargeOverrideMeta =
      const VerificationMeta('fixedChargeOverride');
  @override
  late final GeneratedColumn<double> fixedChargeOverride =
      GeneratedColumn<double>(
        'fixed_charge_override',
        aliasedName,
        true,
        type: DriftSqlType.double,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _tvaOverrideMeta = const VerificationMeta(
    'tvaOverride',
  );
  @override
  late final GeneratedColumn<double> tvaOverride = GeneratedColumn<double>(
    'tva_override',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _hasPricingOverrideMeta =
      const VerificationMeta('hasPricingOverride');
  @override
  late final GeneratedColumn<bool> hasPricingOverride = GeneratedColumn<bool>(
    'has_pricing_override',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("has_pricing_override" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _customerStatusMeta = const VerificationMeta(
    'customerStatus',
  );
  @override
  late final GeneratedColumn<String> customerStatus = GeneratedColumn<String>(
    'customer_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('active'),
  );
  static const VerificationMeta _planMeta = const VerificationMeta('plan');
  @override
  late final GeneratedColumn<String> plan = GeneratedColumn<String>(
    'plan',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _planValueMeta = const VerificationMeta(
    'planValue',
  );
  @override
  late final GeneratedColumn<double> planValue = GeneratedColumn<double>(
    'plan_value',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    createdAt,
    updatedAt,
    name,
    totalBilled,
    totalPaid,
    totalOutstanding,
    phone,
    address,
    building,
    floor,
    cableName,
    boxId,
    boxName,
    ampereScheduleId,
    ampereScheduleName,
    areaName,
    areaId,
    customerType,
    customerRelation,
    subscriptionDate,
    priceOverride,
    fixedChargeOverride,
    tvaOverride,
    hasPricingOverride,
    customerStatus,
    plan,
    planValue,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'customers';
  @override
  VerificationContext validateIntegrity(
    Insertable<Customer> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('total_billed')) {
      context.handle(
        _totalBilledMeta,
        totalBilled.isAcceptableOrUnknown(
          data['total_billed']!,
          _totalBilledMeta,
        ),
      );
    }
    if (data.containsKey('total_paid')) {
      context.handle(
        _totalPaidMeta,
        totalPaid.isAcceptableOrUnknown(data['total_paid']!, _totalPaidMeta),
      );
    }
    if (data.containsKey('total_outstanding')) {
      context.handle(
        _totalOutstandingMeta,
        totalOutstanding.isAcceptableOrUnknown(
          data['total_outstanding']!,
          _totalOutstandingMeta,
        ),
      );
    }
    if (data.containsKey('phone')) {
      context.handle(
        _phoneMeta,
        phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta),
      );
    }
    if (data.containsKey('address')) {
      context.handle(
        _addressMeta,
        address.isAcceptableOrUnknown(data['address']!, _addressMeta),
      );
    }
    if (data.containsKey('building')) {
      context.handle(
        _buildingMeta,
        building.isAcceptableOrUnknown(data['building']!, _buildingMeta),
      );
    }
    if (data.containsKey('floor')) {
      context.handle(
        _floorMeta,
        floor.isAcceptableOrUnknown(data['floor']!, _floorMeta),
      );
    }
    if (data.containsKey('cable_name')) {
      context.handle(
        _cableNameMeta,
        cableName.isAcceptableOrUnknown(data['cable_name']!, _cableNameMeta),
      );
    }
    if (data.containsKey('box_id')) {
      context.handle(
        _boxIdMeta,
        boxId.isAcceptableOrUnknown(data['box_id']!, _boxIdMeta),
      );
    }
    if (data.containsKey('box_name')) {
      context.handle(
        _boxNameMeta,
        boxName.isAcceptableOrUnknown(data['box_name']!, _boxNameMeta),
      );
    }
    if (data.containsKey('ampere_schedule_id')) {
      context.handle(
        _ampereScheduleIdMeta,
        ampereScheduleId.isAcceptableOrUnknown(
          data['ampere_schedule_id']!,
          _ampereScheduleIdMeta,
        ),
      );
    }
    if (data.containsKey('ampere_schedule_name')) {
      context.handle(
        _ampereScheduleNameMeta,
        ampereScheduleName.isAcceptableOrUnknown(
          data['ampere_schedule_name']!,
          _ampereScheduleNameMeta,
        ),
      );
    }
    if (data.containsKey('area_name')) {
      context.handle(
        _areaNameMeta,
        areaName.isAcceptableOrUnknown(data['area_name']!, _areaNameMeta),
      );
    }
    if (data.containsKey('area_id')) {
      context.handle(
        _areaIdMeta,
        areaId.isAcceptableOrUnknown(data['area_id']!, _areaIdMeta),
      );
    }
    if (data.containsKey('customer_type')) {
      context.handle(
        _customerTypeMeta,
        customerType.isAcceptableOrUnknown(
          data['customer_type']!,
          _customerTypeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_customerTypeMeta);
    }
    if (data.containsKey('customer_relation')) {
      context.handle(
        _customerRelationMeta,
        customerRelation.isAcceptableOrUnknown(
          data['customer_relation']!,
          _customerRelationMeta,
        ),
      );
    }
    if (data.containsKey('subscription_date')) {
      context.handle(
        _subscriptionDateMeta,
        subscriptionDate.isAcceptableOrUnknown(
          data['subscription_date']!,
          _subscriptionDateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_subscriptionDateMeta);
    }
    if (data.containsKey('price_override')) {
      context.handle(
        _priceOverrideMeta,
        priceOverride.isAcceptableOrUnknown(
          data['price_override']!,
          _priceOverrideMeta,
        ),
      );
    }
    if (data.containsKey('fixed_charge_override')) {
      context.handle(
        _fixedChargeOverrideMeta,
        fixedChargeOverride.isAcceptableOrUnknown(
          data['fixed_charge_override']!,
          _fixedChargeOverrideMeta,
        ),
      );
    }
    if (data.containsKey('tva_override')) {
      context.handle(
        _tvaOverrideMeta,
        tvaOverride.isAcceptableOrUnknown(
          data['tva_override']!,
          _tvaOverrideMeta,
        ),
      );
    }
    if (data.containsKey('has_pricing_override')) {
      context.handle(
        _hasPricingOverrideMeta,
        hasPricingOverride.isAcceptableOrUnknown(
          data['has_pricing_override']!,
          _hasPricingOverrideMeta,
        ),
      );
    }
    if (data.containsKey('customer_status')) {
      context.handle(
        _customerStatusMeta,
        customerStatus.isAcceptableOrUnknown(
          data['customer_status']!,
          _customerStatusMeta,
        ),
      );
    }
    if (data.containsKey('plan')) {
      context.handle(
        _planMeta,
        plan.isAcceptableOrUnknown(data['plan']!, _planMeta),
      );
    } else if (isInserting) {
      context.missing(_planMeta);
    }
    if (data.containsKey('plan_value')) {
      context.handle(
        _planValueMeta,
        planValue.isAcceptableOrUnknown(data['plan_value']!, _planValueMeta),
      );
    } else if (isInserting) {
      context.missing(_planValueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Customer map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Customer(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      totalBilled: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}total_billed'],
      ),
      totalPaid: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}total_paid'],
      ),
      totalOutstanding: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}total_outstanding'],
      ),
      phone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone'],
      ),
      address: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address'],
      ),
      building: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}building'],
      ),
      floor: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}floor'],
      ),
      cableName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cable_name'],
      ),
      boxId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}box_id'],
      ),
      boxName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}box_name'],
      ),
      ampereScheduleId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ampere_schedule_id'],
      ),
      ampereScheduleName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ampere_schedule_name'],
      ),
      areaName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}area_name'],
      ),
      areaId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}area_id'],
      ),
      customerType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}customer_type'],
      )!,
      customerRelation: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}customer_relation'],
      ),
      subscriptionDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}subscription_date'],
      )!,
      priceOverride: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}price_override'],
      ),
      fixedChargeOverride: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}fixed_charge_override'],
      ),
      tvaOverride: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}tva_override'],
      ),
      hasPricingOverride: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}has_pricing_override'],
      )!,
      customerStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}customer_status'],
      )!,
      plan: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}plan'],
      )!,
      planValue: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}plan_value'],
      )!,
    );
  }

  @override
  $CustomersTable createAlias(String alias) {
    return $CustomersTable(attachedDatabase, alias);
  }
}

class Customer extends DataClass implements Insertable<Customer> {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String name;
  final double? totalBilled;
  final double? totalPaid;
  final double? totalOutstanding;
  final String? phone;
  final String? address;
  final String? building;
  final String? floor;
  final String? cableName;
  final String? boxId;
  final String? boxName;
  final String? ampereScheduleId;
  final String? ampereScheduleName;
  final String? areaName;
  final String? areaId;
  final String customerType;
  final String? customerRelation;
  final DateTime subscriptionDate;
  final double? priceOverride;
  final double? fixedChargeOverride;
  final double? tvaOverride;
  final bool hasPricingOverride;
  final String customerStatus;
  final String plan;
  final double planValue;
  const Customer({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    this.totalBilled,
    this.totalPaid,
    this.totalOutstanding,
    this.phone,
    this.address,
    this.building,
    this.floor,
    this.cableName,
    this.boxId,
    this.boxName,
    this.ampereScheduleId,
    this.ampereScheduleName,
    this.areaName,
    this.areaId,
    required this.customerType,
    this.customerRelation,
    required this.subscriptionDate,
    this.priceOverride,
    this.fixedChargeOverride,
    this.tvaOverride,
    required this.hasPricingOverride,
    required this.customerStatus,
    required this.plan,
    required this.planValue,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || totalBilled != null) {
      map['total_billed'] = Variable<double>(totalBilled);
    }
    if (!nullToAbsent || totalPaid != null) {
      map['total_paid'] = Variable<double>(totalPaid);
    }
    if (!nullToAbsent || totalOutstanding != null) {
      map['total_outstanding'] = Variable<double>(totalOutstanding);
    }
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String>(address);
    }
    if (!nullToAbsent || building != null) {
      map['building'] = Variable<String>(building);
    }
    if (!nullToAbsent || floor != null) {
      map['floor'] = Variable<String>(floor);
    }
    if (!nullToAbsent || cableName != null) {
      map['cable_name'] = Variable<String>(cableName);
    }
    if (!nullToAbsent || boxId != null) {
      map['box_id'] = Variable<String>(boxId);
    }
    if (!nullToAbsent || boxName != null) {
      map['box_name'] = Variable<String>(boxName);
    }
    if (!nullToAbsent || ampereScheduleId != null) {
      map['ampere_schedule_id'] = Variable<String>(ampereScheduleId);
    }
    if (!nullToAbsent || ampereScheduleName != null) {
      map['ampere_schedule_name'] = Variable<String>(ampereScheduleName);
    }
    if (!nullToAbsent || areaName != null) {
      map['area_name'] = Variable<String>(areaName);
    }
    if (!nullToAbsent || areaId != null) {
      map['area_id'] = Variable<String>(areaId);
    }
    map['customer_type'] = Variable<String>(customerType);
    if (!nullToAbsent || customerRelation != null) {
      map['customer_relation'] = Variable<String>(customerRelation);
    }
    map['subscription_date'] = Variable<DateTime>(subscriptionDate);
    if (!nullToAbsent || priceOverride != null) {
      map['price_override'] = Variable<double>(priceOverride);
    }
    if (!nullToAbsent || fixedChargeOverride != null) {
      map['fixed_charge_override'] = Variable<double>(fixedChargeOverride);
    }
    if (!nullToAbsent || tvaOverride != null) {
      map['tva_override'] = Variable<double>(tvaOverride);
    }
    map['has_pricing_override'] = Variable<bool>(hasPricingOverride);
    map['customer_status'] = Variable<String>(customerStatus);
    map['plan'] = Variable<String>(plan);
    map['plan_value'] = Variable<double>(planValue);
    return map;
  }

  CustomersCompanion toCompanion(bool nullToAbsent) {
    return CustomersCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      name: Value(name),
      totalBilled: totalBilled == null && nullToAbsent
          ? const Value.absent()
          : Value(totalBilled),
      totalPaid: totalPaid == null && nullToAbsent
          ? const Value.absent()
          : Value(totalPaid),
      totalOutstanding: totalOutstanding == null && nullToAbsent
          ? const Value.absent()
          : Value(totalOutstanding),
      phone: phone == null && nullToAbsent
          ? const Value.absent()
          : Value(phone),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
      building: building == null && nullToAbsent
          ? const Value.absent()
          : Value(building),
      floor: floor == null && nullToAbsent
          ? const Value.absent()
          : Value(floor),
      cableName: cableName == null && nullToAbsent
          ? const Value.absent()
          : Value(cableName),
      boxId: boxId == null && nullToAbsent
          ? const Value.absent()
          : Value(boxId),
      boxName: boxName == null && nullToAbsent
          ? const Value.absent()
          : Value(boxName),
      ampereScheduleId: ampereScheduleId == null && nullToAbsent
          ? const Value.absent()
          : Value(ampereScheduleId),
      ampereScheduleName: ampereScheduleName == null && nullToAbsent
          ? const Value.absent()
          : Value(ampereScheduleName),
      areaName: areaName == null && nullToAbsent
          ? const Value.absent()
          : Value(areaName),
      areaId: areaId == null && nullToAbsent
          ? const Value.absent()
          : Value(areaId),
      customerType: Value(customerType),
      customerRelation: customerRelation == null && nullToAbsent
          ? const Value.absent()
          : Value(customerRelation),
      subscriptionDate: Value(subscriptionDate),
      priceOverride: priceOverride == null && nullToAbsent
          ? const Value.absent()
          : Value(priceOverride),
      fixedChargeOverride: fixedChargeOverride == null && nullToAbsent
          ? const Value.absent()
          : Value(fixedChargeOverride),
      tvaOverride: tvaOverride == null && nullToAbsent
          ? const Value.absent()
          : Value(tvaOverride),
      hasPricingOverride: Value(hasPricingOverride),
      customerStatus: Value(customerStatus),
      plan: Value(plan),
      planValue: Value(planValue),
    );
  }

  factory Customer.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Customer(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      name: serializer.fromJson<String>(json['name']),
      totalBilled: serializer.fromJson<double?>(json['totalBilled']),
      totalPaid: serializer.fromJson<double?>(json['totalPaid']),
      totalOutstanding: serializer.fromJson<double?>(json['totalOutstanding']),
      phone: serializer.fromJson<String?>(json['phone']),
      address: serializer.fromJson<String?>(json['address']),
      building: serializer.fromJson<String?>(json['building']),
      floor: serializer.fromJson<String?>(json['floor']),
      cableName: serializer.fromJson<String?>(json['cableName']),
      boxId: serializer.fromJson<String?>(json['boxId']),
      boxName: serializer.fromJson<String?>(json['boxName']),
      ampereScheduleId: serializer.fromJson<String?>(json['ampereScheduleId']),
      ampereScheduleName: serializer.fromJson<String?>(
        json['ampereScheduleName'],
      ),
      areaName: serializer.fromJson<String?>(json['areaName']),
      areaId: serializer.fromJson<String?>(json['areaId']),
      customerType: serializer.fromJson<String>(json['customerType']),
      customerRelation: serializer.fromJson<String?>(json['customerRelation']),
      subscriptionDate: serializer.fromJson<DateTime>(json['subscriptionDate']),
      priceOverride: serializer.fromJson<double?>(json['priceOverride']),
      fixedChargeOverride: serializer.fromJson<double?>(
        json['fixedChargeOverride'],
      ),
      tvaOverride: serializer.fromJson<double?>(json['tvaOverride']),
      hasPricingOverride: serializer.fromJson<bool>(json['hasPricingOverride']),
      customerStatus: serializer.fromJson<String>(json['customerStatus']),
      plan: serializer.fromJson<String>(json['plan']),
      planValue: serializer.fromJson<double>(json['planValue']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'name': serializer.toJson<String>(name),
      'totalBilled': serializer.toJson<double?>(totalBilled),
      'totalPaid': serializer.toJson<double?>(totalPaid),
      'totalOutstanding': serializer.toJson<double?>(totalOutstanding),
      'phone': serializer.toJson<String?>(phone),
      'address': serializer.toJson<String?>(address),
      'building': serializer.toJson<String?>(building),
      'floor': serializer.toJson<String?>(floor),
      'cableName': serializer.toJson<String?>(cableName),
      'boxId': serializer.toJson<String?>(boxId),
      'boxName': serializer.toJson<String?>(boxName),
      'ampereScheduleId': serializer.toJson<String?>(ampereScheduleId),
      'ampereScheduleName': serializer.toJson<String?>(ampereScheduleName),
      'areaName': serializer.toJson<String?>(areaName),
      'areaId': serializer.toJson<String?>(areaId),
      'customerType': serializer.toJson<String>(customerType),
      'customerRelation': serializer.toJson<String?>(customerRelation),
      'subscriptionDate': serializer.toJson<DateTime>(subscriptionDate),
      'priceOverride': serializer.toJson<double?>(priceOverride),
      'fixedChargeOverride': serializer.toJson<double?>(fixedChargeOverride),
      'tvaOverride': serializer.toJson<double?>(tvaOverride),
      'hasPricingOverride': serializer.toJson<bool>(hasPricingOverride),
      'customerStatus': serializer.toJson<String>(customerStatus),
      'plan': serializer.toJson<String>(plan),
      'planValue': serializer.toJson<double>(planValue),
    };
  }

  Customer copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? name,
    Value<double?> totalBilled = const Value.absent(),
    Value<double?> totalPaid = const Value.absent(),
    Value<double?> totalOutstanding = const Value.absent(),
    Value<String?> phone = const Value.absent(),
    Value<String?> address = const Value.absent(),
    Value<String?> building = const Value.absent(),
    Value<String?> floor = const Value.absent(),
    Value<String?> cableName = const Value.absent(),
    Value<String?> boxId = const Value.absent(),
    Value<String?> boxName = const Value.absent(),
    Value<String?> ampereScheduleId = const Value.absent(),
    Value<String?> ampereScheduleName = const Value.absent(),
    Value<String?> areaName = const Value.absent(),
    Value<String?> areaId = const Value.absent(),
    String? customerType,
    Value<String?> customerRelation = const Value.absent(),
    DateTime? subscriptionDate,
    Value<double?> priceOverride = const Value.absent(),
    Value<double?> fixedChargeOverride = const Value.absent(),
    Value<double?> tvaOverride = const Value.absent(),
    bool? hasPricingOverride,
    String? customerStatus,
    String? plan,
    double? planValue,
  }) => Customer(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    name: name ?? this.name,
    totalBilled: totalBilled.present ? totalBilled.value : this.totalBilled,
    totalPaid: totalPaid.present ? totalPaid.value : this.totalPaid,
    totalOutstanding: totalOutstanding.present
        ? totalOutstanding.value
        : this.totalOutstanding,
    phone: phone.present ? phone.value : this.phone,
    address: address.present ? address.value : this.address,
    building: building.present ? building.value : this.building,
    floor: floor.present ? floor.value : this.floor,
    cableName: cableName.present ? cableName.value : this.cableName,
    boxId: boxId.present ? boxId.value : this.boxId,
    boxName: boxName.present ? boxName.value : this.boxName,
    ampereScheduleId: ampereScheduleId.present
        ? ampereScheduleId.value
        : this.ampereScheduleId,
    ampereScheduleName: ampereScheduleName.present
        ? ampereScheduleName.value
        : this.ampereScheduleName,
    areaName: areaName.present ? areaName.value : this.areaName,
    areaId: areaId.present ? areaId.value : this.areaId,
    customerType: customerType ?? this.customerType,
    customerRelation: customerRelation.present
        ? customerRelation.value
        : this.customerRelation,
    subscriptionDate: subscriptionDate ?? this.subscriptionDate,
    priceOverride: priceOverride.present
        ? priceOverride.value
        : this.priceOverride,
    fixedChargeOverride: fixedChargeOverride.present
        ? fixedChargeOverride.value
        : this.fixedChargeOverride,
    tvaOverride: tvaOverride.present ? tvaOverride.value : this.tvaOverride,
    hasPricingOverride: hasPricingOverride ?? this.hasPricingOverride,
    customerStatus: customerStatus ?? this.customerStatus,
    plan: plan ?? this.plan,
    planValue: planValue ?? this.planValue,
  );
  Customer copyWithCompanion(CustomersCompanion data) {
    return Customer(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      name: data.name.present ? data.name.value : this.name,
      totalBilled: data.totalBilled.present
          ? data.totalBilled.value
          : this.totalBilled,
      totalPaid: data.totalPaid.present ? data.totalPaid.value : this.totalPaid,
      totalOutstanding: data.totalOutstanding.present
          ? data.totalOutstanding.value
          : this.totalOutstanding,
      phone: data.phone.present ? data.phone.value : this.phone,
      address: data.address.present ? data.address.value : this.address,
      building: data.building.present ? data.building.value : this.building,
      floor: data.floor.present ? data.floor.value : this.floor,
      cableName: data.cableName.present ? data.cableName.value : this.cableName,
      boxId: data.boxId.present ? data.boxId.value : this.boxId,
      boxName: data.boxName.present ? data.boxName.value : this.boxName,
      ampereScheduleId: data.ampereScheduleId.present
          ? data.ampereScheduleId.value
          : this.ampereScheduleId,
      ampereScheduleName: data.ampereScheduleName.present
          ? data.ampereScheduleName.value
          : this.ampereScheduleName,
      areaName: data.areaName.present ? data.areaName.value : this.areaName,
      areaId: data.areaId.present ? data.areaId.value : this.areaId,
      customerType: data.customerType.present
          ? data.customerType.value
          : this.customerType,
      customerRelation: data.customerRelation.present
          ? data.customerRelation.value
          : this.customerRelation,
      subscriptionDate: data.subscriptionDate.present
          ? data.subscriptionDate.value
          : this.subscriptionDate,
      priceOverride: data.priceOverride.present
          ? data.priceOverride.value
          : this.priceOverride,
      fixedChargeOverride: data.fixedChargeOverride.present
          ? data.fixedChargeOverride.value
          : this.fixedChargeOverride,
      tvaOverride: data.tvaOverride.present
          ? data.tvaOverride.value
          : this.tvaOverride,
      hasPricingOverride: data.hasPricingOverride.present
          ? data.hasPricingOverride.value
          : this.hasPricingOverride,
      customerStatus: data.customerStatus.present
          ? data.customerStatus.value
          : this.customerStatus,
      plan: data.plan.present ? data.plan.value : this.plan,
      planValue: data.planValue.present ? data.planValue.value : this.planValue,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Customer(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('name: $name, ')
          ..write('totalBilled: $totalBilled, ')
          ..write('totalPaid: $totalPaid, ')
          ..write('totalOutstanding: $totalOutstanding, ')
          ..write('phone: $phone, ')
          ..write('address: $address, ')
          ..write('building: $building, ')
          ..write('floor: $floor, ')
          ..write('cableName: $cableName, ')
          ..write('boxId: $boxId, ')
          ..write('boxName: $boxName, ')
          ..write('ampereScheduleId: $ampereScheduleId, ')
          ..write('ampereScheduleName: $ampereScheduleName, ')
          ..write('areaName: $areaName, ')
          ..write('areaId: $areaId, ')
          ..write('customerType: $customerType, ')
          ..write('customerRelation: $customerRelation, ')
          ..write('subscriptionDate: $subscriptionDate, ')
          ..write('priceOverride: $priceOverride, ')
          ..write('fixedChargeOverride: $fixedChargeOverride, ')
          ..write('tvaOverride: $tvaOverride, ')
          ..write('hasPricingOverride: $hasPricingOverride, ')
          ..write('customerStatus: $customerStatus, ')
          ..write('plan: $plan, ')
          ..write('planValue: $planValue')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    createdAt,
    updatedAt,
    name,
    totalBilled,
    totalPaid,
    totalOutstanding,
    phone,
    address,
    building,
    floor,
    cableName,
    boxId,
    boxName,
    ampereScheduleId,
    ampereScheduleName,
    areaName,
    areaId,
    customerType,
    customerRelation,
    subscriptionDate,
    priceOverride,
    fixedChargeOverride,
    tvaOverride,
    hasPricingOverride,
    customerStatus,
    plan,
    planValue,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Customer &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.name == this.name &&
          other.totalBilled == this.totalBilled &&
          other.totalPaid == this.totalPaid &&
          other.totalOutstanding == this.totalOutstanding &&
          other.phone == this.phone &&
          other.address == this.address &&
          other.building == this.building &&
          other.floor == this.floor &&
          other.cableName == this.cableName &&
          other.boxId == this.boxId &&
          other.boxName == this.boxName &&
          other.ampereScheduleId == this.ampereScheduleId &&
          other.ampereScheduleName == this.ampereScheduleName &&
          other.areaName == this.areaName &&
          other.areaId == this.areaId &&
          other.customerType == this.customerType &&
          other.customerRelation == this.customerRelation &&
          other.subscriptionDate == this.subscriptionDate &&
          other.priceOverride == this.priceOverride &&
          other.fixedChargeOverride == this.fixedChargeOverride &&
          other.tvaOverride == this.tvaOverride &&
          other.hasPricingOverride == this.hasPricingOverride &&
          other.customerStatus == this.customerStatus &&
          other.plan == this.plan &&
          other.planValue == this.planValue);
}

class CustomersCompanion extends UpdateCompanion<Customer> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<String> name;
  final Value<double?> totalBilled;
  final Value<double?> totalPaid;
  final Value<double?> totalOutstanding;
  final Value<String?> phone;
  final Value<String?> address;
  final Value<String?> building;
  final Value<String?> floor;
  final Value<String?> cableName;
  final Value<String?> boxId;
  final Value<String?> boxName;
  final Value<String?> ampereScheduleId;
  final Value<String?> ampereScheduleName;
  final Value<String?> areaName;
  final Value<String?> areaId;
  final Value<String> customerType;
  final Value<String?> customerRelation;
  final Value<DateTime> subscriptionDate;
  final Value<double?> priceOverride;
  final Value<double?> fixedChargeOverride;
  final Value<double?> tvaOverride;
  final Value<bool> hasPricingOverride;
  final Value<String> customerStatus;
  final Value<String> plan;
  final Value<double> planValue;
  final Value<int> rowid;
  const CustomersCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.name = const Value.absent(),
    this.totalBilled = const Value.absent(),
    this.totalPaid = const Value.absent(),
    this.totalOutstanding = const Value.absent(),
    this.phone = const Value.absent(),
    this.address = const Value.absent(),
    this.building = const Value.absent(),
    this.floor = const Value.absent(),
    this.cableName = const Value.absent(),
    this.boxId = const Value.absent(),
    this.boxName = const Value.absent(),
    this.ampereScheduleId = const Value.absent(),
    this.ampereScheduleName = const Value.absent(),
    this.areaName = const Value.absent(),
    this.areaId = const Value.absent(),
    this.customerType = const Value.absent(),
    this.customerRelation = const Value.absent(),
    this.subscriptionDate = const Value.absent(),
    this.priceOverride = const Value.absent(),
    this.fixedChargeOverride = const Value.absent(),
    this.tvaOverride = const Value.absent(),
    this.hasPricingOverride = const Value.absent(),
    this.customerStatus = const Value.absent(),
    this.plan = const Value.absent(),
    this.planValue = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CustomersCompanion.insert({
    required String id,
    required DateTime createdAt,
    required DateTime updatedAt,
    required String name,
    this.totalBilled = const Value.absent(),
    this.totalPaid = const Value.absent(),
    this.totalOutstanding = const Value.absent(),
    this.phone = const Value.absent(),
    this.address = const Value.absent(),
    this.building = const Value.absent(),
    this.floor = const Value.absent(),
    this.cableName = const Value.absent(),
    this.boxId = const Value.absent(),
    this.boxName = const Value.absent(),
    this.ampereScheduleId = const Value.absent(),
    this.ampereScheduleName = const Value.absent(),
    this.areaName = const Value.absent(),
    this.areaId = const Value.absent(),
    required String customerType,
    this.customerRelation = const Value.absent(),
    required DateTime subscriptionDate,
    this.priceOverride = const Value.absent(),
    this.fixedChargeOverride = const Value.absent(),
    this.tvaOverride = const Value.absent(),
    this.hasPricingOverride = const Value.absent(),
    this.customerStatus = const Value.absent(),
    required String plan,
    required double planValue,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt),
       name = Value(name),
       customerType = Value(customerType),
       subscriptionDate = Value(subscriptionDate),
       plan = Value(plan),
       planValue = Value(planValue);
  static Insertable<Customer> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? name,
    Expression<double>? totalBilled,
    Expression<double>? totalPaid,
    Expression<double>? totalOutstanding,
    Expression<String>? phone,
    Expression<String>? address,
    Expression<String>? building,
    Expression<String>? floor,
    Expression<String>? cableName,
    Expression<String>? boxId,
    Expression<String>? boxName,
    Expression<String>? ampereScheduleId,
    Expression<String>? ampereScheduleName,
    Expression<String>? areaName,
    Expression<String>? areaId,
    Expression<String>? customerType,
    Expression<String>? customerRelation,
    Expression<DateTime>? subscriptionDate,
    Expression<double>? priceOverride,
    Expression<double>? fixedChargeOverride,
    Expression<double>? tvaOverride,
    Expression<bool>? hasPricingOverride,
    Expression<String>? customerStatus,
    Expression<String>? plan,
    Expression<double>? planValue,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (name != null) 'name': name,
      if (totalBilled != null) 'total_billed': totalBilled,
      if (totalPaid != null) 'total_paid': totalPaid,
      if (totalOutstanding != null) 'total_outstanding': totalOutstanding,
      if (phone != null) 'phone': phone,
      if (address != null) 'address': address,
      if (building != null) 'building': building,
      if (floor != null) 'floor': floor,
      if (cableName != null) 'cable_name': cableName,
      if (boxId != null) 'box_id': boxId,
      if (boxName != null) 'box_name': boxName,
      if (ampereScheduleId != null) 'ampere_schedule_id': ampereScheduleId,
      if (ampereScheduleName != null)
        'ampere_schedule_name': ampereScheduleName,
      if (areaName != null) 'area_name': areaName,
      if (areaId != null) 'area_id': areaId,
      if (customerType != null) 'customer_type': customerType,
      if (customerRelation != null) 'customer_relation': customerRelation,
      if (subscriptionDate != null) 'subscription_date': subscriptionDate,
      if (priceOverride != null) 'price_override': priceOverride,
      if (fixedChargeOverride != null)
        'fixed_charge_override': fixedChargeOverride,
      if (tvaOverride != null) 'tva_override': tvaOverride,
      if (hasPricingOverride != null)
        'has_pricing_override': hasPricingOverride,
      if (customerStatus != null) 'customer_status': customerStatus,
      if (plan != null) 'plan': plan,
      if (planValue != null) 'plan_value': planValue,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CustomersCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<String>? name,
    Value<double?>? totalBilled,
    Value<double?>? totalPaid,
    Value<double?>? totalOutstanding,
    Value<String?>? phone,
    Value<String?>? address,
    Value<String?>? building,
    Value<String?>? floor,
    Value<String?>? cableName,
    Value<String?>? boxId,
    Value<String?>? boxName,
    Value<String?>? ampereScheduleId,
    Value<String?>? ampereScheduleName,
    Value<String?>? areaName,
    Value<String?>? areaId,
    Value<String>? customerType,
    Value<String?>? customerRelation,
    Value<DateTime>? subscriptionDate,
    Value<double?>? priceOverride,
    Value<double?>? fixedChargeOverride,
    Value<double?>? tvaOverride,
    Value<bool>? hasPricingOverride,
    Value<String>? customerStatus,
    Value<String>? plan,
    Value<double>? planValue,
    Value<int>? rowid,
  }) {
    return CustomersCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      name: name ?? this.name,
      totalBilled: totalBilled ?? this.totalBilled,
      totalPaid: totalPaid ?? this.totalPaid,
      totalOutstanding: totalOutstanding ?? this.totalOutstanding,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      building: building ?? this.building,
      floor: floor ?? this.floor,
      cableName: cableName ?? this.cableName,
      boxId: boxId ?? this.boxId,
      boxName: boxName ?? this.boxName,
      ampereScheduleId: ampereScheduleId ?? this.ampereScheduleId,
      ampereScheduleName: ampereScheduleName ?? this.ampereScheduleName,
      areaName: areaName ?? this.areaName,
      areaId: areaId ?? this.areaId,
      customerType: customerType ?? this.customerType,
      customerRelation: customerRelation ?? this.customerRelation,
      subscriptionDate: subscriptionDate ?? this.subscriptionDate,
      priceOverride: priceOverride ?? this.priceOverride,
      fixedChargeOverride: fixedChargeOverride ?? this.fixedChargeOverride,
      tvaOverride: tvaOverride ?? this.tvaOverride,
      hasPricingOverride: hasPricingOverride ?? this.hasPricingOverride,
      customerStatus: customerStatus ?? this.customerStatus,
      plan: plan ?? this.plan,
      planValue: planValue ?? this.planValue,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (totalBilled.present) {
      map['total_billed'] = Variable<double>(totalBilled.value);
    }
    if (totalPaid.present) {
      map['total_paid'] = Variable<double>(totalPaid.value);
    }
    if (totalOutstanding.present) {
      map['total_outstanding'] = Variable<double>(totalOutstanding.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (building.present) {
      map['building'] = Variable<String>(building.value);
    }
    if (floor.present) {
      map['floor'] = Variable<String>(floor.value);
    }
    if (cableName.present) {
      map['cable_name'] = Variable<String>(cableName.value);
    }
    if (boxId.present) {
      map['box_id'] = Variable<String>(boxId.value);
    }
    if (boxName.present) {
      map['box_name'] = Variable<String>(boxName.value);
    }
    if (ampereScheduleId.present) {
      map['ampere_schedule_id'] = Variable<String>(ampereScheduleId.value);
    }
    if (ampereScheduleName.present) {
      map['ampere_schedule_name'] = Variable<String>(ampereScheduleName.value);
    }
    if (areaName.present) {
      map['area_name'] = Variable<String>(areaName.value);
    }
    if (areaId.present) {
      map['area_id'] = Variable<String>(areaId.value);
    }
    if (customerType.present) {
      map['customer_type'] = Variable<String>(customerType.value);
    }
    if (customerRelation.present) {
      map['customer_relation'] = Variable<String>(customerRelation.value);
    }
    if (subscriptionDate.present) {
      map['subscription_date'] = Variable<DateTime>(subscriptionDate.value);
    }
    if (priceOverride.present) {
      map['price_override'] = Variable<double>(priceOverride.value);
    }
    if (fixedChargeOverride.present) {
      map['fixed_charge_override'] = Variable<double>(
        fixedChargeOverride.value,
      );
    }
    if (tvaOverride.present) {
      map['tva_override'] = Variable<double>(tvaOverride.value);
    }
    if (hasPricingOverride.present) {
      map['has_pricing_override'] = Variable<bool>(hasPricingOverride.value);
    }
    if (customerStatus.present) {
      map['customer_status'] = Variable<String>(customerStatus.value);
    }
    if (plan.present) {
      map['plan'] = Variable<String>(plan.value);
    }
    if (planValue.present) {
      map['plan_value'] = Variable<double>(planValue.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CustomersCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('name: $name, ')
          ..write('totalBilled: $totalBilled, ')
          ..write('totalPaid: $totalPaid, ')
          ..write('totalOutstanding: $totalOutstanding, ')
          ..write('phone: $phone, ')
          ..write('address: $address, ')
          ..write('building: $building, ')
          ..write('floor: $floor, ')
          ..write('cableName: $cableName, ')
          ..write('boxId: $boxId, ')
          ..write('boxName: $boxName, ')
          ..write('ampereScheduleId: $ampereScheduleId, ')
          ..write('ampereScheduleName: $ampereScheduleName, ')
          ..write('areaName: $areaName, ')
          ..write('areaId: $areaId, ')
          ..write('customerType: $customerType, ')
          ..write('customerRelation: $customerRelation, ')
          ..write('subscriptionDate: $subscriptionDate, ')
          ..write('priceOverride: $priceOverride, ')
          ..write('fixedChargeOverride: $fixedChargeOverride, ')
          ..write('tvaOverride: $tvaOverride, ')
          ..write('hasPricingOverride: $hasPricingOverride, ')
          ..write('customerStatus: $customerStatus, ')
          ..write('plan: $plan, ')
          ..write('planValue: $planValue, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $InvoicesTable extends Invoices with TableInfo<$InvoicesTable, Invoice> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InvoicesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _customerIdMeta = const VerificationMeta(
    'customerId',
  );
  @override
  late final GeneratedColumn<String> customerId = GeneratedColumn<String>(
    'customer_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES customers (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _customerNameMeta = const VerificationMeta(
    'customerName',
  );
  @override
  late final GeneratedColumn<String> customerName = GeneratedColumn<String>(
    'customer_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _invoiceNumberMeta = const VerificationMeta(
    'invoiceNumber',
  );
  @override
  late final GeneratedColumn<int> invoiceNumber = GeneratedColumn<int>(
    'invoice_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _issueDateMeta = const VerificationMeta(
    'issueDate',
  );
  @override
  late final GeneratedColumn<DateTime> issueDate = GeneratedColumn<DateTime>(
    'issue_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dueDateMeta = const VerificationMeta(
    'dueDate',
  );
  @override
  late final GeneratedColumn<DateTime> dueDate = GeneratedColumn<DateTime>(
    'due_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fixedChargeMeta = const VerificationMeta(
    'fixedCharge',
  );
  @override
  late final GeneratedColumn<double> fixedCharge = GeneratedColumn<double>(
    'fixed_charge',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tvaMeta = const VerificationMeta('tva');
  @override
  late final GeneratedColumn<double> tva = GeneratedColumn<double>(
    'tva',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _totalAmountMeta = const VerificationMeta(
    'totalAmount',
  );
  @override
  late final GeneratedColumn<double> totalAmount = GeneratedColumn<double>(
    'total_amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _paidAmountMeta = const VerificationMeta(
    'paidAmount',
  );
  @override
  late final GeneratedColumn<double> paidAmount = GeneratedColumn<double>(
    'paid_amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _amountDueMeta = const VerificationMeta(
    'amountDue',
  );
  @override
  late final GeneratedColumn<double> amountDue = GeneratedColumn<double>(
    'amount_due',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _billedConsumptionMeta = const VerificationMeta(
    'billedConsumption',
  );
  @override
  late final GeneratedColumn<double> billedConsumption =
      GeneratedColumn<double>(
        'billed_consumption',
        aliasedName,
        true,
        type: DriftSqlType.double,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _invoiceStatusMeta = const VerificationMeta(
    'invoiceStatus',
  );
  @override
  late final GeneratedColumn<String> invoiceStatus = GeneratedColumn<String>(
    'invoice_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('unpaid'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    createdAt,
    updatedAt,
    customerId,
    customerName,
    invoiceNumber,
    issueDate,
    dueDate,
    fixedCharge,
    tva,
    totalAmount,
    paidAmount,
    amountDue,
    billedConsumption,
    invoiceStatus,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'invoices';
  @override
  VerificationContext validateIntegrity(
    Insertable<Invoice> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('customer_id')) {
      context.handle(
        _customerIdMeta,
        customerId.isAcceptableOrUnknown(data['customer_id']!, _customerIdMeta),
      );
    } else if (isInserting) {
      context.missing(_customerIdMeta);
    }
    if (data.containsKey('customer_name')) {
      context.handle(
        _customerNameMeta,
        customerName.isAcceptableOrUnknown(
          data['customer_name']!,
          _customerNameMeta,
        ),
      );
    }
    if (data.containsKey('invoice_number')) {
      context.handle(
        _invoiceNumberMeta,
        invoiceNumber.isAcceptableOrUnknown(
          data['invoice_number']!,
          _invoiceNumberMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_invoiceNumberMeta);
    }
    if (data.containsKey('issue_date')) {
      context.handle(
        _issueDateMeta,
        issueDate.isAcceptableOrUnknown(data['issue_date']!, _issueDateMeta),
      );
    } else if (isInserting) {
      context.missing(_issueDateMeta);
    }
    if (data.containsKey('due_date')) {
      context.handle(
        _dueDateMeta,
        dueDate.isAcceptableOrUnknown(data['due_date']!, _dueDateMeta),
      );
    } else if (isInserting) {
      context.missing(_dueDateMeta);
    }
    if (data.containsKey('fixed_charge')) {
      context.handle(
        _fixedChargeMeta,
        fixedCharge.isAcceptableOrUnknown(
          data['fixed_charge']!,
          _fixedChargeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_fixedChargeMeta);
    }
    if (data.containsKey('tva')) {
      context.handle(
        _tvaMeta,
        tva.isAcceptableOrUnknown(data['tva']!, _tvaMeta),
      );
    } else if (isInserting) {
      context.missing(_tvaMeta);
    }
    if (data.containsKey('total_amount')) {
      context.handle(
        _totalAmountMeta,
        totalAmount.isAcceptableOrUnknown(
          data['total_amount']!,
          _totalAmountMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_totalAmountMeta);
    }
    if (data.containsKey('paid_amount')) {
      context.handle(
        _paidAmountMeta,
        paidAmount.isAcceptableOrUnknown(data['paid_amount']!, _paidAmountMeta),
      );
    } else if (isInserting) {
      context.missing(_paidAmountMeta);
    }
    if (data.containsKey('amount_due')) {
      context.handle(
        _amountDueMeta,
        amountDue.isAcceptableOrUnknown(data['amount_due']!, _amountDueMeta),
      );
    } else if (isInserting) {
      context.missing(_amountDueMeta);
    }
    if (data.containsKey('billed_consumption')) {
      context.handle(
        _billedConsumptionMeta,
        billedConsumption.isAcceptableOrUnknown(
          data['billed_consumption']!,
          _billedConsumptionMeta,
        ),
      );
    }
    if (data.containsKey('invoice_status')) {
      context.handle(
        _invoiceStatusMeta,
        invoiceStatus.isAcceptableOrUnknown(
          data['invoice_status']!,
          _invoiceStatusMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Invoice map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Invoice(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      customerId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}customer_id'],
      )!,
      customerName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}customer_name'],
      ),
      invoiceNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}invoice_number'],
      )!,
      issueDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}issue_date'],
      )!,
      dueDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}due_date'],
      )!,
      fixedCharge: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}fixed_charge'],
      )!,
      tva: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}tva'],
      )!,
      totalAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}total_amount'],
      )!,
      paidAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}paid_amount'],
      )!,
      amountDue: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}amount_due'],
      )!,
      billedConsumption: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}billed_consumption'],
      ),
      invoiceStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}invoice_status'],
      )!,
    );
  }

  @override
  $InvoicesTable createAlias(String alias) {
    return $InvoicesTable(attachedDatabase, alias);
  }
}

class Invoice extends DataClass implements Insertable<Invoice> {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String customerId;
  final String? customerName;
  final int invoiceNumber;
  final DateTime issueDate;
  final DateTime dueDate;
  final double fixedCharge;
  final double tva;
  final double totalAmount;
  final double paidAmount;
  final double amountDue;
  final double? billedConsumption;
  final String invoiceStatus;
  const Invoice({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.customerId,
    this.customerName,
    required this.invoiceNumber,
    required this.issueDate,
    required this.dueDate,
    required this.fixedCharge,
    required this.tva,
    required this.totalAmount,
    required this.paidAmount,
    required this.amountDue,
    this.billedConsumption,
    required this.invoiceStatus,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['customer_id'] = Variable<String>(customerId);
    if (!nullToAbsent || customerName != null) {
      map['customer_name'] = Variable<String>(customerName);
    }
    map['invoice_number'] = Variable<int>(invoiceNumber);
    map['issue_date'] = Variable<DateTime>(issueDate);
    map['due_date'] = Variable<DateTime>(dueDate);
    map['fixed_charge'] = Variable<double>(fixedCharge);
    map['tva'] = Variable<double>(tva);
    map['total_amount'] = Variable<double>(totalAmount);
    map['paid_amount'] = Variable<double>(paidAmount);
    map['amount_due'] = Variable<double>(amountDue);
    if (!nullToAbsent || billedConsumption != null) {
      map['billed_consumption'] = Variable<double>(billedConsumption);
    }
    map['invoice_status'] = Variable<String>(invoiceStatus);
    return map;
  }

  InvoicesCompanion toCompanion(bool nullToAbsent) {
    return InvoicesCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      customerId: Value(customerId),
      customerName: customerName == null && nullToAbsent
          ? const Value.absent()
          : Value(customerName),
      invoiceNumber: Value(invoiceNumber),
      issueDate: Value(issueDate),
      dueDate: Value(dueDate),
      fixedCharge: Value(fixedCharge),
      tva: Value(tva),
      totalAmount: Value(totalAmount),
      paidAmount: Value(paidAmount),
      amountDue: Value(amountDue),
      billedConsumption: billedConsumption == null && nullToAbsent
          ? const Value.absent()
          : Value(billedConsumption),
      invoiceStatus: Value(invoiceStatus),
    );
  }

  factory Invoice.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Invoice(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      customerId: serializer.fromJson<String>(json['customerId']),
      customerName: serializer.fromJson<String?>(json['customerName']),
      invoiceNumber: serializer.fromJson<int>(json['invoiceNumber']),
      issueDate: serializer.fromJson<DateTime>(json['issueDate']),
      dueDate: serializer.fromJson<DateTime>(json['dueDate']),
      fixedCharge: serializer.fromJson<double>(json['fixedCharge']),
      tva: serializer.fromJson<double>(json['tva']),
      totalAmount: serializer.fromJson<double>(json['totalAmount']),
      paidAmount: serializer.fromJson<double>(json['paidAmount']),
      amountDue: serializer.fromJson<double>(json['amountDue']),
      billedConsumption: serializer.fromJson<double?>(
        json['billedConsumption'],
      ),
      invoiceStatus: serializer.fromJson<String>(json['invoiceStatus']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'customerId': serializer.toJson<String>(customerId),
      'customerName': serializer.toJson<String?>(customerName),
      'invoiceNumber': serializer.toJson<int>(invoiceNumber),
      'issueDate': serializer.toJson<DateTime>(issueDate),
      'dueDate': serializer.toJson<DateTime>(dueDate),
      'fixedCharge': serializer.toJson<double>(fixedCharge),
      'tva': serializer.toJson<double>(tva),
      'totalAmount': serializer.toJson<double>(totalAmount),
      'paidAmount': serializer.toJson<double>(paidAmount),
      'amountDue': serializer.toJson<double>(amountDue),
      'billedConsumption': serializer.toJson<double?>(billedConsumption),
      'invoiceStatus': serializer.toJson<String>(invoiceStatus),
    };
  }

  Invoice copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? customerId,
    Value<String?> customerName = const Value.absent(),
    int? invoiceNumber,
    DateTime? issueDate,
    DateTime? dueDate,
    double? fixedCharge,
    double? tva,
    double? totalAmount,
    double? paidAmount,
    double? amountDue,
    Value<double?> billedConsumption = const Value.absent(),
    String? invoiceStatus,
  }) => Invoice(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    customerId: customerId ?? this.customerId,
    customerName: customerName.present ? customerName.value : this.customerName,
    invoiceNumber: invoiceNumber ?? this.invoiceNumber,
    issueDate: issueDate ?? this.issueDate,
    dueDate: dueDate ?? this.dueDate,
    fixedCharge: fixedCharge ?? this.fixedCharge,
    tva: tva ?? this.tva,
    totalAmount: totalAmount ?? this.totalAmount,
    paidAmount: paidAmount ?? this.paidAmount,
    amountDue: amountDue ?? this.amountDue,
    billedConsumption: billedConsumption.present
        ? billedConsumption.value
        : this.billedConsumption,
    invoiceStatus: invoiceStatus ?? this.invoiceStatus,
  );
  Invoice copyWithCompanion(InvoicesCompanion data) {
    return Invoice(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      customerId: data.customerId.present
          ? data.customerId.value
          : this.customerId,
      customerName: data.customerName.present
          ? data.customerName.value
          : this.customerName,
      invoiceNumber: data.invoiceNumber.present
          ? data.invoiceNumber.value
          : this.invoiceNumber,
      issueDate: data.issueDate.present ? data.issueDate.value : this.issueDate,
      dueDate: data.dueDate.present ? data.dueDate.value : this.dueDate,
      fixedCharge: data.fixedCharge.present
          ? data.fixedCharge.value
          : this.fixedCharge,
      tva: data.tva.present ? data.tva.value : this.tva,
      totalAmount: data.totalAmount.present
          ? data.totalAmount.value
          : this.totalAmount,
      paidAmount: data.paidAmount.present
          ? data.paidAmount.value
          : this.paidAmount,
      amountDue: data.amountDue.present ? data.amountDue.value : this.amountDue,
      billedConsumption: data.billedConsumption.present
          ? data.billedConsumption.value
          : this.billedConsumption,
      invoiceStatus: data.invoiceStatus.present
          ? data.invoiceStatus.value
          : this.invoiceStatus,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Invoice(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('customerId: $customerId, ')
          ..write('customerName: $customerName, ')
          ..write('invoiceNumber: $invoiceNumber, ')
          ..write('issueDate: $issueDate, ')
          ..write('dueDate: $dueDate, ')
          ..write('fixedCharge: $fixedCharge, ')
          ..write('tva: $tva, ')
          ..write('totalAmount: $totalAmount, ')
          ..write('paidAmount: $paidAmount, ')
          ..write('amountDue: $amountDue, ')
          ..write('billedConsumption: $billedConsumption, ')
          ..write('invoiceStatus: $invoiceStatus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    createdAt,
    updatedAt,
    customerId,
    customerName,
    invoiceNumber,
    issueDate,
    dueDate,
    fixedCharge,
    tva,
    totalAmount,
    paidAmount,
    amountDue,
    billedConsumption,
    invoiceStatus,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Invoice &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.customerId == this.customerId &&
          other.customerName == this.customerName &&
          other.invoiceNumber == this.invoiceNumber &&
          other.issueDate == this.issueDate &&
          other.dueDate == this.dueDate &&
          other.fixedCharge == this.fixedCharge &&
          other.tva == this.tva &&
          other.totalAmount == this.totalAmount &&
          other.paidAmount == this.paidAmount &&
          other.amountDue == this.amountDue &&
          other.billedConsumption == this.billedConsumption &&
          other.invoiceStatus == this.invoiceStatus);
}

class InvoicesCompanion extends UpdateCompanion<Invoice> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<String> customerId;
  final Value<String?> customerName;
  final Value<int> invoiceNumber;
  final Value<DateTime> issueDate;
  final Value<DateTime> dueDate;
  final Value<double> fixedCharge;
  final Value<double> tva;
  final Value<double> totalAmount;
  final Value<double> paidAmount;
  final Value<double> amountDue;
  final Value<double?> billedConsumption;
  final Value<String> invoiceStatus;
  final Value<int> rowid;
  const InvoicesCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.customerId = const Value.absent(),
    this.customerName = const Value.absent(),
    this.invoiceNumber = const Value.absent(),
    this.issueDate = const Value.absent(),
    this.dueDate = const Value.absent(),
    this.fixedCharge = const Value.absent(),
    this.tva = const Value.absent(),
    this.totalAmount = const Value.absent(),
    this.paidAmount = const Value.absent(),
    this.amountDue = const Value.absent(),
    this.billedConsumption = const Value.absent(),
    this.invoiceStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  InvoicesCompanion.insert({
    required String id,
    required DateTime createdAt,
    required DateTime updatedAt,
    required String customerId,
    this.customerName = const Value.absent(),
    required int invoiceNumber,
    required DateTime issueDate,
    required DateTime dueDate,
    required double fixedCharge,
    required double tva,
    required double totalAmount,
    required double paidAmount,
    required double amountDue,
    this.billedConsumption = const Value.absent(),
    this.invoiceStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt),
       customerId = Value(customerId),
       invoiceNumber = Value(invoiceNumber),
       issueDate = Value(issueDate),
       dueDate = Value(dueDate),
       fixedCharge = Value(fixedCharge),
       tva = Value(tva),
       totalAmount = Value(totalAmount),
       paidAmount = Value(paidAmount),
       amountDue = Value(amountDue);
  static Insertable<Invoice> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? customerId,
    Expression<String>? customerName,
    Expression<int>? invoiceNumber,
    Expression<DateTime>? issueDate,
    Expression<DateTime>? dueDate,
    Expression<double>? fixedCharge,
    Expression<double>? tva,
    Expression<double>? totalAmount,
    Expression<double>? paidAmount,
    Expression<double>? amountDue,
    Expression<double>? billedConsumption,
    Expression<String>? invoiceStatus,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (customerId != null) 'customer_id': customerId,
      if (customerName != null) 'customer_name': customerName,
      if (invoiceNumber != null) 'invoice_number': invoiceNumber,
      if (issueDate != null) 'issue_date': issueDate,
      if (dueDate != null) 'due_date': dueDate,
      if (fixedCharge != null) 'fixed_charge': fixedCharge,
      if (tva != null) 'tva': tva,
      if (totalAmount != null) 'total_amount': totalAmount,
      if (paidAmount != null) 'paid_amount': paidAmount,
      if (amountDue != null) 'amount_due': amountDue,
      if (billedConsumption != null) 'billed_consumption': billedConsumption,
      if (invoiceStatus != null) 'invoice_status': invoiceStatus,
      if (rowid != null) 'rowid': rowid,
    });
  }

  InvoicesCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<String>? customerId,
    Value<String?>? customerName,
    Value<int>? invoiceNumber,
    Value<DateTime>? issueDate,
    Value<DateTime>? dueDate,
    Value<double>? fixedCharge,
    Value<double>? tva,
    Value<double>? totalAmount,
    Value<double>? paidAmount,
    Value<double>? amountDue,
    Value<double?>? billedConsumption,
    Value<String>? invoiceStatus,
    Value<int>? rowid,
  }) {
    return InvoicesCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      customerId: customerId ?? this.customerId,
      customerName: customerName ?? this.customerName,
      invoiceNumber: invoiceNumber ?? this.invoiceNumber,
      issueDate: issueDate ?? this.issueDate,
      dueDate: dueDate ?? this.dueDate,
      fixedCharge: fixedCharge ?? this.fixedCharge,
      tva: tva ?? this.tva,
      totalAmount: totalAmount ?? this.totalAmount,
      paidAmount: paidAmount ?? this.paidAmount,
      amountDue: amountDue ?? this.amountDue,
      billedConsumption: billedConsumption ?? this.billedConsumption,
      invoiceStatus: invoiceStatus ?? this.invoiceStatus,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (customerId.present) {
      map['customer_id'] = Variable<String>(customerId.value);
    }
    if (customerName.present) {
      map['customer_name'] = Variable<String>(customerName.value);
    }
    if (invoiceNumber.present) {
      map['invoice_number'] = Variable<int>(invoiceNumber.value);
    }
    if (issueDate.present) {
      map['issue_date'] = Variable<DateTime>(issueDate.value);
    }
    if (dueDate.present) {
      map['due_date'] = Variable<DateTime>(dueDate.value);
    }
    if (fixedCharge.present) {
      map['fixed_charge'] = Variable<double>(fixedCharge.value);
    }
    if (tva.present) {
      map['tva'] = Variable<double>(tva.value);
    }
    if (totalAmount.present) {
      map['total_amount'] = Variable<double>(totalAmount.value);
    }
    if (paidAmount.present) {
      map['paid_amount'] = Variable<double>(paidAmount.value);
    }
    if (amountDue.present) {
      map['amount_due'] = Variable<double>(amountDue.value);
    }
    if (billedConsumption.present) {
      map['billed_consumption'] = Variable<double>(billedConsumption.value);
    }
    if (invoiceStatus.present) {
      map['invoice_status'] = Variable<String>(invoiceStatus.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InvoicesCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('customerId: $customerId, ')
          ..write('customerName: $customerName, ')
          ..write('invoiceNumber: $invoiceNumber, ')
          ..write('issueDate: $issueDate, ')
          ..write('dueDate: $dueDate, ')
          ..write('fixedCharge: $fixedCharge, ')
          ..write('tva: $tva, ')
          ..write('totalAmount: $totalAmount, ')
          ..write('paidAmount: $paidAmount, ')
          ..write('amountDue: $amountDue, ')
          ..write('billedConsumption: $billedConsumption, ')
          ..write('invoiceStatus: $invoiceStatus, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PaymentsTable extends Payments with TableInfo<$PaymentsTable, Payment> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PaymentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _customerIdMeta = const VerificationMeta(
    'customerId',
  );
  @override
  late final GeneratedColumn<String> customerId = GeneratedColumn<String>(
    'customer_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES customers (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _invoiceIdMeta = const VerificationMeta(
    'invoiceId',
  );
  @override
  late final GeneratedColumn<String> invoiceId = GeneratedColumn<String>(
    'invoice_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES invoices (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _paymentMethodMeta = const VerificationMeta(
    'paymentMethod',
  );
  @override
  late final GeneratedColumn<String> paymentMethod = GeneratedColumn<String>(
    'payment_method',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _paymentDateMeta = const VerificationMeta(
    'paymentDate',
  );
  @override
  late final GeneratedColumn<DateTime> paymentDate = GeneratedColumn<DateTime>(
    'payment_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    createdAt,
    updatedAt,
    customerId,
    invoiceId,
    amount,
    paymentMethod,
    paymentDate,
    notes,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'payments';
  @override
  VerificationContext validateIntegrity(
    Insertable<Payment> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('customer_id')) {
      context.handle(
        _customerIdMeta,
        customerId.isAcceptableOrUnknown(data['customer_id']!, _customerIdMeta),
      );
    } else if (isInserting) {
      context.missing(_customerIdMeta);
    }
    if (data.containsKey('invoice_id')) {
      context.handle(
        _invoiceIdMeta,
        invoiceId.isAcceptableOrUnknown(data['invoice_id']!, _invoiceIdMeta),
      );
    } else if (isInserting) {
      context.missing(_invoiceIdMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('payment_method')) {
      context.handle(
        _paymentMethodMeta,
        paymentMethod.isAcceptableOrUnknown(
          data['payment_method']!,
          _paymentMethodMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_paymentMethodMeta);
    }
    if (data.containsKey('payment_date')) {
      context.handle(
        _paymentDateMeta,
        paymentDate.isAcceptableOrUnknown(
          data['payment_date']!,
          _paymentDateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_paymentDateMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Payment map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Payment(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      customerId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}customer_id'],
      )!,
      invoiceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}invoice_id'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}amount'],
      )!,
      paymentMethod: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payment_method'],
      )!,
      paymentDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}payment_date'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
    );
  }

  @override
  $PaymentsTable createAlias(String alias) {
    return $PaymentsTable(attachedDatabase, alias);
  }
}

class Payment extends DataClass implements Insertable<Payment> {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String customerId;
  final String invoiceId;
  final double amount;
  final String paymentMethod;
  final DateTime paymentDate;
  final String? notes;
  const Payment({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.customerId,
    required this.invoiceId,
    required this.amount,
    required this.paymentMethod,
    required this.paymentDate,
    this.notes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['customer_id'] = Variable<String>(customerId);
    map['invoice_id'] = Variable<String>(invoiceId);
    map['amount'] = Variable<double>(amount);
    map['payment_method'] = Variable<String>(paymentMethod);
    map['payment_date'] = Variable<DateTime>(paymentDate);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  PaymentsCompanion toCompanion(bool nullToAbsent) {
    return PaymentsCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      customerId: Value(customerId),
      invoiceId: Value(invoiceId),
      amount: Value(amount),
      paymentMethod: Value(paymentMethod),
      paymentDate: Value(paymentDate),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
    );
  }

  factory Payment.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Payment(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      customerId: serializer.fromJson<String>(json['customerId']),
      invoiceId: serializer.fromJson<String>(json['invoiceId']),
      amount: serializer.fromJson<double>(json['amount']),
      paymentMethod: serializer.fromJson<String>(json['paymentMethod']),
      paymentDate: serializer.fromJson<DateTime>(json['paymentDate']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'customerId': serializer.toJson<String>(customerId),
      'invoiceId': serializer.toJson<String>(invoiceId),
      'amount': serializer.toJson<double>(amount),
      'paymentMethod': serializer.toJson<String>(paymentMethod),
      'paymentDate': serializer.toJson<DateTime>(paymentDate),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  Payment copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? customerId,
    String? invoiceId,
    double? amount,
    String? paymentMethod,
    DateTime? paymentDate,
    Value<String?> notes = const Value.absent(),
  }) => Payment(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    customerId: customerId ?? this.customerId,
    invoiceId: invoiceId ?? this.invoiceId,
    amount: amount ?? this.amount,
    paymentMethod: paymentMethod ?? this.paymentMethod,
    paymentDate: paymentDate ?? this.paymentDate,
    notes: notes.present ? notes.value : this.notes,
  );
  Payment copyWithCompanion(PaymentsCompanion data) {
    return Payment(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      customerId: data.customerId.present
          ? data.customerId.value
          : this.customerId,
      invoiceId: data.invoiceId.present ? data.invoiceId.value : this.invoiceId,
      amount: data.amount.present ? data.amount.value : this.amount,
      paymentMethod: data.paymentMethod.present
          ? data.paymentMethod.value
          : this.paymentMethod,
      paymentDate: data.paymentDate.present
          ? data.paymentDate.value
          : this.paymentDate,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Payment(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('customerId: $customerId, ')
          ..write('invoiceId: $invoiceId, ')
          ..write('amount: $amount, ')
          ..write('paymentMethod: $paymentMethod, ')
          ..write('paymentDate: $paymentDate, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    createdAt,
    updatedAt,
    customerId,
    invoiceId,
    amount,
    paymentMethod,
    paymentDate,
    notes,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Payment &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.customerId == this.customerId &&
          other.invoiceId == this.invoiceId &&
          other.amount == this.amount &&
          other.paymentMethod == this.paymentMethod &&
          other.paymentDate == this.paymentDate &&
          other.notes == this.notes);
}

class PaymentsCompanion extends UpdateCompanion<Payment> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<String> customerId;
  final Value<String> invoiceId;
  final Value<double> amount;
  final Value<String> paymentMethod;
  final Value<DateTime> paymentDate;
  final Value<String?> notes;
  final Value<int> rowid;
  const PaymentsCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.customerId = const Value.absent(),
    this.invoiceId = const Value.absent(),
    this.amount = const Value.absent(),
    this.paymentMethod = const Value.absent(),
    this.paymentDate = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PaymentsCompanion.insert({
    required String id,
    required DateTime createdAt,
    required DateTime updatedAt,
    required String customerId,
    required String invoiceId,
    required double amount,
    required String paymentMethod,
    required DateTime paymentDate,
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt),
       customerId = Value(customerId),
       invoiceId = Value(invoiceId),
       amount = Value(amount),
       paymentMethod = Value(paymentMethod),
       paymentDate = Value(paymentDate);
  static Insertable<Payment> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? customerId,
    Expression<String>? invoiceId,
    Expression<double>? amount,
    Expression<String>? paymentMethod,
    Expression<DateTime>? paymentDate,
    Expression<String>? notes,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (customerId != null) 'customer_id': customerId,
      if (invoiceId != null) 'invoice_id': invoiceId,
      if (amount != null) 'amount': amount,
      if (paymentMethod != null) 'payment_method': paymentMethod,
      if (paymentDate != null) 'payment_date': paymentDate,
      if (notes != null) 'notes': notes,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PaymentsCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<String>? customerId,
    Value<String>? invoiceId,
    Value<double>? amount,
    Value<String>? paymentMethod,
    Value<DateTime>? paymentDate,
    Value<String?>? notes,
    Value<int>? rowid,
  }) {
    return PaymentsCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      customerId: customerId ?? this.customerId,
      invoiceId: invoiceId ?? this.invoiceId,
      amount: amount ?? this.amount,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      paymentDate: paymentDate ?? this.paymentDate,
      notes: notes ?? this.notes,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (customerId.present) {
      map['customer_id'] = Variable<String>(customerId.value);
    }
    if (invoiceId.present) {
      map['invoice_id'] = Variable<String>(invoiceId.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (paymentMethod.present) {
      map['payment_method'] = Variable<String>(paymentMethod.value);
    }
    if (paymentDate.present) {
      map['payment_date'] = Variable<DateTime>(paymentDate.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PaymentsCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('customerId: $customerId, ')
          ..write('invoiceId: $invoiceId, ')
          ..write('amount: $amount, ')
          ..write('paymentMethod: $paymentMethod, ')
          ..write('paymentDate: $paymentDate, ')
          ..write('notes: $notes, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ExpensesTableTable extends ExpensesTable
    with TableInfo<$ExpensesTableTable, Expense> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExpensesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _expenseTypeMeta = const VerificationMeta(
    'expenseType',
  );
  @override
  late final GeneratedColumn<String> expenseType = GeneratedColumn<String>(
    'expense_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _expenseDateMeta = const VerificationMeta(
    'expenseDate',
  );
  @override
  late final GeneratedColumn<DateTime> expenseDate = GeneratedColumn<DateTime>(
    'expense_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _labelMeta = const VerificationMeta('label');
  @override
  late final GeneratedColumn<String> label = GeneratedColumn<String>(
    'label',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    createdAt,
    updatedAt,
    expenseType,
    expenseDate,
    amount,
    label,
    notes,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'expenses_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<Expense> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('expense_type')) {
      context.handle(
        _expenseTypeMeta,
        expenseType.isAcceptableOrUnknown(
          data['expense_type']!,
          _expenseTypeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_expenseTypeMeta);
    }
    if (data.containsKey('expense_date')) {
      context.handle(
        _expenseDateMeta,
        expenseDate.isAcceptableOrUnknown(
          data['expense_date']!,
          _expenseDateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_expenseDateMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('label')) {
      context.handle(
        _labelMeta,
        label.isAcceptableOrUnknown(data['label']!, _labelMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Expense map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Expense(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      expenseType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}expense_type'],
      )!,
      expenseDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}expense_date'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}amount'],
      )!,
      label: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}label'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
    );
  }

  @override
  $ExpensesTableTable createAlias(String alias) {
    return $ExpensesTableTable(attachedDatabase, alias);
  }
}

class Expense extends DataClass implements Insertable<Expense> {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String expenseType;
  final DateTime expenseDate;
  final double amount;
  final String? label;
  final String? notes;
  const Expense({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.expenseType,
    required this.expenseDate,
    required this.amount,
    this.label,
    this.notes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['expense_type'] = Variable<String>(expenseType);
    map['expense_date'] = Variable<DateTime>(expenseDate);
    map['amount'] = Variable<double>(amount);
    if (!nullToAbsent || label != null) {
      map['label'] = Variable<String>(label);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  ExpensesTableCompanion toCompanion(bool nullToAbsent) {
    return ExpensesTableCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      expenseType: Value(expenseType),
      expenseDate: Value(expenseDate),
      amount: Value(amount),
      label: label == null && nullToAbsent
          ? const Value.absent()
          : Value(label),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
    );
  }

  factory Expense.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Expense(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      expenseType: serializer.fromJson<String>(json['expenseType']),
      expenseDate: serializer.fromJson<DateTime>(json['expenseDate']),
      amount: serializer.fromJson<double>(json['amount']),
      label: serializer.fromJson<String?>(json['label']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'expenseType': serializer.toJson<String>(expenseType),
      'expenseDate': serializer.toJson<DateTime>(expenseDate),
      'amount': serializer.toJson<double>(amount),
      'label': serializer.toJson<String?>(label),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  Expense copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? expenseType,
    DateTime? expenseDate,
    double? amount,
    Value<String?> label = const Value.absent(),
    Value<String?> notes = const Value.absent(),
  }) => Expense(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    expenseType: expenseType ?? this.expenseType,
    expenseDate: expenseDate ?? this.expenseDate,
    amount: amount ?? this.amount,
    label: label.present ? label.value : this.label,
    notes: notes.present ? notes.value : this.notes,
  );
  Expense copyWithCompanion(ExpensesTableCompanion data) {
    return Expense(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      expenseType: data.expenseType.present
          ? data.expenseType.value
          : this.expenseType,
      expenseDate: data.expenseDate.present
          ? data.expenseDate.value
          : this.expenseDate,
      amount: data.amount.present ? data.amount.value : this.amount,
      label: data.label.present ? data.label.value : this.label,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Expense(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('expenseType: $expenseType, ')
          ..write('expenseDate: $expenseDate, ')
          ..write('amount: $amount, ')
          ..write('label: $label, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    createdAt,
    updatedAt,
    expenseType,
    expenseDate,
    amount,
    label,
    notes,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Expense &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.expenseType == this.expenseType &&
          other.expenseDate == this.expenseDate &&
          other.amount == this.amount &&
          other.label == this.label &&
          other.notes == this.notes);
}

class ExpensesTableCompanion extends UpdateCompanion<Expense> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<String> expenseType;
  final Value<DateTime> expenseDate;
  final Value<double> amount;
  final Value<String?> label;
  final Value<String?> notes;
  final Value<int> rowid;
  const ExpensesTableCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.expenseType = const Value.absent(),
    this.expenseDate = const Value.absent(),
    this.amount = const Value.absent(),
    this.label = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ExpensesTableCompanion.insert({
    required String id,
    required DateTime createdAt,
    required DateTime updatedAt,
    required String expenseType,
    required DateTime expenseDate,
    required double amount,
    this.label = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt),
       expenseType = Value(expenseType),
       expenseDate = Value(expenseDate),
       amount = Value(amount);
  static Insertable<Expense> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? expenseType,
    Expression<DateTime>? expenseDate,
    Expression<double>? amount,
    Expression<String>? label,
    Expression<String>? notes,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (expenseType != null) 'expense_type': expenseType,
      if (expenseDate != null) 'expense_date': expenseDate,
      if (amount != null) 'amount': amount,
      if (label != null) 'label': label,
      if (notes != null) 'notes': notes,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ExpensesTableCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<String>? expenseType,
    Value<DateTime>? expenseDate,
    Value<double>? amount,
    Value<String?>? label,
    Value<String?>? notes,
    Value<int>? rowid,
  }) {
    return ExpensesTableCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      expenseType: expenseType ?? this.expenseType,
      expenseDate: expenseDate ?? this.expenseDate,
      amount: amount ?? this.amount,
      label: label ?? this.label,
      notes: notes ?? this.notes,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (expenseType.present) {
      map['expense_type'] = Variable<String>(expenseType.value);
    }
    if (expenseDate.present) {
      map['expense_date'] = Variable<DateTime>(expenseDate.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (label.present) {
      map['label'] = Variable<String>(label.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExpensesTableCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('expenseType: $expenseType, ')
          ..write('expenseDate: $expenseDate, ')
          ..write('amount: $amount, ')
          ..write('label: $label, ')
          ..write('notes: $notes, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MeterReadingsTable extends MeterReadings
    with TableInfo<$MeterReadingsTable, MeterReading> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MeterReadingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _customerIdMeta = const VerificationMeta(
    'customerId',
  );
  @override
  late final GeneratedColumn<String> customerId = GeneratedColumn<String>(
    'customer_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES customers (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _readingValueMeta = const VerificationMeta(
    'readingValue',
  );
  @override
  late final GeneratedColumn<double> readingValue = GeneratedColumn<double>(
    'reading_value',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _consumptionMeta = const VerificationMeta(
    'consumption',
  );
  @override
  late final GeneratedColumn<double> consumption = GeneratedColumn<double>(
    'consumption',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    customerId,
    readingValue,
    consumption,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'meter_readings';
  @override
  VerificationContext validateIntegrity(
    Insertable<MeterReading> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('customer_id')) {
      context.handle(
        _customerIdMeta,
        customerId.isAcceptableOrUnknown(data['customer_id']!, _customerIdMeta),
      );
    } else if (isInserting) {
      context.missing(_customerIdMeta);
    }
    if (data.containsKey('reading_value')) {
      context.handle(
        _readingValueMeta,
        readingValue.isAcceptableOrUnknown(
          data['reading_value']!,
          _readingValueMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_readingValueMeta);
    }
    if (data.containsKey('consumption')) {
      context.handle(
        _consumptionMeta,
        consumption.isAcceptableOrUnknown(
          data['consumption']!,
          _consumptionMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MeterReading map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MeterReading(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      customerId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}customer_id'],
      )!,
      readingValue: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}reading_value'],
      )!,
      consumption: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}consumption'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $MeterReadingsTable createAlias(String alias) {
    return $MeterReadingsTable(attachedDatabase, alias);
  }
}

class MeterReading extends DataClass implements Insertable<MeterReading> {
  final String id;
  final String customerId;
  final double readingValue;
  final double? consumption;
  final DateTime createdAt;
  const MeterReading({
    required this.id,
    required this.customerId,
    required this.readingValue,
    this.consumption,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['customer_id'] = Variable<String>(customerId);
    map['reading_value'] = Variable<double>(readingValue);
    if (!nullToAbsent || consumption != null) {
      map['consumption'] = Variable<double>(consumption);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  MeterReadingsCompanion toCompanion(bool nullToAbsent) {
    return MeterReadingsCompanion(
      id: Value(id),
      customerId: Value(customerId),
      readingValue: Value(readingValue),
      consumption: consumption == null && nullToAbsent
          ? const Value.absent()
          : Value(consumption),
      createdAt: Value(createdAt),
    );
  }

  factory MeterReading.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MeterReading(
      id: serializer.fromJson<String>(json['id']),
      customerId: serializer.fromJson<String>(json['customerId']),
      readingValue: serializer.fromJson<double>(json['readingValue']),
      consumption: serializer.fromJson<double?>(json['consumption']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'customerId': serializer.toJson<String>(customerId),
      'readingValue': serializer.toJson<double>(readingValue),
      'consumption': serializer.toJson<double?>(consumption),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  MeterReading copyWith({
    String? id,
    String? customerId,
    double? readingValue,
    Value<double?> consumption = const Value.absent(),
    DateTime? createdAt,
  }) => MeterReading(
    id: id ?? this.id,
    customerId: customerId ?? this.customerId,
    readingValue: readingValue ?? this.readingValue,
    consumption: consumption.present ? consumption.value : this.consumption,
    createdAt: createdAt ?? this.createdAt,
  );
  MeterReading copyWithCompanion(MeterReadingsCompanion data) {
    return MeterReading(
      id: data.id.present ? data.id.value : this.id,
      customerId: data.customerId.present
          ? data.customerId.value
          : this.customerId,
      readingValue: data.readingValue.present
          ? data.readingValue.value
          : this.readingValue,
      consumption: data.consumption.present
          ? data.consumption.value
          : this.consumption,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MeterReading(')
          ..write('id: $id, ')
          ..write('customerId: $customerId, ')
          ..write('readingValue: $readingValue, ')
          ..write('consumption: $consumption, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, customerId, readingValue, consumption, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MeterReading &&
          other.id == this.id &&
          other.customerId == this.customerId &&
          other.readingValue == this.readingValue &&
          other.consumption == this.consumption &&
          other.createdAt == this.createdAt);
}

class MeterReadingsCompanion extends UpdateCompanion<MeterReading> {
  final Value<String> id;
  final Value<String> customerId;
  final Value<double> readingValue;
  final Value<double?> consumption;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const MeterReadingsCompanion({
    this.id = const Value.absent(),
    this.customerId = const Value.absent(),
    this.readingValue = const Value.absent(),
    this.consumption = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MeterReadingsCompanion.insert({
    required String id,
    required String customerId,
    required double readingValue,
    this.consumption = const Value.absent(),
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       customerId = Value(customerId),
       readingValue = Value(readingValue),
       createdAt = Value(createdAt);
  static Insertable<MeterReading> custom({
    Expression<String>? id,
    Expression<String>? customerId,
    Expression<double>? readingValue,
    Expression<double>? consumption,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (customerId != null) 'customer_id': customerId,
      if (readingValue != null) 'reading_value': readingValue,
      if (consumption != null) 'consumption': consumption,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MeterReadingsCompanion copyWith({
    Value<String>? id,
    Value<String>? customerId,
    Value<double>? readingValue,
    Value<double?>? consumption,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return MeterReadingsCompanion(
      id: id ?? this.id,
      customerId: customerId ?? this.customerId,
      readingValue: readingValue ?? this.readingValue,
      consumption: consumption ?? this.consumption,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (customerId.present) {
      map['customer_id'] = Variable<String>(customerId.value);
    }
    if (readingValue.present) {
      map['reading_value'] = Variable<double>(readingValue.value);
    }
    if (consumption.present) {
      map['consumption'] = Variable<double>(consumption.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MeterReadingsCompanion(')
          ..write('id: $id, ')
          ..write('customerId: $customerId, ')
          ..write('readingValue: $readingValue, ')
          ..write('consumption: $consumption, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $AreasTable areas = $AreasTable(this);
  late final $DistributionBoxesTable distributionBoxes =
      $DistributionBoxesTable(this);
  late final $CustomersTable customers = $CustomersTable(this);
  late final $InvoicesTable invoices = $InvoicesTable(this);
  late final $PaymentsTable payments = $PaymentsTable(this);
  late final $ExpensesTableTable expensesTable = $ExpensesTableTable(this);
  late final $MeterReadingsTable meterReadings = $MeterReadingsTable(this);
  late final Index idxAreaName = Index(
    'idx_area_name',
    'CREATE INDEX idx_area_name ON areas (name)',
  );
  late final Index idxDistributionBoxAreaId = Index(
    'idx_distribution_box_area_id',
    'CREATE INDEX idx_distribution_box_area_id ON distribution_boxes (area_id)',
  );
  late final Index idxCustomerName = Index(
    'idx_customer_name',
    'CREATE INDEX idx_customer_name ON customers (name)',
  );
  late final Index idxCustomerPhone = Index(
    'idx_customer_phone',
    'CREATE INDEX idx_customer_phone ON customers (phone)',
  );
  late final Index idxCustomerAreaId = Index(
    'idx_customer_area_id',
    'CREATE INDEX idx_customer_area_id ON customers (area_id)',
  );
  late final Index idxCustomerBoxId = Index(
    'idx_customer_box_id',
    'CREATE INDEX idx_customer_box_id ON customers (box_id)',
  );
  late final Index idxCustomerPlan = Index(
    'idx_customer_plan',
    'CREATE INDEX idx_customer_plan ON customers ("plan")',
  );
  late final Index idxCustomerCustomerRelation = Index(
    'idx_customer_customer_relation',
    'CREATE INDEX idx_customer_customer_relation ON customers (customer_relation)',
  );
  late final Index idxCustomerCustomerStatus = Index(
    'idx_customer_customer_status',
    'CREATE INDEX idx_customer_customer_status ON customers (customer_status)',
  );
  late final Index idxInvoiceCustomerId = Index(
    'idx_invoice_customer_id',
    'CREATE INDEX idx_invoice_customer_id ON invoices (customer_id)',
  );
  late final Index idxInvoiceInvoiceStatus = Index(
    'idx_invoice_invoice_status',
    'CREATE INDEX idx_invoice_invoice_status ON invoices (invoice_status)',
  );
  late final Index idxInvoiceIssueDate = Index(
    'idx_invoice_issue_date',
    'CREATE INDEX idx_invoice_issue_date ON invoices (issue_date)',
  );
  late final Index idxInvoiceDueDate = Index(
    'idx_invoice_due_date',
    'CREATE INDEX idx_invoice_due_date ON invoices (due_date)',
  );
  late final Index idxPaymentCustomerId = Index(
    'idx_payment_customer_id',
    'CREATE INDEX idx_payment_customer_id ON payments (customer_id)',
  );
  late final Index idxPaymentInvoiceId = Index(
    'idx_payment_invoice_id',
    'CREATE INDEX idx_payment_invoice_id ON payments (invoice_id)',
  );
  late final Index idxPaymentPaymentDate = Index(
    'idx_payment_payment_date',
    'CREATE INDEX idx_payment_payment_date ON payments (payment_date)',
  );
  late final Index idxExpenseExpenseType = Index(
    'idx_expense_expense_type',
    'CREATE INDEX idx_expense_expense_type ON expenses_table (expense_type)',
  );
  late final Index idxExpenseExpenseDate = Index(
    'idx_expense_expense_date',
    'CREATE INDEX idx_expense_expense_date ON expenses_table (expense_date)',
  );
  late final Index idxMeterReadingCustomerId = Index(
    'idx_meter_reading_customer_id',
    'CREATE INDEX idx_meter_reading_customer_id ON meter_readings (customer_id)',
  );
  late final Index idxMeterReadingCreatedAt = Index(
    'idx_meter_reading_created_at',
    'CREATE INDEX idx_meter_reading_created_at ON meter_readings (created_at)',
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    areas,
    distributionBoxes,
    customers,
    invoices,
    payments,
    expensesTable,
    meterReadings,
    idxAreaName,
    idxDistributionBoxAreaId,
    idxCustomerName,
    idxCustomerPhone,
    idxCustomerAreaId,
    idxCustomerBoxId,
    idxCustomerPlan,
    idxCustomerCustomerRelation,
    idxCustomerCustomerStatus,
    idxInvoiceCustomerId,
    idxInvoiceInvoiceStatus,
    idxInvoiceIssueDate,
    idxInvoiceDueDate,
    idxPaymentCustomerId,
    idxPaymentInvoiceId,
    idxPaymentPaymentDate,
    idxExpenseExpenseType,
    idxExpenseExpenseDate,
    idxMeterReadingCustomerId,
    idxMeterReadingCreatedAt,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'areas',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('distribution_boxes', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'distribution_boxes',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('customers', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'areas',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('customers', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'customers',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('invoices', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'customers',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('payments', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'invoices',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('payments', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'customers',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('meter_readings', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$AreasTableCreateCompanionBuilder =
    AreasCompanion Function({
      required String id,
      required DateTime createdAt,
      required DateTime updatedAt,
      required String name,
      Value<int> customerCount,
      Value<int> rowid,
    });
typedef $$AreasTableUpdateCompanionBuilder =
    AreasCompanion Function({
      Value<String> id,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<String> name,
      Value<int> customerCount,
      Value<int> rowid,
    });

final class $$AreasTableReferences
    extends BaseReferences<_$AppDatabase, $AreasTable, Area> {
  $$AreasTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$DistributionBoxesTable, List<DistributionBox>>
  _distributionBoxesRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.distributionBoxes,
        aliasName: $_aliasNameGenerator(
          db.areas.id,
          db.distributionBoxes.areaId,
        ),
      );

  $$DistributionBoxesTableProcessedTableManager get distributionBoxesRefs {
    final manager = $$DistributionBoxesTableTableManager(
      $_db,
      $_db.distributionBoxes,
    ).filter((f) => f.areaId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _distributionBoxesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$CustomersTable, List<Customer>>
  _customersRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.customers,
    aliasName: $_aliasNameGenerator(db.areas.id, db.customers.areaId),
  );

  $$CustomersTableProcessedTableManager get customersRefs {
    final manager = $$CustomersTableTableManager(
      $_db,
      $_db.customers,
    ).filter((f) => f.areaId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_customersRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$AreasTableFilterComposer extends Composer<_$AppDatabase, $AreasTable> {
  $$AreasTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get customerCount => $composableBuilder(
    column: $table.customerCount,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> distributionBoxesRefs(
    Expression<bool> Function($$DistributionBoxesTableFilterComposer f) f,
  ) {
    final $$DistributionBoxesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.distributionBoxes,
      getReferencedColumn: (t) => t.areaId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DistributionBoxesTableFilterComposer(
            $db: $db,
            $table: $db.distributionBoxes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> customersRefs(
    Expression<bool> Function($$CustomersTableFilterComposer f) f,
  ) {
    final $$CustomersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.customers,
      getReferencedColumn: (t) => t.areaId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CustomersTableFilterComposer(
            $db: $db,
            $table: $db.customers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$AreasTableOrderingComposer
    extends Composer<_$AppDatabase, $AreasTable> {
  $$AreasTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get customerCount => $composableBuilder(
    column: $table.customerCount,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AreasTableAnnotationComposer
    extends Composer<_$AppDatabase, $AreasTable> {
  $$AreasTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get customerCount => $composableBuilder(
    column: $table.customerCount,
    builder: (column) => column,
  );

  Expression<T> distributionBoxesRefs<T extends Object>(
    Expression<T> Function($$DistributionBoxesTableAnnotationComposer a) f,
  ) {
    final $$DistributionBoxesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.distributionBoxes,
          getReferencedColumn: (t) => t.areaId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$DistributionBoxesTableAnnotationComposer(
                $db: $db,
                $table: $db.distributionBoxes,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> customersRefs<T extends Object>(
    Expression<T> Function($$CustomersTableAnnotationComposer a) f,
  ) {
    final $$CustomersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.customers,
      getReferencedColumn: (t) => t.areaId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CustomersTableAnnotationComposer(
            $db: $db,
            $table: $db.customers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$AreasTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AreasTable,
          Area,
          $$AreasTableFilterComposer,
          $$AreasTableOrderingComposer,
          $$AreasTableAnnotationComposer,
          $$AreasTableCreateCompanionBuilder,
          $$AreasTableUpdateCompanionBuilder,
          (Area, $$AreasTableReferences),
          Area,
          PrefetchHooks Function({
            bool distributionBoxesRefs,
            bool customersRefs,
          })
        > {
  $$AreasTableTableManager(_$AppDatabase db, $AreasTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AreasTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AreasTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AreasTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> customerCount = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AreasCompanion(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                name: name,
                customerCount: customerCount,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required DateTime createdAt,
                required DateTime updatedAt,
                required String name,
                Value<int> customerCount = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AreasCompanion.insert(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                name: name,
                customerCount: customerCount,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$AreasTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({distributionBoxesRefs = false, customersRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (distributionBoxesRefs) db.distributionBoxes,
                    if (customersRefs) db.customers,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (distributionBoxesRefs)
                        await $_getPrefetchedData<
                          Area,
                          $AreasTable,
                          DistributionBox
                        >(
                          currentTable: table,
                          referencedTable: $$AreasTableReferences
                              ._distributionBoxesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$AreasTableReferences(
                                db,
                                table,
                                p0,
                              ).distributionBoxesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.areaId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (customersRefs)
                        await $_getPrefetchedData<Area, $AreasTable, Customer>(
                          currentTable: table,
                          referencedTable: $$AreasTableReferences
                              ._customersRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$AreasTableReferences(
                                db,
                                table,
                                p0,
                              ).customersRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.areaId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$AreasTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AreasTable,
      Area,
      $$AreasTableFilterComposer,
      $$AreasTableOrderingComposer,
      $$AreasTableAnnotationComposer,
      $$AreasTableCreateCompanionBuilder,
      $$AreasTableUpdateCompanionBuilder,
      (Area, $$AreasTableReferences),
      Area,
      PrefetchHooks Function({bool distributionBoxesRefs, bool customersRefs})
    >;
typedef $$DistributionBoxesTableCreateCompanionBuilder =
    DistributionBoxesCompanion Function({
      required String id,
      required String name,
      required String areaId,
      required String areaName,
      Value<String?> locationNote,
      Value<String?> notes,
      Value<int> customerCount,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$DistributionBoxesTableUpdateCompanionBuilder =
    DistributionBoxesCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> areaId,
      Value<String> areaName,
      Value<String?> locationNote,
      Value<String?> notes,
      Value<int> customerCount,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

final class $$DistributionBoxesTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $DistributionBoxesTable,
          DistributionBox
        > {
  $$DistributionBoxesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $AreasTable _areaIdTable(_$AppDatabase db) => db.areas.createAlias(
    $_aliasNameGenerator(db.distributionBoxes.areaId, db.areas.id),
  );

  $$AreasTableProcessedTableManager get areaId {
    final $_column = $_itemColumn<String>('area_id')!;

    final manager = $$AreasTableTableManager(
      $_db,
      $_db.areas,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_areaIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$CustomersTable, List<Customer>>
  _customersRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.customers,
    aliasName: $_aliasNameGenerator(
      db.distributionBoxes.id,
      db.customers.boxId,
    ),
  );

  $$CustomersTableProcessedTableManager get customersRefs {
    final manager = $$CustomersTableTableManager(
      $_db,
      $_db.customers,
    ).filter((f) => f.boxId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_customersRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$DistributionBoxesTableFilterComposer
    extends Composer<_$AppDatabase, $DistributionBoxesTable> {
  $$DistributionBoxesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get areaName => $composableBuilder(
    column: $table.areaName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get locationNote => $composableBuilder(
    column: $table.locationNote,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get customerCount => $composableBuilder(
    column: $table.customerCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$AreasTableFilterComposer get areaId {
    final $$AreasTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.areaId,
      referencedTable: $db.areas,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AreasTableFilterComposer(
            $db: $db,
            $table: $db.areas,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> customersRefs(
    Expression<bool> Function($$CustomersTableFilterComposer f) f,
  ) {
    final $$CustomersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.customers,
      getReferencedColumn: (t) => t.boxId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CustomersTableFilterComposer(
            $db: $db,
            $table: $db.customers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DistributionBoxesTableOrderingComposer
    extends Composer<_$AppDatabase, $DistributionBoxesTable> {
  $$DistributionBoxesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get areaName => $composableBuilder(
    column: $table.areaName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get locationNote => $composableBuilder(
    column: $table.locationNote,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get customerCount => $composableBuilder(
    column: $table.customerCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$AreasTableOrderingComposer get areaId {
    final $$AreasTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.areaId,
      referencedTable: $db.areas,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AreasTableOrderingComposer(
            $db: $db,
            $table: $db.areas,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DistributionBoxesTableAnnotationComposer
    extends Composer<_$AppDatabase, $DistributionBoxesTable> {
  $$DistributionBoxesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get areaName =>
      $composableBuilder(column: $table.areaName, builder: (column) => column);

  GeneratedColumn<String> get locationNote => $composableBuilder(
    column: $table.locationNote,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<int> get customerCount => $composableBuilder(
    column: $table.customerCount,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$AreasTableAnnotationComposer get areaId {
    final $$AreasTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.areaId,
      referencedTable: $db.areas,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AreasTableAnnotationComposer(
            $db: $db,
            $table: $db.areas,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> customersRefs<T extends Object>(
    Expression<T> Function($$CustomersTableAnnotationComposer a) f,
  ) {
    final $$CustomersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.customers,
      getReferencedColumn: (t) => t.boxId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CustomersTableAnnotationComposer(
            $db: $db,
            $table: $db.customers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DistributionBoxesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DistributionBoxesTable,
          DistributionBox,
          $$DistributionBoxesTableFilterComposer,
          $$DistributionBoxesTableOrderingComposer,
          $$DistributionBoxesTableAnnotationComposer,
          $$DistributionBoxesTableCreateCompanionBuilder,
          $$DistributionBoxesTableUpdateCompanionBuilder,
          (DistributionBox, $$DistributionBoxesTableReferences),
          DistributionBox,
          PrefetchHooks Function({bool areaId, bool customersRefs})
        > {
  $$DistributionBoxesTableTableManager(
    _$AppDatabase db,
    $DistributionBoxesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DistributionBoxesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DistributionBoxesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DistributionBoxesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> areaId = const Value.absent(),
                Value<String> areaName = const Value.absent(),
                Value<String?> locationNote = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int> customerCount = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DistributionBoxesCompanion(
                id: id,
                name: name,
                areaId: areaId,
                areaName: areaName,
                locationNote: locationNote,
                notes: notes,
                customerCount: customerCount,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required String areaId,
                required String areaName,
                Value<String?> locationNote = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int> customerCount = const Value.absent(),
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => DistributionBoxesCompanion.insert(
                id: id,
                name: name,
                areaId: areaId,
                areaName: areaName,
                locationNote: locationNote,
                notes: notes,
                customerCount: customerCount,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$DistributionBoxesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({areaId = false, customersRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (customersRefs) db.customers],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (areaId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.areaId,
                                referencedTable:
                                    $$DistributionBoxesTableReferences
                                        ._areaIdTable(db),
                                referencedColumn:
                                    $$DistributionBoxesTableReferences
                                        ._areaIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (customersRefs)
                    await $_getPrefetchedData<
                      DistributionBox,
                      $DistributionBoxesTable,
                      Customer
                    >(
                      currentTable: table,
                      referencedTable: $$DistributionBoxesTableReferences
                          ._customersRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$DistributionBoxesTableReferences(
                            db,
                            table,
                            p0,
                          ).customersRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.boxId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$DistributionBoxesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DistributionBoxesTable,
      DistributionBox,
      $$DistributionBoxesTableFilterComposer,
      $$DistributionBoxesTableOrderingComposer,
      $$DistributionBoxesTableAnnotationComposer,
      $$DistributionBoxesTableCreateCompanionBuilder,
      $$DistributionBoxesTableUpdateCompanionBuilder,
      (DistributionBox, $$DistributionBoxesTableReferences),
      DistributionBox,
      PrefetchHooks Function({bool areaId, bool customersRefs})
    >;
typedef $$CustomersTableCreateCompanionBuilder =
    CustomersCompanion Function({
      required String id,
      required DateTime createdAt,
      required DateTime updatedAt,
      required String name,
      Value<double?> totalBilled,
      Value<double?> totalPaid,
      Value<double?> totalOutstanding,
      Value<String?> phone,
      Value<String?> address,
      Value<String?> building,
      Value<String?> floor,
      Value<String?> cableName,
      Value<String?> boxId,
      Value<String?> boxName,
      Value<String?> ampereScheduleId,
      Value<String?> ampereScheduleName,
      Value<String?> areaName,
      Value<String?> areaId,
      required String customerType,
      Value<String?> customerRelation,
      required DateTime subscriptionDate,
      Value<double?> priceOverride,
      Value<double?> fixedChargeOverride,
      Value<double?> tvaOverride,
      Value<bool> hasPricingOverride,
      Value<String> customerStatus,
      required String plan,
      required double planValue,
      Value<int> rowid,
    });
typedef $$CustomersTableUpdateCompanionBuilder =
    CustomersCompanion Function({
      Value<String> id,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<String> name,
      Value<double?> totalBilled,
      Value<double?> totalPaid,
      Value<double?> totalOutstanding,
      Value<String?> phone,
      Value<String?> address,
      Value<String?> building,
      Value<String?> floor,
      Value<String?> cableName,
      Value<String?> boxId,
      Value<String?> boxName,
      Value<String?> ampereScheduleId,
      Value<String?> ampereScheduleName,
      Value<String?> areaName,
      Value<String?> areaId,
      Value<String> customerType,
      Value<String?> customerRelation,
      Value<DateTime> subscriptionDate,
      Value<double?> priceOverride,
      Value<double?> fixedChargeOverride,
      Value<double?> tvaOverride,
      Value<bool> hasPricingOverride,
      Value<String> customerStatus,
      Value<String> plan,
      Value<double> planValue,
      Value<int> rowid,
    });

final class $$CustomersTableReferences
    extends BaseReferences<_$AppDatabase, $CustomersTable, Customer> {
  $$CustomersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $DistributionBoxesTable _boxIdTable(_$AppDatabase db) =>
      db.distributionBoxes.createAlias(
        $_aliasNameGenerator(db.customers.boxId, db.distributionBoxes.id),
      );

  $$DistributionBoxesTableProcessedTableManager? get boxId {
    final $_column = $_itemColumn<String>('box_id');
    if ($_column == null) return null;
    final manager = $$DistributionBoxesTableTableManager(
      $_db,
      $_db.distributionBoxes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_boxIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $AreasTable _areaIdTable(_$AppDatabase db) => db.areas.createAlias(
    $_aliasNameGenerator(db.customers.areaId, db.areas.id),
  );

  $$AreasTableProcessedTableManager? get areaId {
    final $_column = $_itemColumn<String>('area_id');
    if ($_column == null) return null;
    final manager = $$AreasTableTableManager(
      $_db,
      $_db.areas,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_areaIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$InvoicesTable, List<Invoice>> _invoicesRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.invoices,
    aliasName: $_aliasNameGenerator(db.customers.id, db.invoices.customerId),
  );

  $$InvoicesTableProcessedTableManager get invoicesRefs {
    final manager = $$InvoicesTableTableManager(
      $_db,
      $_db.invoices,
    ).filter((f) => f.customerId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_invoicesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$PaymentsTable, List<Payment>> _paymentsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.payments,
    aliasName: $_aliasNameGenerator(db.customers.id, db.payments.customerId),
  );

  $$PaymentsTableProcessedTableManager get paymentsRefs {
    final manager = $$PaymentsTableTableManager(
      $_db,
      $_db.payments,
    ).filter((f) => f.customerId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_paymentsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$MeterReadingsTable, List<MeterReading>>
  _meterReadingsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.meterReadings,
    aliasName: $_aliasNameGenerator(
      db.customers.id,
      db.meterReadings.customerId,
    ),
  );

  $$MeterReadingsTableProcessedTableManager get meterReadingsRefs {
    final manager = $$MeterReadingsTableTableManager(
      $_db,
      $_db.meterReadings,
    ).filter((f) => f.customerId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_meterReadingsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CustomersTableFilterComposer
    extends Composer<_$AppDatabase, $CustomersTable> {
  $$CustomersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get totalBilled => $composableBuilder(
    column: $table.totalBilled,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get totalPaid => $composableBuilder(
    column: $table.totalPaid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get totalOutstanding => $composableBuilder(
    column: $table.totalOutstanding,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get building => $composableBuilder(
    column: $table.building,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get floor => $composableBuilder(
    column: $table.floor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cableName => $composableBuilder(
    column: $table.cableName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get boxName => $composableBuilder(
    column: $table.boxName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ampereScheduleId => $composableBuilder(
    column: $table.ampereScheduleId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ampereScheduleName => $composableBuilder(
    column: $table.ampereScheduleName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get areaName => $composableBuilder(
    column: $table.areaName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get customerType => $composableBuilder(
    column: $table.customerType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get customerRelation => $composableBuilder(
    column: $table.customerRelation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get subscriptionDate => $composableBuilder(
    column: $table.subscriptionDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get priceOverride => $composableBuilder(
    column: $table.priceOverride,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get fixedChargeOverride => $composableBuilder(
    column: $table.fixedChargeOverride,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get tvaOverride => $composableBuilder(
    column: $table.tvaOverride,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get hasPricingOverride => $composableBuilder(
    column: $table.hasPricingOverride,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get customerStatus => $composableBuilder(
    column: $table.customerStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get plan => $composableBuilder(
    column: $table.plan,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get planValue => $composableBuilder(
    column: $table.planValue,
    builder: (column) => ColumnFilters(column),
  );

  $$DistributionBoxesTableFilterComposer get boxId {
    final $$DistributionBoxesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.boxId,
      referencedTable: $db.distributionBoxes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DistributionBoxesTableFilterComposer(
            $db: $db,
            $table: $db.distributionBoxes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AreasTableFilterComposer get areaId {
    final $$AreasTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.areaId,
      referencedTable: $db.areas,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AreasTableFilterComposer(
            $db: $db,
            $table: $db.areas,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> invoicesRefs(
    Expression<bool> Function($$InvoicesTableFilterComposer f) f,
  ) {
    final $$InvoicesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.invoices,
      getReferencedColumn: (t) => t.customerId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InvoicesTableFilterComposer(
            $db: $db,
            $table: $db.invoices,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> paymentsRefs(
    Expression<bool> Function($$PaymentsTableFilterComposer f) f,
  ) {
    final $$PaymentsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.payments,
      getReferencedColumn: (t) => t.customerId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PaymentsTableFilterComposer(
            $db: $db,
            $table: $db.payments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> meterReadingsRefs(
    Expression<bool> Function($$MeterReadingsTableFilterComposer f) f,
  ) {
    final $$MeterReadingsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.meterReadings,
      getReferencedColumn: (t) => t.customerId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MeterReadingsTableFilterComposer(
            $db: $db,
            $table: $db.meterReadings,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CustomersTableOrderingComposer
    extends Composer<_$AppDatabase, $CustomersTable> {
  $$CustomersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get totalBilled => $composableBuilder(
    column: $table.totalBilled,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get totalPaid => $composableBuilder(
    column: $table.totalPaid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get totalOutstanding => $composableBuilder(
    column: $table.totalOutstanding,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get building => $composableBuilder(
    column: $table.building,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get floor => $composableBuilder(
    column: $table.floor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cableName => $composableBuilder(
    column: $table.cableName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get boxName => $composableBuilder(
    column: $table.boxName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ampereScheduleId => $composableBuilder(
    column: $table.ampereScheduleId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ampereScheduleName => $composableBuilder(
    column: $table.ampereScheduleName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get areaName => $composableBuilder(
    column: $table.areaName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get customerType => $composableBuilder(
    column: $table.customerType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get customerRelation => $composableBuilder(
    column: $table.customerRelation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get subscriptionDate => $composableBuilder(
    column: $table.subscriptionDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get priceOverride => $composableBuilder(
    column: $table.priceOverride,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get fixedChargeOverride => $composableBuilder(
    column: $table.fixedChargeOverride,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get tvaOverride => $composableBuilder(
    column: $table.tvaOverride,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get hasPricingOverride => $composableBuilder(
    column: $table.hasPricingOverride,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get customerStatus => $composableBuilder(
    column: $table.customerStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get plan => $composableBuilder(
    column: $table.plan,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get planValue => $composableBuilder(
    column: $table.planValue,
    builder: (column) => ColumnOrderings(column),
  );

  $$DistributionBoxesTableOrderingComposer get boxId {
    final $$DistributionBoxesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.boxId,
      referencedTable: $db.distributionBoxes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DistributionBoxesTableOrderingComposer(
            $db: $db,
            $table: $db.distributionBoxes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AreasTableOrderingComposer get areaId {
    final $$AreasTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.areaId,
      referencedTable: $db.areas,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AreasTableOrderingComposer(
            $db: $db,
            $table: $db.areas,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CustomersTableAnnotationComposer
    extends Composer<_$AppDatabase, $CustomersTable> {
  $$CustomersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<double> get totalBilled => $composableBuilder(
    column: $table.totalBilled,
    builder: (column) => column,
  );

  GeneratedColumn<double> get totalPaid =>
      $composableBuilder(column: $table.totalPaid, builder: (column) => column);

  GeneratedColumn<double> get totalOutstanding => $composableBuilder(
    column: $table.totalOutstanding,
    builder: (column) => column,
  );

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<String> get building =>
      $composableBuilder(column: $table.building, builder: (column) => column);

  GeneratedColumn<String> get floor =>
      $composableBuilder(column: $table.floor, builder: (column) => column);

  GeneratedColumn<String> get cableName =>
      $composableBuilder(column: $table.cableName, builder: (column) => column);

  GeneratedColumn<String> get boxName =>
      $composableBuilder(column: $table.boxName, builder: (column) => column);

  GeneratedColumn<String> get ampereScheduleId => $composableBuilder(
    column: $table.ampereScheduleId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get ampereScheduleName => $composableBuilder(
    column: $table.ampereScheduleName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get areaName =>
      $composableBuilder(column: $table.areaName, builder: (column) => column);

  GeneratedColumn<String> get customerType => $composableBuilder(
    column: $table.customerType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get customerRelation => $composableBuilder(
    column: $table.customerRelation,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get subscriptionDate => $composableBuilder(
    column: $table.subscriptionDate,
    builder: (column) => column,
  );

  GeneratedColumn<double> get priceOverride => $composableBuilder(
    column: $table.priceOverride,
    builder: (column) => column,
  );

  GeneratedColumn<double> get fixedChargeOverride => $composableBuilder(
    column: $table.fixedChargeOverride,
    builder: (column) => column,
  );

  GeneratedColumn<double> get tvaOverride => $composableBuilder(
    column: $table.tvaOverride,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get hasPricingOverride => $composableBuilder(
    column: $table.hasPricingOverride,
    builder: (column) => column,
  );

  GeneratedColumn<String> get customerStatus => $composableBuilder(
    column: $table.customerStatus,
    builder: (column) => column,
  );

  GeneratedColumn<String> get plan =>
      $composableBuilder(column: $table.plan, builder: (column) => column);

  GeneratedColumn<double> get planValue =>
      $composableBuilder(column: $table.planValue, builder: (column) => column);

  $$DistributionBoxesTableAnnotationComposer get boxId {
    final $$DistributionBoxesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.boxId,
          referencedTable: $db.distributionBoxes,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$DistributionBoxesTableAnnotationComposer(
                $db: $db,
                $table: $db.distributionBoxes,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }

  $$AreasTableAnnotationComposer get areaId {
    final $$AreasTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.areaId,
      referencedTable: $db.areas,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AreasTableAnnotationComposer(
            $db: $db,
            $table: $db.areas,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> invoicesRefs<T extends Object>(
    Expression<T> Function($$InvoicesTableAnnotationComposer a) f,
  ) {
    final $$InvoicesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.invoices,
      getReferencedColumn: (t) => t.customerId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InvoicesTableAnnotationComposer(
            $db: $db,
            $table: $db.invoices,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> paymentsRefs<T extends Object>(
    Expression<T> Function($$PaymentsTableAnnotationComposer a) f,
  ) {
    final $$PaymentsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.payments,
      getReferencedColumn: (t) => t.customerId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PaymentsTableAnnotationComposer(
            $db: $db,
            $table: $db.payments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> meterReadingsRefs<T extends Object>(
    Expression<T> Function($$MeterReadingsTableAnnotationComposer a) f,
  ) {
    final $$MeterReadingsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.meterReadings,
      getReferencedColumn: (t) => t.customerId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MeterReadingsTableAnnotationComposer(
            $db: $db,
            $table: $db.meterReadings,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CustomersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CustomersTable,
          Customer,
          $$CustomersTableFilterComposer,
          $$CustomersTableOrderingComposer,
          $$CustomersTableAnnotationComposer,
          $$CustomersTableCreateCompanionBuilder,
          $$CustomersTableUpdateCompanionBuilder,
          (Customer, $$CustomersTableReferences),
          Customer,
          PrefetchHooks Function({
            bool boxId,
            bool areaId,
            bool invoicesRefs,
            bool paymentsRefs,
            bool meterReadingsRefs,
          })
        > {
  $$CustomersTableTableManager(_$AppDatabase db, $CustomersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CustomersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CustomersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CustomersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<double?> totalBilled = const Value.absent(),
                Value<double?> totalPaid = const Value.absent(),
                Value<double?> totalOutstanding = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                Value<String?> address = const Value.absent(),
                Value<String?> building = const Value.absent(),
                Value<String?> floor = const Value.absent(),
                Value<String?> cableName = const Value.absent(),
                Value<String?> boxId = const Value.absent(),
                Value<String?> boxName = const Value.absent(),
                Value<String?> ampereScheduleId = const Value.absent(),
                Value<String?> ampereScheduleName = const Value.absent(),
                Value<String?> areaName = const Value.absent(),
                Value<String?> areaId = const Value.absent(),
                Value<String> customerType = const Value.absent(),
                Value<String?> customerRelation = const Value.absent(),
                Value<DateTime> subscriptionDate = const Value.absent(),
                Value<double?> priceOverride = const Value.absent(),
                Value<double?> fixedChargeOverride = const Value.absent(),
                Value<double?> tvaOverride = const Value.absent(),
                Value<bool> hasPricingOverride = const Value.absent(),
                Value<String> customerStatus = const Value.absent(),
                Value<String> plan = const Value.absent(),
                Value<double> planValue = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CustomersCompanion(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                name: name,
                totalBilled: totalBilled,
                totalPaid: totalPaid,
                totalOutstanding: totalOutstanding,
                phone: phone,
                address: address,
                building: building,
                floor: floor,
                cableName: cableName,
                boxId: boxId,
                boxName: boxName,
                ampereScheduleId: ampereScheduleId,
                ampereScheduleName: ampereScheduleName,
                areaName: areaName,
                areaId: areaId,
                customerType: customerType,
                customerRelation: customerRelation,
                subscriptionDate: subscriptionDate,
                priceOverride: priceOverride,
                fixedChargeOverride: fixedChargeOverride,
                tvaOverride: tvaOverride,
                hasPricingOverride: hasPricingOverride,
                customerStatus: customerStatus,
                plan: plan,
                planValue: planValue,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required DateTime createdAt,
                required DateTime updatedAt,
                required String name,
                Value<double?> totalBilled = const Value.absent(),
                Value<double?> totalPaid = const Value.absent(),
                Value<double?> totalOutstanding = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                Value<String?> address = const Value.absent(),
                Value<String?> building = const Value.absent(),
                Value<String?> floor = const Value.absent(),
                Value<String?> cableName = const Value.absent(),
                Value<String?> boxId = const Value.absent(),
                Value<String?> boxName = const Value.absent(),
                Value<String?> ampereScheduleId = const Value.absent(),
                Value<String?> ampereScheduleName = const Value.absent(),
                Value<String?> areaName = const Value.absent(),
                Value<String?> areaId = const Value.absent(),
                required String customerType,
                Value<String?> customerRelation = const Value.absent(),
                required DateTime subscriptionDate,
                Value<double?> priceOverride = const Value.absent(),
                Value<double?> fixedChargeOverride = const Value.absent(),
                Value<double?> tvaOverride = const Value.absent(),
                Value<bool> hasPricingOverride = const Value.absent(),
                Value<String> customerStatus = const Value.absent(),
                required String plan,
                required double planValue,
                Value<int> rowid = const Value.absent(),
              }) => CustomersCompanion.insert(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                name: name,
                totalBilled: totalBilled,
                totalPaid: totalPaid,
                totalOutstanding: totalOutstanding,
                phone: phone,
                address: address,
                building: building,
                floor: floor,
                cableName: cableName,
                boxId: boxId,
                boxName: boxName,
                ampereScheduleId: ampereScheduleId,
                ampereScheduleName: ampereScheduleName,
                areaName: areaName,
                areaId: areaId,
                customerType: customerType,
                customerRelation: customerRelation,
                subscriptionDate: subscriptionDate,
                priceOverride: priceOverride,
                fixedChargeOverride: fixedChargeOverride,
                tvaOverride: tvaOverride,
                hasPricingOverride: hasPricingOverride,
                customerStatus: customerStatus,
                plan: plan,
                planValue: planValue,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CustomersTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                boxId = false,
                areaId = false,
                invoicesRefs = false,
                paymentsRefs = false,
                meterReadingsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (invoicesRefs) db.invoices,
                    if (paymentsRefs) db.payments,
                    if (meterReadingsRefs) db.meterReadings,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (boxId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.boxId,
                                    referencedTable: $$CustomersTableReferences
                                        ._boxIdTable(db),
                                    referencedColumn: $$CustomersTableReferences
                                        ._boxIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (areaId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.areaId,
                                    referencedTable: $$CustomersTableReferences
                                        ._areaIdTable(db),
                                    referencedColumn: $$CustomersTableReferences
                                        ._areaIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (invoicesRefs)
                        await $_getPrefetchedData<
                          Customer,
                          $CustomersTable,
                          Invoice
                        >(
                          currentTable: table,
                          referencedTable: $$CustomersTableReferences
                              ._invoicesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CustomersTableReferences(
                                db,
                                table,
                                p0,
                              ).invoicesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.customerId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (paymentsRefs)
                        await $_getPrefetchedData<
                          Customer,
                          $CustomersTable,
                          Payment
                        >(
                          currentTable: table,
                          referencedTable: $$CustomersTableReferences
                              ._paymentsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CustomersTableReferences(
                                db,
                                table,
                                p0,
                              ).paymentsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.customerId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (meterReadingsRefs)
                        await $_getPrefetchedData<
                          Customer,
                          $CustomersTable,
                          MeterReading
                        >(
                          currentTable: table,
                          referencedTable: $$CustomersTableReferences
                              ._meterReadingsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CustomersTableReferences(
                                db,
                                table,
                                p0,
                              ).meterReadingsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.customerId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$CustomersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CustomersTable,
      Customer,
      $$CustomersTableFilterComposer,
      $$CustomersTableOrderingComposer,
      $$CustomersTableAnnotationComposer,
      $$CustomersTableCreateCompanionBuilder,
      $$CustomersTableUpdateCompanionBuilder,
      (Customer, $$CustomersTableReferences),
      Customer,
      PrefetchHooks Function({
        bool boxId,
        bool areaId,
        bool invoicesRefs,
        bool paymentsRefs,
        bool meterReadingsRefs,
      })
    >;
typedef $$InvoicesTableCreateCompanionBuilder =
    InvoicesCompanion Function({
      required String id,
      required DateTime createdAt,
      required DateTime updatedAt,
      required String customerId,
      Value<String?> customerName,
      required int invoiceNumber,
      required DateTime issueDate,
      required DateTime dueDate,
      required double fixedCharge,
      required double tva,
      required double totalAmount,
      required double paidAmount,
      required double amountDue,
      Value<double?> billedConsumption,
      Value<String> invoiceStatus,
      Value<int> rowid,
    });
typedef $$InvoicesTableUpdateCompanionBuilder =
    InvoicesCompanion Function({
      Value<String> id,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<String> customerId,
      Value<String?> customerName,
      Value<int> invoiceNumber,
      Value<DateTime> issueDate,
      Value<DateTime> dueDate,
      Value<double> fixedCharge,
      Value<double> tva,
      Value<double> totalAmount,
      Value<double> paidAmount,
      Value<double> amountDue,
      Value<double?> billedConsumption,
      Value<String> invoiceStatus,
      Value<int> rowid,
    });

final class $$InvoicesTableReferences
    extends BaseReferences<_$AppDatabase, $InvoicesTable, Invoice> {
  $$InvoicesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CustomersTable _customerIdTable(_$AppDatabase db) =>
      db.customers.createAlias(
        $_aliasNameGenerator(db.invoices.customerId, db.customers.id),
      );

  $$CustomersTableProcessedTableManager get customerId {
    final $_column = $_itemColumn<String>('customer_id')!;

    final manager = $$CustomersTableTableManager(
      $_db,
      $_db.customers,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_customerIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$PaymentsTable, List<Payment>> _paymentsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.payments,
    aliasName: $_aliasNameGenerator(db.invoices.id, db.payments.invoiceId),
  );

  $$PaymentsTableProcessedTableManager get paymentsRefs {
    final manager = $$PaymentsTableTableManager(
      $_db,
      $_db.payments,
    ).filter((f) => f.invoiceId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_paymentsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$InvoicesTableFilterComposer
    extends Composer<_$AppDatabase, $InvoicesTable> {
  $$InvoicesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get customerName => $composableBuilder(
    column: $table.customerName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get invoiceNumber => $composableBuilder(
    column: $table.invoiceNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get issueDate => $composableBuilder(
    column: $table.issueDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dueDate => $composableBuilder(
    column: $table.dueDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get fixedCharge => $composableBuilder(
    column: $table.fixedCharge,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get tva => $composableBuilder(
    column: $table.tva,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get totalAmount => $composableBuilder(
    column: $table.totalAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get paidAmount => $composableBuilder(
    column: $table.paidAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get amountDue => $composableBuilder(
    column: $table.amountDue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get billedConsumption => $composableBuilder(
    column: $table.billedConsumption,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get invoiceStatus => $composableBuilder(
    column: $table.invoiceStatus,
    builder: (column) => ColumnFilters(column),
  );

  $$CustomersTableFilterComposer get customerId {
    final $$CustomersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.customerId,
      referencedTable: $db.customers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CustomersTableFilterComposer(
            $db: $db,
            $table: $db.customers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> paymentsRefs(
    Expression<bool> Function($$PaymentsTableFilterComposer f) f,
  ) {
    final $$PaymentsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.payments,
      getReferencedColumn: (t) => t.invoiceId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PaymentsTableFilterComposer(
            $db: $db,
            $table: $db.payments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$InvoicesTableOrderingComposer
    extends Composer<_$AppDatabase, $InvoicesTable> {
  $$InvoicesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get customerName => $composableBuilder(
    column: $table.customerName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get invoiceNumber => $composableBuilder(
    column: $table.invoiceNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get issueDate => $composableBuilder(
    column: $table.issueDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dueDate => $composableBuilder(
    column: $table.dueDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get fixedCharge => $composableBuilder(
    column: $table.fixedCharge,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get tva => $composableBuilder(
    column: $table.tva,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get totalAmount => $composableBuilder(
    column: $table.totalAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get paidAmount => $composableBuilder(
    column: $table.paidAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get amountDue => $composableBuilder(
    column: $table.amountDue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get billedConsumption => $composableBuilder(
    column: $table.billedConsumption,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get invoiceStatus => $composableBuilder(
    column: $table.invoiceStatus,
    builder: (column) => ColumnOrderings(column),
  );

  $$CustomersTableOrderingComposer get customerId {
    final $$CustomersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.customerId,
      referencedTable: $db.customers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CustomersTableOrderingComposer(
            $db: $db,
            $table: $db.customers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$InvoicesTableAnnotationComposer
    extends Composer<_$AppDatabase, $InvoicesTable> {
  $$InvoicesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get customerName => $composableBuilder(
    column: $table.customerName,
    builder: (column) => column,
  );

  GeneratedColumn<int> get invoiceNumber => $composableBuilder(
    column: $table.invoiceNumber,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get issueDate =>
      $composableBuilder(column: $table.issueDate, builder: (column) => column);

  GeneratedColumn<DateTime> get dueDate =>
      $composableBuilder(column: $table.dueDate, builder: (column) => column);

  GeneratedColumn<double> get fixedCharge => $composableBuilder(
    column: $table.fixedCharge,
    builder: (column) => column,
  );

  GeneratedColumn<double> get tva =>
      $composableBuilder(column: $table.tva, builder: (column) => column);

  GeneratedColumn<double> get totalAmount => $composableBuilder(
    column: $table.totalAmount,
    builder: (column) => column,
  );

  GeneratedColumn<double> get paidAmount => $composableBuilder(
    column: $table.paidAmount,
    builder: (column) => column,
  );

  GeneratedColumn<double> get amountDue =>
      $composableBuilder(column: $table.amountDue, builder: (column) => column);

  GeneratedColumn<double> get billedConsumption => $composableBuilder(
    column: $table.billedConsumption,
    builder: (column) => column,
  );

  GeneratedColumn<String> get invoiceStatus => $composableBuilder(
    column: $table.invoiceStatus,
    builder: (column) => column,
  );

  $$CustomersTableAnnotationComposer get customerId {
    final $$CustomersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.customerId,
      referencedTable: $db.customers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CustomersTableAnnotationComposer(
            $db: $db,
            $table: $db.customers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> paymentsRefs<T extends Object>(
    Expression<T> Function($$PaymentsTableAnnotationComposer a) f,
  ) {
    final $$PaymentsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.payments,
      getReferencedColumn: (t) => t.invoiceId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PaymentsTableAnnotationComposer(
            $db: $db,
            $table: $db.payments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$InvoicesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $InvoicesTable,
          Invoice,
          $$InvoicesTableFilterComposer,
          $$InvoicesTableOrderingComposer,
          $$InvoicesTableAnnotationComposer,
          $$InvoicesTableCreateCompanionBuilder,
          $$InvoicesTableUpdateCompanionBuilder,
          (Invoice, $$InvoicesTableReferences),
          Invoice,
          PrefetchHooks Function({bool customerId, bool paymentsRefs})
        > {
  $$InvoicesTableTableManager(_$AppDatabase db, $InvoicesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$InvoicesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$InvoicesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$InvoicesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> customerId = const Value.absent(),
                Value<String?> customerName = const Value.absent(),
                Value<int> invoiceNumber = const Value.absent(),
                Value<DateTime> issueDate = const Value.absent(),
                Value<DateTime> dueDate = const Value.absent(),
                Value<double> fixedCharge = const Value.absent(),
                Value<double> tva = const Value.absent(),
                Value<double> totalAmount = const Value.absent(),
                Value<double> paidAmount = const Value.absent(),
                Value<double> amountDue = const Value.absent(),
                Value<double?> billedConsumption = const Value.absent(),
                Value<String> invoiceStatus = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => InvoicesCompanion(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                customerId: customerId,
                customerName: customerName,
                invoiceNumber: invoiceNumber,
                issueDate: issueDate,
                dueDate: dueDate,
                fixedCharge: fixedCharge,
                tva: tva,
                totalAmount: totalAmount,
                paidAmount: paidAmount,
                amountDue: amountDue,
                billedConsumption: billedConsumption,
                invoiceStatus: invoiceStatus,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required DateTime createdAt,
                required DateTime updatedAt,
                required String customerId,
                Value<String?> customerName = const Value.absent(),
                required int invoiceNumber,
                required DateTime issueDate,
                required DateTime dueDate,
                required double fixedCharge,
                required double tva,
                required double totalAmount,
                required double paidAmount,
                required double amountDue,
                Value<double?> billedConsumption = const Value.absent(),
                Value<String> invoiceStatus = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => InvoicesCompanion.insert(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                customerId: customerId,
                customerName: customerName,
                invoiceNumber: invoiceNumber,
                issueDate: issueDate,
                dueDate: dueDate,
                fixedCharge: fixedCharge,
                tva: tva,
                totalAmount: totalAmount,
                paidAmount: paidAmount,
                amountDue: amountDue,
                billedConsumption: billedConsumption,
                invoiceStatus: invoiceStatus,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$InvoicesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({customerId = false, paymentsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (paymentsRefs) db.payments],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (customerId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.customerId,
                                referencedTable: $$InvoicesTableReferences
                                    ._customerIdTable(db),
                                referencedColumn: $$InvoicesTableReferences
                                    ._customerIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (paymentsRefs)
                    await $_getPrefetchedData<Invoice, $InvoicesTable, Payment>(
                      currentTable: table,
                      referencedTable: $$InvoicesTableReferences
                          ._paymentsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$InvoicesTableReferences(db, table, p0).paymentsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.invoiceId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$InvoicesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $InvoicesTable,
      Invoice,
      $$InvoicesTableFilterComposer,
      $$InvoicesTableOrderingComposer,
      $$InvoicesTableAnnotationComposer,
      $$InvoicesTableCreateCompanionBuilder,
      $$InvoicesTableUpdateCompanionBuilder,
      (Invoice, $$InvoicesTableReferences),
      Invoice,
      PrefetchHooks Function({bool customerId, bool paymentsRefs})
    >;
typedef $$PaymentsTableCreateCompanionBuilder =
    PaymentsCompanion Function({
      required String id,
      required DateTime createdAt,
      required DateTime updatedAt,
      required String customerId,
      required String invoiceId,
      required double amount,
      required String paymentMethod,
      required DateTime paymentDate,
      Value<String?> notes,
      Value<int> rowid,
    });
typedef $$PaymentsTableUpdateCompanionBuilder =
    PaymentsCompanion Function({
      Value<String> id,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<String> customerId,
      Value<String> invoiceId,
      Value<double> amount,
      Value<String> paymentMethod,
      Value<DateTime> paymentDate,
      Value<String?> notes,
      Value<int> rowid,
    });

final class $$PaymentsTableReferences
    extends BaseReferences<_$AppDatabase, $PaymentsTable, Payment> {
  $$PaymentsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CustomersTable _customerIdTable(_$AppDatabase db) =>
      db.customers.createAlias(
        $_aliasNameGenerator(db.payments.customerId, db.customers.id),
      );

  $$CustomersTableProcessedTableManager get customerId {
    final $_column = $_itemColumn<String>('customer_id')!;

    final manager = $$CustomersTableTableManager(
      $_db,
      $_db.customers,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_customerIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $InvoicesTable _invoiceIdTable(_$AppDatabase db) => db.invoices
      .createAlias($_aliasNameGenerator(db.payments.invoiceId, db.invoices.id));

  $$InvoicesTableProcessedTableManager get invoiceId {
    final $_column = $_itemColumn<String>('invoice_id')!;

    final manager = $$InvoicesTableTableManager(
      $_db,
      $_db.invoices,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_invoiceIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$PaymentsTableFilterComposer
    extends Composer<_$AppDatabase, $PaymentsTable> {
  $$PaymentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get paymentMethod => $composableBuilder(
    column: $table.paymentMethod,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get paymentDate => $composableBuilder(
    column: $table.paymentDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  $$CustomersTableFilterComposer get customerId {
    final $$CustomersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.customerId,
      referencedTable: $db.customers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CustomersTableFilterComposer(
            $db: $db,
            $table: $db.customers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$InvoicesTableFilterComposer get invoiceId {
    final $$InvoicesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.invoiceId,
      referencedTable: $db.invoices,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InvoicesTableFilterComposer(
            $db: $db,
            $table: $db.invoices,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PaymentsTableOrderingComposer
    extends Composer<_$AppDatabase, $PaymentsTable> {
  $$PaymentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get paymentMethod => $composableBuilder(
    column: $table.paymentMethod,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get paymentDate => $composableBuilder(
    column: $table.paymentDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  $$CustomersTableOrderingComposer get customerId {
    final $$CustomersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.customerId,
      referencedTable: $db.customers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CustomersTableOrderingComposer(
            $db: $db,
            $table: $db.customers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$InvoicesTableOrderingComposer get invoiceId {
    final $$InvoicesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.invoiceId,
      referencedTable: $db.invoices,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InvoicesTableOrderingComposer(
            $db: $db,
            $table: $db.invoices,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PaymentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PaymentsTable> {
  $$PaymentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<String> get paymentMethod => $composableBuilder(
    column: $table.paymentMethod,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get paymentDate => $composableBuilder(
    column: $table.paymentDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  $$CustomersTableAnnotationComposer get customerId {
    final $$CustomersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.customerId,
      referencedTable: $db.customers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CustomersTableAnnotationComposer(
            $db: $db,
            $table: $db.customers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$InvoicesTableAnnotationComposer get invoiceId {
    final $$InvoicesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.invoiceId,
      referencedTable: $db.invoices,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InvoicesTableAnnotationComposer(
            $db: $db,
            $table: $db.invoices,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PaymentsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PaymentsTable,
          Payment,
          $$PaymentsTableFilterComposer,
          $$PaymentsTableOrderingComposer,
          $$PaymentsTableAnnotationComposer,
          $$PaymentsTableCreateCompanionBuilder,
          $$PaymentsTableUpdateCompanionBuilder,
          (Payment, $$PaymentsTableReferences),
          Payment,
          PrefetchHooks Function({bool customerId, bool invoiceId})
        > {
  $$PaymentsTableTableManager(_$AppDatabase db, $PaymentsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PaymentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PaymentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PaymentsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> customerId = const Value.absent(),
                Value<String> invoiceId = const Value.absent(),
                Value<double> amount = const Value.absent(),
                Value<String> paymentMethod = const Value.absent(),
                Value<DateTime> paymentDate = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PaymentsCompanion(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                customerId: customerId,
                invoiceId: invoiceId,
                amount: amount,
                paymentMethod: paymentMethod,
                paymentDate: paymentDate,
                notes: notes,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required DateTime createdAt,
                required DateTime updatedAt,
                required String customerId,
                required String invoiceId,
                required double amount,
                required String paymentMethod,
                required DateTime paymentDate,
                Value<String?> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PaymentsCompanion.insert(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                customerId: customerId,
                invoiceId: invoiceId,
                amount: amount,
                paymentMethod: paymentMethod,
                paymentDate: paymentDate,
                notes: notes,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PaymentsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({customerId = false, invoiceId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (customerId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.customerId,
                                referencedTable: $$PaymentsTableReferences
                                    ._customerIdTable(db),
                                referencedColumn: $$PaymentsTableReferences
                                    ._customerIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (invoiceId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.invoiceId,
                                referencedTable: $$PaymentsTableReferences
                                    ._invoiceIdTable(db),
                                referencedColumn: $$PaymentsTableReferences
                                    ._invoiceIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$PaymentsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PaymentsTable,
      Payment,
      $$PaymentsTableFilterComposer,
      $$PaymentsTableOrderingComposer,
      $$PaymentsTableAnnotationComposer,
      $$PaymentsTableCreateCompanionBuilder,
      $$PaymentsTableUpdateCompanionBuilder,
      (Payment, $$PaymentsTableReferences),
      Payment,
      PrefetchHooks Function({bool customerId, bool invoiceId})
    >;
typedef $$ExpensesTableTableCreateCompanionBuilder =
    ExpensesTableCompanion Function({
      required String id,
      required DateTime createdAt,
      required DateTime updatedAt,
      required String expenseType,
      required DateTime expenseDate,
      required double amount,
      Value<String?> label,
      Value<String?> notes,
      Value<int> rowid,
    });
typedef $$ExpensesTableTableUpdateCompanionBuilder =
    ExpensesTableCompanion Function({
      Value<String> id,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<String> expenseType,
      Value<DateTime> expenseDate,
      Value<double> amount,
      Value<String?> label,
      Value<String?> notes,
      Value<int> rowid,
    });

class $$ExpensesTableTableFilterComposer
    extends Composer<_$AppDatabase, $ExpensesTableTable> {
  $$ExpensesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get expenseType => $composableBuilder(
    column: $table.expenseType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get expenseDate => $composableBuilder(
    column: $table.expenseDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get label => $composableBuilder(
    column: $table.label,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ExpensesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ExpensesTableTable> {
  $$ExpensesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get expenseType => $composableBuilder(
    column: $table.expenseType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get expenseDate => $composableBuilder(
    column: $table.expenseDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get label => $composableBuilder(
    column: $table.label,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ExpensesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ExpensesTableTable> {
  $$ExpensesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get expenseType => $composableBuilder(
    column: $table.expenseType,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get expenseDate => $composableBuilder(
    column: $table.expenseDate,
    builder: (column) => column,
  );

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<String> get label =>
      $composableBuilder(column: $table.label, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);
}

class $$ExpensesTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ExpensesTableTable,
          Expense,
          $$ExpensesTableTableFilterComposer,
          $$ExpensesTableTableOrderingComposer,
          $$ExpensesTableTableAnnotationComposer,
          $$ExpensesTableTableCreateCompanionBuilder,
          $$ExpensesTableTableUpdateCompanionBuilder,
          (
            Expense,
            BaseReferences<_$AppDatabase, $ExpensesTableTable, Expense>,
          ),
          Expense,
          PrefetchHooks Function()
        > {
  $$ExpensesTableTableTableManager(_$AppDatabase db, $ExpensesTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ExpensesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ExpensesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ExpensesTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> expenseType = const Value.absent(),
                Value<DateTime> expenseDate = const Value.absent(),
                Value<double> amount = const Value.absent(),
                Value<String?> label = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ExpensesTableCompanion(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                expenseType: expenseType,
                expenseDate: expenseDate,
                amount: amount,
                label: label,
                notes: notes,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required DateTime createdAt,
                required DateTime updatedAt,
                required String expenseType,
                required DateTime expenseDate,
                required double amount,
                Value<String?> label = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ExpensesTableCompanion.insert(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                expenseType: expenseType,
                expenseDate: expenseDate,
                amount: amount,
                label: label,
                notes: notes,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ExpensesTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ExpensesTableTable,
      Expense,
      $$ExpensesTableTableFilterComposer,
      $$ExpensesTableTableOrderingComposer,
      $$ExpensesTableTableAnnotationComposer,
      $$ExpensesTableTableCreateCompanionBuilder,
      $$ExpensesTableTableUpdateCompanionBuilder,
      (Expense, BaseReferences<_$AppDatabase, $ExpensesTableTable, Expense>),
      Expense,
      PrefetchHooks Function()
    >;
typedef $$MeterReadingsTableCreateCompanionBuilder =
    MeterReadingsCompanion Function({
      required String id,
      required String customerId,
      required double readingValue,
      Value<double?> consumption,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$MeterReadingsTableUpdateCompanionBuilder =
    MeterReadingsCompanion Function({
      Value<String> id,
      Value<String> customerId,
      Value<double> readingValue,
      Value<double?> consumption,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

final class $$MeterReadingsTableReferences
    extends BaseReferences<_$AppDatabase, $MeterReadingsTable, MeterReading> {
  $$MeterReadingsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $CustomersTable _customerIdTable(_$AppDatabase db) =>
      db.customers.createAlias(
        $_aliasNameGenerator(db.meterReadings.customerId, db.customers.id),
      );

  $$CustomersTableProcessedTableManager get customerId {
    final $_column = $_itemColumn<String>('customer_id')!;

    final manager = $$CustomersTableTableManager(
      $_db,
      $_db.customers,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_customerIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$MeterReadingsTableFilterComposer
    extends Composer<_$AppDatabase, $MeterReadingsTable> {
  $$MeterReadingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get readingValue => $composableBuilder(
    column: $table.readingValue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get consumption => $composableBuilder(
    column: $table.consumption,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$CustomersTableFilterComposer get customerId {
    final $$CustomersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.customerId,
      referencedTable: $db.customers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CustomersTableFilterComposer(
            $db: $db,
            $table: $db.customers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MeterReadingsTableOrderingComposer
    extends Composer<_$AppDatabase, $MeterReadingsTable> {
  $$MeterReadingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get readingValue => $composableBuilder(
    column: $table.readingValue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get consumption => $composableBuilder(
    column: $table.consumption,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$CustomersTableOrderingComposer get customerId {
    final $$CustomersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.customerId,
      referencedTable: $db.customers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CustomersTableOrderingComposer(
            $db: $db,
            $table: $db.customers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MeterReadingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $MeterReadingsTable> {
  $$MeterReadingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get readingValue => $composableBuilder(
    column: $table.readingValue,
    builder: (column) => column,
  );

  GeneratedColumn<double> get consumption => $composableBuilder(
    column: $table.consumption,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$CustomersTableAnnotationComposer get customerId {
    final $$CustomersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.customerId,
      referencedTable: $db.customers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CustomersTableAnnotationComposer(
            $db: $db,
            $table: $db.customers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MeterReadingsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MeterReadingsTable,
          MeterReading,
          $$MeterReadingsTableFilterComposer,
          $$MeterReadingsTableOrderingComposer,
          $$MeterReadingsTableAnnotationComposer,
          $$MeterReadingsTableCreateCompanionBuilder,
          $$MeterReadingsTableUpdateCompanionBuilder,
          (MeterReading, $$MeterReadingsTableReferences),
          MeterReading,
          PrefetchHooks Function({bool customerId})
        > {
  $$MeterReadingsTableTableManager(_$AppDatabase db, $MeterReadingsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MeterReadingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MeterReadingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MeterReadingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> customerId = const Value.absent(),
                Value<double> readingValue = const Value.absent(),
                Value<double?> consumption = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MeterReadingsCompanion(
                id: id,
                customerId: customerId,
                readingValue: readingValue,
                consumption: consumption,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String customerId,
                required double readingValue,
                Value<double?> consumption = const Value.absent(),
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => MeterReadingsCompanion.insert(
                id: id,
                customerId: customerId,
                readingValue: readingValue,
                consumption: consumption,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$MeterReadingsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({customerId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (customerId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.customerId,
                                referencedTable: $$MeterReadingsTableReferences
                                    ._customerIdTable(db),
                                referencedColumn: $$MeterReadingsTableReferences
                                    ._customerIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$MeterReadingsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MeterReadingsTable,
      MeterReading,
      $$MeterReadingsTableFilterComposer,
      $$MeterReadingsTableOrderingComposer,
      $$MeterReadingsTableAnnotationComposer,
      $$MeterReadingsTableCreateCompanionBuilder,
      $$MeterReadingsTableUpdateCompanionBuilder,
      (MeterReading, $$MeterReadingsTableReferences),
      MeterReading,
      PrefetchHooks Function({bool customerId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$AreasTableTableManager get areas =>
      $$AreasTableTableManager(_db, _db.areas);
  $$DistributionBoxesTableTableManager get distributionBoxes =>
      $$DistributionBoxesTableTableManager(_db, _db.distributionBoxes);
  $$CustomersTableTableManager get customers =>
      $$CustomersTableTableManager(_db, _db.customers);
  $$InvoicesTableTableManager get invoices =>
      $$InvoicesTableTableManager(_db, _db.invoices);
  $$PaymentsTableTableManager get payments =>
      $$PaymentsTableTableManager(_db, _db.payments);
  $$ExpensesTableTableTableManager get expensesTable =>
      $$ExpensesTableTableTableManager(_db, _db.expensesTable);
  $$MeterReadingsTableTableManager get meterReadings =>
      $$MeterReadingsTableTableManager(_db, _db.meterReadings);
}
