// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $AppUsersTable extends AppUsers with TableInfo<$AppUsersTable, AppUser> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AppUsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _phoneNumberMeta = const VerificationMeta(
    'phoneNumber',
  );
  @override
  late final GeneratedColumn<String> phoneNumber = GeneratedColumn<String>(
    'phone_number',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isBannedMeta = const VerificationMeta(
    'isBanned',
  );
  @override
  late final GeneratedColumn<bool> isBanned = GeneratedColumn<bool>(
    'is_banned',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_banned" IN (0, 1))',
    ),
  );
  static const VerificationMeta _companyNameMeta = const VerificationMeta(
    'companyName',
  );
  @override
  late final GeneratedColumn<String> companyName = GeneratedColumn<String>(
    'company_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _logoUrlMeta = const VerificationMeta(
    'logoUrl',
  );
  @override
  late final GeneratedColumn<String> logoUrl = GeneratedColumn<String>(
    'logo_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    email,
    phoneNumber,
    isBanned,
    companyName,
    logoUrl,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'app_users';
  @override
  VerificationContext validateIntegrity(
    Insertable<AppUser> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    }
    if (data.containsKey('phone_number')) {
      context.handle(
        _phoneNumberMeta,
        phoneNumber.isAcceptableOrUnknown(
          data['phone_number']!,
          _phoneNumberMeta,
        ),
      );
    }
    if (data.containsKey('is_banned')) {
      context.handle(
        _isBannedMeta,
        isBanned.isAcceptableOrUnknown(data['is_banned']!, _isBannedMeta),
      );
    } else if (isInserting) {
      context.missing(_isBannedMeta);
    }
    if (data.containsKey('company_name')) {
      context.handle(
        _companyNameMeta,
        companyName.isAcceptableOrUnknown(
          data['company_name']!,
          _companyNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_companyNameMeta);
    }
    if (data.containsKey('logo_url')) {
      context.handle(
        _logoUrlMeta,
        logoUrl.isAcceptableOrUnknown(data['logo_url']!, _logoUrlMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AppUser map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AppUser(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      ),
      phoneNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone_number'],
      ),
      isBanned: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_banned'],
      )!,
      companyName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}company_name'],
      )!,
      logoUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}logo_url'],
      ),
    );
  }

  @override
  $AppUsersTable createAlias(String alias) {
    return $AppUsersTable(attachedDatabase, alias);
  }
}

class AppUser extends DataClass implements Insertable<AppUser> {
  final String id;
  final String? email;
  final String? phoneNumber;
  final bool isBanned;
  final String companyName;
  final String? logoUrl;
  const AppUser({
    required this.id,
    this.email,
    this.phoneNumber,
    required this.isBanned,
    required this.companyName,
    this.logoUrl,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || phoneNumber != null) {
      map['phone_number'] = Variable<String>(phoneNumber);
    }
    map['is_banned'] = Variable<bool>(isBanned);
    map['company_name'] = Variable<String>(companyName);
    if (!nullToAbsent || logoUrl != null) {
      map['logo_url'] = Variable<String>(logoUrl);
    }
    return map;
  }

  AppUsersCompanion toCompanion(bool nullToAbsent) {
    return AppUsersCompanion(
      id: Value(id),
      email: email == null && nullToAbsent
          ? const Value.absent()
          : Value(email),
      phoneNumber: phoneNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(phoneNumber),
      isBanned: Value(isBanned),
      companyName: Value(companyName),
      logoUrl: logoUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(logoUrl),
    );
  }

  factory AppUser.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AppUser(
      id: serializer.fromJson<String>(json['id']),
      email: serializer.fromJson<String?>(json['email']),
      phoneNumber: serializer.fromJson<String?>(json['phoneNumber']),
      isBanned: serializer.fromJson<bool>(json['isBanned']),
      companyName: serializer.fromJson<String>(json['companyName']),
      logoUrl: serializer.fromJson<String?>(json['logoUrl']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'email': serializer.toJson<String?>(email),
      'phoneNumber': serializer.toJson<String?>(phoneNumber),
      'isBanned': serializer.toJson<bool>(isBanned),
      'companyName': serializer.toJson<String>(companyName),
      'logoUrl': serializer.toJson<String?>(logoUrl),
    };
  }

  AppUser copyWith({
    String? id,
    Value<String?> email = const Value.absent(),
    Value<String?> phoneNumber = const Value.absent(),
    bool? isBanned,
    String? companyName,
    Value<String?> logoUrl = const Value.absent(),
  }) => AppUser(
    id: id ?? this.id,
    email: email.present ? email.value : this.email,
    phoneNumber: phoneNumber.present ? phoneNumber.value : this.phoneNumber,
    isBanned: isBanned ?? this.isBanned,
    companyName: companyName ?? this.companyName,
    logoUrl: logoUrl.present ? logoUrl.value : this.logoUrl,
  );
  AppUser copyWithCompanion(AppUsersCompanion data) {
    return AppUser(
      id: data.id.present ? data.id.value : this.id,
      email: data.email.present ? data.email.value : this.email,
      phoneNumber: data.phoneNumber.present
          ? data.phoneNumber.value
          : this.phoneNumber,
      isBanned: data.isBanned.present ? data.isBanned.value : this.isBanned,
      companyName: data.companyName.present
          ? data.companyName.value
          : this.companyName,
      logoUrl: data.logoUrl.present ? data.logoUrl.value : this.logoUrl,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AppUser(')
          ..write('id: $id, ')
          ..write('email: $email, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('isBanned: $isBanned, ')
          ..write('companyName: $companyName, ')
          ..write('logoUrl: $logoUrl')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, email, phoneNumber, isBanned, companyName, logoUrl);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppUser &&
          other.id == this.id &&
          other.email == this.email &&
          other.phoneNumber == this.phoneNumber &&
          other.isBanned == this.isBanned &&
          other.companyName == this.companyName &&
          other.logoUrl == this.logoUrl);
}

class AppUsersCompanion extends UpdateCompanion<AppUser> {
  final Value<String> id;
  final Value<String?> email;
  final Value<String?> phoneNumber;
  final Value<bool> isBanned;
  final Value<String> companyName;
  final Value<String?> logoUrl;
  final Value<int> rowid;
  const AppUsersCompanion({
    this.id = const Value.absent(),
    this.email = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    this.isBanned = const Value.absent(),
    this.companyName = const Value.absent(),
    this.logoUrl = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AppUsersCompanion.insert({
    required String id,
    this.email = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    required bool isBanned,
    required String companyName,
    this.logoUrl = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       isBanned = Value(isBanned),
       companyName = Value(companyName);
  static Insertable<AppUser> custom({
    Expression<String>? id,
    Expression<String>? email,
    Expression<String>? phoneNumber,
    Expression<bool>? isBanned,
    Expression<String>? companyName,
    Expression<String>? logoUrl,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (email != null) 'email': email,
      if (phoneNumber != null) 'phone_number': phoneNumber,
      if (isBanned != null) 'is_banned': isBanned,
      if (companyName != null) 'company_name': companyName,
      if (logoUrl != null) 'logo_url': logoUrl,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AppUsersCompanion copyWith({
    Value<String>? id,
    Value<String?>? email,
    Value<String?>? phoneNumber,
    Value<bool>? isBanned,
    Value<String>? companyName,
    Value<String?>? logoUrl,
    Value<int>? rowid,
  }) {
    return AppUsersCompanion(
      id: id ?? this.id,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      isBanned: isBanned ?? this.isBanned,
      companyName: companyName ?? this.companyName,
      logoUrl: logoUrl ?? this.logoUrl,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (phoneNumber.present) {
      map['phone_number'] = Variable<String>(phoneNumber.value);
    }
    if (isBanned.present) {
      map['is_banned'] = Variable<bool>(isBanned.value);
    }
    if (companyName.present) {
      map['company_name'] = Variable<String>(companyName.value);
    }
    if (logoUrl.present) {
      map['logo_url'] = Variable<String>(logoUrl.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AppUsersCompanion(')
          ..write('id: $id, ')
          ..write('email: $email, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('isBanned: $isBanned, ')
          ..write('companyName: $companyName, ')
          ..write('logoUrl: $logoUrl, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CompanyPreferencesTable extends CompanyPreferences
    with TableInfo<$CompanyPreferencesTable, CompanyPreference> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CompanyPreferencesTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isDeletedMeta = const VerificationMeta(
    'isDeleted',
  );
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
    'is_deleted',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_deleted" IN (0, 1))',
    ),
  );
  static const VerificationMeta _companyIdMeta = const VerificationMeta(
    'companyId',
  );
  @override
  late final GeneratedColumn<String> companyId = GeneratedColumn<String>(
    'company_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pricePerKilowatMeta = const VerificationMeta(
    'pricePerKilowat',
  );
  @override
  late final GeneratedColumn<double> pricePerKilowat = GeneratedColumn<double>(
    'price_per_kilowat',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pricePerAmpMeta = const VerificationMeta(
    'pricePerAmp',
  );
  @override
  late final GeneratedColumn<double> pricePerAmp = GeneratedColumn<double>(
    'price_per_amp',
    aliasedName,
    false,
    type: DriftSqlType.double,
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
  static const VerificationMeta _languageMeta = const VerificationMeta(
    'language',
  );
  @override
  late final GeneratedColumn<String> language = GeneratedColumn<String>(
    'language',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _triggerDateMeta = const VerificationMeta(
    'triggerDate',
  );
  @override
  late final GeneratedColumn<int> triggerDate = GeneratedColumn<int>(
    'trigger_date',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _triggerMessageMeta = const VerificationMeta(
    'triggerMessage',
  );
  @override
  late final GeneratedColumn<String> triggerMessage = GeneratedColumn<String>(
    'trigger_message',
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
    deletedAt,
    isDeleted,
    companyId,
    pricePerKilowat,
    pricePerAmp,
    fixedCharge,
    tva,
    language,
    triggerDate,
    triggerMessage,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'company_preferences';
  @override
  VerificationContext validateIntegrity(
    Insertable<CompanyPreference> instance, {
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
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('is_deleted')) {
      context.handle(
        _isDeletedMeta,
        isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta),
      );
    } else if (isInserting) {
      context.missing(_isDeletedMeta);
    }
    if (data.containsKey('company_id')) {
      context.handle(
        _companyIdMeta,
        companyId.isAcceptableOrUnknown(data['company_id']!, _companyIdMeta),
      );
    } else if (isInserting) {
      context.missing(_companyIdMeta);
    }
    if (data.containsKey('price_per_kilowat')) {
      context.handle(
        _pricePerKilowatMeta,
        pricePerKilowat.isAcceptableOrUnknown(
          data['price_per_kilowat']!,
          _pricePerKilowatMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_pricePerKilowatMeta);
    }
    if (data.containsKey('price_per_amp')) {
      context.handle(
        _pricePerAmpMeta,
        pricePerAmp.isAcceptableOrUnknown(
          data['price_per_amp']!,
          _pricePerAmpMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_pricePerAmpMeta);
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
    if (data.containsKey('language')) {
      context.handle(
        _languageMeta,
        language.isAcceptableOrUnknown(data['language']!, _languageMeta),
      );
    } else if (isInserting) {
      context.missing(_languageMeta);
    }
    if (data.containsKey('trigger_date')) {
      context.handle(
        _triggerDateMeta,
        triggerDate.isAcceptableOrUnknown(
          data['trigger_date']!,
          _triggerDateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_triggerDateMeta);
    }
    if (data.containsKey('trigger_message')) {
      context.handle(
        _triggerMessageMeta,
        triggerMessage.isAcceptableOrUnknown(
          data['trigger_message']!,
          _triggerMessageMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CompanyPreference map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CompanyPreference(
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
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      isDeleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_deleted'],
      )!,
      companyId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}company_id'],
      )!,
      pricePerKilowat: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}price_per_kilowat'],
      )!,
      pricePerAmp: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}price_per_amp'],
      )!,
      fixedCharge: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}fixed_charge'],
      )!,
      tva: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}tva'],
      )!,
      language: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}language'],
      )!,
      triggerDate: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}trigger_date'],
      )!,
      triggerMessage: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}trigger_message'],
      ),
    );
  }

  @override
  $CompanyPreferencesTable createAlias(String alias) {
    return $CompanyPreferencesTable(attachedDatabase, alias);
  }
}

class CompanyPreference extends DataClass
    implements Insertable<CompanyPreference> {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final bool isDeleted;
  final String companyId;
  final double pricePerKilowat;
  final double pricePerAmp;
  final double fixedCharge;
  final double tva;
  final String language;
  final int triggerDate;
  final String? triggerMessage;
  const CompanyPreference({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.isDeleted,
    required this.companyId,
    required this.pricePerKilowat,
    required this.pricePerAmp,
    required this.fixedCharge,
    required this.tva,
    required this.language,
    required this.triggerDate,
    this.triggerMessage,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['is_deleted'] = Variable<bool>(isDeleted);
    map['company_id'] = Variable<String>(companyId);
    map['price_per_kilowat'] = Variable<double>(pricePerKilowat);
    map['price_per_amp'] = Variable<double>(pricePerAmp);
    map['fixed_charge'] = Variable<double>(fixedCharge);
    map['tva'] = Variable<double>(tva);
    map['language'] = Variable<String>(language);
    map['trigger_date'] = Variable<int>(triggerDate);
    if (!nullToAbsent || triggerMessage != null) {
      map['trigger_message'] = Variable<String>(triggerMessage);
    }
    return map;
  }

  CompanyPreferencesCompanion toCompanion(bool nullToAbsent) {
    return CompanyPreferencesCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      isDeleted: Value(isDeleted),
      companyId: Value(companyId),
      pricePerKilowat: Value(pricePerKilowat),
      pricePerAmp: Value(pricePerAmp),
      fixedCharge: Value(fixedCharge),
      tva: Value(tva),
      language: Value(language),
      triggerDate: Value(triggerDate),
      triggerMessage: triggerMessage == null && nullToAbsent
          ? const Value.absent()
          : Value(triggerMessage),
    );
  }

  factory CompanyPreference.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CompanyPreference(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
      companyId: serializer.fromJson<String>(json['companyId']),
      pricePerKilowat: serializer.fromJson<double>(json['pricePerKilowat']),
      pricePerAmp: serializer.fromJson<double>(json['pricePerAmp']),
      fixedCharge: serializer.fromJson<double>(json['fixedCharge']),
      tva: serializer.fromJson<double>(json['tva']),
      language: serializer.fromJson<String>(json['language']),
      triggerDate: serializer.fromJson<int>(json['triggerDate']),
      triggerMessage: serializer.fromJson<String?>(json['triggerMessage']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'isDeleted': serializer.toJson<bool>(isDeleted),
      'companyId': serializer.toJson<String>(companyId),
      'pricePerKilowat': serializer.toJson<double>(pricePerKilowat),
      'pricePerAmp': serializer.toJson<double>(pricePerAmp),
      'fixedCharge': serializer.toJson<double>(fixedCharge),
      'tva': serializer.toJson<double>(tva),
      'language': serializer.toJson<String>(language),
      'triggerDate': serializer.toJson<int>(triggerDate),
      'triggerMessage': serializer.toJson<String?>(triggerMessage),
    };
  }

  CompanyPreference copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    bool? isDeleted,
    String? companyId,
    double? pricePerKilowat,
    double? pricePerAmp,
    double? fixedCharge,
    double? tva,
    String? language,
    int? triggerDate,
    Value<String?> triggerMessage = const Value.absent(),
  }) => CompanyPreference(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    isDeleted: isDeleted ?? this.isDeleted,
    companyId: companyId ?? this.companyId,
    pricePerKilowat: pricePerKilowat ?? this.pricePerKilowat,
    pricePerAmp: pricePerAmp ?? this.pricePerAmp,
    fixedCharge: fixedCharge ?? this.fixedCharge,
    tva: tva ?? this.tva,
    language: language ?? this.language,
    triggerDate: triggerDate ?? this.triggerDate,
    triggerMessage: triggerMessage.present
        ? triggerMessage.value
        : this.triggerMessage,
  );
  CompanyPreference copyWithCompanion(CompanyPreferencesCompanion data) {
    return CompanyPreference(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
      companyId: data.companyId.present ? data.companyId.value : this.companyId,
      pricePerKilowat: data.pricePerKilowat.present
          ? data.pricePerKilowat.value
          : this.pricePerKilowat,
      pricePerAmp: data.pricePerAmp.present
          ? data.pricePerAmp.value
          : this.pricePerAmp,
      fixedCharge: data.fixedCharge.present
          ? data.fixedCharge.value
          : this.fixedCharge,
      tva: data.tva.present ? data.tva.value : this.tva,
      language: data.language.present ? data.language.value : this.language,
      triggerDate: data.triggerDate.present
          ? data.triggerDate.value
          : this.triggerDate,
      triggerMessage: data.triggerMessage.present
          ? data.triggerMessage.value
          : this.triggerMessage,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CompanyPreference(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('companyId: $companyId, ')
          ..write('pricePerKilowat: $pricePerKilowat, ')
          ..write('pricePerAmp: $pricePerAmp, ')
          ..write('fixedCharge: $fixedCharge, ')
          ..write('tva: $tva, ')
          ..write('language: $language, ')
          ..write('triggerDate: $triggerDate, ')
          ..write('triggerMessage: $triggerMessage')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    createdAt,
    updatedAt,
    deletedAt,
    isDeleted,
    companyId,
    pricePerKilowat,
    pricePerAmp,
    fixedCharge,
    tva,
    language,
    triggerDate,
    triggerMessage,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CompanyPreference &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.isDeleted == this.isDeleted &&
          other.companyId == this.companyId &&
          other.pricePerKilowat == this.pricePerKilowat &&
          other.pricePerAmp == this.pricePerAmp &&
          other.fixedCharge == this.fixedCharge &&
          other.tva == this.tva &&
          other.language == this.language &&
          other.triggerDate == this.triggerDate &&
          other.triggerMessage == this.triggerMessage);
}

class CompanyPreferencesCompanion extends UpdateCompanion<CompanyPreference> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<bool> isDeleted;
  final Value<String> companyId;
  final Value<double> pricePerKilowat;
  final Value<double> pricePerAmp;
  final Value<double> fixedCharge;
  final Value<double> tva;
  final Value<String> language;
  final Value<int> triggerDate;
  final Value<String?> triggerMessage;
  final Value<int> rowid;
  const CompanyPreferencesCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.companyId = const Value.absent(),
    this.pricePerKilowat = const Value.absent(),
    this.pricePerAmp = const Value.absent(),
    this.fixedCharge = const Value.absent(),
    this.tva = const Value.absent(),
    this.language = const Value.absent(),
    this.triggerDate = const Value.absent(),
    this.triggerMessage = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CompanyPreferencesCompanion.insert({
    required String id,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    required bool isDeleted,
    required String companyId,
    required double pricePerKilowat,
    required double pricePerAmp,
    required double fixedCharge,
    required double tva,
    required String language,
    required int triggerDate,
    this.triggerMessage = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt),
       isDeleted = Value(isDeleted),
       companyId = Value(companyId),
       pricePerKilowat = Value(pricePerKilowat),
       pricePerAmp = Value(pricePerAmp),
       fixedCharge = Value(fixedCharge),
       tva = Value(tva),
       language = Value(language),
       triggerDate = Value(triggerDate);
  static Insertable<CompanyPreference> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<bool>? isDeleted,
    Expression<String>? companyId,
    Expression<double>? pricePerKilowat,
    Expression<double>? pricePerAmp,
    Expression<double>? fixedCharge,
    Expression<double>? tva,
    Expression<String>? language,
    Expression<int>? triggerDate,
    Expression<String>? triggerMessage,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (companyId != null) 'company_id': companyId,
      if (pricePerKilowat != null) 'price_per_kilowat': pricePerKilowat,
      if (pricePerAmp != null) 'price_per_amp': pricePerAmp,
      if (fixedCharge != null) 'fixed_charge': fixedCharge,
      if (tva != null) 'tva': tva,
      if (language != null) 'language': language,
      if (triggerDate != null) 'trigger_date': triggerDate,
      if (triggerMessage != null) 'trigger_message': triggerMessage,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CompanyPreferencesCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<bool>? isDeleted,
    Value<String>? companyId,
    Value<double>? pricePerKilowat,
    Value<double>? pricePerAmp,
    Value<double>? fixedCharge,
    Value<double>? tva,
    Value<String>? language,
    Value<int>? triggerDate,
    Value<String?>? triggerMessage,
    Value<int>? rowid,
  }) {
    return CompanyPreferencesCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      isDeleted: isDeleted ?? this.isDeleted,
      companyId: companyId ?? this.companyId,
      pricePerKilowat: pricePerKilowat ?? this.pricePerKilowat,
      pricePerAmp: pricePerAmp ?? this.pricePerAmp,
      fixedCharge: fixedCharge ?? this.fixedCharge,
      tva: tva ?? this.tva,
      language: language ?? this.language,
      triggerDate: triggerDate ?? this.triggerDate,
      triggerMessage: triggerMessage ?? this.triggerMessage,
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
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (companyId.present) {
      map['company_id'] = Variable<String>(companyId.value);
    }
    if (pricePerKilowat.present) {
      map['price_per_kilowat'] = Variable<double>(pricePerKilowat.value);
    }
    if (pricePerAmp.present) {
      map['price_per_amp'] = Variable<double>(pricePerAmp.value);
    }
    if (fixedCharge.present) {
      map['fixed_charge'] = Variable<double>(fixedCharge.value);
    }
    if (tva.present) {
      map['tva'] = Variable<double>(tva.value);
    }
    if (language.present) {
      map['language'] = Variable<String>(language.value);
    }
    if (triggerDate.present) {
      map['trigger_date'] = Variable<int>(triggerDate.value);
    }
    if (triggerMessage.present) {
      map['trigger_message'] = Variable<String>(triggerMessage.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CompanyPreferencesCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('companyId: $companyId, ')
          ..write('pricePerKilowat: $pricePerKilowat, ')
          ..write('pricePerAmp: $pricePerAmp, ')
          ..write('fixedCharge: $fixedCharge, ')
          ..write('tva: $tva, ')
          ..write('language: $language, ')
          ..write('triggerDate: $triggerDate, ')
          ..write('triggerMessage: $triggerMessage, ')
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
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isDeletedMeta = const VerificationMeta(
    'isDeleted',
  );
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
    'is_deleted',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_deleted" IN (0, 1))',
    ),
  );
  static const VerificationMeta _companyIdMeta = const VerificationMeta(
    'companyId',
  );
  @override
  late final GeneratedColumn<String> companyId = GeneratedColumn<String>(
    'company_id',
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
  static const VerificationMeta _customerStatusMeta = const VerificationMeta(
    'customerStatus',
  );
  @override
  late final GeneratedColumn<String> customerStatus = GeneratedColumn<String>(
    'customer_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
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
    deletedAt,
    isDeleted,
    companyId,
    name,
    phone,
    address,
    customerType,
    subscriptionDate,
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
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('is_deleted')) {
      context.handle(
        _isDeletedMeta,
        isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta),
      );
    } else if (isInserting) {
      context.missing(_isDeletedMeta);
    }
    if (data.containsKey('company_id')) {
      context.handle(
        _companyIdMeta,
        companyId.isAcceptableOrUnknown(data['company_id']!, _companyIdMeta),
      );
    } else if (isInserting) {
      context.missing(_companyIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
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
    if (data.containsKey('customer_status')) {
      context.handle(
        _customerStatusMeta,
        customerStatus.isAcceptableOrUnknown(
          data['customer_status']!,
          _customerStatusMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_customerStatusMeta);
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
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      isDeleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_deleted'],
      )!,
      companyId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}company_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      phone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone'],
      ),
      address: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address'],
      ),
      customerType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}customer_type'],
      )!,
      subscriptionDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}subscription_date'],
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
  final DateTime? deletedAt;
  final bool isDeleted;
  final String companyId;
  final String name;
  final String? phone;
  final String? address;
  final String customerType;
  final DateTime subscriptionDate;
  final String customerStatus;
  final String plan;
  final double planValue;
  const Customer({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.isDeleted,
    required this.companyId,
    required this.name,
    this.phone,
    this.address,
    required this.customerType,
    required this.subscriptionDate,
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
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['is_deleted'] = Variable<bool>(isDeleted);
    map['company_id'] = Variable<String>(companyId);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String>(address);
    }
    map['customer_type'] = Variable<String>(customerType);
    map['subscription_date'] = Variable<DateTime>(subscriptionDate);
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
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      isDeleted: Value(isDeleted),
      companyId: Value(companyId),
      name: Value(name),
      phone: phone == null && nullToAbsent
          ? const Value.absent()
          : Value(phone),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
      customerType: Value(customerType),
      subscriptionDate: Value(subscriptionDate),
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
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
      companyId: serializer.fromJson<String>(json['companyId']),
      name: serializer.fromJson<String>(json['name']),
      phone: serializer.fromJson<String?>(json['phone']),
      address: serializer.fromJson<String?>(json['address']),
      customerType: serializer.fromJson<String>(json['customerType']),
      subscriptionDate: serializer.fromJson<DateTime>(json['subscriptionDate']),
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
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'isDeleted': serializer.toJson<bool>(isDeleted),
      'companyId': serializer.toJson<String>(companyId),
      'name': serializer.toJson<String>(name),
      'phone': serializer.toJson<String?>(phone),
      'address': serializer.toJson<String?>(address),
      'customerType': serializer.toJson<String>(customerType),
      'subscriptionDate': serializer.toJson<DateTime>(subscriptionDate),
      'customerStatus': serializer.toJson<String>(customerStatus),
      'plan': serializer.toJson<String>(plan),
      'planValue': serializer.toJson<double>(planValue),
    };
  }

  Customer copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    bool? isDeleted,
    String? companyId,
    String? name,
    Value<String?> phone = const Value.absent(),
    Value<String?> address = const Value.absent(),
    String? customerType,
    DateTime? subscriptionDate,
    String? customerStatus,
    String? plan,
    double? planValue,
  }) => Customer(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    isDeleted: isDeleted ?? this.isDeleted,
    companyId: companyId ?? this.companyId,
    name: name ?? this.name,
    phone: phone.present ? phone.value : this.phone,
    address: address.present ? address.value : this.address,
    customerType: customerType ?? this.customerType,
    subscriptionDate: subscriptionDate ?? this.subscriptionDate,
    customerStatus: customerStatus ?? this.customerStatus,
    plan: plan ?? this.plan,
    planValue: planValue ?? this.planValue,
  );
  Customer copyWithCompanion(CustomersCompanion data) {
    return Customer(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
      companyId: data.companyId.present ? data.companyId.value : this.companyId,
      name: data.name.present ? data.name.value : this.name,
      phone: data.phone.present ? data.phone.value : this.phone,
      address: data.address.present ? data.address.value : this.address,
      customerType: data.customerType.present
          ? data.customerType.value
          : this.customerType,
      subscriptionDate: data.subscriptionDate.present
          ? data.subscriptionDate.value
          : this.subscriptionDate,
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
          ..write('deletedAt: $deletedAt, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('companyId: $companyId, ')
          ..write('name: $name, ')
          ..write('phone: $phone, ')
          ..write('address: $address, ')
          ..write('customerType: $customerType, ')
          ..write('subscriptionDate: $subscriptionDate, ')
          ..write('customerStatus: $customerStatus, ')
          ..write('plan: $plan, ')
          ..write('planValue: $planValue')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    createdAt,
    updatedAt,
    deletedAt,
    isDeleted,
    companyId,
    name,
    phone,
    address,
    customerType,
    subscriptionDate,
    customerStatus,
    plan,
    planValue,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Customer &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.isDeleted == this.isDeleted &&
          other.companyId == this.companyId &&
          other.name == this.name &&
          other.phone == this.phone &&
          other.address == this.address &&
          other.customerType == this.customerType &&
          other.subscriptionDate == this.subscriptionDate &&
          other.customerStatus == this.customerStatus &&
          other.plan == this.plan &&
          other.planValue == this.planValue);
}

class CustomersCompanion extends UpdateCompanion<Customer> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<bool> isDeleted;
  final Value<String> companyId;
  final Value<String> name;
  final Value<String?> phone;
  final Value<String?> address;
  final Value<String> customerType;
  final Value<DateTime> subscriptionDate;
  final Value<String> customerStatus;
  final Value<String> plan;
  final Value<double> planValue;
  final Value<int> rowid;
  const CustomersCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.companyId = const Value.absent(),
    this.name = const Value.absent(),
    this.phone = const Value.absent(),
    this.address = const Value.absent(),
    this.customerType = const Value.absent(),
    this.subscriptionDate = const Value.absent(),
    this.customerStatus = const Value.absent(),
    this.plan = const Value.absent(),
    this.planValue = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CustomersCompanion.insert({
    required String id,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    required bool isDeleted,
    required String companyId,
    required String name,
    this.phone = const Value.absent(),
    this.address = const Value.absent(),
    required String customerType,
    required DateTime subscriptionDate,
    required String customerStatus,
    required String plan,
    required double planValue,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt),
       isDeleted = Value(isDeleted),
       companyId = Value(companyId),
       name = Value(name),
       customerType = Value(customerType),
       subscriptionDate = Value(subscriptionDate),
       customerStatus = Value(customerStatus),
       plan = Value(plan),
       planValue = Value(planValue);
  static Insertable<Customer> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<bool>? isDeleted,
    Expression<String>? companyId,
    Expression<String>? name,
    Expression<String>? phone,
    Expression<String>? address,
    Expression<String>? customerType,
    Expression<DateTime>? subscriptionDate,
    Expression<String>? customerStatus,
    Expression<String>? plan,
    Expression<double>? planValue,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (companyId != null) 'company_id': companyId,
      if (name != null) 'name': name,
      if (phone != null) 'phone': phone,
      if (address != null) 'address': address,
      if (customerType != null) 'customer_type': customerType,
      if (subscriptionDate != null) 'subscription_date': subscriptionDate,
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
    Value<DateTime?>? deletedAt,
    Value<bool>? isDeleted,
    Value<String>? companyId,
    Value<String>? name,
    Value<String?>? phone,
    Value<String?>? address,
    Value<String>? customerType,
    Value<DateTime>? subscriptionDate,
    Value<String>? customerStatus,
    Value<String>? plan,
    Value<double>? planValue,
    Value<int>? rowid,
  }) {
    return CustomersCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      isDeleted: isDeleted ?? this.isDeleted,
      companyId: companyId ?? this.companyId,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      customerType: customerType ?? this.customerType,
      subscriptionDate: subscriptionDate ?? this.subscriptionDate,
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
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (companyId.present) {
      map['company_id'] = Variable<String>(companyId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (customerType.present) {
      map['customer_type'] = Variable<String>(customerType.value);
    }
    if (subscriptionDate.present) {
      map['subscription_date'] = Variable<DateTime>(subscriptionDate.value);
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
          ..write('deletedAt: $deletedAt, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('companyId: $companyId, ')
          ..write('name: $name, ')
          ..write('phone: $phone, ')
          ..write('address: $address, ')
          ..write('customerType: $customerType, ')
          ..write('subscriptionDate: $subscriptionDate, ')
          ..write('customerStatus: $customerStatus, ')
          ..write('plan: $plan, ')
          ..write('planValue: $planValue, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ExpensesTable extends Expenses with TableInfo<$ExpensesTable, Expense> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExpensesTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isDeletedMeta = const VerificationMeta(
    'isDeleted',
  );
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
    'is_deleted',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_deleted" IN (0, 1))',
    ),
  );
  static const VerificationMeta _companyIdMeta = const VerificationMeta(
    'companyId',
  );
  @override
  late final GeneratedColumn<String> companyId = GeneratedColumn<String>(
    'company_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fuelExpenseMeta = const VerificationMeta(
    'fuelExpense',
  );
  @override
  late final GeneratedColumn<double> fuelExpense = GeneratedColumn<double>(
    'fuel_expense',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _maintenanceExpensesMeta =
      const VerificationMeta('maintenanceExpenses');
  @override
  late final GeneratedColumn<double> maintenanceExpenses =
      GeneratedColumn<double>(
        'maintenance_expenses',
        aliasedName,
        false,
        type: DriftSqlType.double,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _employeesExpensesMeta = const VerificationMeta(
    'employeesExpenses',
  );
  @override
  late final GeneratedColumn<double> employeesExpenses =
      GeneratedColumn<double>(
        'employees_expenses',
        aliasedName,
        false,
        type: DriftSqlType.double,
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
    deletedAt,
    isDeleted,
    companyId,
    fuelExpense,
    maintenanceExpenses,
    employeesExpenses,
    expenseDate,
    notes,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'expenses';
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
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('is_deleted')) {
      context.handle(
        _isDeletedMeta,
        isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta),
      );
    } else if (isInserting) {
      context.missing(_isDeletedMeta);
    }
    if (data.containsKey('company_id')) {
      context.handle(
        _companyIdMeta,
        companyId.isAcceptableOrUnknown(data['company_id']!, _companyIdMeta),
      );
    } else if (isInserting) {
      context.missing(_companyIdMeta);
    }
    if (data.containsKey('fuel_expense')) {
      context.handle(
        _fuelExpenseMeta,
        fuelExpense.isAcceptableOrUnknown(
          data['fuel_expense']!,
          _fuelExpenseMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_fuelExpenseMeta);
    }
    if (data.containsKey('maintenance_expenses')) {
      context.handle(
        _maintenanceExpensesMeta,
        maintenanceExpenses.isAcceptableOrUnknown(
          data['maintenance_expenses']!,
          _maintenanceExpensesMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_maintenanceExpensesMeta);
    }
    if (data.containsKey('employees_expenses')) {
      context.handle(
        _employeesExpensesMeta,
        employeesExpenses.isAcceptableOrUnknown(
          data['employees_expenses']!,
          _employeesExpensesMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_employeesExpensesMeta);
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
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      isDeleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_deleted'],
      )!,
      companyId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}company_id'],
      )!,
      fuelExpense: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}fuel_expense'],
      )!,
      maintenanceExpenses: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}maintenance_expenses'],
      )!,
      employeesExpenses: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}employees_expenses'],
      )!,
      expenseDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}expense_date'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
    );
  }

  @override
  $ExpensesTable createAlias(String alias) {
    return $ExpensesTable(attachedDatabase, alias);
  }
}

class Expense extends DataClass implements Insertable<Expense> {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final bool isDeleted;
  final String companyId;
  final double fuelExpense;
  final double maintenanceExpenses;
  final double employeesExpenses;
  final DateTime expenseDate;
  final String? notes;
  const Expense({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.isDeleted,
    required this.companyId,
    required this.fuelExpense,
    required this.maintenanceExpenses,
    required this.employeesExpenses,
    required this.expenseDate,
    this.notes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['is_deleted'] = Variable<bool>(isDeleted);
    map['company_id'] = Variable<String>(companyId);
    map['fuel_expense'] = Variable<double>(fuelExpense);
    map['maintenance_expenses'] = Variable<double>(maintenanceExpenses);
    map['employees_expenses'] = Variable<double>(employeesExpenses);
    map['expense_date'] = Variable<DateTime>(expenseDate);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  ExpensesCompanion toCompanion(bool nullToAbsent) {
    return ExpensesCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      isDeleted: Value(isDeleted),
      companyId: Value(companyId),
      fuelExpense: Value(fuelExpense),
      maintenanceExpenses: Value(maintenanceExpenses),
      employeesExpenses: Value(employeesExpenses),
      expenseDate: Value(expenseDate),
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
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
      companyId: serializer.fromJson<String>(json['companyId']),
      fuelExpense: serializer.fromJson<double>(json['fuelExpense']),
      maintenanceExpenses: serializer.fromJson<double>(
        json['maintenanceExpenses'],
      ),
      employeesExpenses: serializer.fromJson<double>(json['employeesExpenses']),
      expenseDate: serializer.fromJson<DateTime>(json['expenseDate']),
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
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'isDeleted': serializer.toJson<bool>(isDeleted),
      'companyId': serializer.toJson<String>(companyId),
      'fuelExpense': serializer.toJson<double>(fuelExpense),
      'maintenanceExpenses': serializer.toJson<double>(maintenanceExpenses),
      'employeesExpenses': serializer.toJson<double>(employeesExpenses),
      'expenseDate': serializer.toJson<DateTime>(expenseDate),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  Expense copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    bool? isDeleted,
    String? companyId,
    double? fuelExpense,
    double? maintenanceExpenses,
    double? employeesExpenses,
    DateTime? expenseDate,
    Value<String?> notes = const Value.absent(),
  }) => Expense(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    isDeleted: isDeleted ?? this.isDeleted,
    companyId: companyId ?? this.companyId,
    fuelExpense: fuelExpense ?? this.fuelExpense,
    maintenanceExpenses: maintenanceExpenses ?? this.maintenanceExpenses,
    employeesExpenses: employeesExpenses ?? this.employeesExpenses,
    expenseDate: expenseDate ?? this.expenseDate,
    notes: notes.present ? notes.value : this.notes,
  );
  Expense copyWithCompanion(ExpensesCompanion data) {
    return Expense(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
      companyId: data.companyId.present ? data.companyId.value : this.companyId,
      fuelExpense: data.fuelExpense.present
          ? data.fuelExpense.value
          : this.fuelExpense,
      maintenanceExpenses: data.maintenanceExpenses.present
          ? data.maintenanceExpenses.value
          : this.maintenanceExpenses,
      employeesExpenses: data.employeesExpenses.present
          ? data.employeesExpenses.value
          : this.employeesExpenses,
      expenseDate: data.expenseDate.present
          ? data.expenseDate.value
          : this.expenseDate,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Expense(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('companyId: $companyId, ')
          ..write('fuelExpense: $fuelExpense, ')
          ..write('maintenanceExpenses: $maintenanceExpenses, ')
          ..write('employeesExpenses: $employeesExpenses, ')
          ..write('expenseDate: $expenseDate, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    createdAt,
    updatedAt,
    deletedAt,
    isDeleted,
    companyId,
    fuelExpense,
    maintenanceExpenses,
    employeesExpenses,
    expenseDate,
    notes,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Expense &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.isDeleted == this.isDeleted &&
          other.companyId == this.companyId &&
          other.fuelExpense == this.fuelExpense &&
          other.maintenanceExpenses == this.maintenanceExpenses &&
          other.employeesExpenses == this.employeesExpenses &&
          other.expenseDate == this.expenseDate &&
          other.notes == this.notes);
}

class ExpensesCompanion extends UpdateCompanion<Expense> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<bool> isDeleted;
  final Value<String> companyId;
  final Value<double> fuelExpense;
  final Value<double> maintenanceExpenses;
  final Value<double> employeesExpenses;
  final Value<DateTime> expenseDate;
  final Value<String?> notes;
  final Value<int> rowid;
  const ExpensesCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.companyId = const Value.absent(),
    this.fuelExpense = const Value.absent(),
    this.maintenanceExpenses = const Value.absent(),
    this.employeesExpenses = const Value.absent(),
    this.expenseDate = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ExpensesCompanion.insert({
    required String id,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    required bool isDeleted,
    required String companyId,
    required double fuelExpense,
    required double maintenanceExpenses,
    required double employeesExpenses,
    required DateTime expenseDate,
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt),
       isDeleted = Value(isDeleted),
       companyId = Value(companyId),
       fuelExpense = Value(fuelExpense),
       maintenanceExpenses = Value(maintenanceExpenses),
       employeesExpenses = Value(employeesExpenses),
       expenseDate = Value(expenseDate);
  static Insertable<Expense> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<bool>? isDeleted,
    Expression<String>? companyId,
    Expression<double>? fuelExpense,
    Expression<double>? maintenanceExpenses,
    Expression<double>? employeesExpenses,
    Expression<DateTime>? expenseDate,
    Expression<String>? notes,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (companyId != null) 'company_id': companyId,
      if (fuelExpense != null) 'fuel_expense': fuelExpense,
      if (maintenanceExpenses != null)
        'maintenance_expenses': maintenanceExpenses,
      if (employeesExpenses != null) 'employees_expenses': employeesExpenses,
      if (expenseDate != null) 'expense_date': expenseDate,
      if (notes != null) 'notes': notes,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ExpensesCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<bool>? isDeleted,
    Value<String>? companyId,
    Value<double>? fuelExpense,
    Value<double>? maintenanceExpenses,
    Value<double>? employeesExpenses,
    Value<DateTime>? expenseDate,
    Value<String?>? notes,
    Value<int>? rowid,
  }) {
    return ExpensesCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      isDeleted: isDeleted ?? this.isDeleted,
      companyId: companyId ?? this.companyId,
      fuelExpense: fuelExpense ?? this.fuelExpense,
      maintenanceExpenses: maintenanceExpenses ?? this.maintenanceExpenses,
      employeesExpenses: employeesExpenses ?? this.employeesExpenses,
      expenseDate: expenseDate ?? this.expenseDate,
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
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (companyId.present) {
      map['company_id'] = Variable<String>(companyId.value);
    }
    if (fuelExpense.present) {
      map['fuel_expense'] = Variable<double>(fuelExpense.value);
    }
    if (maintenanceExpenses.present) {
      map['maintenance_expenses'] = Variable<double>(maintenanceExpenses.value);
    }
    if (employeesExpenses.present) {
      map['employees_expenses'] = Variable<double>(employeesExpenses.value);
    }
    if (expenseDate.present) {
      map['expense_date'] = Variable<DateTime>(expenseDate.value);
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
    return (StringBuffer('ExpensesCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('companyId: $companyId, ')
          ..write('fuelExpense: $fuelExpense, ')
          ..write('maintenanceExpenses: $maintenanceExpenses, ')
          ..write('employeesExpenses: $employeesExpenses, ')
          ..write('expenseDate: $expenseDate, ')
          ..write('notes: $notes, ')
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
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isDeletedMeta = const VerificationMeta(
    'isDeleted',
  );
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
    'is_deleted',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_deleted" IN (0, 1))',
    ),
  );
  static const VerificationMeta _companyIdMeta = const VerificationMeta(
    'companyId',
  );
  @override
  late final GeneratedColumn<String> companyId = GeneratedColumn<String>(
    'company_id',
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
  static const VerificationMeta _invoiceStatusMeta = const VerificationMeta(
    'invoiceStatus',
  );
  @override
  late final GeneratedColumn<String> invoiceStatus = GeneratedColumn<String>(
    'invoice_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    createdAt,
    updatedAt,
    deletedAt,
    isDeleted,
    companyId,
    customerId,
    issueDate,
    dueDate,
    fixedCharge,
    tva,
    totalAmount,
    paidAmount,
    amountDue,
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
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('is_deleted')) {
      context.handle(
        _isDeletedMeta,
        isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta),
      );
    } else if (isInserting) {
      context.missing(_isDeletedMeta);
    }
    if (data.containsKey('company_id')) {
      context.handle(
        _companyIdMeta,
        companyId.isAcceptableOrUnknown(data['company_id']!, _companyIdMeta),
      );
    } else if (isInserting) {
      context.missing(_companyIdMeta);
    }
    if (data.containsKey('customer_id')) {
      context.handle(
        _customerIdMeta,
        customerId.isAcceptableOrUnknown(data['customer_id']!, _customerIdMeta),
      );
    } else if (isInserting) {
      context.missing(_customerIdMeta);
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
    if (data.containsKey('invoice_status')) {
      context.handle(
        _invoiceStatusMeta,
        invoiceStatus.isAcceptableOrUnknown(
          data['invoice_status']!,
          _invoiceStatusMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_invoiceStatusMeta);
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
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      isDeleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_deleted'],
      )!,
      companyId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}company_id'],
      )!,
      customerId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}customer_id'],
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
  final DateTime? deletedAt;
  final bool isDeleted;
  final String companyId;
  final String customerId;
  final DateTime issueDate;
  final DateTime dueDate;
  final double fixedCharge;
  final double tva;
  final double totalAmount;
  final double paidAmount;
  final double amountDue;
  final String invoiceStatus;
  const Invoice({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.isDeleted,
    required this.companyId,
    required this.customerId,
    required this.issueDate,
    required this.dueDate,
    required this.fixedCharge,
    required this.tva,
    required this.totalAmount,
    required this.paidAmount,
    required this.amountDue,
    required this.invoiceStatus,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['is_deleted'] = Variable<bool>(isDeleted);
    map['company_id'] = Variable<String>(companyId);
    map['customer_id'] = Variable<String>(customerId);
    map['issue_date'] = Variable<DateTime>(issueDate);
    map['due_date'] = Variable<DateTime>(dueDate);
    map['fixed_charge'] = Variable<double>(fixedCharge);
    map['tva'] = Variable<double>(tva);
    map['total_amount'] = Variable<double>(totalAmount);
    map['paid_amount'] = Variable<double>(paidAmount);
    map['amount_due'] = Variable<double>(amountDue);
    map['invoice_status'] = Variable<String>(invoiceStatus);
    return map;
  }

  InvoicesCompanion toCompanion(bool nullToAbsent) {
    return InvoicesCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      isDeleted: Value(isDeleted),
      companyId: Value(companyId),
      customerId: Value(customerId),
      issueDate: Value(issueDate),
      dueDate: Value(dueDate),
      fixedCharge: Value(fixedCharge),
      tva: Value(tva),
      totalAmount: Value(totalAmount),
      paidAmount: Value(paidAmount),
      amountDue: Value(amountDue),
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
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
      companyId: serializer.fromJson<String>(json['companyId']),
      customerId: serializer.fromJson<String>(json['customerId']),
      issueDate: serializer.fromJson<DateTime>(json['issueDate']),
      dueDate: serializer.fromJson<DateTime>(json['dueDate']),
      fixedCharge: serializer.fromJson<double>(json['fixedCharge']),
      tva: serializer.fromJson<double>(json['tva']),
      totalAmount: serializer.fromJson<double>(json['totalAmount']),
      paidAmount: serializer.fromJson<double>(json['paidAmount']),
      amountDue: serializer.fromJson<double>(json['amountDue']),
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
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'isDeleted': serializer.toJson<bool>(isDeleted),
      'companyId': serializer.toJson<String>(companyId),
      'customerId': serializer.toJson<String>(customerId),
      'issueDate': serializer.toJson<DateTime>(issueDate),
      'dueDate': serializer.toJson<DateTime>(dueDate),
      'fixedCharge': serializer.toJson<double>(fixedCharge),
      'tva': serializer.toJson<double>(tva),
      'totalAmount': serializer.toJson<double>(totalAmount),
      'paidAmount': serializer.toJson<double>(paidAmount),
      'amountDue': serializer.toJson<double>(amountDue),
      'invoiceStatus': serializer.toJson<String>(invoiceStatus),
    };
  }

  Invoice copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    bool? isDeleted,
    String? companyId,
    String? customerId,
    DateTime? issueDate,
    DateTime? dueDate,
    double? fixedCharge,
    double? tva,
    double? totalAmount,
    double? paidAmount,
    double? amountDue,
    String? invoiceStatus,
  }) => Invoice(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    isDeleted: isDeleted ?? this.isDeleted,
    companyId: companyId ?? this.companyId,
    customerId: customerId ?? this.customerId,
    issueDate: issueDate ?? this.issueDate,
    dueDate: dueDate ?? this.dueDate,
    fixedCharge: fixedCharge ?? this.fixedCharge,
    tva: tva ?? this.tva,
    totalAmount: totalAmount ?? this.totalAmount,
    paidAmount: paidAmount ?? this.paidAmount,
    amountDue: amountDue ?? this.amountDue,
    invoiceStatus: invoiceStatus ?? this.invoiceStatus,
  );
  Invoice copyWithCompanion(InvoicesCompanion data) {
    return Invoice(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
      companyId: data.companyId.present ? data.companyId.value : this.companyId,
      customerId: data.customerId.present
          ? data.customerId.value
          : this.customerId,
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
          ..write('deletedAt: $deletedAt, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('companyId: $companyId, ')
          ..write('customerId: $customerId, ')
          ..write('issueDate: $issueDate, ')
          ..write('dueDate: $dueDate, ')
          ..write('fixedCharge: $fixedCharge, ')
          ..write('tva: $tva, ')
          ..write('totalAmount: $totalAmount, ')
          ..write('paidAmount: $paidAmount, ')
          ..write('amountDue: $amountDue, ')
          ..write('invoiceStatus: $invoiceStatus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    createdAt,
    updatedAt,
    deletedAt,
    isDeleted,
    companyId,
    customerId,
    issueDate,
    dueDate,
    fixedCharge,
    tva,
    totalAmount,
    paidAmount,
    amountDue,
    invoiceStatus,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Invoice &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.isDeleted == this.isDeleted &&
          other.companyId == this.companyId &&
          other.customerId == this.customerId &&
          other.issueDate == this.issueDate &&
          other.dueDate == this.dueDate &&
          other.fixedCharge == this.fixedCharge &&
          other.tva == this.tva &&
          other.totalAmount == this.totalAmount &&
          other.paidAmount == this.paidAmount &&
          other.amountDue == this.amountDue &&
          other.invoiceStatus == this.invoiceStatus);
}

class InvoicesCompanion extends UpdateCompanion<Invoice> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<bool> isDeleted;
  final Value<String> companyId;
  final Value<String> customerId;
  final Value<DateTime> issueDate;
  final Value<DateTime> dueDate;
  final Value<double> fixedCharge;
  final Value<double> tva;
  final Value<double> totalAmount;
  final Value<double> paidAmount;
  final Value<double> amountDue;
  final Value<String> invoiceStatus;
  final Value<int> rowid;
  const InvoicesCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.companyId = const Value.absent(),
    this.customerId = const Value.absent(),
    this.issueDate = const Value.absent(),
    this.dueDate = const Value.absent(),
    this.fixedCharge = const Value.absent(),
    this.tva = const Value.absent(),
    this.totalAmount = const Value.absent(),
    this.paidAmount = const Value.absent(),
    this.amountDue = const Value.absent(),
    this.invoiceStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  InvoicesCompanion.insert({
    required String id,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    required bool isDeleted,
    required String companyId,
    required String customerId,
    required DateTime issueDate,
    required DateTime dueDate,
    required double fixedCharge,
    required double tva,
    required double totalAmount,
    required double paidAmount,
    required double amountDue,
    required String invoiceStatus,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt),
       isDeleted = Value(isDeleted),
       companyId = Value(companyId),
       customerId = Value(customerId),
       issueDate = Value(issueDate),
       dueDate = Value(dueDate),
       fixedCharge = Value(fixedCharge),
       tva = Value(tva),
       totalAmount = Value(totalAmount),
       paidAmount = Value(paidAmount),
       amountDue = Value(amountDue),
       invoiceStatus = Value(invoiceStatus);
  static Insertable<Invoice> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<bool>? isDeleted,
    Expression<String>? companyId,
    Expression<String>? customerId,
    Expression<DateTime>? issueDate,
    Expression<DateTime>? dueDate,
    Expression<double>? fixedCharge,
    Expression<double>? tva,
    Expression<double>? totalAmount,
    Expression<double>? paidAmount,
    Expression<double>? amountDue,
    Expression<String>? invoiceStatus,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (companyId != null) 'company_id': companyId,
      if (customerId != null) 'customer_id': customerId,
      if (issueDate != null) 'issue_date': issueDate,
      if (dueDate != null) 'due_date': dueDate,
      if (fixedCharge != null) 'fixed_charge': fixedCharge,
      if (tva != null) 'tva': tva,
      if (totalAmount != null) 'total_amount': totalAmount,
      if (paidAmount != null) 'paid_amount': paidAmount,
      if (amountDue != null) 'amount_due': amountDue,
      if (invoiceStatus != null) 'invoice_status': invoiceStatus,
      if (rowid != null) 'rowid': rowid,
    });
  }

  InvoicesCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<bool>? isDeleted,
    Value<String>? companyId,
    Value<String>? customerId,
    Value<DateTime>? issueDate,
    Value<DateTime>? dueDate,
    Value<double>? fixedCharge,
    Value<double>? tva,
    Value<double>? totalAmount,
    Value<double>? paidAmount,
    Value<double>? amountDue,
    Value<String>? invoiceStatus,
    Value<int>? rowid,
  }) {
    return InvoicesCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      isDeleted: isDeleted ?? this.isDeleted,
      companyId: companyId ?? this.companyId,
      customerId: customerId ?? this.customerId,
      issueDate: issueDate ?? this.issueDate,
      dueDate: dueDate ?? this.dueDate,
      fixedCharge: fixedCharge ?? this.fixedCharge,
      tva: tva ?? this.tva,
      totalAmount: totalAmount ?? this.totalAmount,
      paidAmount: paidAmount ?? this.paidAmount,
      amountDue: amountDue ?? this.amountDue,
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
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (companyId.present) {
      map['company_id'] = Variable<String>(companyId.value);
    }
    if (customerId.present) {
      map['customer_id'] = Variable<String>(customerId.value);
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
          ..write('deletedAt: $deletedAt, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('companyId: $companyId, ')
          ..write('customerId: $customerId, ')
          ..write('issueDate: $issueDate, ')
          ..write('dueDate: $dueDate, ')
          ..write('fixedCharge: $fixedCharge, ')
          ..write('tva: $tva, ')
          ..write('totalAmount: $totalAmount, ')
          ..write('paidAmount: $paidAmount, ')
          ..write('amountDue: $amountDue, ')
          ..write('invoiceStatus: $invoiceStatus, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $OtherExpensesTable extends OtherExpenses
    with TableInfo<$OtherExpensesTable, OtherExpense> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OtherExpensesTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isDeletedMeta = const VerificationMeta(
    'isDeleted',
  );
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
    'is_deleted',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_deleted" IN (0, 1))',
    ),
  );
  static const VerificationMeta _companyIdMeta = const VerificationMeta(
    'companyId',
  );
  @override
  late final GeneratedColumn<String> companyId = GeneratedColumn<String>(
    'company_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _expenseIdMeta = const VerificationMeta(
    'expenseId',
  );
  @override
  late final GeneratedColumn<String> expenseId = GeneratedColumn<String>(
    'expense_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
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
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
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
    deletedAt,
    isDeleted,
    companyId,
    expenseId,
    amount,
    type,
    description,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'other_expenses';
  @override
  VerificationContext validateIntegrity(
    Insertable<OtherExpense> instance, {
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
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('is_deleted')) {
      context.handle(
        _isDeletedMeta,
        isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta),
      );
    } else if (isInserting) {
      context.missing(_isDeletedMeta);
    }
    if (data.containsKey('company_id')) {
      context.handle(
        _companyIdMeta,
        companyId.isAcceptableOrUnknown(data['company_id']!, _companyIdMeta),
      );
    } else if (isInserting) {
      context.missing(_companyIdMeta);
    }
    if (data.containsKey('expense_id')) {
      context.handle(
        _expenseIdMeta,
        expenseId.isAcceptableOrUnknown(data['expense_id']!, _expenseIdMeta),
      );
    } else if (isInserting) {
      context.missing(_expenseIdMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OtherExpense map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OtherExpense(
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
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      isDeleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_deleted'],
      )!,
      companyId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}company_id'],
      )!,
      expenseId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}expense_id'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}amount'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
    );
  }

  @override
  $OtherExpensesTable createAlias(String alias) {
    return $OtherExpensesTable(attachedDatabase, alias);
  }
}

class OtherExpense extends DataClass implements Insertable<OtherExpense> {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final bool isDeleted;
  final String companyId;
  final String expenseId;
  final double amount;
  final String type;
  final String? description;
  const OtherExpense({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.isDeleted,
    required this.companyId,
    required this.expenseId,
    required this.amount,
    required this.type,
    this.description,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['is_deleted'] = Variable<bool>(isDeleted);
    map['company_id'] = Variable<String>(companyId);
    map['expense_id'] = Variable<String>(expenseId);
    map['amount'] = Variable<double>(amount);
    map['type'] = Variable<String>(type);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    return map;
  }

  OtherExpensesCompanion toCompanion(bool nullToAbsent) {
    return OtherExpensesCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      isDeleted: Value(isDeleted),
      companyId: Value(companyId),
      expenseId: Value(expenseId),
      amount: Value(amount),
      type: Value(type),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
    );
  }

  factory OtherExpense.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OtherExpense(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
      companyId: serializer.fromJson<String>(json['companyId']),
      expenseId: serializer.fromJson<String>(json['expenseId']),
      amount: serializer.fromJson<double>(json['amount']),
      type: serializer.fromJson<String>(json['type']),
      description: serializer.fromJson<String?>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'isDeleted': serializer.toJson<bool>(isDeleted),
      'companyId': serializer.toJson<String>(companyId),
      'expenseId': serializer.toJson<String>(expenseId),
      'amount': serializer.toJson<double>(amount),
      'type': serializer.toJson<String>(type),
      'description': serializer.toJson<String?>(description),
    };
  }

  OtherExpense copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    bool? isDeleted,
    String? companyId,
    String? expenseId,
    double? amount,
    String? type,
    Value<String?> description = const Value.absent(),
  }) => OtherExpense(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    isDeleted: isDeleted ?? this.isDeleted,
    companyId: companyId ?? this.companyId,
    expenseId: expenseId ?? this.expenseId,
    amount: amount ?? this.amount,
    type: type ?? this.type,
    description: description.present ? description.value : this.description,
  );
  OtherExpense copyWithCompanion(OtherExpensesCompanion data) {
    return OtherExpense(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
      companyId: data.companyId.present ? data.companyId.value : this.companyId,
      expenseId: data.expenseId.present ? data.expenseId.value : this.expenseId,
      amount: data.amount.present ? data.amount.value : this.amount,
      type: data.type.present ? data.type.value : this.type,
      description: data.description.present
          ? data.description.value
          : this.description,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OtherExpense(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('companyId: $companyId, ')
          ..write('expenseId: $expenseId, ')
          ..write('amount: $amount, ')
          ..write('type: $type, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    createdAt,
    updatedAt,
    deletedAt,
    isDeleted,
    companyId,
    expenseId,
    amount,
    type,
    description,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OtherExpense &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.isDeleted == this.isDeleted &&
          other.companyId == this.companyId &&
          other.expenseId == this.expenseId &&
          other.amount == this.amount &&
          other.type == this.type &&
          other.description == this.description);
}

class OtherExpensesCompanion extends UpdateCompanion<OtherExpense> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<bool> isDeleted;
  final Value<String> companyId;
  final Value<String> expenseId;
  final Value<double> amount;
  final Value<String> type;
  final Value<String?> description;
  final Value<int> rowid;
  const OtherExpensesCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.companyId = const Value.absent(),
    this.expenseId = const Value.absent(),
    this.amount = const Value.absent(),
    this.type = const Value.absent(),
    this.description = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  OtherExpensesCompanion.insert({
    required String id,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    required bool isDeleted,
    required String companyId,
    required String expenseId,
    required double amount,
    required String type,
    this.description = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt),
       isDeleted = Value(isDeleted),
       companyId = Value(companyId),
       expenseId = Value(expenseId),
       amount = Value(amount),
       type = Value(type);
  static Insertable<OtherExpense> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<bool>? isDeleted,
    Expression<String>? companyId,
    Expression<String>? expenseId,
    Expression<double>? amount,
    Expression<String>? type,
    Expression<String>? description,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (companyId != null) 'company_id': companyId,
      if (expenseId != null) 'expense_id': expenseId,
      if (amount != null) 'amount': amount,
      if (type != null) 'type': type,
      if (description != null) 'description': description,
      if (rowid != null) 'rowid': rowid,
    });
  }

  OtherExpensesCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<bool>? isDeleted,
    Value<String>? companyId,
    Value<String>? expenseId,
    Value<double>? amount,
    Value<String>? type,
    Value<String?>? description,
    Value<int>? rowid,
  }) {
    return OtherExpensesCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      isDeleted: isDeleted ?? this.isDeleted,
      companyId: companyId ?? this.companyId,
      expenseId: expenseId ?? this.expenseId,
      amount: amount ?? this.amount,
      type: type ?? this.type,
      description: description ?? this.description,
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
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (companyId.present) {
      map['company_id'] = Variable<String>(companyId.value);
    }
    if (expenseId.present) {
      map['expense_id'] = Variable<String>(expenseId.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OtherExpensesCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('companyId: $companyId, ')
          ..write('expenseId: $expenseId, ')
          ..write('amount: $amount, ')
          ..write('type: $type, ')
          ..write('description: $description, ')
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
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isDeletedMeta = const VerificationMeta(
    'isDeleted',
  );
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
    'is_deleted',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_deleted" IN (0, 1))',
    ),
  );
  static const VerificationMeta _companyIdMeta = const VerificationMeta(
    'companyId',
  );
  @override
  late final GeneratedColumn<String> companyId = GeneratedColumn<String>(
    'company_id',
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
    deletedAt,
    isDeleted,
    companyId,
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
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('is_deleted')) {
      context.handle(
        _isDeletedMeta,
        isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta),
      );
    } else if (isInserting) {
      context.missing(_isDeletedMeta);
    }
    if (data.containsKey('company_id')) {
      context.handle(
        _companyIdMeta,
        companyId.isAcceptableOrUnknown(data['company_id']!, _companyIdMeta),
      );
    } else if (isInserting) {
      context.missing(_companyIdMeta);
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
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      isDeleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_deleted'],
      )!,
      companyId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}company_id'],
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
  final DateTime? deletedAt;
  final bool isDeleted;
  final String companyId;
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
    this.deletedAt,
    required this.isDeleted,
    required this.companyId,
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
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['is_deleted'] = Variable<bool>(isDeleted);
    map['company_id'] = Variable<String>(companyId);
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
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      isDeleted: Value(isDeleted),
      companyId: Value(companyId),
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
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
      companyId: serializer.fromJson<String>(json['companyId']),
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
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'isDeleted': serializer.toJson<bool>(isDeleted),
      'companyId': serializer.toJson<String>(companyId),
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
    Value<DateTime?> deletedAt = const Value.absent(),
    bool? isDeleted,
    String? companyId,
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
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    isDeleted: isDeleted ?? this.isDeleted,
    companyId: companyId ?? this.companyId,
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
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
      companyId: data.companyId.present ? data.companyId.value : this.companyId,
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
          ..write('deletedAt: $deletedAt, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('companyId: $companyId, ')
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
    deletedAt,
    isDeleted,
    companyId,
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
          other.deletedAt == this.deletedAt &&
          other.isDeleted == this.isDeleted &&
          other.companyId == this.companyId &&
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
  final Value<DateTime?> deletedAt;
  final Value<bool> isDeleted;
  final Value<String> companyId;
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
    this.deletedAt = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.companyId = const Value.absent(),
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
    this.deletedAt = const Value.absent(),
    required bool isDeleted,
    required String companyId,
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
       isDeleted = Value(isDeleted),
       companyId = Value(companyId),
       customerId = Value(customerId),
       invoiceId = Value(invoiceId),
       amount = Value(amount),
       paymentMethod = Value(paymentMethod),
       paymentDate = Value(paymentDate);
  static Insertable<Payment> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<bool>? isDeleted,
    Expression<String>? companyId,
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
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (companyId != null) 'company_id': companyId,
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
    Value<DateTime?>? deletedAt,
    Value<bool>? isDeleted,
    Value<String>? companyId,
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
      deletedAt: deletedAt ?? this.deletedAt,
      isDeleted: isDeleted ?? this.isDeleted,
      companyId: companyId ?? this.companyId,
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
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (companyId.present) {
      map['company_id'] = Variable<String>(companyId.value);
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
          ..write('deletedAt: $deletedAt, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('companyId: $companyId, ')
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

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $AppUsersTable appUsers = $AppUsersTable(this);
  late final $CompanyPreferencesTable companyPreferences =
      $CompanyPreferencesTable(this);
  late final $CustomersTable customers = $CustomersTable(this);
  late final $ExpensesTable expenses = $ExpensesTable(this);
  late final $InvoicesTable invoices = $InvoicesTable(this);
  late final $OtherExpensesTable otherExpenses = $OtherExpensesTable(this);
  late final $PaymentsTable payments = $PaymentsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    appUsers,
    companyPreferences,
    customers,
    expenses,
    invoices,
    otherExpenses,
    payments,
  ];
}

typedef $$AppUsersTableCreateCompanionBuilder =
    AppUsersCompanion Function({
      required String id,
      Value<String?> email,
      Value<String?> phoneNumber,
      required bool isBanned,
      required String companyName,
      Value<String?> logoUrl,
      Value<int> rowid,
    });
typedef $$AppUsersTableUpdateCompanionBuilder =
    AppUsersCompanion Function({
      Value<String> id,
      Value<String?> email,
      Value<String?> phoneNumber,
      Value<bool> isBanned,
      Value<String> companyName,
      Value<String?> logoUrl,
      Value<int> rowid,
    });

class $$AppUsersTableFilterComposer
    extends Composer<_$AppDatabase, $AppUsersTable> {
  $$AppUsersTableFilterComposer({
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

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phoneNumber => $composableBuilder(
    column: $table.phoneNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isBanned => $composableBuilder(
    column: $table.isBanned,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get companyName => $composableBuilder(
    column: $table.companyName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get logoUrl => $composableBuilder(
    column: $table.logoUrl,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AppUsersTableOrderingComposer
    extends Composer<_$AppDatabase, $AppUsersTable> {
  $$AppUsersTableOrderingComposer({
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

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phoneNumber => $composableBuilder(
    column: $table.phoneNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isBanned => $composableBuilder(
    column: $table.isBanned,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get companyName => $composableBuilder(
    column: $table.companyName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get logoUrl => $composableBuilder(
    column: $table.logoUrl,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AppUsersTableAnnotationComposer
    extends Composer<_$AppDatabase, $AppUsersTable> {
  $$AppUsersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get phoneNumber => $composableBuilder(
    column: $table.phoneNumber,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isBanned =>
      $composableBuilder(column: $table.isBanned, builder: (column) => column);

  GeneratedColumn<String> get companyName => $composableBuilder(
    column: $table.companyName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get logoUrl =>
      $composableBuilder(column: $table.logoUrl, builder: (column) => column);
}

class $$AppUsersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AppUsersTable,
          AppUser,
          $$AppUsersTableFilterComposer,
          $$AppUsersTableOrderingComposer,
          $$AppUsersTableAnnotationComposer,
          $$AppUsersTableCreateCompanionBuilder,
          $$AppUsersTableUpdateCompanionBuilder,
          (AppUser, BaseReferences<_$AppDatabase, $AppUsersTable, AppUser>),
          AppUser,
          PrefetchHooks Function()
        > {
  $$AppUsersTableTableManager(_$AppDatabase db, $AppUsersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AppUsersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AppUsersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AppUsersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<String?> phoneNumber = const Value.absent(),
                Value<bool> isBanned = const Value.absent(),
                Value<String> companyName = const Value.absent(),
                Value<String?> logoUrl = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AppUsersCompanion(
                id: id,
                email: email,
                phoneNumber: phoneNumber,
                isBanned: isBanned,
                companyName: companyName,
                logoUrl: logoUrl,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<String?> email = const Value.absent(),
                Value<String?> phoneNumber = const Value.absent(),
                required bool isBanned,
                required String companyName,
                Value<String?> logoUrl = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AppUsersCompanion.insert(
                id: id,
                email: email,
                phoneNumber: phoneNumber,
                isBanned: isBanned,
                companyName: companyName,
                logoUrl: logoUrl,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AppUsersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AppUsersTable,
      AppUser,
      $$AppUsersTableFilterComposer,
      $$AppUsersTableOrderingComposer,
      $$AppUsersTableAnnotationComposer,
      $$AppUsersTableCreateCompanionBuilder,
      $$AppUsersTableUpdateCompanionBuilder,
      (AppUser, BaseReferences<_$AppDatabase, $AppUsersTable, AppUser>),
      AppUser,
      PrefetchHooks Function()
    >;
typedef $$CompanyPreferencesTableCreateCompanionBuilder =
    CompanyPreferencesCompanion Function({
      required String id,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<DateTime?> deletedAt,
      required bool isDeleted,
      required String companyId,
      required double pricePerKilowat,
      required double pricePerAmp,
      required double fixedCharge,
      required double tva,
      required String language,
      required int triggerDate,
      Value<String?> triggerMessage,
      Value<int> rowid,
    });
typedef $$CompanyPreferencesTableUpdateCompanionBuilder =
    CompanyPreferencesCompanion Function({
      Value<String> id,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<bool> isDeleted,
      Value<String> companyId,
      Value<double> pricePerKilowat,
      Value<double> pricePerAmp,
      Value<double> fixedCharge,
      Value<double> tva,
      Value<String> language,
      Value<int> triggerDate,
      Value<String?> triggerMessage,
      Value<int> rowid,
    });

class $$CompanyPreferencesTableFilterComposer
    extends Composer<_$AppDatabase, $CompanyPreferencesTable> {
  $$CompanyPreferencesTableFilterComposer({
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

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get companyId => $composableBuilder(
    column: $table.companyId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get pricePerKilowat => $composableBuilder(
    column: $table.pricePerKilowat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get pricePerAmp => $composableBuilder(
    column: $table.pricePerAmp,
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

  ColumnFilters<String> get language => $composableBuilder(
    column: $table.language,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get triggerDate => $composableBuilder(
    column: $table.triggerDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get triggerMessage => $composableBuilder(
    column: $table.triggerMessage,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CompanyPreferencesTableOrderingComposer
    extends Composer<_$AppDatabase, $CompanyPreferencesTable> {
  $$CompanyPreferencesTableOrderingComposer({
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

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get companyId => $composableBuilder(
    column: $table.companyId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get pricePerKilowat => $composableBuilder(
    column: $table.pricePerKilowat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get pricePerAmp => $composableBuilder(
    column: $table.pricePerAmp,
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

  ColumnOrderings<String> get language => $composableBuilder(
    column: $table.language,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get triggerDate => $composableBuilder(
    column: $table.triggerDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get triggerMessage => $composableBuilder(
    column: $table.triggerMessage,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CompanyPreferencesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CompanyPreferencesTable> {
  $$CompanyPreferencesTableAnnotationComposer({
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

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);

  GeneratedColumn<String> get companyId =>
      $composableBuilder(column: $table.companyId, builder: (column) => column);

  GeneratedColumn<double> get pricePerKilowat => $composableBuilder(
    column: $table.pricePerKilowat,
    builder: (column) => column,
  );

  GeneratedColumn<double> get pricePerAmp => $composableBuilder(
    column: $table.pricePerAmp,
    builder: (column) => column,
  );

  GeneratedColumn<double> get fixedCharge => $composableBuilder(
    column: $table.fixedCharge,
    builder: (column) => column,
  );

  GeneratedColumn<double> get tva =>
      $composableBuilder(column: $table.tva, builder: (column) => column);

  GeneratedColumn<String> get language =>
      $composableBuilder(column: $table.language, builder: (column) => column);

  GeneratedColumn<int> get triggerDate => $composableBuilder(
    column: $table.triggerDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get triggerMessage => $composableBuilder(
    column: $table.triggerMessage,
    builder: (column) => column,
  );
}

class $$CompanyPreferencesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CompanyPreferencesTable,
          CompanyPreference,
          $$CompanyPreferencesTableFilterComposer,
          $$CompanyPreferencesTableOrderingComposer,
          $$CompanyPreferencesTableAnnotationComposer,
          $$CompanyPreferencesTableCreateCompanionBuilder,
          $$CompanyPreferencesTableUpdateCompanionBuilder,
          (
            CompanyPreference,
            BaseReferences<
              _$AppDatabase,
              $CompanyPreferencesTable,
              CompanyPreference
            >,
          ),
          CompanyPreference,
          PrefetchHooks Function()
        > {
  $$CompanyPreferencesTableTableManager(
    _$AppDatabase db,
    $CompanyPreferencesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CompanyPreferencesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CompanyPreferencesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CompanyPreferencesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                Value<String> companyId = const Value.absent(),
                Value<double> pricePerKilowat = const Value.absent(),
                Value<double> pricePerAmp = const Value.absent(),
                Value<double> fixedCharge = const Value.absent(),
                Value<double> tva = const Value.absent(),
                Value<String> language = const Value.absent(),
                Value<int> triggerDate = const Value.absent(),
                Value<String?> triggerMessage = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CompanyPreferencesCompanion(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                isDeleted: isDeleted,
                companyId: companyId,
                pricePerKilowat: pricePerKilowat,
                pricePerAmp: pricePerAmp,
                fixedCharge: fixedCharge,
                tva: tva,
                language: language,
                triggerDate: triggerDate,
                triggerMessage: triggerMessage,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<DateTime?> deletedAt = const Value.absent(),
                required bool isDeleted,
                required String companyId,
                required double pricePerKilowat,
                required double pricePerAmp,
                required double fixedCharge,
                required double tva,
                required String language,
                required int triggerDate,
                Value<String?> triggerMessage = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CompanyPreferencesCompanion.insert(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                isDeleted: isDeleted,
                companyId: companyId,
                pricePerKilowat: pricePerKilowat,
                pricePerAmp: pricePerAmp,
                fixedCharge: fixedCharge,
                tva: tva,
                language: language,
                triggerDate: triggerDate,
                triggerMessage: triggerMessage,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CompanyPreferencesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CompanyPreferencesTable,
      CompanyPreference,
      $$CompanyPreferencesTableFilterComposer,
      $$CompanyPreferencesTableOrderingComposer,
      $$CompanyPreferencesTableAnnotationComposer,
      $$CompanyPreferencesTableCreateCompanionBuilder,
      $$CompanyPreferencesTableUpdateCompanionBuilder,
      (
        CompanyPreference,
        BaseReferences<
          _$AppDatabase,
          $CompanyPreferencesTable,
          CompanyPreference
        >,
      ),
      CompanyPreference,
      PrefetchHooks Function()
    >;
typedef $$CustomersTableCreateCompanionBuilder =
    CustomersCompanion Function({
      required String id,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<DateTime?> deletedAt,
      required bool isDeleted,
      required String companyId,
      required String name,
      Value<String?> phone,
      Value<String?> address,
      required String customerType,
      required DateTime subscriptionDate,
      required String customerStatus,
      required String plan,
      required double planValue,
      Value<int> rowid,
    });
typedef $$CustomersTableUpdateCompanionBuilder =
    CustomersCompanion Function({
      Value<String> id,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<bool> isDeleted,
      Value<String> companyId,
      Value<String> name,
      Value<String?> phone,
      Value<String?> address,
      Value<String> customerType,
      Value<DateTime> subscriptionDate,
      Value<String> customerStatus,
      Value<String> plan,
      Value<double> planValue,
      Value<int> rowid,
    });

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

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get companyId => $composableBuilder(
    column: $table.companyId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
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

  ColumnFilters<String> get customerType => $composableBuilder(
    column: $table.customerType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get subscriptionDate => $composableBuilder(
    column: $table.subscriptionDate,
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

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get companyId => $composableBuilder(
    column: $table.companyId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
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

  ColumnOrderings<String> get customerType => $composableBuilder(
    column: $table.customerType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get subscriptionDate => $composableBuilder(
    column: $table.subscriptionDate,
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

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);

  GeneratedColumn<String> get companyId =>
      $composableBuilder(column: $table.companyId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<String> get customerType => $composableBuilder(
    column: $table.customerType,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get subscriptionDate => $composableBuilder(
    column: $table.subscriptionDate,
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
          (Customer, BaseReferences<_$AppDatabase, $CustomersTable, Customer>),
          Customer,
          PrefetchHooks Function()
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
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                Value<String> companyId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                Value<String?> address = const Value.absent(),
                Value<String> customerType = const Value.absent(),
                Value<DateTime> subscriptionDate = const Value.absent(),
                Value<String> customerStatus = const Value.absent(),
                Value<String> plan = const Value.absent(),
                Value<double> planValue = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CustomersCompanion(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                isDeleted: isDeleted,
                companyId: companyId,
                name: name,
                phone: phone,
                address: address,
                customerType: customerType,
                subscriptionDate: subscriptionDate,
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
                Value<DateTime?> deletedAt = const Value.absent(),
                required bool isDeleted,
                required String companyId,
                required String name,
                Value<String?> phone = const Value.absent(),
                Value<String?> address = const Value.absent(),
                required String customerType,
                required DateTime subscriptionDate,
                required String customerStatus,
                required String plan,
                required double planValue,
                Value<int> rowid = const Value.absent(),
              }) => CustomersCompanion.insert(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                isDeleted: isDeleted,
                companyId: companyId,
                name: name,
                phone: phone,
                address: address,
                customerType: customerType,
                subscriptionDate: subscriptionDate,
                customerStatus: customerStatus,
                plan: plan,
                planValue: planValue,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
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
      (Customer, BaseReferences<_$AppDatabase, $CustomersTable, Customer>),
      Customer,
      PrefetchHooks Function()
    >;
typedef $$ExpensesTableCreateCompanionBuilder =
    ExpensesCompanion Function({
      required String id,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<DateTime?> deletedAt,
      required bool isDeleted,
      required String companyId,
      required double fuelExpense,
      required double maintenanceExpenses,
      required double employeesExpenses,
      required DateTime expenseDate,
      Value<String?> notes,
      Value<int> rowid,
    });
typedef $$ExpensesTableUpdateCompanionBuilder =
    ExpensesCompanion Function({
      Value<String> id,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<bool> isDeleted,
      Value<String> companyId,
      Value<double> fuelExpense,
      Value<double> maintenanceExpenses,
      Value<double> employeesExpenses,
      Value<DateTime> expenseDate,
      Value<String?> notes,
      Value<int> rowid,
    });

class $$ExpensesTableFilterComposer
    extends Composer<_$AppDatabase, $ExpensesTable> {
  $$ExpensesTableFilterComposer({
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

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get companyId => $composableBuilder(
    column: $table.companyId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get fuelExpense => $composableBuilder(
    column: $table.fuelExpense,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get maintenanceExpenses => $composableBuilder(
    column: $table.maintenanceExpenses,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get employeesExpenses => $composableBuilder(
    column: $table.employeesExpenses,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get expenseDate => $composableBuilder(
    column: $table.expenseDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ExpensesTableOrderingComposer
    extends Composer<_$AppDatabase, $ExpensesTable> {
  $$ExpensesTableOrderingComposer({
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

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get companyId => $composableBuilder(
    column: $table.companyId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get fuelExpense => $composableBuilder(
    column: $table.fuelExpense,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get maintenanceExpenses => $composableBuilder(
    column: $table.maintenanceExpenses,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get employeesExpenses => $composableBuilder(
    column: $table.employeesExpenses,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get expenseDate => $composableBuilder(
    column: $table.expenseDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ExpensesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ExpensesTable> {
  $$ExpensesTableAnnotationComposer({
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

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);

  GeneratedColumn<String> get companyId =>
      $composableBuilder(column: $table.companyId, builder: (column) => column);

  GeneratedColumn<double> get fuelExpense => $composableBuilder(
    column: $table.fuelExpense,
    builder: (column) => column,
  );

  GeneratedColumn<double> get maintenanceExpenses => $composableBuilder(
    column: $table.maintenanceExpenses,
    builder: (column) => column,
  );

  GeneratedColumn<double> get employeesExpenses => $composableBuilder(
    column: $table.employeesExpenses,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get expenseDate => $composableBuilder(
    column: $table.expenseDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);
}

class $$ExpensesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ExpensesTable,
          Expense,
          $$ExpensesTableFilterComposer,
          $$ExpensesTableOrderingComposer,
          $$ExpensesTableAnnotationComposer,
          $$ExpensesTableCreateCompanionBuilder,
          $$ExpensesTableUpdateCompanionBuilder,
          (Expense, BaseReferences<_$AppDatabase, $ExpensesTable, Expense>),
          Expense,
          PrefetchHooks Function()
        > {
  $$ExpensesTableTableManager(_$AppDatabase db, $ExpensesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ExpensesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ExpensesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ExpensesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                Value<String> companyId = const Value.absent(),
                Value<double> fuelExpense = const Value.absent(),
                Value<double> maintenanceExpenses = const Value.absent(),
                Value<double> employeesExpenses = const Value.absent(),
                Value<DateTime> expenseDate = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ExpensesCompanion(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                isDeleted: isDeleted,
                companyId: companyId,
                fuelExpense: fuelExpense,
                maintenanceExpenses: maintenanceExpenses,
                employeesExpenses: employeesExpenses,
                expenseDate: expenseDate,
                notes: notes,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<DateTime?> deletedAt = const Value.absent(),
                required bool isDeleted,
                required String companyId,
                required double fuelExpense,
                required double maintenanceExpenses,
                required double employeesExpenses,
                required DateTime expenseDate,
                Value<String?> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ExpensesCompanion.insert(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                isDeleted: isDeleted,
                companyId: companyId,
                fuelExpense: fuelExpense,
                maintenanceExpenses: maintenanceExpenses,
                employeesExpenses: employeesExpenses,
                expenseDate: expenseDate,
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

typedef $$ExpensesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ExpensesTable,
      Expense,
      $$ExpensesTableFilterComposer,
      $$ExpensesTableOrderingComposer,
      $$ExpensesTableAnnotationComposer,
      $$ExpensesTableCreateCompanionBuilder,
      $$ExpensesTableUpdateCompanionBuilder,
      (Expense, BaseReferences<_$AppDatabase, $ExpensesTable, Expense>),
      Expense,
      PrefetchHooks Function()
    >;
typedef $$InvoicesTableCreateCompanionBuilder =
    InvoicesCompanion Function({
      required String id,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<DateTime?> deletedAt,
      required bool isDeleted,
      required String companyId,
      required String customerId,
      required DateTime issueDate,
      required DateTime dueDate,
      required double fixedCharge,
      required double tva,
      required double totalAmount,
      required double paidAmount,
      required double amountDue,
      required String invoiceStatus,
      Value<int> rowid,
    });
typedef $$InvoicesTableUpdateCompanionBuilder =
    InvoicesCompanion Function({
      Value<String> id,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<bool> isDeleted,
      Value<String> companyId,
      Value<String> customerId,
      Value<DateTime> issueDate,
      Value<DateTime> dueDate,
      Value<double> fixedCharge,
      Value<double> tva,
      Value<double> totalAmount,
      Value<double> paidAmount,
      Value<double> amountDue,
      Value<String> invoiceStatus,
      Value<int> rowid,
    });

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

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get companyId => $composableBuilder(
    column: $table.companyId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get customerId => $composableBuilder(
    column: $table.customerId,
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

  ColumnFilters<String> get invoiceStatus => $composableBuilder(
    column: $table.invoiceStatus,
    builder: (column) => ColumnFilters(column),
  );
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

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get companyId => $composableBuilder(
    column: $table.companyId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get customerId => $composableBuilder(
    column: $table.customerId,
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

  ColumnOrderings<String> get invoiceStatus => $composableBuilder(
    column: $table.invoiceStatus,
    builder: (column) => ColumnOrderings(column),
  );
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

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);

  GeneratedColumn<String> get companyId =>
      $composableBuilder(column: $table.companyId, builder: (column) => column);

  GeneratedColumn<String> get customerId => $composableBuilder(
    column: $table.customerId,
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

  GeneratedColumn<String> get invoiceStatus => $composableBuilder(
    column: $table.invoiceStatus,
    builder: (column) => column,
  );
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
          (Invoice, BaseReferences<_$AppDatabase, $InvoicesTable, Invoice>),
          Invoice,
          PrefetchHooks Function()
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
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                Value<String> companyId = const Value.absent(),
                Value<String> customerId = const Value.absent(),
                Value<DateTime> issueDate = const Value.absent(),
                Value<DateTime> dueDate = const Value.absent(),
                Value<double> fixedCharge = const Value.absent(),
                Value<double> tva = const Value.absent(),
                Value<double> totalAmount = const Value.absent(),
                Value<double> paidAmount = const Value.absent(),
                Value<double> amountDue = const Value.absent(),
                Value<String> invoiceStatus = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => InvoicesCompanion(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                isDeleted: isDeleted,
                companyId: companyId,
                customerId: customerId,
                issueDate: issueDate,
                dueDate: dueDate,
                fixedCharge: fixedCharge,
                tva: tva,
                totalAmount: totalAmount,
                paidAmount: paidAmount,
                amountDue: amountDue,
                invoiceStatus: invoiceStatus,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<DateTime?> deletedAt = const Value.absent(),
                required bool isDeleted,
                required String companyId,
                required String customerId,
                required DateTime issueDate,
                required DateTime dueDate,
                required double fixedCharge,
                required double tva,
                required double totalAmount,
                required double paidAmount,
                required double amountDue,
                required String invoiceStatus,
                Value<int> rowid = const Value.absent(),
              }) => InvoicesCompanion.insert(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                isDeleted: isDeleted,
                companyId: companyId,
                customerId: customerId,
                issueDate: issueDate,
                dueDate: dueDate,
                fixedCharge: fixedCharge,
                tva: tva,
                totalAmount: totalAmount,
                paidAmount: paidAmount,
                amountDue: amountDue,
                invoiceStatus: invoiceStatus,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
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
      (Invoice, BaseReferences<_$AppDatabase, $InvoicesTable, Invoice>),
      Invoice,
      PrefetchHooks Function()
    >;
typedef $$OtherExpensesTableCreateCompanionBuilder =
    OtherExpensesCompanion Function({
      required String id,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<DateTime?> deletedAt,
      required bool isDeleted,
      required String companyId,
      required String expenseId,
      required double amount,
      required String type,
      Value<String?> description,
      Value<int> rowid,
    });
typedef $$OtherExpensesTableUpdateCompanionBuilder =
    OtherExpensesCompanion Function({
      Value<String> id,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<bool> isDeleted,
      Value<String> companyId,
      Value<String> expenseId,
      Value<double> amount,
      Value<String> type,
      Value<String?> description,
      Value<int> rowid,
    });

class $$OtherExpensesTableFilterComposer
    extends Composer<_$AppDatabase, $OtherExpensesTable> {
  $$OtherExpensesTableFilterComposer({
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

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get companyId => $composableBuilder(
    column: $table.companyId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get expenseId => $composableBuilder(
    column: $table.expenseId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );
}

class $$OtherExpensesTableOrderingComposer
    extends Composer<_$AppDatabase, $OtherExpensesTable> {
  $$OtherExpensesTableOrderingComposer({
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

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get companyId => $composableBuilder(
    column: $table.companyId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get expenseId => $composableBuilder(
    column: $table.expenseId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$OtherExpensesTableAnnotationComposer
    extends Composer<_$AppDatabase, $OtherExpensesTable> {
  $$OtherExpensesTableAnnotationComposer({
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

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);

  GeneratedColumn<String> get companyId =>
      $composableBuilder(column: $table.companyId, builder: (column) => column);

  GeneratedColumn<String> get expenseId =>
      $composableBuilder(column: $table.expenseId, builder: (column) => column);

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );
}

class $$OtherExpensesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $OtherExpensesTable,
          OtherExpense,
          $$OtherExpensesTableFilterComposer,
          $$OtherExpensesTableOrderingComposer,
          $$OtherExpensesTableAnnotationComposer,
          $$OtherExpensesTableCreateCompanionBuilder,
          $$OtherExpensesTableUpdateCompanionBuilder,
          (
            OtherExpense,
            BaseReferences<_$AppDatabase, $OtherExpensesTable, OtherExpense>,
          ),
          OtherExpense,
          PrefetchHooks Function()
        > {
  $$OtherExpensesTableTableManager(_$AppDatabase db, $OtherExpensesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$OtherExpensesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$OtherExpensesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$OtherExpensesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                Value<String> companyId = const Value.absent(),
                Value<String> expenseId = const Value.absent(),
                Value<double> amount = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => OtherExpensesCompanion(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                isDeleted: isDeleted,
                companyId: companyId,
                expenseId: expenseId,
                amount: amount,
                type: type,
                description: description,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<DateTime?> deletedAt = const Value.absent(),
                required bool isDeleted,
                required String companyId,
                required String expenseId,
                required double amount,
                required String type,
                Value<String?> description = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => OtherExpensesCompanion.insert(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                isDeleted: isDeleted,
                companyId: companyId,
                expenseId: expenseId,
                amount: amount,
                type: type,
                description: description,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$OtherExpensesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $OtherExpensesTable,
      OtherExpense,
      $$OtherExpensesTableFilterComposer,
      $$OtherExpensesTableOrderingComposer,
      $$OtherExpensesTableAnnotationComposer,
      $$OtherExpensesTableCreateCompanionBuilder,
      $$OtherExpensesTableUpdateCompanionBuilder,
      (
        OtherExpense,
        BaseReferences<_$AppDatabase, $OtherExpensesTable, OtherExpense>,
      ),
      OtherExpense,
      PrefetchHooks Function()
    >;
typedef $$PaymentsTableCreateCompanionBuilder =
    PaymentsCompanion Function({
      required String id,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<DateTime?> deletedAt,
      required bool isDeleted,
      required String companyId,
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
      Value<DateTime?> deletedAt,
      Value<bool> isDeleted,
      Value<String> companyId,
      Value<String> customerId,
      Value<String> invoiceId,
      Value<double> amount,
      Value<String> paymentMethod,
      Value<DateTime> paymentDate,
      Value<String?> notes,
      Value<int> rowid,
    });

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

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get companyId => $composableBuilder(
    column: $table.companyId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get customerId => $composableBuilder(
    column: $table.customerId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get invoiceId => $composableBuilder(
    column: $table.invoiceId,
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

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get companyId => $composableBuilder(
    column: $table.companyId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get customerId => $composableBuilder(
    column: $table.customerId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get invoiceId => $composableBuilder(
    column: $table.invoiceId,
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

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);

  GeneratedColumn<String> get companyId =>
      $composableBuilder(column: $table.companyId, builder: (column) => column);

  GeneratedColumn<String> get customerId => $composableBuilder(
    column: $table.customerId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get invoiceId =>
      $composableBuilder(column: $table.invoiceId, builder: (column) => column);

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
          (Payment, BaseReferences<_$AppDatabase, $PaymentsTable, Payment>),
          Payment,
          PrefetchHooks Function()
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
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                Value<String> companyId = const Value.absent(),
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
                deletedAt: deletedAt,
                isDeleted: isDeleted,
                companyId: companyId,
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
                Value<DateTime?> deletedAt = const Value.absent(),
                required bool isDeleted,
                required String companyId,
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
                deletedAt: deletedAt,
                isDeleted: isDeleted,
                companyId: companyId,
                customerId: customerId,
                invoiceId: invoiceId,
                amount: amount,
                paymentMethod: paymentMethod,
                paymentDate: paymentDate,
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
      (Payment, BaseReferences<_$AppDatabase, $PaymentsTable, Payment>),
      Payment,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$AppUsersTableTableManager get appUsers =>
      $$AppUsersTableTableManager(_db, _db.appUsers);
  $$CompanyPreferencesTableTableManager get companyPreferences =>
      $$CompanyPreferencesTableTableManager(_db, _db.companyPreferences);
  $$CustomersTableTableManager get customers =>
      $$CustomersTableTableManager(_db, _db.customers);
  $$ExpensesTableTableManager get expenses =>
      $$ExpensesTableTableManager(_db, _db.expenses);
  $$InvoicesTableTableManager get invoices =>
      $$InvoicesTableTableManager(_db, _db.invoices);
  $$OtherExpensesTableTableManager get otherExpenses =>
      $$OtherExpensesTableTableManager(_db, _db.otherExpenses);
  $$PaymentsTableTableManager get payments =>
      $$PaymentsTableTableManager(_db, _db.payments);
}
