// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $UserProfilesTable extends UserProfiles
    with TableInfo<$UserProfilesTable, UserProfile> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserProfilesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
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
  static const VerificationMeta _birthDateMeta = const VerificationMeta(
    'birthDate',
  );
  @override
  late final GeneratedColumn<DateTime> birthDate = GeneratedColumn<DateTime>(
    'birth_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sexMeta = const VerificationMeta('sex');
  @override
  late final GeneratedColumn<String> sex = GeneratedColumn<String>(
    'sex',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _heightMeta = const VerificationMeta('height');
  @override
  late final GeneratedColumn<double> height = GeneratedColumn<double>(
    'height',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _weightMeta = const VerificationMeta('weight');
  @override
  late final GeneratedColumn<double> weight = GeneratedColumn<double>(
    'weight',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _diagnosisMeta = const VerificationMeta(
    'diagnosis',
  );
  @override
  late final GeneratedColumn<String> diagnosis = GeneratedColumn<String>(
    'diagnosis',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('EPOC'),
  );
  static const VerificationMeta _copdStageMeta = const VerificationMeta(
    'copdStage',
  );
  @override
  late final GeneratedColumn<String> copdStage = GeneratedColumn<String>(
    'copd_stage',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _fev1Meta = const VerificationMeta('fev1');
  @override
  late final GeneratedColumn<double> fev1 = GeneratedColumn<double>(
    'fev1',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _usesOxygenMeta = const VerificationMeta(
    'usesOxygen',
  );
  @override
  late final GeneratedColumn<bool> usesOxygen = GeneratedColumn<bool>(
    'uses_oxygen',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("uses_oxygen" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _usesPulseOximeterMeta = const VerificationMeta(
    'usesPulseOximeter',
  );
  @override
  late final GeneratedColumn<bool> usesPulseOximeter = GeneratedColumn<bool>(
    'uses_pulse_oximeter',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("uses_pulse_oximeter" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _regularMedicationMeta = const VerificationMeta(
    'regularMedication',
  );
  @override
  late final GeneratedColumn<String> regularMedication =
      GeneratedColumn<String>(
        'regular_medication',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _rescueInhalerMeta = const VerificationMeta(
    'rescueInhaler',
  );
  @override
  late final GeneratedColumn<String> rescueInhaler = GeneratedColumn<String>(
    'rescue_inhaler',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _rescueUsageFrequencyMeta =
      const VerificationMeta('rescueUsageFrequency');
  @override
  late final GeneratedColumn<int> rescueUsageFrequency = GeneratedColumn<int>(
    'rescue_usage_frequency',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _wakesUpBreathlessMeta = const VerificationMeta(
    'wakesUpBreathless',
  );
  @override
  late final GeneratedColumn<bool> wakesUpBreathless = GeneratedColumn<bool>(
    'wakes_up_breathless',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("wakes_up_breathless" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _snoresMeta = const VerificationMeta('snores');
  @override
  late final GeneratedColumn<bool> snores = GeneratedColumn<bool>(
    'snores',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("snores" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _hasAnxietyMeta = const VerificationMeta(
    'hasAnxiety',
  );
  @override
  late final GeneratedColumn<bool> hasAnxiety = GeneratedColumn<bool>(
    'has_anxiety',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("has_anxiety" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _physicalActivityLevelMeta =
      const VerificationMeta('physicalActivityLevel');
  @override
  late final GeneratedColumn<String> physicalActivityLevel =
      GeneratedColumn<String>(
        'physical_activity_level',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _canWalkFlatMeta = const VerificationMeta(
    'canWalkFlat',
  );
  @override
  late final GeneratedColumn<bool> canWalkFlat = GeneratedColumn<bool>(
    'can_walk_flat',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("can_walk_flat" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _canClimbStairsMeta = const VerificationMeta(
    'canClimbStairs',
  );
  @override
  late final GeneratedColumn<bool> canClimbStairs = GeneratedColumn<bool>(
    'can_climb_stairs',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("can_climb_stairs" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _makesFrequentPausesMeta =
      const VerificationMeta('makesFrequentPauses');
  @override
  late final GeneratedColumn<bool> makesFrequentPauses = GeneratedColumn<bool>(
    'makes_frequent_pauses',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("makes_frequent_pauses" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _preferredStartHourMeta =
      const VerificationMeta('preferredStartHour');
  @override
  late final GeneratedColumn<int> preferredStartHour = GeneratedColumn<int>(
    'preferred_start_hour',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(8),
  );
  static const VerificationMeta _sleepHourMeta = const VerificationMeta(
    'sleepHour',
  );
  @override
  late final GeneratedColumn<int> sleepHour = GeneratedColumn<int>(
    'sleep_hour',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(22),
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
    requiredDuringInsert: false,
    defaultValue: const Constant('es'),
  );
  static const VerificationMeta _techLevelMeta = const VerificationMeta(
    'techLevel',
  );
  @override
  late final GeneratedColumn<String> techLevel = GeneratedColumn<String>(
    'tech_level',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('bajo'),
  );
  static const VerificationMeta _cityMeta = const VerificationMeta('city');
  @override
  late final GeneratedColumn<String> city = GeneratedColumn<String>(
    'city',
    aliasedName,
    true,
    type: DriftSqlType.string,
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
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
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
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    birthDate,
    sex,
    height,
    weight,
    diagnosis,
    copdStage,
    fev1,
    usesOxygen,
    usesPulseOximeter,
    regularMedication,
    rescueInhaler,
    rescueUsageFrequency,
    wakesUpBreathless,
    snores,
    hasAnxiety,
    physicalActivityLevel,
    canWalkFlat,
    canClimbStairs,
    makesFrequentPauses,
    preferredStartHour,
    sleepHour,
    language,
    techLevel,
    city,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_profiles';
  @override
  VerificationContext validateIntegrity(
    Insertable<UserProfile> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('birth_date')) {
      context.handle(
        _birthDateMeta,
        birthDate.isAcceptableOrUnknown(data['birth_date']!, _birthDateMeta),
      );
    }
    if (data.containsKey('sex')) {
      context.handle(
        _sexMeta,
        sex.isAcceptableOrUnknown(data['sex']!, _sexMeta),
      );
    }
    if (data.containsKey('height')) {
      context.handle(
        _heightMeta,
        height.isAcceptableOrUnknown(data['height']!, _heightMeta),
      );
    }
    if (data.containsKey('weight')) {
      context.handle(
        _weightMeta,
        weight.isAcceptableOrUnknown(data['weight']!, _weightMeta),
      );
    }
    if (data.containsKey('diagnosis')) {
      context.handle(
        _diagnosisMeta,
        diagnosis.isAcceptableOrUnknown(data['diagnosis']!, _diagnosisMeta),
      );
    }
    if (data.containsKey('copd_stage')) {
      context.handle(
        _copdStageMeta,
        copdStage.isAcceptableOrUnknown(data['copd_stage']!, _copdStageMeta),
      );
    }
    if (data.containsKey('fev1')) {
      context.handle(
        _fev1Meta,
        fev1.isAcceptableOrUnknown(data['fev1']!, _fev1Meta),
      );
    }
    if (data.containsKey('uses_oxygen')) {
      context.handle(
        _usesOxygenMeta,
        usesOxygen.isAcceptableOrUnknown(data['uses_oxygen']!, _usesOxygenMeta),
      );
    }
    if (data.containsKey('uses_pulse_oximeter')) {
      context.handle(
        _usesPulseOximeterMeta,
        usesPulseOximeter.isAcceptableOrUnknown(
          data['uses_pulse_oximeter']!,
          _usesPulseOximeterMeta,
        ),
      );
    }
    if (data.containsKey('regular_medication')) {
      context.handle(
        _regularMedicationMeta,
        regularMedication.isAcceptableOrUnknown(
          data['regular_medication']!,
          _regularMedicationMeta,
        ),
      );
    }
    if (data.containsKey('rescue_inhaler')) {
      context.handle(
        _rescueInhalerMeta,
        rescueInhaler.isAcceptableOrUnknown(
          data['rescue_inhaler']!,
          _rescueInhalerMeta,
        ),
      );
    }
    if (data.containsKey('rescue_usage_frequency')) {
      context.handle(
        _rescueUsageFrequencyMeta,
        rescueUsageFrequency.isAcceptableOrUnknown(
          data['rescue_usage_frequency']!,
          _rescueUsageFrequencyMeta,
        ),
      );
    }
    if (data.containsKey('wakes_up_breathless')) {
      context.handle(
        _wakesUpBreathlessMeta,
        wakesUpBreathless.isAcceptableOrUnknown(
          data['wakes_up_breathless']!,
          _wakesUpBreathlessMeta,
        ),
      );
    }
    if (data.containsKey('snores')) {
      context.handle(
        _snoresMeta,
        snores.isAcceptableOrUnknown(data['snores']!, _snoresMeta),
      );
    }
    if (data.containsKey('has_anxiety')) {
      context.handle(
        _hasAnxietyMeta,
        hasAnxiety.isAcceptableOrUnknown(data['has_anxiety']!, _hasAnxietyMeta),
      );
    }
    if (data.containsKey('physical_activity_level')) {
      context.handle(
        _physicalActivityLevelMeta,
        physicalActivityLevel.isAcceptableOrUnknown(
          data['physical_activity_level']!,
          _physicalActivityLevelMeta,
        ),
      );
    }
    if (data.containsKey('can_walk_flat')) {
      context.handle(
        _canWalkFlatMeta,
        canWalkFlat.isAcceptableOrUnknown(
          data['can_walk_flat']!,
          _canWalkFlatMeta,
        ),
      );
    }
    if (data.containsKey('can_climb_stairs')) {
      context.handle(
        _canClimbStairsMeta,
        canClimbStairs.isAcceptableOrUnknown(
          data['can_climb_stairs']!,
          _canClimbStairsMeta,
        ),
      );
    }
    if (data.containsKey('makes_frequent_pauses')) {
      context.handle(
        _makesFrequentPausesMeta,
        makesFrequentPauses.isAcceptableOrUnknown(
          data['makes_frequent_pauses']!,
          _makesFrequentPausesMeta,
        ),
      );
    }
    if (data.containsKey('preferred_start_hour')) {
      context.handle(
        _preferredStartHourMeta,
        preferredStartHour.isAcceptableOrUnknown(
          data['preferred_start_hour']!,
          _preferredStartHourMeta,
        ),
      );
    }
    if (data.containsKey('sleep_hour')) {
      context.handle(
        _sleepHourMeta,
        sleepHour.isAcceptableOrUnknown(data['sleep_hour']!, _sleepHourMeta),
      );
    }
    if (data.containsKey('language')) {
      context.handle(
        _languageMeta,
        language.isAcceptableOrUnknown(data['language']!, _languageMeta),
      );
    }
    if (data.containsKey('tech_level')) {
      context.handle(
        _techLevelMeta,
        techLevel.isAcceptableOrUnknown(data['tech_level']!, _techLevelMeta),
      );
    }
    if (data.containsKey('city')) {
      context.handle(
        _cityMeta,
        city.isAcceptableOrUnknown(data['city']!, _cityMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserProfile map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserProfile(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      birthDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}birth_date'],
      ),
      sex: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sex'],
      ),
      height: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}height'],
      ),
      weight: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}weight'],
      ),
      diagnosis:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}diagnosis'],
          )!,
      copdStage: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}copd_stage'],
      ),
      fev1: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}fev1'],
      ),
      usesOxygen:
          attachedDatabase.typeMapping.read(
            DriftSqlType.bool,
            data['${effectivePrefix}uses_oxygen'],
          )!,
      usesPulseOximeter:
          attachedDatabase.typeMapping.read(
            DriftSqlType.bool,
            data['${effectivePrefix}uses_pulse_oximeter'],
          )!,
      regularMedication: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}regular_medication'],
      ),
      rescueInhaler: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}rescue_inhaler'],
      ),
      rescueUsageFrequency: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}rescue_usage_frequency'],
      ),
      wakesUpBreathless:
          attachedDatabase.typeMapping.read(
            DriftSqlType.bool,
            data['${effectivePrefix}wakes_up_breathless'],
          )!,
      snores:
          attachedDatabase.typeMapping.read(
            DriftSqlType.bool,
            data['${effectivePrefix}snores'],
          )!,
      hasAnxiety:
          attachedDatabase.typeMapping.read(
            DriftSqlType.bool,
            data['${effectivePrefix}has_anxiety'],
          )!,
      physicalActivityLevel: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}physical_activity_level'],
      ),
      canWalkFlat:
          attachedDatabase.typeMapping.read(
            DriftSqlType.bool,
            data['${effectivePrefix}can_walk_flat'],
          )!,
      canClimbStairs:
          attachedDatabase.typeMapping.read(
            DriftSqlType.bool,
            data['${effectivePrefix}can_climb_stairs'],
          )!,
      makesFrequentPauses:
          attachedDatabase.typeMapping.read(
            DriftSqlType.bool,
            data['${effectivePrefix}makes_frequent_pauses'],
          )!,
      preferredStartHour:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}preferred_start_hour'],
          )!,
      sleepHour:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}sleep_hour'],
          )!,
      language:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}language'],
          )!,
      techLevel:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}tech_level'],
          )!,
      city: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}city'],
      ),
      createdAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}created_at'],
          )!,
      updatedAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}updated_at'],
          )!,
    );
  }

  @override
  $UserProfilesTable createAlias(String alias) {
    return $UserProfilesTable(attachedDatabase, alias);
  }
}

class UserProfile extends DataClass implements Insertable<UserProfile> {
  final int id;
  final String name;
  final DateTime? birthDate;
  final String? sex;
  final double? height;
  final double? weight;
  final String diagnosis;
  final String? copdStage;
  final double? fev1;
  final bool usesOxygen;
  final bool usesPulseOximeter;
  final String? regularMedication;
  final String? rescueInhaler;
  final int? rescueUsageFrequency;
  final bool wakesUpBreathless;
  final bool snores;
  final bool hasAnxiety;
  final String? physicalActivityLevel;
  final bool canWalkFlat;
  final bool canClimbStairs;
  final bool makesFrequentPauses;
  final int preferredStartHour;
  final int sleepHour;
  final String language;
  final String techLevel;
  final String? city;
  final DateTime createdAt;
  final DateTime updatedAt;
  const UserProfile({
    required this.id,
    required this.name,
    this.birthDate,
    this.sex,
    this.height,
    this.weight,
    required this.diagnosis,
    this.copdStage,
    this.fev1,
    required this.usesOxygen,
    required this.usesPulseOximeter,
    this.regularMedication,
    this.rescueInhaler,
    this.rescueUsageFrequency,
    required this.wakesUpBreathless,
    required this.snores,
    required this.hasAnxiety,
    this.physicalActivityLevel,
    required this.canWalkFlat,
    required this.canClimbStairs,
    required this.makesFrequentPauses,
    required this.preferredStartHour,
    required this.sleepHour,
    required this.language,
    required this.techLevel,
    this.city,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || birthDate != null) {
      map['birth_date'] = Variable<DateTime>(birthDate);
    }
    if (!nullToAbsent || sex != null) {
      map['sex'] = Variable<String>(sex);
    }
    if (!nullToAbsent || height != null) {
      map['height'] = Variable<double>(height);
    }
    if (!nullToAbsent || weight != null) {
      map['weight'] = Variable<double>(weight);
    }
    map['diagnosis'] = Variable<String>(diagnosis);
    if (!nullToAbsent || copdStage != null) {
      map['copd_stage'] = Variable<String>(copdStage);
    }
    if (!nullToAbsent || fev1 != null) {
      map['fev1'] = Variable<double>(fev1);
    }
    map['uses_oxygen'] = Variable<bool>(usesOxygen);
    map['uses_pulse_oximeter'] = Variable<bool>(usesPulseOximeter);
    if (!nullToAbsent || regularMedication != null) {
      map['regular_medication'] = Variable<String>(regularMedication);
    }
    if (!nullToAbsent || rescueInhaler != null) {
      map['rescue_inhaler'] = Variable<String>(rescueInhaler);
    }
    if (!nullToAbsent || rescueUsageFrequency != null) {
      map['rescue_usage_frequency'] = Variable<int>(rescueUsageFrequency);
    }
    map['wakes_up_breathless'] = Variable<bool>(wakesUpBreathless);
    map['snores'] = Variable<bool>(snores);
    map['has_anxiety'] = Variable<bool>(hasAnxiety);
    if (!nullToAbsent || physicalActivityLevel != null) {
      map['physical_activity_level'] = Variable<String>(physicalActivityLevel);
    }
    map['can_walk_flat'] = Variable<bool>(canWalkFlat);
    map['can_climb_stairs'] = Variable<bool>(canClimbStairs);
    map['makes_frequent_pauses'] = Variable<bool>(makesFrequentPauses);
    map['preferred_start_hour'] = Variable<int>(preferredStartHour);
    map['sleep_hour'] = Variable<int>(sleepHour);
    map['language'] = Variable<String>(language);
    map['tech_level'] = Variable<String>(techLevel);
    if (!nullToAbsent || city != null) {
      map['city'] = Variable<String>(city);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  UserProfilesCompanion toCompanion(bool nullToAbsent) {
    return UserProfilesCompanion(
      id: Value(id),
      name: Value(name),
      birthDate:
          birthDate == null && nullToAbsent
              ? const Value.absent()
              : Value(birthDate),
      sex: sex == null && nullToAbsent ? const Value.absent() : Value(sex),
      height:
          height == null && nullToAbsent ? const Value.absent() : Value(height),
      weight:
          weight == null && nullToAbsent ? const Value.absent() : Value(weight),
      diagnosis: Value(diagnosis),
      copdStage:
          copdStage == null && nullToAbsent
              ? const Value.absent()
              : Value(copdStage),
      fev1: fev1 == null && nullToAbsent ? const Value.absent() : Value(fev1),
      usesOxygen: Value(usesOxygen),
      usesPulseOximeter: Value(usesPulseOximeter),
      regularMedication:
          regularMedication == null && nullToAbsent
              ? const Value.absent()
              : Value(regularMedication),
      rescueInhaler:
          rescueInhaler == null && nullToAbsent
              ? const Value.absent()
              : Value(rescueInhaler),
      rescueUsageFrequency:
          rescueUsageFrequency == null && nullToAbsent
              ? const Value.absent()
              : Value(rescueUsageFrequency),
      wakesUpBreathless: Value(wakesUpBreathless),
      snores: Value(snores),
      hasAnxiety: Value(hasAnxiety),
      physicalActivityLevel:
          physicalActivityLevel == null && nullToAbsent
              ? const Value.absent()
              : Value(physicalActivityLevel),
      canWalkFlat: Value(canWalkFlat),
      canClimbStairs: Value(canClimbStairs),
      makesFrequentPauses: Value(makesFrequentPauses),
      preferredStartHour: Value(preferredStartHour),
      sleepHour: Value(sleepHour),
      language: Value(language),
      techLevel: Value(techLevel),
      city: city == null && nullToAbsent ? const Value.absent() : Value(city),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory UserProfile.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserProfile(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      birthDate: serializer.fromJson<DateTime?>(json['birthDate']),
      sex: serializer.fromJson<String?>(json['sex']),
      height: serializer.fromJson<double?>(json['height']),
      weight: serializer.fromJson<double?>(json['weight']),
      diagnosis: serializer.fromJson<String>(json['diagnosis']),
      copdStage: serializer.fromJson<String?>(json['copdStage']),
      fev1: serializer.fromJson<double?>(json['fev1']),
      usesOxygen: serializer.fromJson<bool>(json['usesOxygen']),
      usesPulseOximeter: serializer.fromJson<bool>(json['usesPulseOximeter']),
      regularMedication: serializer.fromJson<String?>(
        json['regularMedication'],
      ),
      rescueInhaler: serializer.fromJson<String?>(json['rescueInhaler']),
      rescueUsageFrequency: serializer.fromJson<int?>(
        json['rescueUsageFrequency'],
      ),
      wakesUpBreathless: serializer.fromJson<bool>(json['wakesUpBreathless']),
      snores: serializer.fromJson<bool>(json['snores']),
      hasAnxiety: serializer.fromJson<bool>(json['hasAnxiety']),
      physicalActivityLevel: serializer.fromJson<String?>(
        json['physicalActivityLevel'],
      ),
      canWalkFlat: serializer.fromJson<bool>(json['canWalkFlat']),
      canClimbStairs: serializer.fromJson<bool>(json['canClimbStairs']),
      makesFrequentPauses: serializer.fromJson<bool>(
        json['makesFrequentPauses'],
      ),
      preferredStartHour: serializer.fromJson<int>(json['preferredStartHour']),
      sleepHour: serializer.fromJson<int>(json['sleepHour']),
      language: serializer.fromJson<String>(json['language']),
      techLevel: serializer.fromJson<String>(json['techLevel']),
      city: serializer.fromJson<String?>(json['city']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'birthDate': serializer.toJson<DateTime?>(birthDate),
      'sex': serializer.toJson<String?>(sex),
      'height': serializer.toJson<double?>(height),
      'weight': serializer.toJson<double?>(weight),
      'diagnosis': serializer.toJson<String>(diagnosis),
      'copdStage': serializer.toJson<String?>(copdStage),
      'fev1': serializer.toJson<double?>(fev1),
      'usesOxygen': serializer.toJson<bool>(usesOxygen),
      'usesPulseOximeter': serializer.toJson<bool>(usesPulseOximeter),
      'regularMedication': serializer.toJson<String?>(regularMedication),
      'rescueInhaler': serializer.toJson<String?>(rescueInhaler),
      'rescueUsageFrequency': serializer.toJson<int?>(rescueUsageFrequency),
      'wakesUpBreathless': serializer.toJson<bool>(wakesUpBreathless),
      'snores': serializer.toJson<bool>(snores),
      'hasAnxiety': serializer.toJson<bool>(hasAnxiety),
      'physicalActivityLevel': serializer.toJson<String?>(
        physicalActivityLevel,
      ),
      'canWalkFlat': serializer.toJson<bool>(canWalkFlat),
      'canClimbStairs': serializer.toJson<bool>(canClimbStairs),
      'makesFrequentPauses': serializer.toJson<bool>(makesFrequentPauses),
      'preferredStartHour': serializer.toJson<int>(preferredStartHour),
      'sleepHour': serializer.toJson<int>(sleepHour),
      'language': serializer.toJson<String>(language),
      'techLevel': serializer.toJson<String>(techLevel),
      'city': serializer.toJson<String?>(city),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  UserProfile copyWith({
    int? id,
    String? name,
    Value<DateTime?> birthDate = const Value.absent(),
    Value<String?> sex = const Value.absent(),
    Value<double?> height = const Value.absent(),
    Value<double?> weight = const Value.absent(),
    String? diagnosis,
    Value<String?> copdStage = const Value.absent(),
    Value<double?> fev1 = const Value.absent(),
    bool? usesOxygen,
    bool? usesPulseOximeter,
    Value<String?> regularMedication = const Value.absent(),
    Value<String?> rescueInhaler = const Value.absent(),
    Value<int?> rescueUsageFrequency = const Value.absent(),
    bool? wakesUpBreathless,
    bool? snores,
    bool? hasAnxiety,
    Value<String?> physicalActivityLevel = const Value.absent(),
    bool? canWalkFlat,
    bool? canClimbStairs,
    bool? makesFrequentPauses,
    int? preferredStartHour,
    int? sleepHour,
    String? language,
    String? techLevel,
    Value<String?> city = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => UserProfile(
    id: id ?? this.id,
    name: name ?? this.name,
    birthDate: birthDate.present ? birthDate.value : this.birthDate,
    sex: sex.present ? sex.value : this.sex,
    height: height.present ? height.value : this.height,
    weight: weight.present ? weight.value : this.weight,
    diagnosis: diagnosis ?? this.diagnosis,
    copdStage: copdStage.present ? copdStage.value : this.copdStage,
    fev1: fev1.present ? fev1.value : this.fev1,
    usesOxygen: usesOxygen ?? this.usesOxygen,
    usesPulseOximeter: usesPulseOximeter ?? this.usesPulseOximeter,
    regularMedication:
        regularMedication.present
            ? regularMedication.value
            : this.regularMedication,
    rescueInhaler:
        rescueInhaler.present ? rescueInhaler.value : this.rescueInhaler,
    rescueUsageFrequency:
        rescueUsageFrequency.present
            ? rescueUsageFrequency.value
            : this.rescueUsageFrequency,
    wakesUpBreathless: wakesUpBreathless ?? this.wakesUpBreathless,
    snores: snores ?? this.snores,
    hasAnxiety: hasAnxiety ?? this.hasAnxiety,
    physicalActivityLevel:
        physicalActivityLevel.present
            ? physicalActivityLevel.value
            : this.physicalActivityLevel,
    canWalkFlat: canWalkFlat ?? this.canWalkFlat,
    canClimbStairs: canClimbStairs ?? this.canClimbStairs,
    makesFrequentPauses: makesFrequentPauses ?? this.makesFrequentPauses,
    preferredStartHour: preferredStartHour ?? this.preferredStartHour,
    sleepHour: sleepHour ?? this.sleepHour,
    language: language ?? this.language,
    techLevel: techLevel ?? this.techLevel,
    city: city.present ? city.value : this.city,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  UserProfile copyWithCompanion(UserProfilesCompanion data) {
    return UserProfile(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      birthDate: data.birthDate.present ? data.birthDate.value : this.birthDate,
      sex: data.sex.present ? data.sex.value : this.sex,
      height: data.height.present ? data.height.value : this.height,
      weight: data.weight.present ? data.weight.value : this.weight,
      diagnosis: data.diagnosis.present ? data.diagnosis.value : this.diagnosis,
      copdStage: data.copdStage.present ? data.copdStage.value : this.copdStage,
      fev1: data.fev1.present ? data.fev1.value : this.fev1,
      usesOxygen:
          data.usesOxygen.present ? data.usesOxygen.value : this.usesOxygen,
      usesPulseOximeter:
          data.usesPulseOximeter.present
              ? data.usesPulseOximeter.value
              : this.usesPulseOximeter,
      regularMedication:
          data.regularMedication.present
              ? data.regularMedication.value
              : this.regularMedication,
      rescueInhaler:
          data.rescueInhaler.present
              ? data.rescueInhaler.value
              : this.rescueInhaler,
      rescueUsageFrequency:
          data.rescueUsageFrequency.present
              ? data.rescueUsageFrequency.value
              : this.rescueUsageFrequency,
      wakesUpBreathless:
          data.wakesUpBreathless.present
              ? data.wakesUpBreathless.value
              : this.wakesUpBreathless,
      snores: data.snores.present ? data.snores.value : this.snores,
      hasAnxiety:
          data.hasAnxiety.present ? data.hasAnxiety.value : this.hasAnxiety,
      physicalActivityLevel:
          data.physicalActivityLevel.present
              ? data.physicalActivityLevel.value
              : this.physicalActivityLevel,
      canWalkFlat:
          data.canWalkFlat.present ? data.canWalkFlat.value : this.canWalkFlat,
      canClimbStairs:
          data.canClimbStairs.present
              ? data.canClimbStairs.value
              : this.canClimbStairs,
      makesFrequentPauses:
          data.makesFrequentPauses.present
              ? data.makesFrequentPauses.value
              : this.makesFrequentPauses,
      preferredStartHour:
          data.preferredStartHour.present
              ? data.preferredStartHour.value
              : this.preferredStartHour,
      sleepHour: data.sleepHour.present ? data.sleepHour.value : this.sleepHour,
      language: data.language.present ? data.language.value : this.language,
      techLevel: data.techLevel.present ? data.techLevel.value : this.techLevel,
      city: data.city.present ? data.city.value : this.city,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserProfile(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('birthDate: $birthDate, ')
          ..write('sex: $sex, ')
          ..write('height: $height, ')
          ..write('weight: $weight, ')
          ..write('diagnosis: $diagnosis, ')
          ..write('copdStage: $copdStage, ')
          ..write('fev1: $fev1, ')
          ..write('usesOxygen: $usesOxygen, ')
          ..write('usesPulseOximeter: $usesPulseOximeter, ')
          ..write('regularMedication: $regularMedication, ')
          ..write('rescueInhaler: $rescueInhaler, ')
          ..write('rescueUsageFrequency: $rescueUsageFrequency, ')
          ..write('wakesUpBreathless: $wakesUpBreathless, ')
          ..write('snores: $snores, ')
          ..write('hasAnxiety: $hasAnxiety, ')
          ..write('physicalActivityLevel: $physicalActivityLevel, ')
          ..write('canWalkFlat: $canWalkFlat, ')
          ..write('canClimbStairs: $canClimbStairs, ')
          ..write('makesFrequentPauses: $makesFrequentPauses, ')
          ..write('preferredStartHour: $preferredStartHour, ')
          ..write('sleepHour: $sleepHour, ')
          ..write('language: $language, ')
          ..write('techLevel: $techLevel, ')
          ..write('city: $city, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    name,
    birthDate,
    sex,
    height,
    weight,
    diagnosis,
    copdStage,
    fev1,
    usesOxygen,
    usesPulseOximeter,
    regularMedication,
    rescueInhaler,
    rescueUsageFrequency,
    wakesUpBreathless,
    snores,
    hasAnxiety,
    physicalActivityLevel,
    canWalkFlat,
    canClimbStairs,
    makesFrequentPauses,
    preferredStartHour,
    sleepHour,
    language,
    techLevel,
    city,
    createdAt,
    updatedAt,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserProfile &&
          other.id == this.id &&
          other.name == this.name &&
          other.birthDate == this.birthDate &&
          other.sex == this.sex &&
          other.height == this.height &&
          other.weight == this.weight &&
          other.diagnosis == this.diagnosis &&
          other.copdStage == this.copdStage &&
          other.fev1 == this.fev1 &&
          other.usesOxygen == this.usesOxygen &&
          other.usesPulseOximeter == this.usesPulseOximeter &&
          other.regularMedication == this.regularMedication &&
          other.rescueInhaler == this.rescueInhaler &&
          other.rescueUsageFrequency == this.rescueUsageFrequency &&
          other.wakesUpBreathless == this.wakesUpBreathless &&
          other.snores == this.snores &&
          other.hasAnxiety == this.hasAnxiety &&
          other.physicalActivityLevel == this.physicalActivityLevel &&
          other.canWalkFlat == this.canWalkFlat &&
          other.canClimbStairs == this.canClimbStairs &&
          other.makesFrequentPauses == this.makesFrequentPauses &&
          other.preferredStartHour == this.preferredStartHour &&
          other.sleepHour == this.sleepHour &&
          other.language == this.language &&
          other.techLevel == this.techLevel &&
          other.city == this.city &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class UserProfilesCompanion extends UpdateCompanion<UserProfile> {
  final Value<int> id;
  final Value<String> name;
  final Value<DateTime?> birthDate;
  final Value<String?> sex;
  final Value<double?> height;
  final Value<double?> weight;
  final Value<String> diagnosis;
  final Value<String?> copdStage;
  final Value<double?> fev1;
  final Value<bool> usesOxygen;
  final Value<bool> usesPulseOximeter;
  final Value<String?> regularMedication;
  final Value<String?> rescueInhaler;
  final Value<int?> rescueUsageFrequency;
  final Value<bool> wakesUpBreathless;
  final Value<bool> snores;
  final Value<bool> hasAnxiety;
  final Value<String?> physicalActivityLevel;
  final Value<bool> canWalkFlat;
  final Value<bool> canClimbStairs;
  final Value<bool> makesFrequentPauses;
  final Value<int> preferredStartHour;
  final Value<int> sleepHour;
  final Value<String> language;
  final Value<String> techLevel;
  final Value<String?> city;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const UserProfilesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.birthDate = const Value.absent(),
    this.sex = const Value.absent(),
    this.height = const Value.absent(),
    this.weight = const Value.absent(),
    this.diagnosis = const Value.absent(),
    this.copdStage = const Value.absent(),
    this.fev1 = const Value.absent(),
    this.usesOxygen = const Value.absent(),
    this.usesPulseOximeter = const Value.absent(),
    this.regularMedication = const Value.absent(),
    this.rescueInhaler = const Value.absent(),
    this.rescueUsageFrequency = const Value.absent(),
    this.wakesUpBreathless = const Value.absent(),
    this.snores = const Value.absent(),
    this.hasAnxiety = const Value.absent(),
    this.physicalActivityLevel = const Value.absent(),
    this.canWalkFlat = const Value.absent(),
    this.canClimbStairs = const Value.absent(),
    this.makesFrequentPauses = const Value.absent(),
    this.preferredStartHour = const Value.absent(),
    this.sleepHour = const Value.absent(),
    this.language = const Value.absent(),
    this.techLevel = const Value.absent(),
    this.city = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  UserProfilesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.birthDate = const Value.absent(),
    this.sex = const Value.absent(),
    this.height = const Value.absent(),
    this.weight = const Value.absent(),
    this.diagnosis = const Value.absent(),
    this.copdStage = const Value.absent(),
    this.fev1 = const Value.absent(),
    this.usesOxygen = const Value.absent(),
    this.usesPulseOximeter = const Value.absent(),
    this.regularMedication = const Value.absent(),
    this.rescueInhaler = const Value.absent(),
    this.rescueUsageFrequency = const Value.absent(),
    this.wakesUpBreathless = const Value.absent(),
    this.snores = const Value.absent(),
    this.hasAnxiety = const Value.absent(),
    this.physicalActivityLevel = const Value.absent(),
    this.canWalkFlat = const Value.absent(),
    this.canClimbStairs = const Value.absent(),
    this.makesFrequentPauses = const Value.absent(),
    this.preferredStartHour = const Value.absent(),
    this.sleepHour = const Value.absent(),
    this.language = const Value.absent(),
    this.techLevel = const Value.absent(),
    this.city = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : name = Value(name);
  static Insertable<UserProfile> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<DateTime>? birthDate,
    Expression<String>? sex,
    Expression<double>? height,
    Expression<double>? weight,
    Expression<String>? diagnosis,
    Expression<String>? copdStage,
    Expression<double>? fev1,
    Expression<bool>? usesOxygen,
    Expression<bool>? usesPulseOximeter,
    Expression<String>? regularMedication,
    Expression<String>? rescueInhaler,
    Expression<int>? rescueUsageFrequency,
    Expression<bool>? wakesUpBreathless,
    Expression<bool>? snores,
    Expression<bool>? hasAnxiety,
    Expression<String>? physicalActivityLevel,
    Expression<bool>? canWalkFlat,
    Expression<bool>? canClimbStairs,
    Expression<bool>? makesFrequentPauses,
    Expression<int>? preferredStartHour,
    Expression<int>? sleepHour,
    Expression<String>? language,
    Expression<String>? techLevel,
    Expression<String>? city,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (birthDate != null) 'birth_date': birthDate,
      if (sex != null) 'sex': sex,
      if (height != null) 'height': height,
      if (weight != null) 'weight': weight,
      if (diagnosis != null) 'diagnosis': diagnosis,
      if (copdStage != null) 'copd_stage': copdStage,
      if (fev1 != null) 'fev1': fev1,
      if (usesOxygen != null) 'uses_oxygen': usesOxygen,
      if (usesPulseOximeter != null) 'uses_pulse_oximeter': usesPulseOximeter,
      if (regularMedication != null) 'regular_medication': regularMedication,
      if (rescueInhaler != null) 'rescue_inhaler': rescueInhaler,
      if (rescueUsageFrequency != null)
        'rescue_usage_frequency': rescueUsageFrequency,
      if (wakesUpBreathless != null) 'wakes_up_breathless': wakesUpBreathless,
      if (snores != null) 'snores': snores,
      if (hasAnxiety != null) 'has_anxiety': hasAnxiety,
      if (physicalActivityLevel != null)
        'physical_activity_level': physicalActivityLevel,
      if (canWalkFlat != null) 'can_walk_flat': canWalkFlat,
      if (canClimbStairs != null) 'can_climb_stairs': canClimbStairs,
      if (makesFrequentPauses != null)
        'makes_frequent_pauses': makesFrequentPauses,
      if (preferredStartHour != null)
        'preferred_start_hour': preferredStartHour,
      if (sleepHour != null) 'sleep_hour': sleepHour,
      if (language != null) 'language': language,
      if (techLevel != null) 'tech_level': techLevel,
      if (city != null) 'city': city,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  UserProfilesCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<DateTime?>? birthDate,
    Value<String?>? sex,
    Value<double?>? height,
    Value<double?>? weight,
    Value<String>? diagnosis,
    Value<String?>? copdStage,
    Value<double?>? fev1,
    Value<bool>? usesOxygen,
    Value<bool>? usesPulseOximeter,
    Value<String?>? regularMedication,
    Value<String?>? rescueInhaler,
    Value<int?>? rescueUsageFrequency,
    Value<bool>? wakesUpBreathless,
    Value<bool>? snores,
    Value<bool>? hasAnxiety,
    Value<String?>? physicalActivityLevel,
    Value<bool>? canWalkFlat,
    Value<bool>? canClimbStairs,
    Value<bool>? makesFrequentPauses,
    Value<int>? preferredStartHour,
    Value<int>? sleepHour,
    Value<String>? language,
    Value<String>? techLevel,
    Value<String?>? city,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return UserProfilesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      birthDate: birthDate ?? this.birthDate,
      sex: sex ?? this.sex,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      diagnosis: diagnosis ?? this.diagnosis,
      copdStage: copdStage ?? this.copdStage,
      fev1: fev1 ?? this.fev1,
      usesOxygen: usesOxygen ?? this.usesOxygen,
      usesPulseOximeter: usesPulseOximeter ?? this.usesPulseOximeter,
      regularMedication: regularMedication ?? this.regularMedication,
      rescueInhaler: rescueInhaler ?? this.rescueInhaler,
      rescueUsageFrequency: rescueUsageFrequency ?? this.rescueUsageFrequency,
      wakesUpBreathless: wakesUpBreathless ?? this.wakesUpBreathless,
      snores: snores ?? this.snores,
      hasAnxiety: hasAnxiety ?? this.hasAnxiety,
      physicalActivityLevel:
          physicalActivityLevel ?? this.physicalActivityLevel,
      canWalkFlat: canWalkFlat ?? this.canWalkFlat,
      canClimbStairs: canClimbStairs ?? this.canClimbStairs,
      makesFrequentPauses: makesFrequentPauses ?? this.makesFrequentPauses,
      preferredStartHour: preferredStartHour ?? this.preferredStartHour,
      sleepHour: sleepHour ?? this.sleepHour,
      language: language ?? this.language,
      techLevel: techLevel ?? this.techLevel,
      city: city ?? this.city,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (birthDate.present) {
      map['birth_date'] = Variable<DateTime>(birthDate.value);
    }
    if (sex.present) {
      map['sex'] = Variable<String>(sex.value);
    }
    if (height.present) {
      map['height'] = Variable<double>(height.value);
    }
    if (weight.present) {
      map['weight'] = Variable<double>(weight.value);
    }
    if (diagnosis.present) {
      map['diagnosis'] = Variable<String>(diagnosis.value);
    }
    if (copdStage.present) {
      map['copd_stage'] = Variable<String>(copdStage.value);
    }
    if (fev1.present) {
      map['fev1'] = Variable<double>(fev1.value);
    }
    if (usesOxygen.present) {
      map['uses_oxygen'] = Variable<bool>(usesOxygen.value);
    }
    if (usesPulseOximeter.present) {
      map['uses_pulse_oximeter'] = Variable<bool>(usesPulseOximeter.value);
    }
    if (regularMedication.present) {
      map['regular_medication'] = Variable<String>(regularMedication.value);
    }
    if (rescueInhaler.present) {
      map['rescue_inhaler'] = Variable<String>(rescueInhaler.value);
    }
    if (rescueUsageFrequency.present) {
      map['rescue_usage_frequency'] = Variable<int>(rescueUsageFrequency.value);
    }
    if (wakesUpBreathless.present) {
      map['wakes_up_breathless'] = Variable<bool>(wakesUpBreathless.value);
    }
    if (snores.present) {
      map['snores'] = Variable<bool>(snores.value);
    }
    if (hasAnxiety.present) {
      map['has_anxiety'] = Variable<bool>(hasAnxiety.value);
    }
    if (physicalActivityLevel.present) {
      map['physical_activity_level'] = Variable<String>(
        physicalActivityLevel.value,
      );
    }
    if (canWalkFlat.present) {
      map['can_walk_flat'] = Variable<bool>(canWalkFlat.value);
    }
    if (canClimbStairs.present) {
      map['can_climb_stairs'] = Variable<bool>(canClimbStairs.value);
    }
    if (makesFrequentPauses.present) {
      map['makes_frequent_pauses'] = Variable<bool>(makesFrequentPauses.value);
    }
    if (preferredStartHour.present) {
      map['preferred_start_hour'] = Variable<int>(preferredStartHour.value);
    }
    if (sleepHour.present) {
      map['sleep_hour'] = Variable<int>(sleepHour.value);
    }
    if (language.present) {
      map['language'] = Variable<String>(language.value);
    }
    if (techLevel.present) {
      map['tech_level'] = Variable<String>(techLevel.value);
    }
    if (city.present) {
      map['city'] = Variable<String>(city.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserProfilesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('birthDate: $birthDate, ')
          ..write('sex: $sex, ')
          ..write('height: $height, ')
          ..write('weight: $weight, ')
          ..write('diagnosis: $diagnosis, ')
          ..write('copdStage: $copdStage, ')
          ..write('fev1: $fev1, ')
          ..write('usesOxygen: $usesOxygen, ')
          ..write('usesPulseOximeter: $usesPulseOximeter, ')
          ..write('regularMedication: $regularMedication, ')
          ..write('rescueInhaler: $rescueInhaler, ')
          ..write('rescueUsageFrequency: $rescueUsageFrequency, ')
          ..write('wakesUpBreathless: $wakesUpBreathless, ')
          ..write('snores: $snores, ')
          ..write('hasAnxiety: $hasAnxiety, ')
          ..write('physicalActivityLevel: $physicalActivityLevel, ')
          ..write('canWalkFlat: $canWalkFlat, ')
          ..write('canClimbStairs: $canClimbStairs, ')
          ..write('makesFrequentPauses: $makesFrequentPauses, ')
          ..write('preferredStartHour: $preferredStartHour, ')
          ..write('sleepHour: $sleepHour, ')
          ..write('language: $language, ')
          ..write('techLevel: $techLevel, ')
          ..write('city: $city, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $EmergencyContactsTable extends EmergencyContacts
    with TableInfo<$EmergencyContactsTable, EmergencyContact> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EmergencyContactsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
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
  static const VerificationMeta _relationshipMeta = const VerificationMeta(
    'relationship',
  );
  @override
  late final GeneratedColumn<String> relationship = GeneratedColumn<String>(
    'relationship',
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
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _priorityMeta = const VerificationMeta(
    'priority',
  );
  @override
  late final GeneratedColumn<int> priority = GeneratedColumn<int>(
    'priority',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _receivesSmsMeta = const VerificationMeta(
    'receivesSms',
  );
  @override
  late final GeneratedColumn<bool> receivesSms = GeneratedColumn<bool>(
    'receives_sms',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("receives_sms" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _receivesEmailMeta = const VerificationMeta(
    'receivesEmail',
  );
  @override
  late final GeneratedColumn<bool> receivesEmail = GeneratedColumn<bool>(
    'receives_email',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("receives_email" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
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
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    name,
    relationship,
    phone,
    priority,
    receivesSms,
    receivesEmail,
    email,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'emergency_contacts';
  @override
  VerificationContext validateIntegrity(
    Insertable<EmergencyContact> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('relationship')) {
      context.handle(
        _relationshipMeta,
        relationship.isAcceptableOrUnknown(
          data['relationship']!,
          _relationshipMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_relationshipMeta);
    }
    if (data.containsKey('phone')) {
      context.handle(
        _phoneMeta,
        phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta),
      );
    } else if (isInserting) {
      context.missing(_phoneMeta);
    }
    if (data.containsKey('priority')) {
      context.handle(
        _priorityMeta,
        priority.isAcceptableOrUnknown(data['priority']!, _priorityMeta),
      );
    }
    if (data.containsKey('receives_sms')) {
      context.handle(
        _receivesSmsMeta,
        receivesSms.isAcceptableOrUnknown(
          data['receives_sms']!,
          _receivesSmsMeta,
        ),
      );
    }
    if (data.containsKey('receives_email')) {
      context.handle(
        _receivesEmailMeta,
        receivesEmail.isAcceptableOrUnknown(
          data['receives_email']!,
          _receivesEmailMeta,
        ),
      );
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  EmergencyContact map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EmergencyContact(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      userId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}user_id'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      relationship:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}relationship'],
          )!,
      phone:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}phone'],
          )!,
      priority:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}priority'],
          )!,
      receivesSms:
          attachedDatabase.typeMapping.read(
            DriftSqlType.bool,
            data['${effectivePrefix}receives_sms'],
          )!,
      receivesEmail:
          attachedDatabase.typeMapping.read(
            DriftSqlType.bool,
            data['${effectivePrefix}receives_email'],
          )!,
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      ),
      createdAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}created_at'],
          )!,
    );
  }

  @override
  $EmergencyContactsTable createAlias(String alias) {
    return $EmergencyContactsTable(attachedDatabase, alias);
  }
}

class EmergencyContact extends DataClass
    implements Insertable<EmergencyContact> {
  final int id;
  final int userId;
  final String name;
  final String relationship;
  final String phone;
  final int priority;
  final bool receivesSms;
  final bool receivesEmail;
  final String? email;
  final DateTime createdAt;
  const EmergencyContact({
    required this.id,
    required this.userId,
    required this.name,
    required this.relationship,
    required this.phone,
    required this.priority,
    required this.receivesSms,
    required this.receivesEmail,
    this.email,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<int>(userId);
    map['name'] = Variable<String>(name);
    map['relationship'] = Variable<String>(relationship);
    map['phone'] = Variable<String>(phone);
    map['priority'] = Variable<int>(priority);
    map['receives_sms'] = Variable<bool>(receivesSms);
    map['receives_email'] = Variable<bool>(receivesEmail);
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  EmergencyContactsCompanion toCompanion(bool nullToAbsent) {
    return EmergencyContactsCompanion(
      id: Value(id),
      userId: Value(userId),
      name: Value(name),
      relationship: Value(relationship),
      phone: Value(phone),
      priority: Value(priority),
      receivesSms: Value(receivesSms),
      receivesEmail: Value(receivesEmail),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
      createdAt: Value(createdAt),
    );
  }

  factory EmergencyContact.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EmergencyContact(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int>(json['userId']),
      name: serializer.fromJson<String>(json['name']),
      relationship: serializer.fromJson<String>(json['relationship']),
      phone: serializer.fromJson<String>(json['phone']),
      priority: serializer.fromJson<int>(json['priority']),
      receivesSms: serializer.fromJson<bool>(json['receivesSms']),
      receivesEmail: serializer.fromJson<bool>(json['receivesEmail']),
      email: serializer.fromJson<String?>(json['email']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<int>(userId),
      'name': serializer.toJson<String>(name),
      'relationship': serializer.toJson<String>(relationship),
      'phone': serializer.toJson<String>(phone),
      'priority': serializer.toJson<int>(priority),
      'receivesSms': serializer.toJson<bool>(receivesSms),
      'receivesEmail': serializer.toJson<bool>(receivesEmail),
      'email': serializer.toJson<String?>(email),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  EmergencyContact copyWith({
    int? id,
    int? userId,
    String? name,
    String? relationship,
    String? phone,
    int? priority,
    bool? receivesSms,
    bool? receivesEmail,
    Value<String?> email = const Value.absent(),
    DateTime? createdAt,
  }) => EmergencyContact(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    name: name ?? this.name,
    relationship: relationship ?? this.relationship,
    phone: phone ?? this.phone,
    priority: priority ?? this.priority,
    receivesSms: receivesSms ?? this.receivesSms,
    receivesEmail: receivesEmail ?? this.receivesEmail,
    email: email.present ? email.value : this.email,
    createdAt: createdAt ?? this.createdAt,
  );
  EmergencyContact copyWithCompanion(EmergencyContactsCompanion data) {
    return EmergencyContact(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      name: data.name.present ? data.name.value : this.name,
      relationship:
          data.relationship.present
              ? data.relationship.value
              : this.relationship,
      phone: data.phone.present ? data.phone.value : this.phone,
      priority: data.priority.present ? data.priority.value : this.priority,
      receivesSms:
          data.receivesSms.present ? data.receivesSms.value : this.receivesSms,
      receivesEmail:
          data.receivesEmail.present
              ? data.receivesEmail.value
              : this.receivesEmail,
      email: data.email.present ? data.email.value : this.email,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EmergencyContact(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('name: $name, ')
          ..write('relationship: $relationship, ')
          ..write('phone: $phone, ')
          ..write('priority: $priority, ')
          ..write('receivesSms: $receivesSms, ')
          ..write('receivesEmail: $receivesEmail, ')
          ..write('email: $email, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    name,
    relationship,
    phone,
    priority,
    receivesSms,
    receivesEmail,
    email,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EmergencyContact &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.name == this.name &&
          other.relationship == this.relationship &&
          other.phone == this.phone &&
          other.priority == this.priority &&
          other.receivesSms == this.receivesSms &&
          other.receivesEmail == this.receivesEmail &&
          other.email == this.email &&
          other.createdAt == this.createdAt);
}

class EmergencyContactsCompanion extends UpdateCompanion<EmergencyContact> {
  final Value<int> id;
  final Value<int> userId;
  final Value<String> name;
  final Value<String> relationship;
  final Value<String> phone;
  final Value<int> priority;
  final Value<bool> receivesSms;
  final Value<bool> receivesEmail;
  final Value<String?> email;
  final Value<DateTime> createdAt;
  const EmergencyContactsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.name = const Value.absent(),
    this.relationship = const Value.absent(),
    this.phone = const Value.absent(),
    this.priority = const Value.absent(),
    this.receivesSms = const Value.absent(),
    this.receivesEmail = const Value.absent(),
    this.email = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  EmergencyContactsCompanion.insert({
    this.id = const Value.absent(),
    required int userId,
    required String name,
    required String relationship,
    required String phone,
    this.priority = const Value.absent(),
    this.receivesSms = const Value.absent(),
    this.receivesEmail = const Value.absent(),
    this.email = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : userId = Value(userId),
       name = Value(name),
       relationship = Value(relationship),
       phone = Value(phone);
  static Insertable<EmergencyContact> custom({
    Expression<int>? id,
    Expression<int>? userId,
    Expression<String>? name,
    Expression<String>? relationship,
    Expression<String>? phone,
    Expression<int>? priority,
    Expression<bool>? receivesSms,
    Expression<bool>? receivesEmail,
    Expression<String>? email,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (name != null) 'name': name,
      if (relationship != null) 'relationship': relationship,
      if (phone != null) 'phone': phone,
      if (priority != null) 'priority': priority,
      if (receivesSms != null) 'receives_sms': receivesSms,
      if (receivesEmail != null) 'receives_email': receivesEmail,
      if (email != null) 'email': email,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  EmergencyContactsCompanion copyWith({
    Value<int>? id,
    Value<int>? userId,
    Value<String>? name,
    Value<String>? relationship,
    Value<String>? phone,
    Value<int>? priority,
    Value<bool>? receivesSms,
    Value<bool>? receivesEmail,
    Value<String?>? email,
    Value<DateTime>? createdAt,
  }) {
    return EmergencyContactsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      name: name ?? this.name,
      relationship: relationship ?? this.relationship,
      phone: phone ?? this.phone,
      priority: priority ?? this.priority,
      receivesSms: receivesSms ?? this.receivesSms,
      receivesEmail: receivesEmail ?? this.receivesEmail,
      email: email ?? this.email,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (relationship.present) {
      map['relationship'] = Variable<String>(relationship.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (priority.present) {
      map['priority'] = Variable<int>(priority.value);
    }
    if (receivesSms.present) {
      map['receives_sms'] = Variable<bool>(receivesSms.value);
    }
    if (receivesEmail.present) {
      map['receives_email'] = Variable<bool>(receivesEmail.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EmergencyContactsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('name: $name, ')
          ..write('relationship: $relationship, ')
          ..write('phone: $phone, ')
          ..write('priority: $priority, ')
          ..write('receivesSms: $receivesSms, ')
          ..write('receivesEmail: $receivesEmail, ')
          ..write('email: $email, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $DailyFlowsTable extends DailyFlows
    with TableInfo<$DailyFlowsTable, DailyFlow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DailyFlowsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _flowDateMeta = const VerificationMeta(
    'flowDate',
  );
  @override
  late final GeneratedColumn<DateTime> flowDate = GeneratedColumn<DateTime>(
    'flow_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('checklist'),
  );
  static const VerificationMeta _dayClassificationMeta = const VerificationMeta(
    'dayClassification',
  );
  @override
  late final GeneratedColumn<String> dayClassification =
      GeneratedColumn<String>(
        'day_classification',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _morningScoreMeta = const VerificationMeta(
    'morningScore',
  );
  @override
  late final GeneratedColumn<double> morningScore = GeneratedColumn<double>(
    'morning_score',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _respiratoryStabilityScoreMeta =
      const VerificationMeta('respiratoryStabilityScore');
  @override
  late final GeneratedColumn<double> respiratoryStabilityScore =
      GeneratedColumn<double>(
        'respiratory_stability_score',
        aliasedName,
        true,
        type: DriftSqlType.double,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _eveningNotesMeta = const VerificationMeta(
    'eveningNotes',
  );
  @override
  late final GeneratedColumn<String> eveningNotes = GeneratedColumn<String>(
    'evening_notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _checklistCompletedMeta =
      const VerificationMeta('checklistCompleted');
  @override
  late final GeneratedColumn<bool> checklistCompleted = GeneratedColumn<bool>(
    'checklist_completed',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("checklist_completed" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _morningQuestionnaireCompletedMeta =
      const VerificationMeta('morningQuestionnaireCompleted');
  @override
  late final GeneratedColumn<bool> morningQuestionnaireCompleted =
      GeneratedColumn<bool>(
        'morning_questionnaire_completed',
        aliasedName,
        false,
        type: DriftSqlType.bool,
        requiredDuringInsert: false,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("morning_questionnaire_completed" IN (0, 1))',
        ),
        defaultValue: const Constant(false),
      );
  static const VerificationMeta _eveningQuestionnaireCompletedMeta =
      const VerificationMeta('eveningQuestionnaireCompleted');
  @override
  late final GeneratedColumn<bool> eveningQuestionnaireCompleted =
      GeneratedColumn<bool>(
        'evening_questionnaire_completed',
        aliasedName,
        false,
        type: DriftSqlType.bool,
        requiredDuringInsert: false,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("evening_questionnaire_completed" IN (0, 1))',
        ),
        defaultValue: const Constant(false),
      );
  static const VerificationMeta _medicationTakenMeta = const VerificationMeta(
    'medicationTaken',
  );
  @override
  late final GeneratedColumn<bool> medicationTaken = GeneratedColumn<bool>(
    'medication_taken',
    aliasedName,
    true,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("medication_taken" IN (0, 1))',
    ),
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
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
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
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _archivedAtMeta = const VerificationMeta(
    'archivedAt',
  );
  @override
  late final GeneratedColumn<DateTime> archivedAt = GeneratedColumn<DateTime>(
    'archived_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    flowDate,
    status,
    dayClassification,
    morningScore,
    respiratoryStabilityScore,
    eveningNotes,
    checklistCompleted,
    morningQuestionnaireCompleted,
    eveningQuestionnaireCompleted,
    medicationTaken,
    createdAt,
    updatedAt,
    archivedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'daily_flows';
  @override
  VerificationContext validateIntegrity(
    Insertable<DailyFlow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('flow_date')) {
      context.handle(
        _flowDateMeta,
        flowDate.isAcceptableOrUnknown(data['flow_date']!, _flowDateMeta),
      );
    } else if (isInserting) {
      context.missing(_flowDateMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('day_classification')) {
      context.handle(
        _dayClassificationMeta,
        dayClassification.isAcceptableOrUnknown(
          data['day_classification']!,
          _dayClassificationMeta,
        ),
      );
    }
    if (data.containsKey('morning_score')) {
      context.handle(
        _morningScoreMeta,
        morningScore.isAcceptableOrUnknown(
          data['morning_score']!,
          _morningScoreMeta,
        ),
      );
    }
    if (data.containsKey('respiratory_stability_score')) {
      context.handle(
        _respiratoryStabilityScoreMeta,
        respiratoryStabilityScore.isAcceptableOrUnknown(
          data['respiratory_stability_score']!,
          _respiratoryStabilityScoreMeta,
        ),
      );
    }
    if (data.containsKey('evening_notes')) {
      context.handle(
        _eveningNotesMeta,
        eveningNotes.isAcceptableOrUnknown(
          data['evening_notes']!,
          _eveningNotesMeta,
        ),
      );
    }
    if (data.containsKey('checklist_completed')) {
      context.handle(
        _checklistCompletedMeta,
        checklistCompleted.isAcceptableOrUnknown(
          data['checklist_completed']!,
          _checklistCompletedMeta,
        ),
      );
    }
    if (data.containsKey('morning_questionnaire_completed')) {
      context.handle(
        _morningQuestionnaireCompletedMeta,
        morningQuestionnaireCompleted.isAcceptableOrUnknown(
          data['morning_questionnaire_completed']!,
          _morningQuestionnaireCompletedMeta,
        ),
      );
    }
    if (data.containsKey('evening_questionnaire_completed')) {
      context.handle(
        _eveningQuestionnaireCompletedMeta,
        eveningQuestionnaireCompleted.isAcceptableOrUnknown(
          data['evening_questionnaire_completed']!,
          _eveningQuestionnaireCompletedMeta,
        ),
      );
    }
    if (data.containsKey('medication_taken')) {
      context.handle(
        _medicationTakenMeta,
        medicationTaken.isAcceptableOrUnknown(
          data['medication_taken']!,
          _medicationTakenMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('archived_at')) {
      context.handle(
        _archivedAtMeta,
        archivedAt.isAcceptableOrUnknown(data['archived_at']!, _archivedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DailyFlow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DailyFlow(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      flowDate:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}flow_date'],
          )!,
      status:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}status'],
          )!,
      dayClassification: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}day_classification'],
      ),
      morningScore: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}morning_score'],
      ),
      respiratoryStabilityScore: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}respiratory_stability_score'],
      ),
      eveningNotes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}evening_notes'],
      ),
      checklistCompleted:
          attachedDatabase.typeMapping.read(
            DriftSqlType.bool,
            data['${effectivePrefix}checklist_completed'],
          )!,
      morningQuestionnaireCompleted:
          attachedDatabase.typeMapping.read(
            DriftSqlType.bool,
            data['${effectivePrefix}morning_questionnaire_completed'],
          )!,
      eveningQuestionnaireCompleted:
          attachedDatabase.typeMapping.read(
            DriftSqlType.bool,
            data['${effectivePrefix}evening_questionnaire_completed'],
          )!,
      medicationTaken: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}medication_taken'],
      ),
      createdAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}created_at'],
          )!,
      updatedAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}updated_at'],
          )!,
      archivedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}archived_at'],
      ),
    );
  }

  @override
  $DailyFlowsTable createAlias(String alias) {
    return $DailyFlowsTable(attachedDatabase, alias);
  }
}

class DailyFlow extends DataClass implements Insertable<DailyFlow> {
  final int id;
  final DateTime flowDate;
  final String status;
  final String? dayClassification;
  final double? morningScore;
  final double? respiratoryStabilityScore;
  final String? eveningNotes;
  final bool checklistCompleted;
  final bool morningQuestionnaireCompleted;
  final bool eveningQuestionnaireCompleted;
  final bool? medicationTaken;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? archivedAt;
  const DailyFlow({
    required this.id,
    required this.flowDate,
    required this.status,
    this.dayClassification,
    this.morningScore,
    this.respiratoryStabilityScore,
    this.eveningNotes,
    required this.checklistCompleted,
    required this.morningQuestionnaireCompleted,
    required this.eveningQuestionnaireCompleted,
    this.medicationTaken,
    required this.createdAt,
    required this.updatedAt,
    this.archivedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['flow_date'] = Variable<DateTime>(flowDate);
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || dayClassification != null) {
      map['day_classification'] = Variable<String>(dayClassification);
    }
    if (!nullToAbsent || morningScore != null) {
      map['morning_score'] = Variable<double>(morningScore);
    }
    if (!nullToAbsent || respiratoryStabilityScore != null) {
      map['respiratory_stability_score'] = Variable<double>(
        respiratoryStabilityScore,
      );
    }
    if (!nullToAbsent || eveningNotes != null) {
      map['evening_notes'] = Variable<String>(eveningNotes);
    }
    map['checklist_completed'] = Variable<bool>(checklistCompleted);
    map['morning_questionnaire_completed'] = Variable<bool>(
      morningQuestionnaireCompleted,
    );
    map['evening_questionnaire_completed'] = Variable<bool>(
      eveningQuestionnaireCompleted,
    );
    if (!nullToAbsent || medicationTaken != null) {
      map['medication_taken'] = Variable<bool>(medicationTaken);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || archivedAt != null) {
      map['archived_at'] = Variable<DateTime>(archivedAt);
    }
    return map;
  }

  DailyFlowsCompanion toCompanion(bool nullToAbsent) {
    return DailyFlowsCompanion(
      id: Value(id),
      flowDate: Value(flowDate),
      status: Value(status),
      dayClassification:
          dayClassification == null && nullToAbsent
              ? const Value.absent()
              : Value(dayClassification),
      morningScore:
          morningScore == null && nullToAbsent
              ? const Value.absent()
              : Value(morningScore),
      respiratoryStabilityScore:
          respiratoryStabilityScore == null && nullToAbsent
              ? const Value.absent()
              : Value(respiratoryStabilityScore),
      eveningNotes:
          eveningNotes == null && nullToAbsent
              ? const Value.absent()
              : Value(eveningNotes),
      checklistCompleted: Value(checklistCompleted),
      morningQuestionnaireCompleted: Value(morningQuestionnaireCompleted),
      eveningQuestionnaireCompleted: Value(eveningQuestionnaireCompleted),
      medicationTaken:
          medicationTaken == null && nullToAbsent
              ? const Value.absent()
              : Value(medicationTaken),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      archivedAt:
          archivedAt == null && nullToAbsent
              ? const Value.absent()
              : Value(archivedAt),
    );
  }

  factory DailyFlow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DailyFlow(
      id: serializer.fromJson<int>(json['id']),
      flowDate: serializer.fromJson<DateTime>(json['flowDate']),
      status: serializer.fromJson<String>(json['status']),
      dayClassification: serializer.fromJson<String?>(
        json['dayClassification'],
      ),
      morningScore: serializer.fromJson<double?>(json['morningScore']),
      respiratoryStabilityScore: serializer.fromJson<double?>(
        json['respiratoryStabilityScore'],
      ),
      eveningNotes: serializer.fromJson<String?>(json['eveningNotes']),
      checklistCompleted: serializer.fromJson<bool>(json['checklistCompleted']),
      morningQuestionnaireCompleted: serializer.fromJson<bool>(
        json['morningQuestionnaireCompleted'],
      ),
      eveningQuestionnaireCompleted: serializer.fromJson<bool>(
        json['eveningQuestionnaireCompleted'],
      ),
      medicationTaken: serializer.fromJson<bool?>(json['medicationTaken']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      archivedAt: serializer.fromJson<DateTime?>(json['archivedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'flowDate': serializer.toJson<DateTime>(flowDate),
      'status': serializer.toJson<String>(status),
      'dayClassification': serializer.toJson<String?>(dayClassification),
      'morningScore': serializer.toJson<double?>(morningScore),
      'respiratoryStabilityScore': serializer.toJson<double?>(
        respiratoryStabilityScore,
      ),
      'eveningNotes': serializer.toJson<String?>(eveningNotes),
      'checklistCompleted': serializer.toJson<bool>(checklistCompleted),
      'morningQuestionnaireCompleted': serializer.toJson<bool>(
        morningQuestionnaireCompleted,
      ),
      'eveningQuestionnaireCompleted': serializer.toJson<bool>(
        eveningQuestionnaireCompleted,
      ),
      'medicationTaken': serializer.toJson<bool?>(medicationTaken),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'archivedAt': serializer.toJson<DateTime?>(archivedAt),
    };
  }

  DailyFlow copyWith({
    int? id,
    DateTime? flowDate,
    String? status,
    Value<String?> dayClassification = const Value.absent(),
    Value<double?> morningScore = const Value.absent(),
    Value<double?> respiratoryStabilityScore = const Value.absent(),
    Value<String?> eveningNotes = const Value.absent(),
    bool? checklistCompleted,
    bool? morningQuestionnaireCompleted,
    bool? eveningQuestionnaireCompleted,
    Value<bool?> medicationTaken = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> archivedAt = const Value.absent(),
  }) => DailyFlow(
    id: id ?? this.id,
    flowDate: flowDate ?? this.flowDate,
    status: status ?? this.status,
    dayClassification:
        dayClassification.present
            ? dayClassification.value
            : this.dayClassification,
    morningScore: morningScore.present ? morningScore.value : this.morningScore,
    respiratoryStabilityScore:
        respiratoryStabilityScore.present
            ? respiratoryStabilityScore.value
            : this.respiratoryStabilityScore,
    eveningNotes: eveningNotes.present ? eveningNotes.value : this.eveningNotes,
    checklistCompleted: checklistCompleted ?? this.checklistCompleted,
    morningQuestionnaireCompleted:
        morningQuestionnaireCompleted ?? this.morningQuestionnaireCompleted,
    eveningQuestionnaireCompleted:
        eveningQuestionnaireCompleted ?? this.eveningQuestionnaireCompleted,
    medicationTaken:
        medicationTaken.present ? medicationTaken.value : this.medicationTaken,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    archivedAt: archivedAt.present ? archivedAt.value : this.archivedAt,
  );
  DailyFlow copyWithCompanion(DailyFlowsCompanion data) {
    return DailyFlow(
      id: data.id.present ? data.id.value : this.id,
      flowDate: data.flowDate.present ? data.flowDate.value : this.flowDate,
      status: data.status.present ? data.status.value : this.status,
      dayClassification:
          data.dayClassification.present
              ? data.dayClassification.value
              : this.dayClassification,
      morningScore:
          data.morningScore.present
              ? data.morningScore.value
              : this.morningScore,
      respiratoryStabilityScore:
          data.respiratoryStabilityScore.present
              ? data.respiratoryStabilityScore.value
              : this.respiratoryStabilityScore,
      eveningNotes:
          data.eveningNotes.present
              ? data.eveningNotes.value
              : this.eveningNotes,
      checklistCompleted:
          data.checklistCompleted.present
              ? data.checklistCompleted.value
              : this.checklistCompleted,
      morningQuestionnaireCompleted:
          data.morningQuestionnaireCompleted.present
              ? data.morningQuestionnaireCompleted.value
              : this.morningQuestionnaireCompleted,
      eveningQuestionnaireCompleted:
          data.eveningQuestionnaireCompleted.present
              ? data.eveningQuestionnaireCompleted.value
              : this.eveningQuestionnaireCompleted,
      medicationTaken:
          data.medicationTaken.present
              ? data.medicationTaken.value
              : this.medicationTaken,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      archivedAt:
          data.archivedAt.present ? data.archivedAt.value : this.archivedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DailyFlow(')
          ..write('id: $id, ')
          ..write('flowDate: $flowDate, ')
          ..write('status: $status, ')
          ..write('dayClassification: $dayClassification, ')
          ..write('morningScore: $morningScore, ')
          ..write('respiratoryStabilityScore: $respiratoryStabilityScore, ')
          ..write('eveningNotes: $eveningNotes, ')
          ..write('checklistCompleted: $checklistCompleted, ')
          ..write(
            'morningQuestionnaireCompleted: $morningQuestionnaireCompleted, ',
          )
          ..write(
            'eveningQuestionnaireCompleted: $eveningQuestionnaireCompleted, ',
          )
          ..write('medicationTaken: $medicationTaken, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('archivedAt: $archivedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    flowDate,
    status,
    dayClassification,
    morningScore,
    respiratoryStabilityScore,
    eveningNotes,
    checklistCompleted,
    morningQuestionnaireCompleted,
    eveningQuestionnaireCompleted,
    medicationTaken,
    createdAt,
    updatedAt,
    archivedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DailyFlow &&
          other.id == this.id &&
          other.flowDate == this.flowDate &&
          other.status == this.status &&
          other.dayClassification == this.dayClassification &&
          other.morningScore == this.morningScore &&
          other.respiratoryStabilityScore == this.respiratoryStabilityScore &&
          other.eveningNotes == this.eveningNotes &&
          other.checklistCompleted == this.checklistCompleted &&
          other.morningQuestionnaireCompleted ==
              this.morningQuestionnaireCompleted &&
          other.eveningQuestionnaireCompleted ==
              this.eveningQuestionnaireCompleted &&
          other.medicationTaken == this.medicationTaken &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.archivedAt == this.archivedAt);
}

class DailyFlowsCompanion extends UpdateCompanion<DailyFlow> {
  final Value<int> id;
  final Value<DateTime> flowDate;
  final Value<String> status;
  final Value<String?> dayClassification;
  final Value<double?> morningScore;
  final Value<double?> respiratoryStabilityScore;
  final Value<String?> eveningNotes;
  final Value<bool> checklistCompleted;
  final Value<bool> morningQuestionnaireCompleted;
  final Value<bool> eveningQuestionnaireCompleted;
  final Value<bool?> medicationTaken;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> archivedAt;
  const DailyFlowsCompanion({
    this.id = const Value.absent(),
    this.flowDate = const Value.absent(),
    this.status = const Value.absent(),
    this.dayClassification = const Value.absent(),
    this.morningScore = const Value.absent(),
    this.respiratoryStabilityScore = const Value.absent(),
    this.eveningNotes = const Value.absent(),
    this.checklistCompleted = const Value.absent(),
    this.morningQuestionnaireCompleted = const Value.absent(),
    this.eveningQuestionnaireCompleted = const Value.absent(),
    this.medicationTaken = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.archivedAt = const Value.absent(),
  });
  DailyFlowsCompanion.insert({
    this.id = const Value.absent(),
    required DateTime flowDate,
    this.status = const Value.absent(),
    this.dayClassification = const Value.absent(),
    this.morningScore = const Value.absent(),
    this.respiratoryStabilityScore = const Value.absent(),
    this.eveningNotes = const Value.absent(),
    this.checklistCompleted = const Value.absent(),
    this.morningQuestionnaireCompleted = const Value.absent(),
    this.eveningQuestionnaireCompleted = const Value.absent(),
    this.medicationTaken = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.archivedAt = const Value.absent(),
  }) : flowDate = Value(flowDate);
  static Insertable<DailyFlow> custom({
    Expression<int>? id,
    Expression<DateTime>? flowDate,
    Expression<String>? status,
    Expression<String>? dayClassification,
    Expression<double>? morningScore,
    Expression<double>? respiratoryStabilityScore,
    Expression<String>? eveningNotes,
    Expression<bool>? checklistCompleted,
    Expression<bool>? morningQuestionnaireCompleted,
    Expression<bool>? eveningQuestionnaireCompleted,
    Expression<bool>? medicationTaken,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? archivedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (flowDate != null) 'flow_date': flowDate,
      if (status != null) 'status': status,
      if (dayClassification != null) 'day_classification': dayClassification,
      if (morningScore != null) 'morning_score': morningScore,
      if (respiratoryStabilityScore != null)
        'respiratory_stability_score': respiratoryStabilityScore,
      if (eveningNotes != null) 'evening_notes': eveningNotes,
      if (checklistCompleted != null) 'checklist_completed': checklistCompleted,
      if (morningQuestionnaireCompleted != null)
        'morning_questionnaire_completed': morningQuestionnaireCompleted,
      if (eveningQuestionnaireCompleted != null)
        'evening_questionnaire_completed': eveningQuestionnaireCompleted,
      if (medicationTaken != null) 'medication_taken': medicationTaken,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (archivedAt != null) 'archived_at': archivedAt,
    });
  }

  DailyFlowsCompanion copyWith({
    Value<int>? id,
    Value<DateTime>? flowDate,
    Value<String>? status,
    Value<String?>? dayClassification,
    Value<double?>? morningScore,
    Value<double?>? respiratoryStabilityScore,
    Value<String?>? eveningNotes,
    Value<bool>? checklistCompleted,
    Value<bool>? morningQuestionnaireCompleted,
    Value<bool>? eveningQuestionnaireCompleted,
    Value<bool?>? medicationTaken,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? archivedAt,
  }) {
    return DailyFlowsCompanion(
      id: id ?? this.id,
      flowDate: flowDate ?? this.flowDate,
      status: status ?? this.status,
      dayClassification: dayClassification ?? this.dayClassification,
      morningScore: morningScore ?? this.morningScore,
      respiratoryStabilityScore:
          respiratoryStabilityScore ?? this.respiratoryStabilityScore,
      eveningNotes: eveningNotes ?? this.eveningNotes,
      checklistCompleted: checklistCompleted ?? this.checklistCompleted,
      morningQuestionnaireCompleted:
          morningQuestionnaireCompleted ?? this.morningQuestionnaireCompleted,
      eveningQuestionnaireCompleted:
          eveningQuestionnaireCompleted ?? this.eveningQuestionnaireCompleted,
      medicationTaken: medicationTaken ?? this.medicationTaken,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      archivedAt: archivedAt ?? this.archivedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (flowDate.present) {
      map['flow_date'] = Variable<DateTime>(flowDate.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (dayClassification.present) {
      map['day_classification'] = Variable<String>(dayClassification.value);
    }
    if (morningScore.present) {
      map['morning_score'] = Variable<double>(morningScore.value);
    }
    if (respiratoryStabilityScore.present) {
      map['respiratory_stability_score'] = Variable<double>(
        respiratoryStabilityScore.value,
      );
    }
    if (eveningNotes.present) {
      map['evening_notes'] = Variable<String>(eveningNotes.value);
    }
    if (checklistCompleted.present) {
      map['checklist_completed'] = Variable<bool>(checklistCompleted.value);
    }
    if (morningQuestionnaireCompleted.present) {
      map['morning_questionnaire_completed'] = Variable<bool>(
        morningQuestionnaireCompleted.value,
      );
    }
    if (eveningQuestionnaireCompleted.present) {
      map['evening_questionnaire_completed'] = Variable<bool>(
        eveningQuestionnaireCompleted.value,
      );
    }
    if (medicationTaken.present) {
      map['medication_taken'] = Variable<bool>(medicationTaken.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (archivedAt.present) {
      map['archived_at'] = Variable<DateTime>(archivedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DailyFlowsCompanion(')
          ..write('id: $id, ')
          ..write('flowDate: $flowDate, ')
          ..write('status: $status, ')
          ..write('dayClassification: $dayClassification, ')
          ..write('morningScore: $morningScore, ')
          ..write('respiratoryStabilityScore: $respiratoryStabilityScore, ')
          ..write('eveningNotes: $eveningNotes, ')
          ..write('checklistCompleted: $checklistCompleted, ')
          ..write(
            'morningQuestionnaireCompleted: $morningQuestionnaireCompleted, ',
          )
          ..write(
            'eveningQuestionnaireCompleted: $eveningQuestionnaireCompleted, ',
          )
          ..write('medicationTaken: $medicationTaken, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('archivedAt: $archivedAt')
          ..write(')'))
        .toString();
  }
}

class $ChecklistItemsTable extends ChecklistItems
    with TableInfo<$ChecklistItemsTable, ChecklistItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ChecklistItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _dailyFlowIdMeta = const VerificationMeta(
    'dailyFlowId',
  );
  @override
  late final GeneratedColumn<int> dailyFlowId = GeneratedColumn<int>(
    'daily_flow_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
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
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isRequiredMeta = const VerificationMeta(
    'isRequired',
  );
  @override
  late final GeneratedColumn<bool> isRequired = GeneratedColumn<bool>(
    'is_required',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_required" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _completedMeta = const VerificationMeta(
    'completed',
  );
  @override
  late final GeneratedColumn<bool> completed = GeneratedColumn<bool>(
    'completed',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("completed" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _completedAtMeta = const VerificationMeta(
    'completedAt',
  );
  @override
  late final GeneratedColumn<DateTime> completedAt = GeneratedColumn<DateTime>(
    'completed_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    dailyFlowId,
    type,
    name,
    isRequired,
    completed,
    completedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'checklist_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<ChecklistItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('daily_flow_id')) {
      context.handle(
        _dailyFlowIdMeta,
        dailyFlowId.isAcceptableOrUnknown(
          data['daily_flow_id']!,
          _dailyFlowIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_dailyFlowIdMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('is_required')) {
      context.handle(
        _isRequiredMeta,
        isRequired.isAcceptableOrUnknown(data['is_required']!, _isRequiredMeta),
      );
    }
    if (data.containsKey('completed')) {
      context.handle(
        _completedMeta,
        completed.isAcceptableOrUnknown(data['completed']!, _completedMeta),
      );
    }
    if (data.containsKey('completed_at')) {
      context.handle(
        _completedAtMeta,
        completedAt.isAcceptableOrUnknown(
          data['completed_at']!,
          _completedAtMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ChecklistItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ChecklistItem(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      dailyFlowId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}daily_flow_id'],
          )!,
      type:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}type'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      isRequired:
          attachedDatabase.typeMapping.read(
            DriftSqlType.bool,
            data['${effectivePrefix}is_required'],
          )!,
      completed:
          attachedDatabase.typeMapping.read(
            DriftSqlType.bool,
            data['${effectivePrefix}completed'],
          )!,
      completedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}completed_at'],
      ),
    );
  }

  @override
  $ChecklistItemsTable createAlias(String alias) {
    return $ChecklistItemsTable(attachedDatabase, alias);
  }
}

class ChecklistItem extends DataClass implements Insertable<ChecklistItem> {
  final int id;
  final int dailyFlowId;
  final String type;
  final String name;
  final bool isRequired;
  final bool completed;
  final DateTime? completedAt;
  const ChecklistItem({
    required this.id,
    required this.dailyFlowId,
    required this.type,
    required this.name,
    required this.isRequired,
    required this.completed,
    this.completedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['daily_flow_id'] = Variable<int>(dailyFlowId);
    map['type'] = Variable<String>(type);
    map['name'] = Variable<String>(name);
    map['is_required'] = Variable<bool>(isRequired);
    map['completed'] = Variable<bool>(completed);
    if (!nullToAbsent || completedAt != null) {
      map['completed_at'] = Variable<DateTime>(completedAt);
    }
    return map;
  }

  ChecklistItemsCompanion toCompanion(bool nullToAbsent) {
    return ChecklistItemsCompanion(
      id: Value(id),
      dailyFlowId: Value(dailyFlowId),
      type: Value(type),
      name: Value(name),
      isRequired: Value(isRequired),
      completed: Value(completed),
      completedAt:
          completedAt == null && nullToAbsent
              ? const Value.absent()
              : Value(completedAt),
    );
  }

  factory ChecklistItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ChecklistItem(
      id: serializer.fromJson<int>(json['id']),
      dailyFlowId: serializer.fromJson<int>(json['dailyFlowId']),
      type: serializer.fromJson<String>(json['type']),
      name: serializer.fromJson<String>(json['name']),
      isRequired: serializer.fromJson<bool>(json['isRequired']),
      completed: serializer.fromJson<bool>(json['completed']),
      completedAt: serializer.fromJson<DateTime?>(json['completedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'dailyFlowId': serializer.toJson<int>(dailyFlowId),
      'type': serializer.toJson<String>(type),
      'name': serializer.toJson<String>(name),
      'isRequired': serializer.toJson<bool>(isRequired),
      'completed': serializer.toJson<bool>(completed),
      'completedAt': serializer.toJson<DateTime?>(completedAt),
    };
  }

  ChecklistItem copyWith({
    int? id,
    int? dailyFlowId,
    String? type,
    String? name,
    bool? isRequired,
    bool? completed,
    Value<DateTime?> completedAt = const Value.absent(),
  }) => ChecklistItem(
    id: id ?? this.id,
    dailyFlowId: dailyFlowId ?? this.dailyFlowId,
    type: type ?? this.type,
    name: name ?? this.name,
    isRequired: isRequired ?? this.isRequired,
    completed: completed ?? this.completed,
    completedAt: completedAt.present ? completedAt.value : this.completedAt,
  );
  ChecklistItem copyWithCompanion(ChecklistItemsCompanion data) {
    return ChecklistItem(
      id: data.id.present ? data.id.value : this.id,
      dailyFlowId:
          data.dailyFlowId.present ? data.dailyFlowId.value : this.dailyFlowId,
      type: data.type.present ? data.type.value : this.type,
      name: data.name.present ? data.name.value : this.name,
      isRequired:
          data.isRequired.present ? data.isRequired.value : this.isRequired,
      completed: data.completed.present ? data.completed.value : this.completed,
      completedAt:
          data.completedAt.present ? data.completedAt.value : this.completedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ChecklistItem(')
          ..write('id: $id, ')
          ..write('dailyFlowId: $dailyFlowId, ')
          ..write('type: $type, ')
          ..write('name: $name, ')
          ..write('isRequired: $isRequired, ')
          ..write('completed: $completed, ')
          ..write('completedAt: $completedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    dailyFlowId,
    type,
    name,
    isRequired,
    completed,
    completedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ChecklistItem &&
          other.id == this.id &&
          other.dailyFlowId == this.dailyFlowId &&
          other.type == this.type &&
          other.name == this.name &&
          other.isRequired == this.isRequired &&
          other.completed == this.completed &&
          other.completedAt == this.completedAt);
}

class ChecklistItemsCompanion extends UpdateCompanion<ChecklistItem> {
  final Value<int> id;
  final Value<int> dailyFlowId;
  final Value<String> type;
  final Value<String> name;
  final Value<bool> isRequired;
  final Value<bool> completed;
  final Value<DateTime?> completedAt;
  const ChecklistItemsCompanion({
    this.id = const Value.absent(),
    this.dailyFlowId = const Value.absent(),
    this.type = const Value.absent(),
    this.name = const Value.absent(),
    this.isRequired = const Value.absent(),
    this.completed = const Value.absent(),
    this.completedAt = const Value.absent(),
  });
  ChecklistItemsCompanion.insert({
    this.id = const Value.absent(),
    required int dailyFlowId,
    required String type,
    required String name,
    this.isRequired = const Value.absent(),
    this.completed = const Value.absent(),
    this.completedAt = const Value.absent(),
  }) : dailyFlowId = Value(dailyFlowId),
       type = Value(type),
       name = Value(name);
  static Insertable<ChecklistItem> custom({
    Expression<int>? id,
    Expression<int>? dailyFlowId,
    Expression<String>? type,
    Expression<String>? name,
    Expression<bool>? isRequired,
    Expression<bool>? completed,
    Expression<DateTime>? completedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (dailyFlowId != null) 'daily_flow_id': dailyFlowId,
      if (type != null) 'type': type,
      if (name != null) 'name': name,
      if (isRequired != null) 'is_required': isRequired,
      if (completed != null) 'completed': completed,
      if (completedAt != null) 'completed_at': completedAt,
    });
  }

  ChecklistItemsCompanion copyWith({
    Value<int>? id,
    Value<int>? dailyFlowId,
    Value<String>? type,
    Value<String>? name,
    Value<bool>? isRequired,
    Value<bool>? completed,
    Value<DateTime?>? completedAt,
  }) {
    return ChecklistItemsCompanion(
      id: id ?? this.id,
      dailyFlowId: dailyFlowId ?? this.dailyFlowId,
      type: type ?? this.type,
      name: name ?? this.name,
      isRequired: isRequired ?? this.isRequired,
      completed: completed ?? this.completed,
      completedAt: completedAt ?? this.completedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (dailyFlowId.present) {
      map['daily_flow_id'] = Variable<int>(dailyFlowId.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (isRequired.present) {
      map['is_required'] = Variable<bool>(isRequired.value);
    }
    if (completed.present) {
      map['completed'] = Variable<bool>(completed.value);
    }
    if (completedAt.present) {
      map['completed_at'] = Variable<DateTime>(completedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChecklistItemsCompanion(')
          ..write('id: $id, ')
          ..write('dailyFlowId: $dailyFlowId, ')
          ..write('type: $type, ')
          ..write('name: $name, ')
          ..write('isRequired: $isRequired, ')
          ..write('completed: $completed, ')
          ..write('completedAt: $completedAt')
          ..write(')'))
        .toString();
  }
}

class $RoutineBlocksTable extends RoutineBlocks
    with TableInfo<$RoutineBlocksTable, RoutineBlock> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RoutineBlocksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _dailyFlowIdMeta = const VerificationMeta(
    'dailyFlowId',
  );
  @override
  late final GeneratedColumn<int> dailyFlowId = GeneratedColumn<int>(
    'daily_flow_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _blockIndexMeta = const VerificationMeta(
    'blockIndex',
  );
  @override
  late final GeneratedColumn<int> blockIndex = GeneratedColumn<int>(
    'block_index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _blockNameMeta = const VerificationMeta(
    'blockName',
  );
  @override
  late final GeneratedColumn<String> blockName = GeneratedColumn<String>(
    'block_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _scheduledTimeMeta = const VerificationMeta(
    'scheduledTime',
  );
  @override
  late final GeneratedColumn<String> scheduledTime = GeneratedColumn<String>(
    'scheduled_time',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('pending'),
  );
  static const VerificationMeta _estimatedDurationMinutesMeta =
      const VerificationMeta('estimatedDurationMinutes');
  @override
  late final GeneratedColumn<int> estimatedDurationMinutes =
      GeneratedColumn<int>(
        'estimated_duration_minutes',
        aliasedName,
        true,
        type: DriftSqlType.int,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _actualDurationMinutesMeta =
      const VerificationMeta('actualDurationMinutes');
  @override
  late final GeneratedColumn<int> actualDurationMinutes = GeneratedColumn<int>(
    'actual_duration_minutes',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _perceivedEffortMeta = const VerificationMeta(
    'perceivedEffort',
  );
  @override
  late final GeneratedColumn<int> perceivedEffort = GeneratedColumn<int>(
    'perceived_effort',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _completedAtMeta = const VerificationMeta(
    'completedAt',
  );
  @override
  late final GeneratedColumn<DateTime> completedAt = GeneratedColumn<DateTime>(
    'completed_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    dailyFlowId,
    blockIndex,
    blockName,
    scheduledTime,
    status,
    estimatedDurationMinutes,
    actualDurationMinutes,
    perceivedEffort,
    completedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'routine_blocks';
  @override
  VerificationContext validateIntegrity(
    Insertable<RoutineBlock> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('daily_flow_id')) {
      context.handle(
        _dailyFlowIdMeta,
        dailyFlowId.isAcceptableOrUnknown(
          data['daily_flow_id']!,
          _dailyFlowIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_dailyFlowIdMeta);
    }
    if (data.containsKey('block_index')) {
      context.handle(
        _blockIndexMeta,
        blockIndex.isAcceptableOrUnknown(data['block_index']!, _blockIndexMeta),
      );
    } else if (isInserting) {
      context.missing(_blockIndexMeta);
    }
    if (data.containsKey('block_name')) {
      context.handle(
        _blockNameMeta,
        blockName.isAcceptableOrUnknown(data['block_name']!, _blockNameMeta),
      );
    } else if (isInserting) {
      context.missing(_blockNameMeta);
    }
    if (data.containsKey('scheduled_time')) {
      context.handle(
        _scheduledTimeMeta,
        scheduledTime.isAcceptableOrUnknown(
          data['scheduled_time']!,
          _scheduledTimeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_scheduledTimeMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('estimated_duration_minutes')) {
      context.handle(
        _estimatedDurationMinutesMeta,
        estimatedDurationMinutes.isAcceptableOrUnknown(
          data['estimated_duration_minutes']!,
          _estimatedDurationMinutesMeta,
        ),
      );
    }
    if (data.containsKey('actual_duration_minutes')) {
      context.handle(
        _actualDurationMinutesMeta,
        actualDurationMinutes.isAcceptableOrUnknown(
          data['actual_duration_minutes']!,
          _actualDurationMinutesMeta,
        ),
      );
    }
    if (data.containsKey('perceived_effort')) {
      context.handle(
        _perceivedEffortMeta,
        perceivedEffort.isAcceptableOrUnknown(
          data['perceived_effort']!,
          _perceivedEffortMeta,
        ),
      );
    }
    if (data.containsKey('completed_at')) {
      context.handle(
        _completedAtMeta,
        completedAt.isAcceptableOrUnknown(
          data['completed_at']!,
          _completedAtMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RoutineBlock map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RoutineBlock(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      dailyFlowId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}daily_flow_id'],
          )!,
      blockIndex:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}block_index'],
          )!,
      blockName:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}block_name'],
          )!,
      scheduledTime:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}scheduled_time'],
          )!,
      status:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}status'],
          )!,
      estimatedDurationMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}estimated_duration_minutes'],
      ),
      actualDurationMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}actual_duration_minutes'],
      ),
      perceivedEffort: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}perceived_effort'],
      ),
      completedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}completed_at'],
      ),
    );
  }

  @override
  $RoutineBlocksTable createAlias(String alias) {
    return $RoutineBlocksTable(attachedDatabase, alias);
  }
}

class RoutineBlock extends DataClass implements Insertable<RoutineBlock> {
  final int id;
  final int dailyFlowId;
  final int blockIndex;
  final String blockName;
  final String scheduledTime;
  final String status;
  final int? estimatedDurationMinutes;
  final int? actualDurationMinutes;
  final int? perceivedEffort;
  final DateTime? completedAt;
  const RoutineBlock({
    required this.id,
    required this.dailyFlowId,
    required this.blockIndex,
    required this.blockName,
    required this.scheduledTime,
    required this.status,
    this.estimatedDurationMinutes,
    this.actualDurationMinutes,
    this.perceivedEffort,
    this.completedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['daily_flow_id'] = Variable<int>(dailyFlowId);
    map['block_index'] = Variable<int>(blockIndex);
    map['block_name'] = Variable<String>(blockName);
    map['scheduled_time'] = Variable<String>(scheduledTime);
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || estimatedDurationMinutes != null) {
      map['estimated_duration_minutes'] = Variable<int>(
        estimatedDurationMinutes,
      );
    }
    if (!nullToAbsent || actualDurationMinutes != null) {
      map['actual_duration_minutes'] = Variable<int>(actualDurationMinutes);
    }
    if (!nullToAbsent || perceivedEffort != null) {
      map['perceived_effort'] = Variable<int>(perceivedEffort);
    }
    if (!nullToAbsent || completedAt != null) {
      map['completed_at'] = Variable<DateTime>(completedAt);
    }
    return map;
  }

  RoutineBlocksCompanion toCompanion(bool nullToAbsent) {
    return RoutineBlocksCompanion(
      id: Value(id),
      dailyFlowId: Value(dailyFlowId),
      blockIndex: Value(blockIndex),
      blockName: Value(blockName),
      scheduledTime: Value(scheduledTime),
      status: Value(status),
      estimatedDurationMinutes:
          estimatedDurationMinutes == null && nullToAbsent
              ? const Value.absent()
              : Value(estimatedDurationMinutes),
      actualDurationMinutes:
          actualDurationMinutes == null && nullToAbsent
              ? const Value.absent()
              : Value(actualDurationMinutes),
      perceivedEffort:
          perceivedEffort == null && nullToAbsent
              ? const Value.absent()
              : Value(perceivedEffort),
      completedAt:
          completedAt == null && nullToAbsent
              ? const Value.absent()
              : Value(completedAt),
    );
  }

  factory RoutineBlock.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RoutineBlock(
      id: serializer.fromJson<int>(json['id']),
      dailyFlowId: serializer.fromJson<int>(json['dailyFlowId']),
      blockIndex: serializer.fromJson<int>(json['blockIndex']),
      blockName: serializer.fromJson<String>(json['blockName']),
      scheduledTime: serializer.fromJson<String>(json['scheduledTime']),
      status: serializer.fromJson<String>(json['status']),
      estimatedDurationMinutes: serializer.fromJson<int?>(
        json['estimatedDurationMinutes'],
      ),
      actualDurationMinutes: serializer.fromJson<int?>(
        json['actualDurationMinutes'],
      ),
      perceivedEffort: serializer.fromJson<int?>(json['perceivedEffort']),
      completedAt: serializer.fromJson<DateTime?>(json['completedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'dailyFlowId': serializer.toJson<int>(dailyFlowId),
      'blockIndex': serializer.toJson<int>(blockIndex),
      'blockName': serializer.toJson<String>(blockName),
      'scheduledTime': serializer.toJson<String>(scheduledTime),
      'status': serializer.toJson<String>(status),
      'estimatedDurationMinutes': serializer.toJson<int?>(
        estimatedDurationMinutes,
      ),
      'actualDurationMinutes': serializer.toJson<int?>(actualDurationMinutes),
      'perceivedEffort': serializer.toJson<int?>(perceivedEffort),
      'completedAt': serializer.toJson<DateTime?>(completedAt),
    };
  }

  RoutineBlock copyWith({
    int? id,
    int? dailyFlowId,
    int? blockIndex,
    String? blockName,
    String? scheduledTime,
    String? status,
    Value<int?> estimatedDurationMinutes = const Value.absent(),
    Value<int?> actualDurationMinutes = const Value.absent(),
    Value<int?> perceivedEffort = const Value.absent(),
    Value<DateTime?> completedAt = const Value.absent(),
  }) => RoutineBlock(
    id: id ?? this.id,
    dailyFlowId: dailyFlowId ?? this.dailyFlowId,
    blockIndex: blockIndex ?? this.blockIndex,
    blockName: blockName ?? this.blockName,
    scheduledTime: scheduledTime ?? this.scheduledTime,
    status: status ?? this.status,
    estimatedDurationMinutes:
        estimatedDurationMinutes.present
            ? estimatedDurationMinutes.value
            : this.estimatedDurationMinutes,
    actualDurationMinutes:
        actualDurationMinutes.present
            ? actualDurationMinutes.value
            : this.actualDurationMinutes,
    perceivedEffort:
        perceivedEffort.present ? perceivedEffort.value : this.perceivedEffort,
    completedAt: completedAt.present ? completedAt.value : this.completedAt,
  );
  RoutineBlock copyWithCompanion(RoutineBlocksCompanion data) {
    return RoutineBlock(
      id: data.id.present ? data.id.value : this.id,
      dailyFlowId:
          data.dailyFlowId.present ? data.dailyFlowId.value : this.dailyFlowId,
      blockIndex:
          data.blockIndex.present ? data.blockIndex.value : this.blockIndex,
      blockName: data.blockName.present ? data.blockName.value : this.blockName,
      scheduledTime:
          data.scheduledTime.present
              ? data.scheduledTime.value
              : this.scheduledTime,
      status: data.status.present ? data.status.value : this.status,
      estimatedDurationMinutes:
          data.estimatedDurationMinutes.present
              ? data.estimatedDurationMinutes.value
              : this.estimatedDurationMinutes,
      actualDurationMinutes:
          data.actualDurationMinutes.present
              ? data.actualDurationMinutes.value
              : this.actualDurationMinutes,
      perceivedEffort:
          data.perceivedEffort.present
              ? data.perceivedEffort.value
              : this.perceivedEffort,
      completedAt:
          data.completedAt.present ? data.completedAt.value : this.completedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RoutineBlock(')
          ..write('id: $id, ')
          ..write('dailyFlowId: $dailyFlowId, ')
          ..write('blockIndex: $blockIndex, ')
          ..write('blockName: $blockName, ')
          ..write('scheduledTime: $scheduledTime, ')
          ..write('status: $status, ')
          ..write('estimatedDurationMinutes: $estimatedDurationMinutes, ')
          ..write('actualDurationMinutes: $actualDurationMinutes, ')
          ..write('perceivedEffort: $perceivedEffort, ')
          ..write('completedAt: $completedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    dailyFlowId,
    blockIndex,
    blockName,
    scheduledTime,
    status,
    estimatedDurationMinutes,
    actualDurationMinutes,
    perceivedEffort,
    completedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RoutineBlock &&
          other.id == this.id &&
          other.dailyFlowId == this.dailyFlowId &&
          other.blockIndex == this.blockIndex &&
          other.blockName == this.blockName &&
          other.scheduledTime == this.scheduledTime &&
          other.status == this.status &&
          other.estimatedDurationMinutes == this.estimatedDurationMinutes &&
          other.actualDurationMinutes == this.actualDurationMinutes &&
          other.perceivedEffort == this.perceivedEffort &&
          other.completedAt == this.completedAt);
}

class RoutineBlocksCompanion extends UpdateCompanion<RoutineBlock> {
  final Value<int> id;
  final Value<int> dailyFlowId;
  final Value<int> blockIndex;
  final Value<String> blockName;
  final Value<String> scheduledTime;
  final Value<String> status;
  final Value<int?> estimatedDurationMinutes;
  final Value<int?> actualDurationMinutes;
  final Value<int?> perceivedEffort;
  final Value<DateTime?> completedAt;
  const RoutineBlocksCompanion({
    this.id = const Value.absent(),
    this.dailyFlowId = const Value.absent(),
    this.blockIndex = const Value.absent(),
    this.blockName = const Value.absent(),
    this.scheduledTime = const Value.absent(),
    this.status = const Value.absent(),
    this.estimatedDurationMinutes = const Value.absent(),
    this.actualDurationMinutes = const Value.absent(),
    this.perceivedEffort = const Value.absent(),
    this.completedAt = const Value.absent(),
  });
  RoutineBlocksCompanion.insert({
    this.id = const Value.absent(),
    required int dailyFlowId,
    required int blockIndex,
    required String blockName,
    required String scheduledTime,
    this.status = const Value.absent(),
    this.estimatedDurationMinutes = const Value.absent(),
    this.actualDurationMinutes = const Value.absent(),
    this.perceivedEffort = const Value.absent(),
    this.completedAt = const Value.absent(),
  }) : dailyFlowId = Value(dailyFlowId),
       blockIndex = Value(blockIndex),
       blockName = Value(blockName),
       scheduledTime = Value(scheduledTime);
  static Insertable<RoutineBlock> custom({
    Expression<int>? id,
    Expression<int>? dailyFlowId,
    Expression<int>? blockIndex,
    Expression<String>? blockName,
    Expression<String>? scheduledTime,
    Expression<String>? status,
    Expression<int>? estimatedDurationMinutes,
    Expression<int>? actualDurationMinutes,
    Expression<int>? perceivedEffort,
    Expression<DateTime>? completedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (dailyFlowId != null) 'daily_flow_id': dailyFlowId,
      if (blockIndex != null) 'block_index': blockIndex,
      if (blockName != null) 'block_name': blockName,
      if (scheduledTime != null) 'scheduled_time': scheduledTime,
      if (status != null) 'status': status,
      if (estimatedDurationMinutes != null)
        'estimated_duration_minutes': estimatedDurationMinutes,
      if (actualDurationMinutes != null)
        'actual_duration_minutes': actualDurationMinutes,
      if (perceivedEffort != null) 'perceived_effort': perceivedEffort,
      if (completedAt != null) 'completed_at': completedAt,
    });
  }

  RoutineBlocksCompanion copyWith({
    Value<int>? id,
    Value<int>? dailyFlowId,
    Value<int>? blockIndex,
    Value<String>? blockName,
    Value<String>? scheduledTime,
    Value<String>? status,
    Value<int?>? estimatedDurationMinutes,
    Value<int?>? actualDurationMinutes,
    Value<int?>? perceivedEffort,
    Value<DateTime?>? completedAt,
  }) {
    return RoutineBlocksCompanion(
      id: id ?? this.id,
      dailyFlowId: dailyFlowId ?? this.dailyFlowId,
      blockIndex: blockIndex ?? this.blockIndex,
      blockName: blockName ?? this.blockName,
      scheduledTime: scheduledTime ?? this.scheduledTime,
      status: status ?? this.status,
      estimatedDurationMinutes:
          estimatedDurationMinutes ?? this.estimatedDurationMinutes,
      actualDurationMinutes:
          actualDurationMinutes ?? this.actualDurationMinutes,
      perceivedEffort: perceivedEffort ?? this.perceivedEffort,
      completedAt: completedAt ?? this.completedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (dailyFlowId.present) {
      map['daily_flow_id'] = Variable<int>(dailyFlowId.value);
    }
    if (blockIndex.present) {
      map['block_index'] = Variable<int>(blockIndex.value);
    }
    if (blockName.present) {
      map['block_name'] = Variable<String>(blockName.value);
    }
    if (scheduledTime.present) {
      map['scheduled_time'] = Variable<String>(scheduledTime.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (estimatedDurationMinutes.present) {
      map['estimated_duration_minutes'] = Variable<int>(
        estimatedDurationMinutes.value,
      );
    }
    if (actualDurationMinutes.present) {
      map['actual_duration_minutes'] = Variable<int>(
        actualDurationMinutes.value,
      );
    }
    if (perceivedEffort.present) {
      map['perceived_effort'] = Variable<int>(perceivedEffort.value);
    }
    if (completedAt.present) {
      map['completed_at'] = Variable<DateTime>(completedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RoutineBlocksCompanion(')
          ..write('id: $id, ')
          ..write('dailyFlowId: $dailyFlowId, ')
          ..write('blockIndex: $blockIndex, ')
          ..write('blockName: $blockName, ')
          ..write('scheduledTime: $scheduledTime, ')
          ..write('status: $status, ')
          ..write('estimatedDurationMinutes: $estimatedDurationMinutes, ')
          ..write('actualDurationMinutes: $actualDurationMinutes, ')
          ..write('perceivedEffort: $perceivedEffort, ')
          ..write('completedAt: $completedAt')
          ..write(')'))
        .toString();
  }
}

class $RoutineTasksTable extends RoutineTasks
    with TableInfo<$RoutineTasksTable, RoutineTask> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RoutineTasksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _routineBlockIdMeta = const VerificationMeta(
    'routineBlockId',
  );
  @override
  late final GeneratedColumn<int> routineBlockId = GeneratedColumn<int>(
    'routine_block_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _exerciseTypeMeta = const VerificationMeta(
    'exerciseType',
  );
  @override
  late final GeneratedColumn<String> exerciseType = GeneratedColumn<String>(
    'exercise_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
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
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _durationSecondsMeta = const VerificationMeta(
    'durationSeconds',
  );
  @override
  late final GeneratedColumn<int> durationSeconds = GeneratedColumn<int>(
    'duration_seconds',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _videoAssetPathMeta = const VerificationMeta(
    'videoAssetPath',
  );
  @override
  late final GeneratedColumn<String> videoAssetPath = GeneratedColumn<String>(
    'video_asset_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _orderIndexMeta = const VerificationMeta(
    'orderIndex',
  );
  @override
  late final GeneratedColumn<int> orderIndex = GeneratedColumn<int>(
    'order_index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('pending'),
  );
  static const VerificationMeta _postponedMeta = const VerificationMeta(
    'postponed',
  );
  @override
  late final GeneratedColumn<bool> postponed = GeneratedColumn<bool>(
    'postponed',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("postponed" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _completedAtMeta = const VerificationMeta(
    'completedAt',
  );
  @override
  late final GeneratedColumn<DateTime> completedAt = GeneratedColumn<DateTime>(
    'completed_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    routineBlockId,
    exerciseType,
    title,
    description,
    durationSeconds,
    videoAssetPath,
    orderIndex,
    status,
    postponed,
    completedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'routine_tasks';
  @override
  VerificationContext validateIntegrity(
    Insertable<RoutineTask> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('routine_block_id')) {
      context.handle(
        _routineBlockIdMeta,
        routineBlockId.isAcceptableOrUnknown(
          data['routine_block_id']!,
          _routineBlockIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_routineBlockIdMeta);
    }
    if (data.containsKey('exercise_type')) {
      context.handle(
        _exerciseTypeMeta,
        exerciseType.isAcceptableOrUnknown(
          data['exercise_type']!,
          _exerciseTypeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_exerciseTypeMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
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
    if (data.containsKey('duration_seconds')) {
      context.handle(
        _durationSecondsMeta,
        durationSeconds.isAcceptableOrUnknown(
          data['duration_seconds']!,
          _durationSecondsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_durationSecondsMeta);
    }
    if (data.containsKey('video_asset_path')) {
      context.handle(
        _videoAssetPathMeta,
        videoAssetPath.isAcceptableOrUnknown(
          data['video_asset_path']!,
          _videoAssetPathMeta,
        ),
      );
    }
    if (data.containsKey('order_index')) {
      context.handle(
        _orderIndexMeta,
        orderIndex.isAcceptableOrUnknown(data['order_index']!, _orderIndexMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('postponed')) {
      context.handle(
        _postponedMeta,
        postponed.isAcceptableOrUnknown(data['postponed']!, _postponedMeta),
      );
    }
    if (data.containsKey('completed_at')) {
      context.handle(
        _completedAtMeta,
        completedAt.isAcceptableOrUnknown(
          data['completed_at']!,
          _completedAtMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RoutineTask map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RoutineTask(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      routineBlockId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}routine_block_id'],
          )!,
      exerciseType:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}exercise_type'],
          )!,
      title:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}title'],
          )!,
      description:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}description'],
          )!,
      durationSeconds:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}duration_seconds'],
          )!,
      videoAssetPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}video_asset_path'],
      ),
      orderIndex:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}order_index'],
          )!,
      status:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}status'],
          )!,
      postponed:
          attachedDatabase.typeMapping.read(
            DriftSqlType.bool,
            data['${effectivePrefix}postponed'],
          )!,
      completedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}completed_at'],
      ),
    );
  }

  @override
  $RoutineTasksTable createAlias(String alias) {
    return $RoutineTasksTable(attachedDatabase, alias);
  }
}

class RoutineTask extends DataClass implements Insertable<RoutineTask> {
  final int id;
  final int routineBlockId;
  final String exerciseType;
  final String title;
  final String description;
  final int durationSeconds;
  final String? videoAssetPath;
  final int orderIndex;
  final String status;
  final bool postponed;
  final DateTime? completedAt;
  const RoutineTask({
    required this.id,
    required this.routineBlockId,
    required this.exerciseType,
    required this.title,
    required this.description,
    required this.durationSeconds,
    this.videoAssetPath,
    required this.orderIndex,
    required this.status,
    required this.postponed,
    this.completedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['routine_block_id'] = Variable<int>(routineBlockId);
    map['exercise_type'] = Variable<String>(exerciseType);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    map['duration_seconds'] = Variable<int>(durationSeconds);
    if (!nullToAbsent || videoAssetPath != null) {
      map['video_asset_path'] = Variable<String>(videoAssetPath);
    }
    map['order_index'] = Variable<int>(orderIndex);
    map['status'] = Variable<String>(status);
    map['postponed'] = Variable<bool>(postponed);
    if (!nullToAbsent || completedAt != null) {
      map['completed_at'] = Variable<DateTime>(completedAt);
    }
    return map;
  }

  RoutineTasksCompanion toCompanion(bool nullToAbsent) {
    return RoutineTasksCompanion(
      id: Value(id),
      routineBlockId: Value(routineBlockId),
      exerciseType: Value(exerciseType),
      title: Value(title),
      description: Value(description),
      durationSeconds: Value(durationSeconds),
      videoAssetPath:
          videoAssetPath == null && nullToAbsent
              ? const Value.absent()
              : Value(videoAssetPath),
      orderIndex: Value(orderIndex),
      status: Value(status),
      postponed: Value(postponed),
      completedAt:
          completedAt == null && nullToAbsent
              ? const Value.absent()
              : Value(completedAt),
    );
  }

  factory RoutineTask.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RoutineTask(
      id: serializer.fromJson<int>(json['id']),
      routineBlockId: serializer.fromJson<int>(json['routineBlockId']),
      exerciseType: serializer.fromJson<String>(json['exerciseType']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      durationSeconds: serializer.fromJson<int>(json['durationSeconds']),
      videoAssetPath: serializer.fromJson<String?>(json['videoAssetPath']),
      orderIndex: serializer.fromJson<int>(json['orderIndex']),
      status: serializer.fromJson<String>(json['status']),
      postponed: serializer.fromJson<bool>(json['postponed']),
      completedAt: serializer.fromJson<DateTime?>(json['completedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'routineBlockId': serializer.toJson<int>(routineBlockId),
      'exerciseType': serializer.toJson<String>(exerciseType),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'durationSeconds': serializer.toJson<int>(durationSeconds),
      'videoAssetPath': serializer.toJson<String?>(videoAssetPath),
      'orderIndex': serializer.toJson<int>(orderIndex),
      'status': serializer.toJson<String>(status),
      'postponed': serializer.toJson<bool>(postponed),
      'completedAt': serializer.toJson<DateTime?>(completedAt),
    };
  }

  RoutineTask copyWith({
    int? id,
    int? routineBlockId,
    String? exerciseType,
    String? title,
    String? description,
    int? durationSeconds,
    Value<String?> videoAssetPath = const Value.absent(),
    int? orderIndex,
    String? status,
    bool? postponed,
    Value<DateTime?> completedAt = const Value.absent(),
  }) => RoutineTask(
    id: id ?? this.id,
    routineBlockId: routineBlockId ?? this.routineBlockId,
    exerciseType: exerciseType ?? this.exerciseType,
    title: title ?? this.title,
    description: description ?? this.description,
    durationSeconds: durationSeconds ?? this.durationSeconds,
    videoAssetPath:
        videoAssetPath.present ? videoAssetPath.value : this.videoAssetPath,
    orderIndex: orderIndex ?? this.orderIndex,
    status: status ?? this.status,
    postponed: postponed ?? this.postponed,
    completedAt: completedAt.present ? completedAt.value : this.completedAt,
  );
  RoutineTask copyWithCompanion(RoutineTasksCompanion data) {
    return RoutineTask(
      id: data.id.present ? data.id.value : this.id,
      routineBlockId:
          data.routineBlockId.present
              ? data.routineBlockId.value
              : this.routineBlockId,
      exerciseType:
          data.exerciseType.present
              ? data.exerciseType.value
              : this.exerciseType,
      title: data.title.present ? data.title.value : this.title,
      description:
          data.description.present ? data.description.value : this.description,
      durationSeconds:
          data.durationSeconds.present
              ? data.durationSeconds.value
              : this.durationSeconds,
      videoAssetPath:
          data.videoAssetPath.present
              ? data.videoAssetPath.value
              : this.videoAssetPath,
      orderIndex:
          data.orderIndex.present ? data.orderIndex.value : this.orderIndex,
      status: data.status.present ? data.status.value : this.status,
      postponed: data.postponed.present ? data.postponed.value : this.postponed,
      completedAt:
          data.completedAt.present ? data.completedAt.value : this.completedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RoutineTask(')
          ..write('id: $id, ')
          ..write('routineBlockId: $routineBlockId, ')
          ..write('exerciseType: $exerciseType, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('durationSeconds: $durationSeconds, ')
          ..write('videoAssetPath: $videoAssetPath, ')
          ..write('orderIndex: $orderIndex, ')
          ..write('status: $status, ')
          ..write('postponed: $postponed, ')
          ..write('completedAt: $completedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    routineBlockId,
    exerciseType,
    title,
    description,
    durationSeconds,
    videoAssetPath,
    orderIndex,
    status,
    postponed,
    completedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RoutineTask &&
          other.id == this.id &&
          other.routineBlockId == this.routineBlockId &&
          other.exerciseType == this.exerciseType &&
          other.title == this.title &&
          other.description == this.description &&
          other.durationSeconds == this.durationSeconds &&
          other.videoAssetPath == this.videoAssetPath &&
          other.orderIndex == this.orderIndex &&
          other.status == this.status &&
          other.postponed == this.postponed &&
          other.completedAt == this.completedAt);
}

class RoutineTasksCompanion extends UpdateCompanion<RoutineTask> {
  final Value<int> id;
  final Value<int> routineBlockId;
  final Value<String> exerciseType;
  final Value<String> title;
  final Value<String> description;
  final Value<int> durationSeconds;
  final Value<String?> videoAssetPath;
  final Value<int> orderIndex;
  final Value<String> status;
  final Value<bool> postponed;
  final Value<DateTime?> completedAt;
  const RoutineTasksCompanion({
    this.id = const Value.absent(),
    this.routineBlockId = const Value.absent(),
    this.exerciseType = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.durationSeconds = const Value.absent(),
    this.videoAssetPath = const Value.absent(),
    this.orderIndex = const Value.absent(),
    this.status = const Value.absent(),
    this.postponed = const Value.absent(),
    this.completedAt = const Value.absent(),
  });
  RoutineTasksCompanion.insert({
    this.id = const Value.absent(),
    required int routineBlockId,
    required String exerciseType,
    required String title,
    this.description = const Value.absent(),
    required int durationSeconds,
    this.videoAssetPath = const Value.absent(),
    this.orderIndex = const Value.absent(),
    this.status = const Value.absent(),
    this.postponed = const Value.absent(),
    this.completedAt = const Value.absent(),
  }) : routineBlockId = Value(routineBlockId),
       exerciseType = Value(exerciseType),
       title = Value(title),
       durationSeconds = Value(durationSeconds);
  static Insertable<RoutineTask> custom({
    Expression<int>? id,
    Expression<int>? routineBlockId,
    Expression<String>? exerciseType,
    Expression<String>? title,
    Expression<String>? description,
    Expression<int>? durationSeconds,
    Expression<String>? videoAssetPath,
    Expression<int>? orderIndex,
    Expression<String>? status,
    Expression<bool>? postponed,
    Expression<DateTime>? completedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (routineBlockId != null) 'routine_block_id': routineBlockId,
      if (exerciseType != null) 'exercise_type': exerciseType,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (durationSeconds != null) 'duration_seconds': durationSeconds,
      if (videoAssetPath != null) 'video_asset_path': videoAssetPath,
      if (orderIndex != null) 'order_index': orderIndex,
      if (status != null) 'status': status,
      if (postponed != null) 'postponed': postponed,
      if (completedAt != null) 'completed_at': completedAt,
    });
  }

  RoutineTasksCompanion copyWith({
    Value<int>? id,
    Value<int>? routineBlockId,
    Value<String>? exerciseType,
    Value<String>? title,
    Value<String>? description,
    Value<int>? durationSeconds,
    Value<String?>? videoAssetPath,
    Value<int>? orderIndex,
    Value<String>? status,
    Value<bool>? postponed,
    Value<DateTime?>? completedAt,
  }) {
    return RoutineTasksCompanion(
      id: id ?? this.id,
      routineBlockId: routineBlockId ?? this.routineBlockId,
      exerciseType: exerciseType ?? this.exerciseType,
      title: title ?? this.title,
      description: description ?? this.description,
      durationSeconds: durationSeconds ?? this.durationSeconds,
      videoAssetPath: videoAssetPath ?? this.videoAssetPath,
      orderIndex: orderIndex ?? this.orderIndex,
      status: status ?? this.status,
      postponed: postponed ?? this.postponed,
      completedAt: completedAt ?? this.completedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (routineBlockId.present) {
      map['routine_block_id'] = Variable<int>(routineBlockId.value);
    }
    if (exerciseType.present) {
      map['exercise_type'] = Variable<String>(exerciseType.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (durationSeconds.present) {
      map['duration_seconds'] = Variable<int>(durationSeconds.value);
    }
    if (videoAssetPath.present) {
      map['video_asset_path'] = Variable<String>(videoAssetPath.value);
    }
    if (orderIndex.present) {
      map['order_index'] = Variable<int>(orderIndex.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (postponed.present) {
      map['postponed'] = Variable<bool>(postponed.value);
    }
    if (completedAt.present) {
      map['completed_at'] = Variable<DateTime>(completedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RoutineTasksCompanion(')
          ..write('id: $id, ')
          ..write('routineBlockId: $routineBlockId, ')
          ..write('exerciseType: $exerciseType, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('durationSeconds: $durationSeconds, ')
          ..write('videoAssetPath: $videoAssetPath, ')
          ..write('orderIndex: $orderIndex, ')
          ..write('status: $status, ')
          ..write('postponed: $postponed, ')
          ..write('completedAt: $completedAt')
          ..write(')'))
        .toString();
  }
}

class $ExerciseFeedbacksTable extends ExerciseFeedbacks
    with TableInfo<$ExerciseFeedbacksTable, ExerciseFeedback> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExerciseFeedbacksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _routineTaskIdMeta = const VerificationMeta(
    'routineTaskId',
  );
  @override
  late final GeneratedColumn<int> routineTaskId = GeneratedColumn<int>(
    'routine_task_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _startedAtMeta = const VerificationMeta(
    'startedAt',
  );
  @override
  late final GeneratedColumn<DateTime> startedAt = GeneratedColumn<DateTime>(
    'started_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _endedAtMeta = const VerificationMeta(
    'endedAt',
  );
  @override
  late final GeneratedColumn<DateTime> endedAt = GeneratedColumn<DateTime>(
    'ended_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _completedStatusMeta = const VerificationMeta(
    'completedStatus',
  );
  @override
  late final GeneratedColumn<String> completedStatus = GeneratedColumn<String>(
    'completed_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _preExerciseStateMeta = const VerificationMeta(
    'preExerciseState',
  );
  @override
  late final GeneratedColumn<int> preExerciseState = GeneratedColumn<int>(
    'pre_exercise_state',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _postExerciseStateMeta = const VerificationMeta(
    'postExerciseState',
  );
  @override
  late final GeneratedColumn<int> postExerciseState = GeneratedColumn<int>(
    'post_exercise_state',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _breathlessnessLevelMeta =
      const VerificationMeta('breathlessnessLevel');
  @override
  late final GeneratedColumn<int> breathlessnessLevel = GeneratedColumn<int>(
    'breathlessness_level',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _pauseCountMeta = const VerificationMeta(
    'pauseCount',
  );
  @override
  late final GeneratedColumn<int> pauseCount = GeneratedColumn<int>(
    'pause_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _rescueInhalerUsedMeta = const VerificationMeta(
    'rescueInhalerUsed',
  );
  @override
  late final GeneratedColumn<bool> rescueInhalerUsed = GeneratedColumn<bool>(
    'rescue_inhaler_used',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("rescue_inhaler_used" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _rescueInhalerTimingMeta =
      const VerificationMeta('rescueInhalerTiming');
  @override
  late final GeneratedColumn<String> rescueInhalerTiming =
      GeneratedColumn<String>(
        'rescue_inhaler_timing',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _recoveryMinutesMeta = const VerificationMeta(
    'recoveryMinutes',
  );
  @override
  late final GeneratedColumn<int> recoveryMinutes = GeneratedColumn<int>(
    'recovery_minutes',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _perceivedEffortMeta = const VerificationMeta(
    'perceivedEffort',
  );
  @override
  late final GeneratedColumn<int> perceivedEffort = GeneratedColumn<int>(
    'perceived_effort',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _toleranceRatingMeta = const VerificationMeta(
    'toleranceRating',
  );
  @override
  late final GeneratedColumn<String> toleranceRating = GeneratedColumn<String>(
    'tolerance_rating',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _repeatSameLevelTomorrowMeta =
      const VerificationMeta('repeatSameLevelTomorrow');
  @override
  late final GeneratedColumn<bool> repeatSameLevelTomorrow =
      GeneratedColumn<bool>(
        'repeat_same_level_tomorrow',
        aliasedName,
        true,
        type: DriftSqlType.bool,
        requiredDuringInsert: false,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("repeat_same_level_tomorrow" IN (0, 1))',
        ),
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
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    routineTaskId,
    startedAt,
    endedAt,
    completedStatus,
    preExerciseState,
    postExerciseState,
    breathlessnessLevel,
    pauseCount,
    rescueInhalerUsed,
    rescueInhalerTiming,
    recoveryMinutes,
    perceivedEffort,
    toleranceRating,
    repeatSameLevelTomorrow,
    notes,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'exercise_feedbacks';
  @override
  VerificationContext validateIntegrity(
    Insertable<ExerciseFeedback> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('routine_task_id')) {
      context.handle(
        _routineTaskIdMeta,
        routineTaskId.isAcceptableOrUnknown(
          data['routine_task_id']!,
          _routineTaskIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_routineTaskIdMeta);
    }
    if (data.containsKey('started_at')) {
      context.handle(
        _startedAtMeta,
        startedAt.isAcceptableOrUnknown(data['started_at']!, _startedAtMeta),
      );
    }
    if (data.containsKey('ended_at')) {
      context.handle(
        _endedAtMeta,
        endedAt.isAcceptableOrUnknown(data['ended_at']!, _endedAtMeta),
      );
    }
    if (data.containsKey('completed_status')) {
      context.handle(
        _completedStatusMeta,
        completedStatus.isAcceptableOrUnknown(
          data['completed_status']!,
          _completedStatusMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_completedStatusMeta);
    }
    if (data.containsKey('pre_exercise_state')) {
      context.handle(
        _preExerciseStateMeta,
        preExerciseState.isAcceptableOrUnknown(
          data['pre_exercise_state']!,
          _preExerciseStateMeta,
        ),
      );
    }
    if (data.containsKey('post_exercise_state')) {
      context.handle(
        _postExerciseStateMeta,
        postExerciseState.isAcceptableOrUnknown(
          data['post_exercise_state']!,
          _postExerciseStateMeta,
        ),
      );
    }
    if (data.containsKey('breathlessness_level')) {
      context.handle(
        _breathlessnessLevelMeta,
        breathlessnessLevel.isAcceptableOrUnknown(
          data['breathlessness_level']!,
          _breathlessnessLevelMeta,
        ),
      );
    }
    if (data.containsKey('pause_count')) {
      context.handle(
        _pauseCountMeta,
        pauseCount.isAcceptableOrUnknown(data['pause_count']!, _pauseCountMeta),
      );
    }
    if (data.containsKey('rescue_inhaler_used')) {
      context.handle(
        _rescueInhalerUsedMeta,
        rescueInhalerUsed.isAcceptableOrUnknown(
          data['rescue_inhaler_used']!,
          _rescueInhalerUsedMeta,
        ),
      );
    }
    if (data.containsKey('rescue_inhaler_timing')) {
      context.handle(
        _rescueInhalerTimingMeta,
        rescueInhalerTiming.isAcceptableOrUnknown(
          data['rescue_inhaler_timing']!,
          _rescueInhalerTimingMeta,
        ),
      );
    }
    if (data.containsKey('recovery_minutes')) {
      context.handle(
        _recoveryMinutesMeta,
        recoveryMinutes.isAcceptableOrUnknown(
          data['recovery_minutes']!,
          _recoveryMinutesMeta,
        ),
      );
    }
    if (data.containsKey('perceived_effort')) {
      context.handle(
        _perceivedEffortMeta,
        perceivedEffort.isAcceptableOrUnknown(
          data['perceived_effort']!,
          _perceivedEffortMeta,
        ),
      );
    }
    if (data.containsKey('tolerance_rating')) {
      context.handle(
        _toleranceRatingMeta,
        toleranceRating.isAcceptableOrUnknown(
          data['tolerance_rating']!,
          _toleranceRatingMeta,
        ),
      );
    }
    if (data.containsKey('repeat_same_level_tomorrow')) {
      context.handle(
        _repeatSameLevelTomorrowMeta,
        repeatSameLevelTomorrow.isAcceptableOrUnknown(
          data['repeat_same_level_tomorrow']!,
          _repeatSameLevelTomorrowMeta,
        ),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ExerciseFeedback map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ExerciseFeedback(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      routineTaskId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}routine_task_id'],
          )!,
      startedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}started_at'],
      ),
      endedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}ended_at'],
      ),
      completedStatus:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}completed_status'],
          )!,
      preExerciseState: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}pre_exercise_state'],
      ),
      postExerciseState: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}post_exercise_state'],
      ),
      breathlessnessLevel: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}breathlessness_level'],
      ),
      pauseCount:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}pause_count'],
          )!,
      rescueInhalerUsed:
          attachedDatabase.typeMapping.read(
            DriftSqlType.bool,
            data['${effectivePrefix}rescue_inhaler_used'],
          )!,
      rescueInhalerTiming: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}rescue_inhaler_timing'],
      ),
      recoveryMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}recovery_minutes'],
      ),
      perceivedEffort: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}perceived_effort'],
      ),
      toleranceRating: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tolerance_rating'],
      ),
      repeatSameLevelTomorrow: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}repeat_same_level_tomorrow'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      createdAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}created_at'],
          )!,
    );
  }

  @override
  $ExerciseFeedbacksTable createAlias(String alias) {
    return $ExerciseFeedbacksTable(attachedDatabase, alias);
  }
}

class ExerciseFeedback extends DataClass
    implements Insertable<ExerciseFeedback> {
  final int id;
  final int routineTaskId;
  final DateTime? startedAt;
  final DateTime? endedAt;
  final String completedStatus;
  final int? preExerciseState;
  final int? postExerciseState;
  final int? breathlessnessLevel;
  final int pauseCount;
  final bool rescueInhalerUsed;
  final String? rescueInhalerTiming;
  final int? recoveryMinutes;
  final int? perceivedEffort;
  final String? toleranceRating;
  final bool? repeatSameLevelTomorrow;
  final String? notes;
  final DateTime createdAt;
  const ExerciseFeedback({
    required this.id,
    required this.routineTaskId,
    this.startedAt,
    this.endedAt,
    required this.completedStatus,
    this.preExerciseState,
    this.postExerciseState,
    this.breathlessnessLevel,
    required this.pauseCount,
    required this.rescueInhalerUsed,
    this.rescueInhalerTiming,
    this.recoveryMinutes,
    this.perceivedEffort,
    this.toleranceRating,
    this.repeatSameLevelTomorrow,
    this.notes,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['routine_task_id'] = Variable<int>(routineTaskId);
    if (!nullToAbsent || startedAt != null) {
      map['started_at'] = Variable<DateTime>(startedAt);
    }
    if (!nullToAbsent || endedAt != null) {
      map['ended_at'] = Variable<DateTime>(endedAt);
    }
    map['completed_status'] = Variable<String>(completedStatus);
    if (!nullToAbsent || preExerciseState != null) {
      map['pre_exercise_state'] = Variable<int>(preExerciseState);
    }
    if (!nullToAbsent || postExerciseState != null) {
      map['post_exercise_state'] = Variable<int>(postExerciseState);
    }
    if (!nullToAbsent || breathlessnessLevel != null) {
      map['breathlessness_level'] = Variable<int>(breathlessnessLevel);
    }
    map['pause_count'] = Variable<int>(pauseCount);
    map['rescue_inhaler_used'] = Variable<bool>(rescueInhalerUsed);
    if (!nullToAbsent || rescueInhalerTiming != null) {
      map['rescue_inhaler_timing'] = Variable<String>(rescueInhalerTiming);
    }
    if (!nullToAbsent || recoveryMinutes != null) {
      map['recovery_minutes'] = Variable<int>(recoveryMinutes);
    }
    if (!nullToAbsent || perceivedEffort != null) {
      map['perceived_effort'] = Variable<int>(perceivedEffort);
    }
    if (!nullToAbsent || toleranceRating != null) {
      map['tolerance_rating'] = Variable<String>(toleranceRating);
    }
    if (!nullToAbsent || repeatSameLevelTomorrow != null) {
      map['repeat_same_level_tomorrow'] = Variable<bool>(
        repeatSameLevelTomorrow,
      );
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  ExerciseFeedbacksCompanion toCompanion(bool nullToAbsent) {
    return ExerciseFeedbacksCompanion(
      id: Value(id),
      routineTaskId: Value(routineTaskId),
      startedAt:
          startedAt == null && nullToAbsent
              ? const Value.absent()
              : Value(startedAt),
      endedAt:
          endedAt == null && nullToAbsent
              ? const Value.absent()
              : Value(endedAt),
      completedStatus: Value(completedStatus),
      preExerciseState:
          preExerciseState == null && nullToAbsent
              ? const Value.absent()
              : Value(preExerciseState),
      postExerciseState:
          postExerciseState == null && nullToAbsent
              ? const Value.absent()
              : Value(postExerciseState),
      breathlessnessLevel:
          breathlessnessLevel == null && nullToAbsent
              ? const Value.absent()
              : Value(breathlessnessLevel),
      pauseCount: Value(pauseCount),
      rescueInhalerUsed: Value(rescueInhalerUsed),
      rescueInhalerTiming:
          rescueInhalerTiming == null && nullToAbsent
              ? const Value.absent()
              : Value(rescueInhalerTiming),
      recoveryMinutes:
          recoveryMinutes == null && nullToAbsent
              ? const Value.absent()
              : Value(recoveryMinutes),
      perceivedEffort:
          perceivedEffort == null && nullToAbsent
              ? const Value.absent()
              : Value(perceivedEffort),
      toleranceRating:
          toleranceRating == null && nullToAbsent
              ? const Value.absent()
              : Value(toleranceRating),
      repeatSameLevelTomorrow:
          repeatSameLevelTomorrow == null && nullToAbsent
              ? const Value.absent()
              : Value(repeatSameLevelTomorrow),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      createdAt: Value(createdAt),
    );
  }

  factory ExerciseFeedback.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExerciseFeedback(
      id: serializer.fromJson<int>(json['id']),
      routineTaskId: serializer.fromJson<int>(json['routineTaskId']),
      startedAt: serializer.fromJson<DateTime?>(json['startedAt']),
      endedAt: serializer.fromJson<DateTime?>(json['endedAt']),
      completedStatus: serializer.fromJson<String>(json['completedStatus']),
      preExerciseState: serializer.fromJson<int?>(json['preExerciseState']),
      postExerciseState: serializer.fromJson<int?>(json['postExerciseState']),
      breathlessnessLevel: serializer.fromJson<int?>(
        json['breathlessnessLevel'],
      ),
      pauseCount: serializer.fromJson<int>(json['pauseCount']),
      rescueInhalerUsed: serializer.fromJson<bool>(json['rescueInhalerUsed']),
      rescueInhalerTiming: serializer.fromJson<String?>(
        json['rescueInhalerTiming'],
      ),
      recoveryMinutes: serializer.fromJson<int?>(json['recoveryMinutes']),
      perceivedEffort: serializer.fromJson<int?>(json['perceivedEffort']),
      toleranceRating: serializer.fromJson<String?>(json['toleranceRating']),
      repeatSameLevelTomorrow: serializer.fromJson<bool?>(
        json['repeatSameLevelTomorrow'],
      ),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'routineTaskId': serializer.toJson<int>(routineTaskId),
      'startedAt': serializer.toJson<DateTime?>(startedAt),
      'endedAt': serializer.toJson<DateTime?>(endedAt),
      'completedStatus': serializer.toJson<String>(completedStatus),
      'preExerciseState': serializer.toJson<int?>(preExerciseState),
      'postExerciseState': serializer.toJson<int?>(postExerciseState),
      'breathlessnessLevel': serializer.toJson<int?>(breathlessnessLevel),
      'pauseCount': serializer.toJson<int>(pauseCount),
      'rescueInhalerUsed': serializer.toJson<bool>(rescueInhalerUsed),
      'rescueInhalerTiming': serializer.toJson<String?>(rescueInhalerTiming),
      'recoveryMinutes': serializer.toJson<int?>(recoveryMinutes),
      'perceivedEffort': serializer.toJson<int?>(perceivedEffort),
      'toleranceRating': serializer.toJson<String?>(toleranceRating),
      'repeatSameLevelTomorrow': serializer.toJson<bool?>(
        repeatSameLevelTomorrow,
      ),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  ExerciseFeedback copyWith({
    int? id,
    int? routineTaskId,
    Value<DateTime?> startedAt = const Value.absent(),
    Value<DateTime?> endedAt = const Value.absent(),
    String? completedStatus,
    Value<int?> preExerciseState = const Value.absent(),
    Value<int?> postExerciseState = const Value.absent(),
    Value<int?> breathlessnessLevel = const Value.absent(),
    int? pauseCount,
    bool? rescueInhalerUsed,
    Value<String?> rescueInhalerTiming = const Value.absent(),
    Value<int?> recoveryMinutes = const Value.absent(),
    Value<int?> perceivedEffort = const Value.absent(),
    Value<String?> toleranceRating = const Value.absent(),
    Value<bool?> repeatSameLevelTomorrow = const Value.absent(),
    Value<String?> notes = const Value.absent(),
    DateTime? createdAt,
  }) => ExerciseFeedback(
    id: id ?? this.id,
    routineTaskId: routineTaskId ?? this.routineTaskId,
    startedAt: startedAt.present ? startedAt.value : this.startedAt,
    endedAt: endedAt.present ? endedAt.value : this.endedAt,
    completedStatus: completedStatus ?? this.completedStatus,
    preExerciseState:
        preExerciseState.present
            ? preExerciseState.value
            : this.preExerciseState,
    postExerciseState:
        postExerciseState.present
            ? postExerciseState.value
            : this.postExerciseState,
    breathlessnessLevel:
        breathlessnessLevel.present
            ? breathlessnessLevel.value
            : this.breathlessnessLevel,
    pauseCount: pauseCount ?? this.pauseCount,
    rescueInhalerUsed: rescueInhalerUsed ?? this.rescueInhalerUsed,
    rescueInhalerTiming:
        rescueInhalerTiming.present
            ? rescueInhalerTiming.value
            : this.rescueInhalerTiming,
    recoveryMinutes:
        recoveryMinutes.present ? recoveryMinutes.value : this.recoveryMinutes,
    perceivedEffort:
        perceivedEffort.present ? perceivedEffort.value : this.perceivedEffort,
    toleranceRating:
        toleranceRating.present ? toleranceRating.value : this.toleranceRating,
    repeatSameLevelTomorrow:
        repeatSameLevelTomorrow.present
            ? repeatSameLevelTomorrow.value
            : this.repeatSameLevelTomorrow,
    notes: notes.present ? notes.value : this.notes,
    createdAt: createdAt ?? this.createdAt,
  );
  ExerciseFeedback copyWithCompanion(ExerciseFeedbacksCompanion data) {
    return ExerciseFeedback(
      id: data.id.present ? data.id.value : this.id,
      routineTaskId:
          data.routineTaskId.present
              ? data.routineTaskId.value
              : this.routineTaskId,
      startedAt: data.startedAt.present ? data.startedAt.value : this.startedAt,
      endedAt: data.endedAt.present ? data.endedAt.value : this.endedAt,
      completedStatus:
          data.completedStatus.present
              ? data.completedStatus.value
              : this.completedStatus,
      preExerciseState:
          data.preExerciseState.present
              ? data.preExerciseState.value
              : this.preExerciseState,
      postExerciseState:
          data.postExerciseState.present
              ? data.postExerciseState.value
              : this.postExerciseState,
      breathlessnessLevel:
          data.breathlessnessLevel.present
              ? data.breathlessnessLevel.value
              : this.breathlessnessLevel,
      pauseCount:
          data.pauseCount.present ? data.pauseCount.value : this.pauseCount,
      rescueInhalerUsed:
          data.rescueInhalerUsed.present
              ? data.rescueInhalerUsed.value
              : this.rescueInhalerUsed,
      rescueInhalerTiming:
          data.rescueInhalerTiming.present
              ? data.rescueInhalerTiming.value
              : this.rescueInhalerTiming,
      recoveryMinutes:
          data.recoveryMinutes.present
              ? data.recoveryMinutes.value
              : this.recoveryMinutes,
      perceivedEffort:
          data.perceivedEffort.present
              ? data.perceivedEffort.value
              : this.perceivedEffort,
      toleranceRating:
          data.toleranceRating.present
              ? data.toleranceRating.value
              : this.toleranceRating,
      repeatSameLevelTomorrow:
          data.repeatSameLevelTomorrow.present
              ? data.repeatSameLevelTomorrow.value
              : this.repeatSameLevelTomorrow,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ExerciseFeedback(')
          ..write('id: $id, ')
          ..write('routineTaskId: $routineTaskId, ')
          ..write('startedAt: $startedAt, ')
          ..write('endedAt: $endedAt, ')
          ..write('completedStatus: $completedStatus, ')
          ..write('preExerciseState: $preExerciseState, ')
          ..write('postExerciseState: $postExerciseState, ')
          ..write('breathlessnessLevel: $breathlessnessLevel, ')
          ..write('pauseCount: $pauseCount, ')
          ..write('rescueInhalerUsed: $rescueInhalerUsed, ')
          ..write('rescueInhalerTiming: $rescueInhalerTiming, ')
          ..write('recoveryMinutes: $recoveryMinutes, ')
          ..write('perceivedEffort: $perceivedEffort, ')
          ..write('toleranceRating: $toleranceRating, ')
          ..write('repeatSameLevelTomorrow: $repeatSameLevelTomorrow, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    routineTaskId,
    startedAt,
    endedAt,
    completedStatus,
    preExerciseState,
    postExerciseState,
    breathlessnessLevel,
    pauseCount,
    rescueInhalerUsed,
    rescueInhalerTiming,
    recoveryMinutes,
    perceivedEffort,
    toleranceRating,
    repeatSameLevelTomorrow,
    notes,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExerciseFeedback &&
          other.id == this.id &&
          other.routineTaskId == this.routineTaskId &&
          other.startedAt == this.startedAt &&
          other.endedAt == this.endedAt &&
          other.completedStatus == this.completedStatus &&
          other.preExerciseState == this.preExerciseState &&
          other.postExerciseState == this.postExerciseState &&
          other.breathlessnessLevel == this.breathlessnessLevel &&
          other.pauseCount == this.pauseCount &&
          other.rescueInhalerUsed == this.rescueInhalerUsed &&
          other.rescueInhalerTiming == this.rescueInhalerTiming &&
          other.recoveryMinutes == this.recoveryMinutes &&
          other.perceivedEffort == this.perceivedEffort &&
          other.toleranceRating == this.toleranceRating &&
          other.repeatSameLevelTomorrow == this.repeatSameLevelTomorrow &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt);
}

class ExerciseFeedbacksCompanion extends UpdateCompanion<ExerciseFeedback> {
  final Value<int> id;
  final Value<int> routineTaskId;
  final Value<DateTime?> startedAt;
  final Value<DateTime?> endedAt;
  final Value<String> completedStatus;
  final Value<int?> preExerciseState;
  final Value<int?> postExerciseState;
  final Value<int?> breathlessnessLevel;
  final Value<int> pauseCount;
  final Value<bool> rescueInhalerUsed;
  final Value<String?> rescueInhalerTiming;
  final Value<int?> recoveryMinutes;
  final Value<int?> perceivedEffort;
  final Value<String?> toleranceRating;
  final Value<bool?> repeatSameLevelTomorrow;
  final Value<String?> notes;
  final Value<DateTime> createdAt;
  const ExerciseFeedbacksCompanion({
    this.id = const Value.absent(),
    this.routineTaskId = const Value.absent(),
    this.startedAt = const Value.absent(),
    this.endedAt = const Value.absent(),
    this.completedStatus = const Value.absent(),
    this.preExerciseState = const Value.absent(),
    this.postExerciseState = const Value.absent(),
    this.breathlessnessLevel = const Value.absent(),
    this.pauseCount = const Value.absent(),
    this.rescueInhalerUsed = const Value.absent(),
    this.rescueInhalerTiming = const Value.absent(),
    this.recoveryMinutes = const Value.absent(),
    this.perceivedEffort = const Value.absent(),
    this.toleranceRating = const Value.absent(),
    this.repeatSameLevelTomorrow = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  ExerciseFeedbacksCompanion.insert({
    this.id = const Value.absent(),
    required int routineTaskId,
    this.startedAt = const Value.absent(),
    this.endedAt = const Value.absent(),
    required String completedStatus,
    this.preExerciseState = const Value.absent(),
    this.postExerciseState = const Value.absent(),
    this.breathlessnessLevel = const Value.absent(),
    this.pauseCount = const Value.absent(),
    this.rescueInhalerUsed = const Value.absent(),
    this.rescueInhalerTiming = const Value.absent(),
    this.recoveryMinutes = const Value.absent(),
    this.perceivedEffort = const Value.absent(),
    this.toleranceRating = const Value.absent(),
    this.repeatSameLevelTomorrow = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : routineTaskId = Value(routineTaskId),
       completedStatus = Value(completedStatus);
  static Insertable<ExerciseFeedback> custom({
    Expression<int>? id,
    Expression<int>? routineTaskId,
    Expression<DateTime>? startedAt,
    Expression<DateTime>? endedAt,
    Expression<String>? completedStatus,
    Expression<int>? preExerciseState,
    Expression<int>? postExerciseState,
    Expression<int>? breathlessnessLevel,
    Expression<int>? pauseCount,
    Expression<bool>? rescueInhalerUsed,
    Expression<String>? rescueInhalerTiming,
    Expression<int>? recoveryMinutes,
    Expression<int>? perceivedEffort,
    Expression<String>? toleranceRating,
    Expression<bool>? repeatSameLevelTomorrow,
    Expression<String>? notes,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (routineTaskId != null) 'routine_task_id': routineTaskId,
      if (startedAt != null) 'started_at': startedAt,
      if (endedAt != null) 'ended_at': endedAt,
      if (completedStatus != null) 'completed_status': completedStatus,
      if (preExerciseState != null) 'pre_exercise_state': preExerciseState,
      if (postExerciseState != null) 'post_exercise_state': postExerciseState,
      if (breathlessnessLevel != null)
        'breathlessness_level': breathlessnessLevel,
      if (pauseCount != null) 'pause_count': pauseCount,
      if (rescueInhalerUsed != null) 'rescue_inhaler_used': rescueInhalerUsed,
      if (rescueInhalerTiming != null)
        'rescue_inhaler_timing': rescueInhalerTiming,
      if (recoveryMinutes != null) 'recovery_minutes': recoveryMinutes,
      if (perceivedEffort != null) 'perceived_effort': perceivedEffort,
      if (toleranceRating != null) 'tolerance_rating': toleranceRating,
      if (repeatSameLevelTomorrow != null)
        'repeat_same_level_tomorrow': repeatSameLevelTomorrow,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  ExerciseFeedbacksCompanion copyWith({
    Value<int>? id,
    Value<int>? routineTaskId,
    Value<DateTime?>? startedAt,
    Value<DateTime?>? endedAt,
    Value<String>? completedStatus,
    Value<int?>? preExerciseState,
    Value<int?>? postExerciseState,
    Value<int?>? breathlessnessLevel,
    Value<int>? pauseCount,
    Value<bool>? rescueInhalerUsed,
    Value<String?>? rescueInhalerTiming,
    Value<int?>? recoveryMinutes,
    Value<int?>? perceivedEffort,
    Value<String?>? toleranceRating,
    Value<bool?>? repeatSameLevelTomorrow,
    Value<String?>? notes,
    Value<DateTime>? createdAt,
  }) {
    return ExerciseFeedbacksCompanion(
      id: id ?? this.id,
      routineTaskId: routineTaskId ?? this.routineTaskId,
      startedAt: startedAt ?? this.startedAt,
      endedAt: endedAt ?? this.endedAt,
      completedStatus: completedStatus ?? this.completedStatus,
      preExerciseState: preExerciseState ?? this.preExerciseState,
      postExerciseState: postExerciseState ?? this.postExerciseState,
      breathlessnessLevel: breathlessnessLevel ?? this.breathlessnessLevel,
      pauseCount: pauseCount ?? this.pauseCount,
      rescueInhalerUsed: rescueInhalerUsed ?? this.rescueInhalerUsed,
      rescueInhalerTiming: rescueInhalerTiming ?? this.rescueInhalerTiming,
      recoveryMinutes: recoveryMinutes ?? this.recoveryMinutes,
      perceivedEffort: perceivedEffort ?? this.perceivedEffort,
      toleranceRating: toleranceRating ?? this.toleranceRating,
      repeatSameLevelTomorrow:
          repeatSameLevelTomorrow ?? this.repeatSameLevelTomorrow,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (routineTaskId.present) {
      map['routine_task_id'] = Variable<int>(routineTaskId.value);
    }
    if (startedAt.present) {
      map['started_at'] = Variable<DateTime>(startedAt.value);
    }
    if (endedAt.present) {
      map['ended_at'] = Variable<DateTime>(endedAt.value);
    }
    if (completedStatus.present) {
      map['completed_status'] = Variable<String>(completedStatus.value);
    }
    if (preExerciseState.present) {
      map['pre_exercise_state'] = Variable<int>(preExerciseState.value);
    }
    if (postExerciseState.present) {
      map['post_exercise_state'] = Variable<int>(postExerciseState.value);
    }
    if (breathlessnessLevel.present) {
      map['breathlessness_level'] = Variable<int>(breathlessnessLevel.value);
    }
    if (pauseCount.present) {
      map['pause_count'] = Variable<int>(pauseCount.value);
    }
    if (rescueInhalerUsed.present) {
      map['rescue_inhaler_used'] = Variable<bool>(rescueInhalerUsed.value);
    }
    if (rescueInhalerTiming.present) {
      map['rescue_inhaler_timing'] = Variable<String>(
        rescueInhalerTiming.value,
      );
    }
    if (recoveryMinutes.present) {
      map['recovery_minutes'] = Variable<int>(recoveryMinutes.value);
    }
    if (perceivedEffort.present) {
      map['perceived_effort'] = Variable<int>(perceivedEffort.value);
    }
    if (toleranceRating.present) {
      map['tolerance_rating'] = Variable<String>(toleranceRating.value);
    }
    if (repeatSameLevelTomorrow.present) {
      map['repeat_same_level_tomorrow'] = Variable<bool>(
        repeatSameLevelTomorrow.value,
      );
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExerciseFeedbacksCompanion(')
          ..write('id: $id, ')
          ..write('routineTaskId: $routineTaskId, ')
          ..write('startedAt: $startedAt, ')
          ..write('endedAt: $endedAt, ')
          ..write('completedStatus: $completedStatus, ')
          ..write('preExerciseState: $preExerciseState, ')
          ..write('postExerciseState: $postExerciseState, ')
          ..write('breathlessnessLevel: $breathlessnessLevel, ')
          ..write('pauseCount: $pauseCount, ')
          ..write('rescueInhalerUsed: $rescueInhalerUsed, ')
          ..write('rescueInhalerTiming: $rescueInhalerTiming, ')
          ..write('recoveryMinutes: $recoveryMinutes, ')
          ..write('perceivedEffort: $perceivedEffort, ')
          ..write('toleranceRating: $toleranceRating, ')
          ..write('repeatSameLevelTomorrow: $repeatSameLevelTomorrow, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $SymptomChecksTable extends SymptomChecks
    with TableInfo<$SymptomChecksTable, SymptomCheck> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SymptomChecksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _dailyFlowIdMeta = const VerificationMeta(
    'dailyFlowId',
  );
  @override
  late final GeneratedColumn<int> dailyFlowId = GeneratedColumn<int>(
    'daily_flow_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _momentMeta = const VerificationMeta('moment');
  @override
  late final GeneratedColumn<String> moment = GeneratedColumn<String>(
    'moment',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _breathingTodayMeta = const VerificationMeta(
    'breathingToday',
  );
  @override
  late final GeneratedColumn<int> breathingToday = GeneratedColumn<int>(
    'breathing_today',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _fatigueMeta = const VerificationMeta(
    'fatigue',
  );
  @override
  late final GeneratedColumn<int> fatigue = GeneratedColumn<int>(
    'fatigue',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _coughMeta = const VerificationMeta('cough');
  @override
  late final GeneratedColumn<int> cough = GeneratedColumn<int>(
    'cough',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _phlegmMeta = const VerificationMeta('phlegm');
  @override
  late final GeneratedColumn<int> phlegm = GeneratedColumn<int>(
    'phlegm',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _awakeningsMeta = const VerificationMeta(
    'awakenings',
  );
  @override
  late final GeneratedColumn<int> awakenings = GeneratedColumn<int>(
    'awakenings',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _saturationMeta = const VerificationMeta(
    'saturation',
  );
  @override
  late final GeneratedColumn<double> saturation = GeneratedColumn<double>(
    'saturation',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _pulseMeta = const VerificationMeta('pulse');
  @override
  late final GeneratedColumn<int> pulse = GeneratedColumn<int>(
    'pulse',
    aliasedName,
    true,
    type: DriftSqlType.int,
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
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    dailyFlowId,
    moment,
    breathingToday,
    fatigue,
    cough,
    phlegm,
    awakenings,
    saturation,
    pulse,
    notes,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'symptom_checks';
  @override
  VerificationContext validateIntegrity(
    Insertable<SymptomCheck> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('daily_flow_id')) {
      context.handle(
        _dailyFlowIdMeta,
        dailyFlowId.isAcceptableOrUnknown(
          data['daily_flow_id']!,
          _dailyFlowIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_dailyFlowIdMeta);
    }
    if (data.containsKey('moment')) {
      context.handle(
        _momentMeta,
        moment.isAcceptableOrUnknown(data['moment']!, _momentMeta),
      );
    } else if (isInserting) {
      context.missing(_momentMeta);
    }
    if (data.containsKey('breathing_today')) {
      context.handle(
        _breathingTodayMeta,
        breathingToday.isAcceptableOrUnknown(
          data['breathing_today']!,
          _breathingTodayMeta,
        ),
      );
    }
    if (data.containsKey('fatigue')) {
      context.handle(
        _fatigueMeta,
        fatigue.isAcceptableOrUnknown(data['fatigue']!, _fatigueMeta),
      );
    }
    if (data.containsKey('cough')) {
      context.handle(
        _coughMeta,
        cough.isAcceptableOrUnknown(data['cough']!, _coughMeta),
      );
    }
    if (data.containsKey('phlegm')) {
      context.handle(
        _phlegmMeta,
        phlegm.isAcceptableOrUnknown(data['phlegm']!, _phlegmMeta),
      );
    }
    if (data.containsKey('awakenings')) {
      context.handle(
        _awakeningsMeta,
        awakenings.isAcceptableOrUnknown(data['awakenings']!, _awakeningsMeta),
      );
    }
    if (data.containsKey('saturation')) {
      context.handle(
        _saturationMeta,
        saturation.isAcceptableOrUnknown(data['saturation']!, _saturationMeta),
      );
    }
    if (data.containsKey('pulse')) {
      context.handle(
        _pulseMeta,
        pulse.isAcceptableOrUnknown(data['pulse']!, _pulseMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SymptomCheck map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SymptomCheck(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      dailyFlowId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}daily_flow_id'],
          )!,
      moment:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}moment'],
          )!,
      breathingToday: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}breathing_today'],
      ),
      fatigue: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}fatigue'],
      ),
      cough: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}cough'],
      ),
      phlegm: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}phlegm'],
      ),
      awakenings: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}awakenings'],
      ),
      saturation: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}saturation'],
      ),
      pulse: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}pulse'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      createdAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}created_at'],
          )!,
    );
  }

  @override
  $SymptomChecksTable createAlias(String alias) {
    return $SymptomChecksTable(attachedDatabase, alias);
  }
}

class SymptomCheck extends DataClass implements Insertable<SymptomCheck> {
  final int id;
  final int dailyFlowId;
  final String moment;
  final int? breathingToday;
  final int? fatigue;
  final int? cough;
  final int? phlegm;
  final int? awakenings;
  final double? saturation;
  final int? pulse;
  final String? notes;
  final DateTime createdAt;
  const SymptomCheck({
    required this.id,
    required this.dailyFlowId,
    required this.moment,
    this.breathingToday,
    this.fatigue,
    this.cough,
    this.phlegm,
    this.awakenings,
    this.saturation,
    this.pulse,
    this.notes,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['daily_flow_id'] = Variable<int>(dailyFlowId);
    map['moment'] = Variable<String>(moment);
    if (!nullToAbsent || breathingToday != null) {
      map['breathing_today'] = Variable<int>(breathingToday);
    }
    if (!nullToAbsent || fatigue != null) {
      map['fatigue'] = Variable<int>(fatigue);
    }
    if (!nullToAbsent || cough != null) {
      map['cough'] = Variable<int>(cough);
    }
    if (!nullToAbsent || phlegm != null) {
      map['phlegm'] = Variable<int>(phlegm);
    }
    if (!nullToAbsent || awakenings != null) {
      map['awakenings'] = Variable<int>(awakenings);
    }
    if (!nullToAbsent || saturation != null) {
      map['saturation'] = Variable<double>(saturation);
    }
    if (!nullToAbsent || pulse != null) {
      map['pulse'] = Variable<int>(pulse);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  SymptomChecksCompanion toCompanion(bool nullToAbsent) {
    return SymptomChecksCompanion(
      id: Value(id),
      dailyFlowId: Value(dailyFlowId),
      moment: Value(moment),
      breathingToday:
          breathingToday == null && nullToAbsent
              ? const Value.absent()
              : Value(breathingToday),
      fatigue:
          fatigue == null && nullToAbsent
              ? const Value.absent()
              : Value(fatigue),
      cough:
          cough == null && nullToAbsent ? const Value.absent() : Value(cough),
      phlegm:
          phlegm == null && nullToAbsent ? const Value.absent() : Value(phlegm),
      awakenings:
          awakenings == null && nullToAbsent
              ? const Value.absent()
              : Value(awakenings),
      saturation:
          saturation == null && nullToAbsent
              ? const Value.absent()
              : Value(saturation),
      pulse:
          pulse == null && nullToAbsent ? const Value.absent() : Value(pulse),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      createdAt: Value(createdAt),
    );
  }

  factory SymptomCheck.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SymptomCheck(
      id: serializer.fromJson<int>(json['id']),
      dailyFlowId: serializer.fromJson<int>(json['dailyFlowId']),
      moment: serializer.fromJson<String>(json['moment']),
      breathingToday: serializer.fromJson<int?>(json['breathingToday']),
      fatigue: serializer.fromJson<int?>(json['fatigue']),
      cough: serializer.fromJson<int?>(json['cough']),
      phlegm: serializer.fromJson<int?>(json['phlegm']),
      awakenings: serializer.fromJson<int?>(json['awakenings']),
      saturation: serializer.fromJson<double?>(json['saturation']),
      pulse: serializer.fromJson<int?>(json['pulse']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'dailyFlowId': serializer.toJson<int>(dailyFlowId),
      'moment': serializer.toJson<String>(moment),
      'breathingToday': serializer.toJson<int?>(breathingToday),
      'fatigue': serializer.toJson<int?>(fatigue),
      'cough': serializer.toJson<int?>(cough),
      'phlegm': serializer.toJson<int?>(phlegm),
      'awakenings': serializer.toJson<int?>(awakenings),
      'saturation': serializer.toJson<double?>(saturation),
      'pulse': serializer.toJson<int?>(pulse),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  SymptomCheck copyWith({
    int? id,
    int? dailyFlowId,
    String? moment,
    Value<int?> breathingToday = const Value.absent(),
    Value<int?> fatigue = const Value.absent(),
    Value<int?> cough = const Value.absent(),
    Value<int?> phlegm = const Value.absent(),
    Value<int?> awakenings = const Value.absent(),
    Value<double?> saturation = const Value.absent(),
    Value<int?> pulse = const Value.absent(),
    Value<String?> notes = const Value.absent(),
    DateTime? createdAt,
  }) => SymptomCheck(
    id: id ?? this.id,
    dailyFlowId: dailyFlowId ?? this.dailyFlowId,
    moment: moment ?? this.moment,
    breathingToday:
        breathingToday.present ? breathingToday.value : this.breathingToday,
    fatigue: fatigue.present ? fatigue.value : this.fatigue,
    cough: cough.present ? cough.value : this.cough,
    phlegm: phlegm.present ? phlegm.value : this.phlegm,
    awakenings: awakenings.present ? awakenings.value : this.awakenings,
    saturation: saturation.present ? saturation.value : this.saturation,
    pulse: pulse.present ? pulse.value : this.pulse,
    notes: notes.present ? notes.value : this.notes,
    createdAt: createdAt ?? this.createdAt,
  );
  SymptomCheck copyWithCompanion(SymptomChecksCompanion data) {
    return SymptomCheck(
      id: data.id.present ? data.id.value : this.id,
      dailyFlowId:
          data.dailyFlowId.present ? data.dailyFlowId.value : this.dailyFlowId,
      moment: data.moment.present ? data.moment.value : this.moment,
      breathingToday:
          data.breathingToday.present
              ? data.breathingToday.value
              : this.breathingToday,
      fatigue: data.fatigue.present ? data.fatigue.value : this.fatigue,
      cough: data.cough.present ? data.cough.value : this.cough,
      phlegm: data.phlegm.present ? data.phlegm.value : this.phlegm,
      awakenings:
          data.awakenings.present ? data.awakenings.value : this.awakenings,
      saturation:
          data.saturation.present ? data.saturation.value : this.saturation,
      pulse: data.pulse.present ? data.pulse.value : this.pulse,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SymptomCheck(')
          ..write('id: $id, ')
          ..write('dailyFlowId: $dailyFlowId, ')
          ..write('moment: $moment, ')
          ..write('breathingToday: $breathingToday, ')
          ..write('fatigue: $fatigue, ')
          ..write('cough: $cough, ')
          ..write('phlegm: $phlegm, ')
          ..write('awakenings: $awakenings, ')
          ..write('saturation: $saturation, ')
          ..write('pulse: $pulse, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    dailyFlowId,
    moment,
    breathingToday,
    fatigue,
    cough,
    phlegm,
    awakenings,
    saturation,
    pulse,
    notes,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SymptomCheck &&
          other.id == this.id &&
          other.dailyFlowId == this.dailyFlowId &&
          other.moment == this.moment &&
          other.breathingToday == this.breathingToday &&
          other.fatigue == this.fatigue &&
          other.cough == this.cough &&
          other.phlegm == this.phlegm &&
          other.awakenings == this.awakenings &&
          other.saturation == this.saturation &&
          other.pulse == this.pulse &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt);
}

class SymptomChecksCompanion extends UpdateCompanion<SymptomCheck> {
  final Value<int> id;
  final Value<int> dailyFlowId;
  final Value<String> moment;
  final Value<int?> breathingToday;
  final Value<int?> fatigue;
  final Value<int?> cough;
  final Value<int?> phlegm;
  final Value<int?> awakenings;
  final Value<double?> saturation;
  final Value<int?> pulse;
  final Value<String?> notes;
  final Value<DateTime> createdAt;
  const SymptomChecksCompanion({
    this.id = const Value.absent(),
    this.dailyFlowId = const Value.absent(),
    this.moment = const Value.absent(),
    this.breathingToday = const Value.absent(),
    this.fatigue = const Value.absent(),
    this.cough = const Value.absent(),
    this.phlegm = const Value.absent(),
    this.awakenings = const Value.absent(),
    this.saturation = const Value.absent(),
    this.pulse = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  SymptomChecksCompanion.insert({
    this.id = const Value.absent(),
    required int dailyFlowId,
    required String moment,
    this.breathingToday = const Value.absent(),
    this.fatigue = const Value.absent(),
    this.cough = const Value.absent(),
    this.phlegm = const Value.absent(),
    this.awakenings = const Value.absent(),
    this.saturation = const Value.absent(),
    this.pulse = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : dailyFlowId = Value(dailyFlowId),
       moment = Value(moment);
  static Insertable<SymptomCheck> custom({
    Expression<int>? id,
    Expression<int>? dailyFlowId,
    Expression<String>? moment,
    Expression<int>? breathingToday,
    Expression<int>? fatigue,
    Expression<int>? cough,
    Expression<int>? phlegm,
    Expression<int>? awakenings,
    Expression<double>? saturation,
    Expression<int>? pulse,
    Expression<String>? notes,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (dailyFlowId != null) 'daily_flow_id': dailyFlowId,
      if (moment != null) 'moment': moment,
      if (breathingToday != null) 'breathing_today': breathingToday,
      if (fatigue != null) 'fatigue': fatigue,
      if (cough != null) 'cough': cough,
      if (phlegm != null) 'phlegm': phlegm,
      if (awakenings != null) 'awakenings': awakenings,
      if (saturation != null) 'saturation': saturation,
      if (pulse != null) 'pulse': pulse,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  SymptomChecksCompanion copyWith({
    Value<int>? id,
    Value<int>? dailyFlowId,
    Value<String>? moment,
    Value<int?>? breathingToday,
    Value<int?>? fatigue,
    Value<int?>? cough,
    Value<int?>? phlegm,
    Value<int?>? awakenings,
    Value<double?>? saturation,
    Value<int?>? pulse,
    Value<String?>? notes,
    Value<DateTime>? createdAt,
  }) {
    return SymptomChecksCompanion(
      id: id ?? this.id,
      dailyFlowId: dailyFlowId ?? this.dailyFlowId,
      moment: moment ?? this.moment,
      breathingToday: breathingToday ?? this.breathingToday,
      fatigue: fatigue ?? this.fatigue,
      cough: cough ?? this.cough,
      phlegm: phlegm ?? this.phlegm,
      awakenings: awakenings ?? this.awakenings,
      saturation: saturation ?? this.saturation,
      pulse: pulse ?? this.pulse,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (dailyFlowId.present) {
      map['daily_flow_id'] = Variable<int>(dailyFlowId.value);
    }
    if (moment.present) {
      map['moment'] = Variable<String>(moment.value);
    }
    if (breathingToday.present) {
      map['breathing_today'] = Variable<int>(breathingToday.value);
    }
    if (fatigue.present) {
      map['fatigue'] = Variable<int>(fatigue.value);
    }
    if (cough.present) {
      map['cough'] = Variable<int>(cough.value);
    }
    if (phlegm.present) {
      map['phlegm'] = Variable<int>(phlegm.value);
    }
    if (awakenings.present) {
      map['awakenings'] = Variable<int>(awakenings.value);
    }
    if (saturation.present) {
      map['saturation'] = Variable<double>(saturation.value);
    }
    if (pulse.present) {
      map['pulse'] = Variable<int>(pulse.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SymptomChecksCompanion(')
          ..write('id: $id, ')
          ..write('dailyFlowId: $dailyFlowId, ')
          ..write('moment: $moment, ')
          ..write('breathingToday: $breathingToday, ')
          ..write('fatigue: $fatigue, ')
          ..write('cough: $cough, ')
          ..write('phlegm: $phlegm, ')
          ..write('awakenings: $awakenings, ')
          ..write('saturation: $saturation, ')
          ..write('pulse: $pulse, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $BreathlessnessEpisodesTable extends BreathlessnessEpisodes
    with TableInfo<$BreathlessnessEpisodesTable, BreathlessnessEpisode> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BreathlessnessEpisodesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _dailyFlowIdMeta = const VerificationMeta(
    'dailyFlowId',
  );
  @override
  late final GeneratedColumn<int> dailyFlowId = GeneratedColumn<int>(
    'daily_flow_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _contextMeta = const VerificationMeta(
    'context',
  );
  @override
  late final GeneratedColumn<String> context = GeneratedColumn<String>(
    'context',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _intensityMeta = const VerificationMeta(
    'intensity',
  );
  @override
  late final GeneratedColumn<int> intensity = GeneratedColumn<int>(
    'intensity',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _inhalerUsedMeta = const VerificationMeta(
    'inhalerUsed',
  );
  @override
  late final GeneratedColumn<bool> inhalerUsed = GeneratedColumn<bool>(
    'inhaler_used',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("inhaler_used" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _microSessionCountMeta = const VerificationMeta(
    'microSessionCount',
  );
  @override
  late final GeneratedColumn<int> microSessionCount = GeneratedColumn<int>(
    'micro_session_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _improvementMeta = const VerificationMeta(
    'improvement',
  );
  @override
  late final GeneratedColumn<String> improvement = GeneratedColumn<String>(
    'improvement',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _durationMinutesMeta = const VerificationMeta(
    'durationMinutes',
  );
  @override
  late final GeneratedColumn<int> durationMinutes = GeneratedColumn<int>(
    'duration_minutes',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _calledFamilyMeta = const VerificationMeta(
    'calledFamily',
  );
  @override
  late final GeneratedColumn<bool> calledFamily = GeneratedColumn<bool>(
    'called_family',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("called_family" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _escalatedEmergencyMeta =
      const VerificationMeta('escalatedEmergency');
  @override
  late final GeneratedColumn<bool> escalatedEmergency = GeneratedColumn<bool>(
    'escalated_emergency',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("escalated_emergency" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
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
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    dailyFlowId,
    context,
    intensity,
    inhalerUsed,
    microSessionCount,
    improvement,
    durationMinutes,
    calledFamily,
    escalatedEmergency,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'breathlessness_episodes';
  @override
  VerificationContext validateIntegrity(
    Insertable<BreathlessnessEpisode> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('daily_flow_id')) {
      context.handle(
        _dailyFlowIdMeta,
        dailyFlowId.isAcceptableOrUnknown(
          data['daily_flow_id']!,
          _dailyFlowIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_dailyFlowIdMeta);
    }
    if (data.containsKey('context')) {
      context.handle(
        _contextMeta,
        this.context.isAcceptableOrUnknown(data['context']!, _contextMeta),
      );
    }
    if (data.containsKey('intensity')) {
      context.handle(
        _intensityMeta,
        intensity.isAcceptableOrUnknown(data['intensity']!, _intensityMeta),
      );
    }
    if (data.containsKey('inhaler_used')) {
      context.handle(
        _inhalerUsedMeta,
        inhalerUsed.isAcceptableOrUnknown(
          data['inhaler_used']!,
          _inhalerUsedMeta,
        ),
      );
    }
    if (data.containsKey('micro_session_count')) {
      context.handle(
        _microSessionCountMeta,
        microSessionCount.isAcceptableOrUnknown(
          data['micro_session_count']!,
          _microSessionCountMeta,
        ),
      );
    }
    if (data.containsKey('improvement')) {
      context.handle(
        _improvementMeta,
        improvement.isAcceptableOrUnknown(
          data['improvement']!,
          _improvementMeta,
        ),
      );
    }
    if (data.containsKey('duration_minutes')) {
      context.handle(
        _durationMinutesMeta,
        durationMinutes.isAcceptableOrUnknown(
          data['duration_minutes']!,
          _durationMinutesMeta,
        ),
      );
    }
    if (data.containsKey('called_family')) {
      context.handle(
        _calledFamilyMeta,
        calledFamily.isAcceptableOrUnknown(
          data['called_family']!,
          _calledFamilyMeta,
        ),
      );
    }
    if (data.containsKey('escalated_emergency')) {
      context.handle(
        _escalatedEmergencyMeta,
        escalatedEmergency.isAcceptableOrUnknown(
          data['escalated_emergency']!,
          _escalatedEmergencyMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BreathlessnessEpisode map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BreathlessnessEpisode(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      dailyFlowId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}daily_flow_id'],
          )!,
      context: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}context'],
      ),
      intensity: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}intensity'],
      ),
      inhalerUsed:
          attachedDatabase.typeMapping.read(
            DriftSqlType.bool,
            data['${effectivePrefix}inhaler_used'],
          )!,
      microSessionCount:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}micro_session_count'],
          )!,
      improvement: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}improvement'],
      ),
      durationMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}duration_minutes'],
      ),
      calledFamily:
          attachedDatabase.typeMapping.read(
            DriftSqlType.bool,
            data['${effectivePrefix}called_family'],
          )!,
      escalatedEmergency:
          attachedDatabase.typeMapping.read(
            DriftSqlType.bool,
            data['${effectivePrefix}escalated_emergency'],
          )!,
      createdAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}created_at'],
          )!,
    );
  }

  @override
  $BreathlessnessEpisodesTable createAlias(String alias) {
    return $BreathlessnessEpisodesTable(attachedDatabase, alias);
  }
}

class BreathlessnessEpisode extends DataClass
    implements Insertable<BreathlessnessEpisode> {
  final int id;
  final int dailyFlowId;
  final String? context;
  final int? intensity;
  final bool inhalerUsed;
  final int microSessionCount;
  final String? improvement;
  final int? durationMinutes;
  final bool calledFamily;
  final bool escalatedEmergency;
  final DateTime createdAt;
  const BreathlessnessEpisode({
    required this.id,
    required this.dailyFlowId,
    this.context,
    this.intensity,
    required this.inhalerUsed,
    required this.microSessionCount,
    this.improvement,
    this.durationMinutes,
    required this.calledFamily,
    required this.escalatedEmergency,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['daily_flow_id'] = Variable<int>(dailyFlowId);
    if (!nullToAbsent || context != null) {
      map['context'] = Variable<String>(context);
    }
    if (!nullToAbsent || intensity != null) {
      map['intensity'] = Variable<int>(intensity);
    }
    map['inhaler_used'] = Variable<bool>(inhalerUsed);
    map['micro_session_count'] = Variable<int>(microSessionCount);
    if (!nullToAbsent || improvement != null) {
      map['improvement'] = Variable<String>(improvement);
    }
    if (!nullToAbsent || durationMinutes != null) {
      map['duration_minutes'] = Variable<int>(durationMinutes);
    }
    map['called_family'] = Variable<bool>(calledFamily);
    map['escalated_emergency'] = Variable<bool>(escalatedEmergency);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  BreathlessnessEpisodesCompanion toCompanion(bool nullToAbsent) {
    return BreathlessnessEpisodesCompanion(
      id: Value(id),
      dailyFlowId: Value(dailyFlowId),
      context:
          context == null && nullToAbsent
              ? const Value.absent()
              : Value(context),
      intensity:
          intensity == null && nullToAbsent
              ? const Value.absent()
              : Value(intensity),
      inhalerUsed: Value(inhalerUsed),
      microSessionCount: Value(microSessionCount),
      improvement:
          improvement == null && nullToAbsent
              ? const Value.absent()
              : Value(improvement),
      durationMinutes:
          durationMinutes == null && nullToAbsent
              ? const Value.absent()
              : Value(durationMinutes),
      calledFamily: Value(calledFamily),
      escalatedEmergency: Value(escalatedEmergency),
      createdAt: Value(createdAt),
    );
  }

  factory BreathlessnessEpisode.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BreathlessnessEpisode(
      id: serializer.fromJson<int>(json['id']),
      dailyFlowId: serializer.fromJson<int>(json['dailyFlowId']),
      context: serializer.fromJson<String?>(json['context']),
      intensity: serializer.fromJson<int?>(json['intensity']),
      inhalerUsed: serializer.fromJson<bool>(json['inhalerUsed']),
      microSessionCount: serializer.fromJson<int>(json['microSessionCount']),
      improvement: serializer.fromJson<String?>(json['improvement']),
      durationMinutes: serializer.fromJson<int?>(json['durationMinutes']),
      calledFamily: serializer.fromJson<bool>(json['calledFamily']),
      escalatedEmergency: serializer.fromJson<bool>(json['escalatedEmergency']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'dailyFlowId': serializer.toJson<int>(dailyFlowId),
      'context': serializer.toJson<String?>(context),
      'intensity': serializer.toJson<int?>(intensity),
      'inhalerUsed': serializer.toJson<bool>(inhalerUsed),
      'microSessionCount': serializer.toJson<int>(microSessionCount),
      'improvement': serializer.toJson<String?>(improvement),
      'durationMinutes': serializer.toJson<int?>(durationMinutes),
      'calledFamily': serializer.toJson<bool>(calledFamily),
      'escalatedEmergency': serializer.toJson<bool>(escalatedEmergency),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  BreathlessnessEpisode copyWith({
    int? id,
    int? dailyFlowId,
    Value<String?> context = const Value.absent(),
    Value<int?> intensity = const Value.absent(),
    bool? inhalerUsed,
    int? microSessionCount,
    Value<String?> improvement = const Value.absent(),
    Value<int?> durationMinutes = const Value.absent(),
    bool? calledFamily,
    bool? escalatedEmergency,
    DateTime? createdAt,
  }) => BreathlessnessEpisode(
    id: id ?? this.id,
    dailyFlowId: dailyFlowId ?? this.dailyFlowId,
    context: context.present ? context.value : this.context,
    intensity: intensity.present ? intensity.value : this.intensity,
    inhalerUsed: inhalerUsed ?? this.inhalerUsed,
    microSessionCount: microSessionCount ?? this.microSessionCount,
    improvement: improvement.present ? improvement.value : this.improvement,
    durationMinutes:
        durationMinutes.present ? durationMinutes.value : this.durationMinutes,
    calledFamily: calledFamily ?? this.calledFamily,
    escalatedEmergency: escalatedEmergency ?? this.escalatedEmergency,
    createdAt: createdAt ?? this.createdAt,
  );
  BreathlessnessEpisode copyWithCompanion(
    BreathlessnessEpisodesCompanion data,
  ) {
    return BreathlessnessEpisode(
      id: data.id.present ? data.id.value : this.id,
      dailyFlowId:
          data.dailyFlowId.present ? data.dailyFlowId.value : this.dailyFlowId,
      context: data.context.present ? data.context.value : this.context,
      intensity: data.intensity.present ? data.intensity.value : this.intensity,
      inhalerUsed:
          data.inhalerUsed.present ? data.inhalerUsed.value : this.inhalerUsed,
      microSessionCount:
          data.microSessionCount.present
              ? data.microSessionCount.value
              : this.microSessionCount,
      improvement:
          data.improvement.present ? data.improvement.value : this.improvement,
      durationMinutes:
          data.durationMinutes.present
              ? data.durationMinutes.value
              : this.durationMinutes,
      calledFamily:
          data.calledFamily.present
              ? data.calledFamily.value
              : this.calledFamily,
      escalatedEmergency:
          data.escalatedEmergency.present
              ? data.escalatedEmergency.value
              : this.escalatedEmergency,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BreathlessnessEpisode(')
          ..write('id: $id, ')
          ..write('dailyFlowId: $dailyFlowId, ')
          ..write('context: $context, ')
          ..write('intensity: $intensity, ')
          ..write('inhalerUsed: $inhalerUsed, ')
          ..write('microSessionCount: $microSessionCount, ')
          ..write('improvement: $improvement, ')
          ..write('durationMinutes: $durationMinutes, ')
          ..write('calledFamily: $calledFamily, ')
          ..write('escalatedEmergency: $escalatedEmergency, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    dailyFlowId,
    context,
    intensity,
    inhalerUsed,
    microSessionCount,
    improvement,
    durationMinutes,
    calledFamily,
    escalatedEmergency,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BreathlessnessEpisode &&
          other.id == this.id &&
          other.dailyFlowId == this.dailyFlowId &&
          other.context == this.context &&
          other.intensity == this.intensity &&
          other.inhalerUsed == this.inhalerUsed &&
          other.microSessionCount == this.microSessionCount &&
          other.improvement == this.improvement &&
          other.durationMinutes == this.durationMinutes &&
          other.calledFamily == this.calledFamily &&
          other.escalatedEmergency == this.escalatedEmergency &&
          other.createdAt == this.createdAt);
}

class BreathlessnessEpisodesCompanion
    extends UpdateCompanion<BreathlessnessEpisode> {
  final Value<int> id;
  final Value<int> dailyFlowId;
  final Value<String?> context;
  final Value<int?> intensity;
  final Value<bool> inhalerUsed;
  final Value<int> microSessionCount;
  final Value<String?> improvement;
  final Value<int?> durationMinutes;
  final Value<bool> calledFamily;
  final Value<bool> escalatedEmergency;
  final Value<DateTime> createdAt;
  const BreathlessnessEpisodesCompanion({
    this.id = const Value.absent(),
    this.dailyFlowId = const Value.absent(),
    this.context = const Value.absent(),
    this.intensity = const Value.absent(),
    this.inhalerUsed = const Value.absent(),
    this.microSessionCount = const Value.absent(),
    this.improvement = const Value.absent(),
    this.durationMinutes = const Value.absent(),
    this.calledFamily = const Value.absent(),
    this.escalatedEmergency = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  BreathlessnessEpisodesCompanion.insert({
    this.id = const Value.absent(),
    required int dailyFlowId,
    this.context = const Value.absent(),
    this.intensity = const Value.absent(),
    this.inhalerUsed = const Value.absent(),
    this.microSessionCount = const Value.absent(),
    this.improvement = const Value.absent(),
    this.durationMinutes = const Value.absent(),
    this.calledFamily = const Value.absent(),
    this.escalatedEmergency = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : dailyFlowId = Value(dailyFlowId);
  static Insertable<BreathlessnessEpisode> custom({
    Expression<int>? id,
    Expression<int>? dailyFlowId,
    Expression<String>? context,
    Expression<int>? intensity,
    Expression<bool>? inhalerUsed,
    Expression<int>? microSessionCount,
    Expression<String>? improvement,
    Expression<int>? durationMinutes,
    Expression<bool>? calledFamily,
    Expression<bool>? escalatedEmergency,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (dailyFlowId != null) 'daily_flow_id': dailyFlowId,
      if (context != null) 'context': context,
      if (intensity != null) 'intensity': intensity,
      if (inhalerUsed != null) 'inhaler_used': inhalerUsed,
      if (microSessionCount != null) 'micro_session_count': microSessionCount,
      if (improvement != null) 'improvement': improvement,
      if (durationMinutes != null) 'duration_minutes': durationMinutes,
      if (calledFamily != null) 'called_family': calledFamily,
      if (escalatedEmergency != null) 'escalated_emergency': escalatedEmergency,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  BreathlessnessEpisodesCompanion copyWith({
    Value<int>? id,
    Value<int>? dailyFlowId,
    Value<String?>? context,
    Value<int?>? intensity,
    Value<bool>? inhalerUsed,
    Value<int>? microSessionCount,
    Value<String?>? improvement,
    Value<int?>? durationMinutes,
    Value<bool>? calledFamily,
    Value<bool>? escalatedEmergency,
    Value<DateTime>? createdAt,
  }) {
    return BreathlessnessEpisodesCompanion(
      id: id ?? this.id,
      dailyFlowId: dailyFlowId ?? this.dailyFlowId,
      context: context ?? this.context,
      intensity: intensity ?? this.intensity,
      inhalerUsed: inhalerUsed ?? this.inhalerUsed,
      microSessionCount: microSessionCount ?? this.microSessionCount,
      improvement: improvement ?? this.improvement,
      durationMinutes: durationMinutes ?? this.durationMinutes,
      calledFamily: calledFamily ?? this.calledFamily,
      escalatedEmergency: escalatedEmergency ?? this.escalatedEmergency,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (dailyFlowId.present) {
      map['daily_flow_id'] = Variable<int>(dailyFlowId.value);
    }
    if (context.present) {
      map['context'] = Variable<String>(context.value);
    }
    if (intensity.present) {
      map['intensity'] = Variable<int>(intensity.value);
    }
    if (inhalerUsed.present) {
      map['inhaler_used'] = Variable<bool>(inhalerUsed.value);
    }
    if (microSessionCount.present) {
      map['micro_session_count'] = Variable<int>(microSessionCount.value);
    }
    if (improvement.present) {
      map['improvement'] = Variable<String>(improvement.value);
    }
    if (durationMinutes.present) {
      map['duration_minutes'] = Variable<int>(durationMinutes.value);
    }
    if (calledFamily.present) {
      map['called_family'] = Variable<bool>(calledFamily.value);
    }
    if (escalatedEmergency.present) {
      map['escalated_emergency'] = Variable<bool>(escalatedEmergency.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BreathlessnessEpisodesCompanion(')
          ..write('id: $id, ')
          ..write('dailyFlowId: $dailyFlowId, ')
          ..write('context: $context, ')
          ..write('intensity: $intensity, ')
          ..write('inhalerUsed: $inhalerUsed, ')
          ..write('microSessionCount: $microSessionCount, ')
          ..write('improvement: $improvement, ')
          ..write('durationMinutes: $durationMinutes, ')
          ..write('calledFamily: $calledFamily, ')
          ..write('escalatedEmergency: $escalatedEmergency, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $RescueInhalerUsesTable extends RescueInhalerUses
    with TableInfo<$RescueInhalerUsesTable, RescueInhalerUse> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RescueInhalerUsesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _dailyFlowIdMeta = const VerificationMeta(
    'dailyFlowId',
  );
  @override
  late final GeneratedColumn<int> dailyFlowId = GeneratedColumn<int>(
    'daily_flow_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _timestampMeta = const VerificationMeta(
    'timestamp',
  );
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
    'timestamp',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _usageContextMeta = const VerificationMeta(
    'usageContext',
  );
  @override
  late final GeneratedColumn<String> usageContext = GeneratedColumn<String>(
    'usage_context',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _puffsMeta = const VerificationMeta('puffs');
  @override
  late final GeneratedColumn<int> puffs = GeneratedColumn<int>(
    'puffs',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _reliefLevelMeta = const VerificationMeta(
    'reliefLevel',
  );
  @override
  late final GeneratedColumn<int> reliefLevel = GeneratedColumn<int>(
    'relief_level',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _recoveryMinutesMeta = const VerificationMeta(
    'recoveryMinutes',
  );
  @override
  late final GeneratedColumn<int> recoveryMinutes = GeneratedColumn<int>(
    'recovery_minutes',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _activityContextMeta = const VerificationMeta(
    'activityContext',
  );
  @override
  late final GeneratedColumn<String> activityContext = GeneratedColumn<String>(
    'activity_context',
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
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    dailyFlowId,
    timestamp,
    usageContext,
    puffs,
    reliefLevel,
    recoveryMinutes,
    activityContext,
    notes,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'rescue_inhaler_uses';
  @override
  VerificationContext validateIntegrity(
    Insertable<RescueInhalerUse> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('daily_flow_id')) {
      context.handle(
        _dailyFlowIdMeta,
        dailyFlowId.isAcceptableOrUnknown(
          data['daily_flow_id']!,
          _dailyFlowIdMeta,
        ),
      );
    }
    if (data.containsKey('timestamp')) {
      context.handle(
        _timestampMeta,
        timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta),
      );
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    if (data.containsKey('usage_context')) {
      context.handle(
        _usageContextMeta,
        usageContext.isAcceptableOrUnknown(
          data['usage_context']!,
          _usageContextMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_usageContextMeta);
    }
    if (data.containsKey('puffs')) {
      context.handle(
        _puffsMeta,
        puffs.isAcceptableOrUnknown(data['puffs']!, _puffsMeta),
      );
    }
    if (data.containsKey('relief_level')) {
      context.handle(
        _reliefLevelMeta,
        reliefLevel.isAcceptableOrUnknown(
          data['relief_level']!,
          _reliefLevelMeta,
        ),
      );
    }
    if (data.containsKey('recovery_minutes')) {
      context.handle(
        _recoveryMinutesMeta,
        recoveryMinutes.isAcceptableOrUnknown(
          data['recovery_minutes']!,
          _recoveryMinutesMeta,
        ),
      );
    }
    if (data.containsKey('activity_context')) {
      context.handle(
        _activityContextMeta,
        activityContext.isAcceptableOrUnknown(
          data['activity_context']!,
          _activityContextMeta,
        ),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RescueInhalerUse map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RescueInhalerUse(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      dailyFlowId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}daily_flow_id'],
      ),
      timestamp:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}timestamp'],
          )!,
      usageContext:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}usage_context'],
          )!,
      puffs:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}puffs'],
          )!,
      reliefLevel: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}relief_level'],
      ),
      recoveryMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}recovery_minutes'],
      ),
      activityContext: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}activity_context'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      createdAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}created_at'],
          )!,
    );
  }

  @override
  $RescueInhalerUsesTable createAlias(String alias) {
    return $RescueInhalerUsesTable(attachedDatabase, alias);
  }
}

class RescueInhalerUse extends DataClass
    implements Insertable<RescueInhalerUse> {
  final int id;
  final int? dailyFlowId;
  final DateTime timestamp;
  final String usageContext;
  final int puffs;
  final int? reliefLevel;
  final int? recoveryMinutes;
  final String? activityContext;
  final String? notes;
  final DateTime createdAt;
  const RescueInhalerUse({
    required this.id,
    this.dailyFlowId,
    required this.timestamp,
    required this.usageContext,
    required this.puffs,
    this.reliefLevel,
    this.recoveryMinutes,
    this.activityContext,
    this.notes,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || dailyFlowId != null) {
      map['daily_flow_id'] = Variable<int>(dailyFlowId);
    }
    map['timestamp'] = Variable<DateTime>(timestamp);
    map['usage_context'] = Variable<String>(usageContext);
    map['puffs'] = Variable<int>(puffs);
    if (!nullToAbsent || reliefLevel != null) {
      map['relief_level'] = Variable<int>(reliefLevel);
    }
    if (!nullToAbsent || recoveryMinutes != null) {
      map['recovery_minutes'] = Variable<int>(recoveryMinutes);
    }
    if (!nullToAbsent || activityContext != null) {
      map['activity_context'] = Variable<String>(activityContext);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  RescueInhalerUsesCompanion toCompanion(bool nullToAbsent) {
    return RescueInhalerUsesCompanion(
      id: Value(id),
      dailyFlowId:
          dailyFlowId == null && nullToAbsent
              ? const Value.absent()
              : Value(dailyFlowId),
      timestamp: Value(timestamp),
      usageContext: Value(usageContext),
      puffs: Value(puffs),
      reliefLevel:
          reliefLevel == null && nullToAbsent
              ? const Value.absent()
              : Value(reliefLevel),
      recoveryMinutes:
          recoveryMinutes == null && nullToAbsent
              ? const Value.absent()
              : Value(recoveryMinutes),
      activityContext:
          activityContext == null && nullToAbsent
              ? const Value.absent()
              : Value(activityContext),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      createdAt: Value(createdAt),
    );
  }

  factory RescueInhalerUse.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RescueInhalerUse(
      id: serializer.fromJson<int>(json['id']),
      dailyFlowId: serializer.fromJson<int?>(json['dailyFlowId']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
      usageContext: serializer.fromJson<String>(json['usageContext']),
      puffs: serializer.fromJson<int>(json['puffs']),
      reliefLevel: serializer.fromJson<int?>(json['reliefLevel']),
      recoveryMinutes: serializer.fromJson<int?>(json['recoveryMinutes']),
      activityContext: serializer.fromJson<String?>(json['activityContext']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'dailyFlowId': serializer.toJson<int?>(dailyFlowId),
      'timestamp': serializer.toJson<DateTime>(timestamp),
      'usageContext': serializer.toJson<String>(usageContext),
      'puffs': serializer.toJson<int>(puffs),
      'reliefLevel': serializer.toJson<int?>(reliefLevel),
      'recoveryMinutes': serializer.toJson<int?>(recoveryMinutes),
      'activityContext': serializer.toJson<String?>(activityContext),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  RescueInhalerUse copyWith({
    int? id,
    Value<int?> dailyFlowId = const Value.absent(),
    DateTime? timestamp,
    String? usageContext,
    int? puffs,
    Value<int?> reliefLevel = const Value.absent(),
    Value<int?> recoveryMinutes = const Value.absent(),
    Value<String?> activityContext = const Value.absent(),
    Value<String?> notes = const Value.absent(),
    DateTime? createdAt,
  }) => RescueInhalerUse(
    id: id ?? this.id,
    dailyFlowId: dailyFlowId.present ? dailyFlowId.value : this.dailyFlowId,
    timestamp: timestamp ?? this.timestamp,
    usageContext: usageContext ?? this.usageContext,
    puffs: puffs ?? this.puffs,
    reliefLevel: reliefLevel.present ? reliefLevel.value : this.reliefLevel,
    recoveryMinutes:
        recoveryMinutes.present ? recoveryMinutes.value : this.recoveryMinutes,
    activityContext:
        activityContext.present ? activityContext.value : this.activityContext,
    notes: notes.present ? notes.value : this.notes,
    createdAt: createdAt ?? this.createdAt,
  );
  RescueInhalerUse copyWithCompanion(RescueInhalerUsesCompanion data) {
    return RescueInhalerUse(
      id: data.id.present ? data.id.value : this.id,
      dailyFlowId:
          data.dailyFlowId.present ? data.dailyFlowId.value : this.dailyFlowId,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
      usageContext:
          data.usageContext.present
              ? data.usageContext.value
              : this.usageContext,
      puffs: data.puffs.present ? data.puffs.value : this.puffs,
      reliefLevel:
          data.reliefLevel.present ? data.reliefLevel.value : this.reliefLevel,
      recoveryMinutes:
          data.recoveryMinutes.present
              ? data.recoveryMinutes.value
              : this.recoveryMinutes,
      activityContext:
          data.activityContext.present
              ? data.activityContext.value
              : this.activityContext,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RescueInhalerUse(')
          ..write('id: $id, ')
          ..write('dailyFlowId: $dailyFlowId, ')
          ..write('timestamp: $timestamp, ')
          ..write('usageContext: $usageContext, ')
          ..write('puffs: $puffs, ')
          ..write('reliefLevel: $reliefLevel, ')
          ..write('recoveryMinutes: $recoveryMinutes, ')
          ..write('activityContext: $activityContext, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    dailyFlowId,
    timestamp,
    usageContext,
    puffs,
    reliefLevel,
    recoveryMinutes,
    activityContext,
    notes,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RescueInhalerUse &&
          other.id == this.id &&
          other.dailyFlowId == this.dailyFlowId &&
          other.timestamp == this.timestamp &&
          other.usageContext == this.usageContext &&
          other.puffs == this.puffs &&
          other.reliefLevel == this.reliefLevel &&
          other.recoveryMinutes == this.recoveryMinutes &&
          other.activityContext == this.activityContext &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt);
}

class RescueInhalerUsesCompanion extends UpdateCompanion<RescueInhalerUse> {
  final Value<int> id;
  final Value<int?> dailyFlowId;
  final Value<DateTime> timestamp;
  final Value<String> usageContext;
  final Value<int> puffs;
  final Value<int?> reliefLevel;
  final Value<int?> recoveryMinutes;
  final Value<String?> activityContext;
  final Value<String?> notes;
  final Value<DateTime> createdAt;
  const RescueInhalerUsesCompanion({
    this.id = const Value.absent(),
    this.dailyFlowId = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.usageContext = const Value.absent(),
    this.puffs = const Value.absent(),
    this.reliefLevel = const Value.absent(),
    this.recoveryMinutes = const Value.absent(),
    this.activityContext = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  RescueInhalerUsesCompanion.insert({
    this.id = const Value.absent(),
    this.dailyFlowId = const Value.absent(),
    required DateTime timestamp,
    required String usageContext,
    this.puffs = const Value.absent(),
    this.reliefLevel = const Value.absent(),
    this.recoveryMinutes = const Value.absent(),
    this.activityContext = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : timestamp = Value(timestamp),
       usageContext = Value(usageContext);
  static Insertable<RescueInhalerUse> custom({
    Expression<int>? id,
    Expression<int>? dailyFlowId,
    Expression<DateTime>? timestamp,
    Expression<String>? usageContext,
    Expression<int>? puffs,
    Expression<int>? reliefLevel,
    Expression<int>? recoveryMinutes,
    Expression<String>? activityContext,
    Expression<String>? notes,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (dailyFlowId != null) 'daily_flow_id': dailyFlowId,
      if (timestamp != null) 'timestamp': timestamp,
      if (usageContext != null) 'usage_context': usageContext,
      if (puffs != null) 'puffs': puffs,
      if (reliefLevel != null) 'relief_level': reliefLevel,
      if (recoveryMinutes != null) 'recovery_minutes': recoveryMinutes,
      if (activityContext != null) 'activity_context': activityContext,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  RescueInhalerUsesCompanion copyWith({
    Value<int>? id,
    Value<int?>? dailyFlowId,
    Value<DateTime>? timestamp,
    Value<String>? usageContext,
    Value<int>? puffs,
    Value<int?>? reliefLevel,
    Value<int?>? recoveryMinutes,
    Value<String?>? activityContext,
    Value<String?>? notes,
    Value<DateTime>? createdAt,
  }) {
    return RescueInhalerUsesCompanion(
      id: id ?? this.id,
      dailyFlowId: dailyFlowId ?? this.dailyFlowId,
      timestamp: timestamp ?? this.timestamp,
      usageContext: usageContext ?? this.usageContext,
      puffs: puffs ?? this.puffs,
      reliefLevel: reliefLevel ?? this.reliefLevel,
      recoveryMinutes: recoveryMinutes ?? this.recoveryMinutes,
      activityContext: activityContext ?? this.activityContext,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (dailyFlowId.present) {
      map['daily_flow_id'] = Variable<int>(dailyFlowId.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    if (usageContext.present) {
      map['usage_context'] = Variable<String>(usageContext.value);
    }
    if (puffs.present) {
      map['puffs'] = Variable<int>(puffs.value);
    }
    if (reliefLevel.present) {
      map['relief_level'] = Variable<int>(reliefLevel.value);
    }
    if (recoveryMinutes.present) {
      map['recovery_minutes'] = Variable<int>(recoveryMinutes.value);
    }
    if (activityContext.present) {
      map['activity_context'] = Variable<String>(activityContext.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RescueInhalerUsesCompanion(')
          ..write('id: $id, ')
          ..write('dailyFlowId: $dailyFlowId, ')
          ..write('timestamp: $timestamp, ')
          ..write('usageContext: $usageContext, ')
          ..write('puffs: $puffs, ')
          ..write('reliefLevel: $reliefLevel, ')
          ..write('recoveryMinutes: $recoveryMinutes, ')
          ..write('activityContext: $activityContext, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $FunctionalTestsTable extends FunctionalTests
    with TableInfo<$FunctionalTestsTable, FunctionalTest> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FunctionalTestsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _dailyFlowIdMeta = const VerificationMeta(
    'dailyFlowId',
  );
  @override
  late final GeneratedColumn<int> dailyFlowId = GeneratedColumn<int>(
    'daily_flow_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
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
  static const VerificationMeta _timestampMeta = const VerificationMeta(
    'timestamp',
  );
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
    'timestamp',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pausesMeta = const VerificationMeta('pauses');
  @override
  late final GeneratedColumn<int> pauses = GeneratedColumn<int>(
    'pauses',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _difficultyMeta = const VerificationMeta(
    'difficulty',
  );
  @override
  late final GeneratedColumn<int> difficulty = GeneratedColumn<int>(
    'difficulty',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _resultTextMeta = const VerificationMeta(
    'resultText',
  );
  @override
  late final GeneratedColumn<String> resultText = GeneratedColumn<String>(
    'result_text',
    aliasedName,
    true,
    type: DriftSqlType.string,
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
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    dailyFlowId,
    type,
    timestamp,
    pauses,
    difficulty,
    resultText,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'functional_tests';
  @override
  VerificationContext validateIntegrity(
    Insertable<FunctionalTest> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('daily_flow_id')) {
      context.handle(
        _dailyFlowIdMeta,
        dailyFlowId.isAcceptableOrUnknown(
          data['daily_flow_id']!,
          _dailyFlowIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_dailyFlowIdMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('timestamp')) {
      context.handle(
        _timestampMeta,
        timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta),
      );
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    if (data.containsKey('pauses')) {
      context.handle(
        _pausesMeta,
        pauses.isAcceptableOrUnknown(data['pauses']!, _pausesMeta),
      );
    }
    if (data.containsKey('difficulty')) {
      context.handle(
        _difficultyMeta,
        difficulty.isAcceptableOrUnknown(data['difficulty']!, _difficultyMeta),
      );
    }
    if (data.containsKey('result_text')) {
      context.handle(
        _resultTextMeta,
        resultText.isAcceptableOrUnknown(data['result_text']!, _resultTextMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FunctionalTest map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FunctionalTest(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      dailyFlowId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}daily_flow_id'],
          )!,
      type:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}type'],
          )!,
      timestamp:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}timestamp'],
          )!,
      pauses:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}pauses'],
          )!,
      difficulty: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}difficulty'],
      ),
      resultText: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}result_text'],
      ),
      createdAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}created_at'],
          )!,
    );
  }

  @override
  $FunctionalTestsTable createAlias(String alias) {
    return $FunctionalTestsTable(attachedDatabase, alias);
  }
}

class FunctionalTest extends DataClass implements Insertable<FunctionalTest> {
  final int id;
  final int dailyFlowId;
  final String type;
  final DateTime timestamp;
  final int pauses;
  final int? difficulty;
  final String? resultText;
  final DateTime createdAt;
  const FunctionalTest({
    required this.id,
    required this.dailyFlowId,
    required this.type,
    required this.timestamp,
    required this.pauses,
    this.difficulty,
    this.resultText,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['daily_flow_id'] = Variable<int>(dailyFlowId);
    map['type'] = Variable<String>(type);
    map['timestamp'] = Variable<DateTime>(timestamp);
    map['pauses'] = Variable<int>(pauses);
    if (!nullToAbsent || difficulty != null) {
      map['difficulty'] = Variable<int>(difficulty);
    }
    if (!nullToAbsent || resultText != null) {
      map['result_text'] = Variable<String>(resultText);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  FunctionalTestsCompanion toCompanion(bool nullToAbsent) {
    return FunctionalTestsCompanion(
      id: Value(id),
      dailyFlowId: Value(dailyFlowId),
      type: Value(type),
      timestamp: Value(timestamp),
      pauses: Value(pauses),
      difficulty:
          difficulty == null && nullToAbsent
              ? const Value.absent()
              : Value(difficulty),
      resultText:
          resultText == null && nullToAbsent
              ? const Value.absent()
              : Value(resultText),
      createdAt: Value(createdAt),
    );
  }

  factory FunctionalTest.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FunctionalTest(
      id: serializer.fromJson<int>(json['id']),
      dailyFlowId: serializer.fromJson<int>(json['dailyFlowId']),
      type: serializer.fromJson<String>(json['type']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
      pauses: serializer.fromJson<int>(json['pauses']),
      difficulty: serializer.fromJson<int?>(json['difficulty']),
      resultText: serializer.fromJson<String?>(json['resultText']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'dailyFlowId': serializer.toJson<int>(dailyFlowId),
      'type': serializer.toJson<String>(type),
      'timestamp': serializer.toJson<DateTime>(timestamp),
      'pauses': serializer.toJson<int>(pauses),
      'difficulty': serializer.toJson<int?>(difficulty),
      'resultText': serializer.toJson<String?>(resultText),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  FunctionalTest copyWith({
    int? id,
    int? dailyFlowId,
    String? type,
    DateTime? timestamp,
    int? pauses,
    Value<int?> difficulty = const Value.absent(),
    Value<String?> resultText = const Value.absent(),
    DateTime? createdAt,
  }) => FunctionalTest(
    id: id ?? this.id,
    dailyFlowId: dailyFlowId ?? this.dailyFlowId,
    type: type ?? this.type,
    timestamp: timestamp ?? this.timestamp,
    pauses: pauses ?? this.pauses,
    difficulty: difficulty.present ? difficulty.value : this.difficulty,
    resultText: resultText.present ? resultText.value : this.resultText,
    createdAt: createdAt ?? this.createdAt,
  );
  FunctionalTest copyWithCompanion(FunctionalTestsCompanion data) {
    return FunctionalTest(
      id: data.id.present ? data.id.value : this.id,
      dailyFlowId:
          data.dailyFlowId.present ? data.dailyFlowId.value : this.dailyFlowId,
      type: data.type.present ? data.type.value : this.type,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
      pauses: data.pauses.present ? data.pauses.value : this.pauses,
      difficulty:
          data.difficulty.present ? data.difficulty.value : this.difficulty,
      resultText:
          data.resultText.present ? data.resultText.value : this.resultText,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FunctionalTest(')
          ..write('id: $id, ')
          ..write('dailyFlowId: $dailyFlowId, ')
          ..write('type: $type, ')
          ..write('timestamp: $timestamp, ')
          ..write('pauses: $pauses, ')
          ..write('difficulty: $difficulty, ')
          ..write('resultText: $resultText, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    dailyFlowId,
    type,
    timestamp,
    pauses,
    difficulty,
    resultText,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FunctionalTest &&
          other.id == this.id &&
          other.dailyFlowId == this.dailyFlowId &&
          other.type == this.type &&
          other.timestamp == this.timestamp &&
          other.pauses == this.pauses &&
          other.difficulty == this.difficulty &&
          other.resultText == this.resultText &&
          other.createdAt == this.createdAt);
}

class FunctionalTestsCompanion extends UpdateCompanion<FunctionalTest> {
  final Value<int> id;
  final Value<int> dailyFlowId;
  final Value<String> type;
  final Value<DateTime> timestamp;
  final Value<int> pauses;
  final Value<int?> difficulty;
  final Value<String?> resultText;
  final Value<DateTime> createdAt;
  const FunctionalTestsCompanion({
    this.id = const Value.absent(),
    this.dailyFlowId = const Value.absent(),
    this.type = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.pauses = const Value.absent(),
    this.difficulty = const Value.absent(),
    this.resultText = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  FunctionalTestsCompanion.insert({
    this.id = const Value.absent(),
    required int dailyFlowId,
    required String type,
    required DateTime timestamp,
    this.pauses = const Value.absent(),
    this.difficulty = const Value.absent(),
    this.resultText = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : dailyFlowId = Value(dailyFlowId),
       type = Value(type),
       timestamp = Value(timestamp);
  static Insertable<FunctionalTest> custom({
    Expression<int>? id,
    Expression<int>? dailyFlowId,
    Expression<String>? type,
    Expression<DateTime>? timestamp,
    Expression<int>? pauses,
    Expression<int>? difficulty,
    Expression<String>? resultText,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (dailyFlowId != null) 'daily_flow_id': dailyFlowId,
      if (type != null) 'type': type,
      if (timestamp != null) 'timestamp': timestamp,
      if (pauses != null) 'pauses': pauses,
      if (difficulty != null) 'difficulty': difficulty,
      if (resultText != null) 'result_text': resultText,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  FunctionalTestsCompanion copyWith({
    Value<int>? id,
    Value<int>? dailyFlowId,
    Value<String>? type,
    Value<DateTime>? timestamp,
    Value<int>? pauses,
    Value<int?>? difficulty,
    Value<String?>? resultText,
    Value<DateTime>? createdAt,
  }) {
    return FunctionalTestsCompanion(
      id: id ?? this.id,
      dailyFlowId: dailyFlowId ?? this.dailyFlowId,
      type: type ?? this.type,
      timestamp: timestamp ?? this.timestamp,
      pauses: pauses ?? this.pauses,
      difficulty: difficulty ?? this.difficulty,
      resultText: resultText ?? this.resultText,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (dailyFlowId.present) {
      map['daily_flow_id'] = Variable<int>(dailyFlowId.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    if (pauses.present) {
      map['pauses'] = Variable<int>(pauses.value);
    }
    if (difficulty.present) {
      map['difficulty'] = Variable<int>(difficulty.value);
    }
    if (resultText.present) {
      map['result_text'] = Variable<String>(resultText.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FunctionalTestsCompanion(')
          ..write('id: $id, ')
          ..write('dailyFlowId: $dailyFlowId, ')
          ..write('type: $type, ')
          ..write('timestamp: $timestamp, ')
          ..write('pauses: $pauses, ')
          ..write('difficulty: $difficulty, ')
          ..write('resultText: $resultText, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $ActivityLogsTable extends ActivityLogs
    with TableInfo<$ActivityLogsTable, ActivityLog> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ActivityLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
    'user_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
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
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _durationMinutesMeta = const VerificationMeta(
    'durationMinutes',
  );
  @override
  late final GeneratedColumn<int> durationMinutes = GeneratedColumn<int>(
    'duration_minutes',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _perceivedEffortMeta = const VerificationMeta(
    'perceivedEffort',
  );
  @override
  late final GeneratedColumn<int> perceivedEffort = GeneratedColumn<int>(
    'perceived_effort',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sourceMeta = const VerificationMeta('source');
  @override
  late final GeneratedColumn<String> source = GeneratedColumn<String>(
    'source',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('free'),
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
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    type,
    title,
    durationMinutes,
    perceivedEffort,
    source,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'activity_logs';
  @override
  VerificationContext validateIntegrity(
    Insertable<ActivityLog> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('duration_minutes')) {
      context.handle(
        _durationMinutesMeta,
        durationMinutes.isAcceptableOrUnknown(
          data['duration_minutes']!,
          _durationMinutesMeta,
        ),
      );
    }
    if (data.containsKey('perceived_effort')) {
      context.handle(
        _perceivedEffortMeta,
        perceivedEffort.isAcceptableOrUnknown(
          data['perceived_effort']!,
          _perceivedEffortMeta,
        ),
      );
    }
    if (data.containsKey('source')) {
      context.handle(
        _sourceMeta,
        source.isAcceptableOrUnknown(data['source']!, _sourceMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ActivityLog map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ActivityLog(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}user_id'],
      ),
      type:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}type'],
          )!,
      title:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}title'],
          )!,
      durationMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}duration_minutes'],
      ),
      perceivedEffort: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}perceived_effort'],
      ),
      source:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}source'],
          )!,
      createdAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}created_at'],
          )!,
    );
  }

  @override
  $ActivityLogsTable createAlias(String alias) {
    return $ActivityLogsTable(attachedDatabase, alias);
  }
}

class ActivityLog extends DataClass implements Insertable<ActivityLog> {
  final int id;
  final int? userId;
  final String type;
  final String title;
  final int? durationMinutes;
  final int? perceivedEffort;
  final String source;
  final DateTime createdAt;
  const ActivityLog({
    required this.id,
    this.userId,
    required this.type,
    required this.title,
    this.durationMinutes,
    this.perceivedEffort,
    required this.source,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || userId != null) {
      map['user_id'] = Variable<int>(userId);
    }
    map['type'] = Variable<String>(type);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || durationMinutes != null) {
      map['duration_minutes'] = Variable<int>(durationMinutes);
    }
    if (!nullToAbsent || perceivedEffort != null) {
      map['perceived_effort'] = Variable<int>(perceivedEffort);
    }
    map['source'] = Variable<String>(source);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  ActivityLogsCompanion toCompanion(bool nullToAbsent) {
    return ActivityLogsCompanion(
      id: Value(id),
      userId:
          userId == null && nullToAbsent ? const Value.absent() : Value(userId),
      type: Value(type),
      title: Value(title),
      durationMinutes:
          durationMinutes == null && nullToAbsent
              ? const Value.absent()
              : Value(durationMinutes),
      perceivedEffort:
          perceivedEffort == null && nullToAbsent
              ? const Value.absent()
              : Value(perceivedEffort),
      source: Value(source),
      createdAt: Value(createdAt),
    );
  }

  factory ActivityLog.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ActivityLog(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int?>(json['userId']),
      type: serializer.fromJson<String>(json['type']),
      title: serializer.fromJson<String>(json['title']),
      durationMinutes: serializer.fromJson<int?>(json['durationMinutes']),
      perceivedEffort: serializer.fromJson<int?>(json['perceivedEffort']),
      source: serializer.fromJson<String>(json['source']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<int?>(userId),
      'type': serializer.toJson<String>(type),
      'title': serializer.toJson<String>(title),
      'durationMinutes': serializer.toJson<int?>(durationMinutes),
      'perceivedEffort': serializer.toJson<int?>(perceivedEffort),
      'source': serializer.toJson<String>(source),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  ActivityLog copyWith({
    int? id,
    Value<int?> userId = const Value.absent(),
    String? type,
    String? title,
    Value<int?> durationMinutes = const Value.absent(),
    Value<int?> perceivedEffort = const Value.absent(),
    String? source,
    DateTime? createdAt,
  }) => ActivityLog(
    id: id ?? this.id,
    userId: userId.present ? userId.value : this.userId,
    type: type ?? this.type,
    title: title ?? this.title,
    durationMinutes:
        durationMinutes.present ? durationMinutes.value : this.durationMinutes,
    perceivedEffort:
        perceivedEffort.present ? perceivedEffort.value : this.perceivedEffort,
    source: source ?? this.source,
    createdAt: createdAt ?? this.createdAt,
  );
  ActivityLog copyWithCompanion(ActivityLogsCompanion data) {
    return ActivityLog(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      type: data.type.present ? data.type.value : this.type,
      title: data.title.present ? data.title.value : this.title,
      durationMinutes:
          data.durationMinutes.present
              ? data.durationMinutes.value
              : this.durationMinutes,
      perceivedEffort:
          data.perceivedEffort.present
              ? data.perceivedEffort.value
              : this.perceivedEffort,
      source: data.source.present ? data.source.value : this.source,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ActivityLog(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('type: $type, ')
          ..write('title: $title, ')
          ..write('durationMinutes: $durationMinutes, ')
          ..write('perceivedEffort: $perceivedEffort, ')
          ..write('source: $source, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    type,
    title,
    durationMinutes,
    perceivedEffort,
    source,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ActivityLog &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.type == this.type &&
          other.title == this.title &&
          other.durationMinutes == this.durationMinutes &&
          other.perceivedEffort == this.perceivedEffort &&
          other.source == this.source &&
          other.createdAt == this.createdAt);
}

class ActivityLogsCompanion extends UpdateCompanion<ActivityLog> {
  final Value<int> id;
  final Value<int?> userId;
  final Value<String> type;
  final Value<String> title;
  final Value<int?> durationMinutes;
  final Value<int?> perceivedEffort;
  final Value<String> source;
  final Value<DateTime> createdAt;
  const ActivityLogsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.type = const Value.absent(),
    this.title = const Value.absent(),
    this.durationMinutes = const Value.absent(),
    this.perceivedEffort = const Value.absent(),
    this.source = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  ActivityLogsCompanion.insert({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    required String type,
    required String title,
    this.durationMinutes = const Value.absent(),
    this.perceivedEffort = const Value.absent(),
    this.source = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : type = Value(type),
       title = Value(title);
  static Insertable<ActivityLog> custom({
    Expression<int>? id,
    Expression<int>? userId,
    Expression<String>? type,
    Expression<String>? title,
    Expression<int>? durationMinutes,
    Expression<int>? perceivedEffort,
    Expression<String>? source,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (type != null) 'type': type,
      if (title != null) 'title': title,
      if (durationMinutes != null) 'duration_minutes': durationMinutes,
      if (perceivedEffort != null) 'perceived_effort': perceivedEffort,
      if (source != null) 'source': source,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  ActivityLogsCompanion copyWith({
    Value<int>? id,
    Value<int?>? userId,
    Value<String>? type,
    Value<String>? title,
    Value<int?>? durationMinutes,
    Value<int?>? perceivedEffort,
    Value<String>? source,
    Value<DateTime>? createdAt,
  }) {
    return ActivityLogsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      type: type ?? this.type,
      title: title ?? this.title,
      durationMinutes: durationMinutes ?? this.durationMinutes,
      perceivedEffort: perceivedEffort ?? this.perceivedEffort,
      source: source ?? this.source,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (durationMinutes.present) {
      map['duration_minutes'] = Variable<int>(durationMinutes.value);
    }
    if (perceivedEffort.present) {
      map['perceived_effort'] = Variable<int>(perceivedEffort.value);
    }
    if (source.present) {
      map['source'] = Variable<String>(source.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ActivityLogsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('type: $type, ')
          ..write('title: $title, ')
          ..write('durationMinutes: $durationMinutes, ')
          ..write('perceivedEffort: $perceivedEffort, ')
          ..write('source: $source, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $EmergencyEventsTable extends EmergencyEvents
    with TableInfo<$EmergencyEventsTable, EmergencyEvent> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EmergencyEventsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
    'user_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _dailyFlowIdMeta = const VerificationMeta(
    'dailyFlowId',
  );
  @override
  late final GeneratedColumn<int> dailyFlowId = GeneratedColumn<int>(
    'daily_flow_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _timestampMeta = const VerificationMeta(
    'timestamp',
  );
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
    'timestamp',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
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
  static const VerificationMeta _contactCalledMeta = const VerificationMeta(
    'contactCalled',
  );
  @override
  late final GeneratedColumn<String> contactCalled = GeneratedColumn<String>(
    'contact_called',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _smsSentMeta = const VerificationMeta(
    'smsSent',
  );
  @override
  late final GeneratedColumn<bool> smsSent = GeneratedColumn<bool>(
    'sms_sent',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("sms_sent" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _resultMeta = const VerificationMeta('result');
  @override
  late final GeneratedColumn<String> result = GeneratedColumn<String>(
    'result',
    aliasedName,
    true,
    type: DriftSqlType.string,
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
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    dailyFlowId,
    timestamp,
    type,
    contactCalled,
    smsSent,
    result,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'emergency_events';
  @override
  VerificationContext validateIntegrity(
    Insertable<EmergencyEvent> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    }
    if (data.containsKey('daily_flow_id')) {
      context.handle(
        _dailyFlowIdMeta,
        dailyFlowId.isAcceptableOrUnknown(
          data['daily_flow_id']!,
          _dailyFlowIdMeta,
        ),
      );
    }
    if (data.containsKey('timestamp')) {
      context.handle(
        _timestampMeta,
        timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta),
      );
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('contact_called')) {
      context.handle(
        _contactCalledMeta,
        contactCalled.isAcceptableOrUnknown(
          data['contact_called']!,
          _contactCalledMeta,
        ),
      );
    }
    if (data.containsKey('sms_sent')) {
      context.handle(
        _smsSentMeta,
        smsSent.isAcceptableOrUnknown(data['sms_sent']!, _smsSentMeta),
      );
    }
    if (data.containsKey('result')) {
      context.handle(
        _resultMeta,
        result.isAcceptableOrUnknown(data['result']!, _resultMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  EmergencyEvent map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EmergencyEvent(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}user_id'],
      ),
      dailyFlowId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}daily_flow_id'],
      ),
      timestamp:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}timestamp'],
          )!,
      type:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}type'],
          )!,
      contactCalled: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}contact_called'],
      ),
      smsSent:
          attachedDatabase.typeMapping.read(
            DriftSqlType.bool,
            data['${effectivePrefix}sms_sent'],
          )!,
      result: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}result'],
      ),
      createdAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}created_at'],
          )!,
    );
  }

  @override
  $EmergencyEventsTable createAlias(String alias) {
    return $EmergencyEventsTable(attachedDatabase, alias);
  }
}

class EmergencyEvent extends DataClass implements Insertable<EmergencyEvent> {
  final int id;
  final int? userId;
  final int? dailyFlowId;
  final DateTime timestamp;
  final String type;
  final String? contactCalled;
  final bool smsSent;
  final String? result;
  final DateTime createdAt;
  const EmergencyEvent({
    required this.id,
    this.userId,
    this.dailyFlowId,
    required this.timestamp,
    required this.type,
    this.contactCalled,
    required this.smsSent,
    this.result,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || userId != null) {
      map['user_id'] = Variable<int>(userId);
    }
    if (!nullToAbsent || dailyFlowId != null) {
      map['daily_flow_id'] = Variable<int>(dailyFlowId);
    }
    map['timestamp'] = Variable<DateTime>(timestamp);
    map['type'] = Variable<String>(type);
    if (!nullToAbsent || contactCalled != null) {
      map['contact_called'] = Variable<String>(contactCalled);
    }
    map['sms_sent'] = Variable<bool>(smsSent);
    if (!nullToAbsent || result != null) {
      map['result'] = Variable<String>(result);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  EmergencyEventsCompanion toCompanion(bool nullToAbsent) {
    return EmergencyEventsCompanion(
      id: Value(id),
      userId:
          userId == null && nullToAbsent ? const Value.absent() : Value(userId),
      dailyFlowId:
          dailyFlowId == null && nullToAbsent
              ? const Value.absent()
              : Value(dailyFlowId),
      timestamp: Value(timestamp),
      type: Value(type),
      contactCalled:
          contactCalled == null && nullToAbsent
              ? const Value.absent()
              : Value(contactCalled),
      smsSent: Value(smsSent),
      result:
          result == null && nullToAbsent ? const Value.absent() : Value(result),
      createdAt: Value(createdAt),
    );
  }

  factory EmergencyEvent.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EmergencyEvent(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int?>(json['userId']),
      dailyFlowId: serializer.fromJson<int?>(json['dailyFlowId']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
      type: serializer.fromJson<String>(json['type']),
      contactCalled: serializer.fromJson<String?>(json['contactCalled']),
      smsSent: serializer.fromJson<bool>(json['smsSent']),
      result: serializer.fromJson<String?>(json['result']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<int?>(userId),
      'dailyFlowId': serializer.toJson<int?>(dailyFlowId),
      'timestamp': serializer.toJson<DateTime>(timestamp),
      'type': serializer.toJson<String>(type),
      'contactCalled': serializer.toJson<String?>(contactCalled),
      'smsSent': serializer.toJson<bool>(smsSent),
      'result': serializer.toJson<String?>(result),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  EmergencyEvent copyWith({
    int? id,
    Value<int?> userId = const Value.absent(),
    Value<int?> dailyFlowId = const Value.absent(),
    DateTime? timestamp,
    String? type,
    Value<String?> contactCalled = const Value.absent(),
    bool? smsSent,
    Value<String?> result = const Value.absent(),
    DateTime? createdAt,
  }) => EmergencyEvent(
    id: id ?? this.id,
    userId: userId.present ? userId.value : this.userId,
    dailyFlowId: dailyFlowId.present ? dailyFlowId.value : this.dailyFlowId,
    timestamp: timestamp ?? this.timestamp,
    type: type ?? this.type,
    contactCalled:
        contactCalled.present ? contactCalled.value : this.contactCalled,
    smsSent: smsSent ?? this.smsSent,
    result: result.present ? result.value : this.result,
    createdAt: createdAt ?? this.createdAt,
  );
  EmergencyEvent copyWithCompanion(EmergencyEventsCompanion data) {
    return EmergencyEvent(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      dailyFlowId:
          data.dailyFlowId.present ? data.dailyFlowId.value : this.dailyFlowId,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
      type: data.type.present ? data.type.value : this.type,
      contactCalled:
          data.contactCalled.present
              ? data.contactCalled.value
              : this.contactCalled,
      smsSent: data.smsSent.present ? data.smsSent.value : this.smsSent,
      result: data.result.present ? data.result.value : this.result,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EmergencyEvent(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('dailyFlowId: $dailyFlowId, ')
          ..write('timestamp: $timestamp, ')
          ..write('type: $type, ')
          ..write('contactCalled: $contactCalled, ')
          ..write('smsSent: $smsSent, ')
          ..write('result: $result, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    dailyFlowId,
    timestamp,
    type,
    contactCalled,
    smsSent,
    result,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EmergencyEvent &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.dailyFlowId == this.dailyFlowId &&
          other.timestamp == this.timestamp &&
          other.type == this.type &&
          other.contactCalled == this.contactCalled &&
          other.smsSent == this.smsSent &&
          other.result == this.result &&
          other.createdAt == this.createdAt);
}

class EmergencyEventsCompanion extends UpdateCompanion<EmergencyEvent> {
  final Value<int> id;
  final Value<int?> userId;
  final Value<int?> dailyFlowId;
  final Value<DateTime> timestamp;
  final Value<String> type;
  final Value<String?> contactCalled;
  final Value<bool> smsSent;
  final Value<String?> result;
  final Value<DateTime> createdAt;
  const EmergencyEventsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.dailyFlowId = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.type = const Value.absent(),
    this.contactCalled = const Value.absent(),
    this.smsSent = const Value.absent(),
    this.result = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  EmergencyEventsCompanion.insert({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.dailyFlowId = const Value.absent(),
    required DateTime timestamp,
    required String type,
    this.contactCalled = const Value.absent(),
    this.smsSent = const Value.absent(),
    this.result = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : timestamp = Value(timestamp),
       type = Value(type);
  static Insertable<EmergencyEvent> custom({
    Expression<int>? id,
    Expression<int>? userId,
    Expression<int>? dailyFlowId,
    Expression<DateTime>? timestamp,
    Expression<String>? type,
    Expression<String>? contactCalled,
    Expression<bool>? smsSent,
    Expression<String>? result,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (dailyFlowId != null) 'daily_flow_id': dailyFlowId,
      if (timestamp != null) 'timestamp': timestamp,
      if (type != null) 'type': type,
      if (contactCalled != null) 'contact_called': contactCalled,
      if (smsSent != null) 'sms_sent': smsSent,
      if (result != null) 'result': result,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  EmergencyEventsCompanion copyWith({
    Value<int>? id,
    Value<int?>? userId,
    Value<int?>? dailyFlowId,
    Value<DateTime>? timestamp,
    Value<String>? type,
    Value<String?>? contactCalled,
    Value<bool>? smsSent,
    Value<String?>? result,
    Value<DateTime>? createdAt,
  }) {
    return EmergencyEventsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      dailyFlowId: dailyFlowId ?? this.dailyFlowId,
      timestamp: timestamp ?? this.timestamp,
      type: type ?? this.type,
      contactCalled: contactCalled ?? this.contactCalled,
      smsSent: smsSent ?? this.smsSent,
      result: result ?? this.result,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (dailyFlowId.present) {
      map['daily_flow_id'] = Variable<int>(dailyFlowId.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (contactCalled.present) {
      map['contact_called'] = Variable<String>(contactCalled.value);
    }
    if (smsSent.present) {
      map['sms_sent'] = Variable<bool>(smsSent.value);
    }
    if (result.present) {
      map['result'] = Variable<String>(result.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EmergencyEventsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('dailyFlowId: $dailyFlowId, ')
          ..write('timestamp: $timestamp, ')
          ..write('type: $type, ')
          ..write('contactCalled: $contactCalled, ')
          ..write('smsSent: $smsSent, ')
          ..write('result: $result, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $ExerciseVideoResourcesTable extends ExerciseVideoResources
    with TableInfo<$ExerciseVideoResourcesTable, ExerciseVideoResource> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExerciseVideoResourcesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _videoIdMeta = const VerificationMeta(
    'videoId',
  );
  @override
  late final GeneratedColumn<String> videoId = GeneratedColumn<String>(
    'video_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _assetPathMeta = const VerificationMeta(
    'assetPath',
  );
  @override
  late final GeneratedColumn<String> assetPath = GeneratedColumn<String>(
    'asset_path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _estimatedDurationSecondsMeta =
      const VerificationMeta('estimatedDurationSeconds');
  @override
  late final GeneratedColumn<int> estimatedDurationSeconds =
      GeneratedColumn<int>(
        'estimated_duration_seconds',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _shortDescriptionMeta = const VerificationMeta(
    'shortDescription',
  );
  @override
  late final GeneratedColumn<String> shortDescription = GeneratedColumn<String>(
    'short_description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _tagsMeta = const VerificationMeta('tags');
  @override
  late final GeneratedColumn<String> tags = GeneratedColumn<String>(
    'tags',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _isAvailableMeta = const VerificationMeta(
    'isAvailable',
  );
  @override
  late final GeneratedColumn<bool> isAvailable = GeneratedColumn<bool>(
    'is_available',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_available" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    videoId,
    title,
    category,
    assetPath,
    estimatedDurationSeconds,
    shortDescription,
    tags,
    isAvailable,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'exercise_video_resources';
  @override
  VerificationContext validateIntegrity(
    Insertable<ExerciseVideoResource> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('video_id')) {
      context.handle(
        _videoIdMeta,
        videoId.isAcceptableOrUnknown(data['video_id']!, _videoIdMeta),
      );
    } else if (isInserting) {
      context.missing(_videoIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('asset_path')) {
      context.handle(
        _assetPathMeta,
        assetPath.isAcceptableOrUnknown(data['asset_path']!, _assetPathMeta),
      );
    } else if (isInserting) {
      context.missing(_assetPathMeta);
    }
    if (data.containsKey('estimated_duration_seconds')) {
      context.handle(
        _estimatedDurationSecondsMeta,
        estimatedDurationSeconds.isAcceptableOrUnknown(
          data['estimated_duration_seconds']!,
          _estimatedDurationSecondsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_estimatedDurationSecondsMeta);
    }
    if (data.containsKey('short_description')) {
      context.handle(
        _shortDescriptionMeta,
        shortDescription.isAcceptableOrUnknown(
          data['short_description']!,
          _shortDescriptionMeta,
        ),
      );
    }
    if (data.containsKey('tags')) {
      context.handle(
        _tagsMeta,
        tags.isAcceptableOrUnknown(data['tags']!, _tagsMeta),
      );
    }
    if (data.containsKey('is_available')) {
      context.handle(
        _isAvailableMeta,
        isAvailable.isAcceptableOrUnknown(
          data['is_available']!,
          _isAvailableMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ExerciseVideoResource map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ExerciseVideoResource(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      videoId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}video_id'],
          )!,
      title:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}title'],
          )!,
      category:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}category'],
          )!,
      assetPath:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}asset_path'],
          )!,
      estimatedDurationSeconds:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}estimated_duration_seconds'],
          )!,
      shortDescription:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}short_description'],
          )!,
      tags:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}tags'],
          )!,
      isAvailable:
          attachedDatabase.typeMapping.read(
            DriftSqlType.bool,
            data['${effectivePrefix}is_available'],
          )!,
    );
  }

  @override
  $ExerciseVideoResourcesTable createAlias(String alias) {
    return $ExerciseVideoResourcesTable(attachedDatabase, alias);
  }
}

class ExerciseVideoResource extends DataClass
    implements Insertable<ExerciseVideoResource> {
  final int id;
  final String videoId;
  final String title;
  final String category;
  final String assetPath;
  final int estimatedDurationSeconds;
  final String shortDescription;
  final String tags;
  final bool isAvailable;
  const ExerciseVideoResource({
    required this.id,
    required this.videoId,
    required this.title,
    required this.category,
    required this.assetPath,
    required this.estimatedDurationSeconds,
    required this.shortDescription,
    required this.tags,
    required this.isAvailable,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['video_id'] = Variable<String>(videoId);
    map['title'] = Variable<String>(title);
    map['category'] = Variable<String>(category);
    map['asset_path'] = Variable<String>(assetPath);
    map['estimated_duration_seconds'] = Variable<int>(estimatedDurationSeconds);
    map['short_description'] = Variable<String>(shortDescription);
    map['tags'] = Variable<String>(tags);
    map['is_available'] = Variable<bool>(isAvailable);
    return map;
  }

  ExerciseVideoResourcesCompanion toCompanion(bool nullToAbsent) {
    return ExerciseVideoResourcesCompanion(
      id: Value(id),
      videoId: Value(videoId),
      title: Value(title),
      category: Value(category),
      assetPath: Value(assetPath),
      estimatedDurationSeconds: Value(estimatedDurationSeconds),
      shortDescription: Value(shortDescription),
      tags: Value(tags),
      isAvailable: Value(isAvailable),
    );
  }

  factory ExerciseVideoResource.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExerciseVideoResource(
      id: serializer.fromJson<int>(json['id']),
      videoId: serializer.fromJson<String>(json['videoId']),
      title: serializer.fromJson<String>(json['title']),
      category: serializer.fromJson<String>(json['category']),
      assetPath: serializer.fromJson<String>(json['assetPath']),
      estimatedDurationSeconds: serializer.fromJson<int>(
        json['estimatedDurationSeconds'],
      ),
      shortDescription: serializer.fromJson<String>(json['shortDescription']),
      tags: serializer.fromJson<String>(json['tags']),
      isAvailable: serializer.fromJson<bool>(json['isAvailable']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'videoId': serializer.toJson<String>(videoId),
      'title': serializer.toJson<String>(title),
      'category': serializer.toJson<String>(category),
      'assetPath': serializer.toJson<String>(assetPath),
      'estimatedDurationSeconds': serializer.toJson<int>(
        estimatedDurationSeconds,
      ),
      'shortDescription': serializer.toJson<String>(shortDescription),
      'tags': serializer.toJson<String>(tags),
      'isAvailable': serializer.toJson<bool>(isAvailable),
    };
  }

  ExerciseVideoResource copyWith({
    int? id,
    String? videoId,
    String? title,
    String? category,
    String? assetPath,
    int? estimatedDurationSeconds,
    String? shortDescription,
    String? tags,
    bool? isAvailable,
  }) => ExerciseVideoResource(
    id: id ?? this.id,
    videoId: videoId ?? this.videoId,
    title: title ?? this.title,
    category: category ?? this.category,
    assetPath: assetPath ?? this.assetPath,
    estimatedDurationSeconds:
        estimatedDurationSeconds ?? this.estimatedDurationSeconds,
    shortDescription: shortDescription ?? this.shortDescription,
    tags: tags ?? this.tags,
    isAvailable: isAvailable ?? this.isAvailable,
  );
  ExerciseVideoResource copyWithCompanion(
    ExerciseVideoResourcesCompanion data,
  ) {
    return ExerciseVideoResource(
      id: data.id.present ? data.id.value : this.id,
      videoId: data.videoId.present ? data.videoId.value : this.videoId,
      title: data.title.present ? data.title.value : this.title,
      category: data.category.present ? data.category.value : this.category,
      assetPath: data.assetPath.present ? data.assetPath.value : this.assetPath,
      estimatedDurationSeconds:
          data.estimatedDurationSeconds.present
              ? data.estimatedDurationSeconds.value
              : this.estimatedDurationSeconds,
      shortDescription:
          data.shortDescription.present
              ? data.shortDescription.value
              : this.shortDescription,
      tags: data.tags.present ? data.tags.value : this.tags,
      isAvailable:
          data.isAvailable.present ? data.isAvailable.value : this.isAvailable,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ExerciseVideoResource(')
          ..write('id: $id, ')
          ..write('videoId: $videoId, ')
          ..write('title: $title, ')
          ..write('category: $category, ')
          ..write('assetPath: $assetPath, ')
          ..write('estimatedDurationSeconds: $estimatedDurationSeconds, ')
          ..write('shortDescription: $shortDescription, ')
          ..write('tags: $tags, ')
          ..write('isAvailable: $isAvailable')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    videoId,
    title,
    category,
    assetPath,
    estimatedDurationSeconds,
    shortDescription,
    tags,
    isAvailable,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExerciseVideoResource &&
          other.id == this.id &&
          other.videoId == this.videoId &&
          other.title == this.title &&
          other.category == this.category &&
          other.assetPath == this.assetPath &&
          other.estimatedDurationSeconds == this.estimatedDurationSeconds &&
          other.shortDescription == this.shortDescription &&
          other.tags == this.tags &&
          other.isAvailable == this.isAvailable);
}

class ExerciseVideoResourcesCompanion
    extends UpdateCompanion<ExerciseVideoResource> {
  final Value<int> id;
  final Value<String> videoId;
  final Value<String> title;
  final Value<String> category;
  final Value<String> assetPath;
  final Value<int> estimatedDurationSeconds;
  final Value<String> shortDescription;
  final Value<String> tags;
  final Value<bool> isAvailable;
  const ExerciseVideoResourcesCompanion({
    this.id = const Value.absent(),
    this.videoId = const Value.absent(),
    this.title = const Value.absent(),
    this.category = const Value.absent(),
    this.assetPath = const Value.absent(),
    this.estimatedDurationSeconds = const Value.absent(),
    this.shortDescription = const Value.absent(),
    this.tags = const Value.absent(),
    this.isAvailable = const Value.absent(),
  });
  ExerciseVideoResourcesCompanion.insert({
    this.id = const Value.absent(),
    required String videoId,
    required String title,
    required String category,
    required String assetPath,
    required int estimatedDurationSeconds,
    this.shortDescription = const Value.absent(),
    this.tags = const Value.absent(),
    this.isAvailable = const Value.absent(),
  }) : videoId = Value(videoId),
       title = Value(title),
       category = Value(category),
       assetPath = Value(assetPath),
       estimatedDurationSeconds = Value(estimatedDurationSeconds);
  static Insertable<ExerciseVideoResource> custom({
    Expression<int>? id,
    Expression<String>? videoId,
    Expression<String>? title,
    Expression<String>? category,
    Expression<String>? assetPath,
    Expression<int>? estimatedDurationSeconds,
    Expression<String>? shortDescription,
    Expression<String>? tags,
    Expression<bool>? isAvailable,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (videoId != null) 'video_id': videoId,
      if (title != null) 'title': title,
      if (category != null) 'category': category,
      if (assetPath != null) 'asset_path': assetPath,
      if (estimatedDurationSeconds != null)
        'estimated_duration_seconds': estimatedDurationSeconds,
      if (shortDescription != null) 'short_description': shortDescription,
      if (tags != null) 'tags': tags,
      if (isAvailable != null) 'is_available': isAvailable,
    });
  }

  ExerciseVideoResourcesCompanion copyWith({
    Value<int>? id,
    Value<String>? videoId,
    Value<String>? title,
    Value<String>? category,
    Value<String>? assetPath,
    Value<int>? estimatedDurationSeconds,
    Value<String>? shortDescription,
    Value<String>? tags,
    Value<bool>? isAvailable,
  }) {
    return ExerciseVideoResourcesCompanion(
      id: id ?? this.id,
      videoId: videoId ?? this.videoId,
      title: title ?? this.title,
      category: category ?? this.category,
      assetPath: assetPath ?? this.assetPath,
      estimatedDurationSeconds:
          estimatedDurationSeconds ?? this.estimatedDurationSeconds,
      shortDescription: shortDescription ?? this.shortDescription,
      tags: tags ?? this.tags,
      isAvailable: isAvailable ?? this.isAvailable,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (videoId.present) {
      map['video_id'] = Variable<String>(videoId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (assetPath.present) {
      map['asset_path'] = Variable<String>(assetPath.value);
    }
    if (estimatedDurationSeconds.present) {
      map['estimated_duration_seconds'] = Variable<int>(
        estimatedDurationSeconds.value,
      );
    }
    if (shortDescription.present) {
      map['short_description'] = Variable<String>(shortDescription.value);
    }
    if (tags.present) {
      map['tags'] = Variable<String>(tags.value);
    }
    if (isAvailable.present) {
      map['is_available'] = Variable<bool>(isAvailable.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExerciseVideoResourcesCompanion(')
          ..write('id: $id, ')
          ..write('videoId: $videoId, ')
          ..write('title: $title, ')
          ..write('category: $category, ')
          ..write('assetPath: $assetPath, ')
          ..write('estimatedDurationSeconds: $estimatedDurationSeconds, ')
          ..write('shortDescription: $shortDescription, ')
          ..write('tags: $tags, ')
          ..write('isAvailable: $isAvailable')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UserProfilesTable userProfiles = $UserProfilesTable(this);
  late final $EmergencyContactsTable emergencyContacts =
      $EmergencyContactsTable(this);
  late final $DailyFlowsTable dailyFlows = $DailyFlowsTable(this);
  late final $ChecklistItemsTable checklistItems = $ChecklistItemsTable(this);
  late final $RoutineBlocksTable routineBlocks = $RoutineBlocksTable(this);
  late final $RoutineTasksTable routineTasks = $RoutineTasksTable(this);
  late final $ExerciseFeedbacksTable exerciseFeedbacks =
      $ExerciseFeedbacksTable(this);
  late final $SymptomChecksTable symptomChecks = $SymptomChecksTable(this);
  late final $BreathlessnessEpisodesTable breathlessnessEpisodes =
      $BreathlessnessEpisodesTable(this);
  late final $RescueInhalerUsesTable rescueInhalerUses =
      $RescueInhalerUsesTable(this);
  late final $FunctionalTestsTable functionalTests = $FunctionalTestsTable(
    this,
  );
  late final $ActivityLogsTable activityLogs = $ActivityLogsTable(this);
  late final $EmergencyEventsTable emergencyEvents = $EmergencyEventsTable(
    this,
  );
  late final $ExerciseVideoResourcesTable exerciseVideoResources =
      $ExerciseVideoResourcesTable(this);
  late final UserDao userDao = UserDao(this as AppDatabase);
  late final DailyFlowDao dailyFlowDao = DailyFlowDao(this as AppDatabase);
  late final ExerciseDao exerciseDao = ExerciseDao(this as AppDatabase);
  late final SymptomDao symptomDao = SymptomDao(this as AppDatabase);
  late final InhalerDao inhalerDao = InhalerDao(this as AppDatabase);
  late final ReportDao reportDao = ReportDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    userProfiles,
    emergencyContacts,
    dailyFlows,
    checklistItems,
    routineBlocks,
    routineTasks,
    exerciseFeedbacks,
    symptomChecks,
    breathlessnessEpisodes,
    rescueInhalerUses,
    functionalTests,
    activityLogs,
    emergencyEvents,
    exerciseVideoResources,
  ];
}

typedef $$UserProfilesTableCreateCompanionBuilder =
    UserProfilesCompanion Function({
      Value<int> id,
      required String name,
      Value<DateTime?> birthDate,
      Value<String?> sex,
      Value<double?> height,
      Value<double?> weight,
      Value<String> diagnosis,
      Value<String?> copdStage,
      Value<double?> fev1,
      Value<bool> usesOxygen,
      Value<bool> usesPulseOximeter,
      Value<String?> regularMedication,
      Value<String?> rescueInhaler,
      Value<int?> rescueUsageFrequency,
      Value<bool> wakesUpBreathless,
      Value<bool> snores,
      Value<bool> hasAnxiety,
      Value<String?> physicalActivityLevel,
      Value<bool> canWalkFlat,
      Value<bool> canClimbStairs,
      Value<bool> makesFrequentPauses,
      Value<int> preferredStartHour,
      Value<int> sleepHour,
      Value<String> language,
      Value<String> techLevel,
      Value<String?> city,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });
typedef $$UserProfilesTableUpdateCompanionBuilder =
    UserProfilesCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<DateTime?> birthDate,
      Value<String?> sex,
      Value<double?> height,
      Value<double?> weight,
      Value<String> diagnosis,
      Value<String?> copdStage,
      Value<double?> fev1,
      Value<bool> usesOxygen,
      Value<bool> usesPulseOximeter,
      Value<String?> regularMedication,
      Value<String?> rescueInhaler,
      Value<int?> rescueUsageFrequency,
      Value<bool> wakesUpBreathless,
      Value<bool> snores,
      Value<bool> hasAnxiety,
      Value<String?> physicalActivityLevel,
      Value<bool> canWalkFlat,
      Value<bool> canClimbStairs,
      Value<bool> makesFrequentPauses,
      Value<int> preferredStartHour,
      Value<int> sleepHour,
      Value<String> language,
      Value<String> techLevel,
      Value<String?> city,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

class $$UserProfilesTableFilterComposer
    extends Composer<_$AppDatabase, $UserProfilesTable> {
  $$UserProfilesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get birthDate => $composableBuilder(
    column: $table.birthDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sex => $composableBuilder(
    column: $table.sex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get height => $composableBuilder(
    column: $table.height,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get weight => $composableBuilder(
    column: $table.weight,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get diagnosis => $composableBuilder(
    column: $table.diagnosis,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get copdStage => $composableBuilder(
    column: $table.copdStage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get fev1 => $composableBuilder(
    column: $table.fev1,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get usesOxygen => $composableBuilder(
    column: $table.usesOxygen,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get usesPulseOximeter => $composableBuilder(
    column: $table.usesPulseOximeter,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get regularMedication => $composableBuilder(
    column: $table.regularMedication,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get rescueInhaler => $composableBuilder(
    column: $table.rescueInhaler,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get rescueUsageFrequency => $composableBuilder(
    column: $table.rescueUsageFrequency,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get wakesUpBreathless => $composableBuilder(
    column: $table.wakesUpBreathless,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get snores => $composableBuilder(
    column: $table.snores,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get hasAnxiety => $composableBuilder(
    column: $table.hasAnxiety,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get physicalActivityLevel => $composableBuilder(
    column: $table.physicalActivityLevel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get canWalkFlat => $composableBuilder(
    column: $table.canWalkFlat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get canClimbStairs => $composableBuilder(
    column: $table.canClimbStairs,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get makesFrequentPauses => $composableBuilder(
    column: $table.makesFrequentPauses,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get preferredStartHour => $composableBuilder(
    column: $table.preferredStartHour,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sleepHour => $composableBuilder(
    column: $table.sleepHour,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get language => $composableBuilder(
    column: $table.language,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get techLevel => $composableBuilder(
    column: $table.techLevel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get city => $composableBuilder(
    column: $table.city,
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
}

class $$UserProfilesTableOrderingComposer
    extends Composer<_$AppDatabase, $UserProfilesTable> {
  $$UserProfilesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get birthDate => $composableBuilder(
    column: $table.birthDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sex => $composableBuilder(
    column: $table.sex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get height => $composableBuilder(
    column: $table.height,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get weight => $composableBuilder(
    column: $table.weight,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get diagnosis => $composableBuilder(
    column: $table.diagnosis,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get copdStage => $composableBuilder(
    column: $table.copdStage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get fev1 => $composableBuilder(
    column: $table.fev1,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get usesOxygen => $composableBuilder(
    column: $table.usesOxygen,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get usesPulseOximeter => $composableBuilder(
    column: $table.usesPulseOximeter,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get regularMedication => $composableBuilder(
    column: $table.regularMedication,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get rescueInhaler => $composableBuilder(
    column: $table.rescueInhaler,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get rescueUsageFrequency => $composableBuilder(
    column: $table.rescueUsageFrequency,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get wakesUpBreathless => $composableBuilder(
    column: $table.wakesUpBreathless,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get snores => $composableBuilder(
    column: $table.snores,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get hasAnxiety => $composableBuilder(
    column: $table.hasAnxiety,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get physicalActivityLevel => $composableBuilder(
    column: $table.physicalActivityLevel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get canWalkFlat => $composableBuilder(
    column: $table.canWalkFlat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get canClimbStairs => $composableBuilder(
    column: $table.canClimbStairs,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get makesFrequentPauses => $composableBuilder(
    column: $table.makesFrequentPauses,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get preferredStartHour => $composableBuilder(
    column: $table.preferredStartHour,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sleepHour => $composableBuilder(
    column: $table.sleepHour,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get language => $composableBuilder(
    column: $table.language,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get techLevel => $composableBuilder(
    column: $table.techLevel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get city => $composableBuilder(
    column: $table.city,
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
}

class $$UserProfilesTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserProfilesTable> {
  $$UserProfilesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<DateTime> get birthDate =>
      $composableBuilder(column: $table.birthDate, builder: (column) => column);

  GeneratedColumn<String> get sex =>
      $composableBuilder(column: $table.sex, builder: (column) => column);

  GeneratedColumn<double> get height =>
      $composableBuilder(column: $table.height, builder: (column) => column);

  GeneratedColumn<double> get weight =>
      $composableBuilder(column: $table.weight, builder: (column) => column);

  GeneratedColumn<String> get diagnosis =>
      $composableBuilder(column: $table.diagnosis, builder: (column) => column);

  GeneratedColumn<String> get copdStage =>
      $composableBuilder(column: $table.copdStage, builder: (column) => column);

  GeneratedColumn<double> get fev1 =>
      $composableBuilder(column: $table.fev1, builder: (column) => column);

  GeneratedColumn<bool> get usesOxygen => $composableBuilder(
    column: $table.usesOxygen,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get usesPulseOximeter => $composableBuilder(
    column: $table.usesPulseOximeter,
    builder: (column) => column,
  );

  GeneratedColumn<String> get regularMedication => $composableBuilder(
    column: $table.regularMedication,
    builder: (column) => column,
  );

  GeneratedColumn<String> get rescueInhaler => $composableBuilder(
    column: $table.rescueInhaler,
    builder: (column) => column,
  );

  GeneratedColumn<int> get rescueUsageFrequency => $composableBuilder(
    column: $table.rescueUsageFrequency,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get wakesUpBreathless => $composableBuilder(
    column: $table.wakesUpBreathless,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get snores =>
      $composableBuilder(column: $table.snores, builder: (column) => column);

  GeneratedColumn<bool> get hasAnxiety => $composableBuilder(
    column: $table.hasAnxiety,
    builder: (column) => column,
  );

  GeneratedColumn<String> get physicalActivityLevel => $composableBuilder(
    column: $table.physicalActivityLevel,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get canWalkFlat => $composableBuilder(
    column: $table.canWalkFlat,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get canClimbStairs => $composableBuilder(
    column: $table.canClimbStairs,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get makesFrequentPauses => $composableBuilder(
    column: $table.makesFrequentPauses,
    builder: (column) => column,
  );

  GeneratedColumn<int> get preferredStartHour => $composableBuilder(
    column: $table.preferredStartHour,
    builder: (column) => column,
  );

  GeneratedColumn<int> get sleepHour =>
      $composableBuilder(column: $table.sleepHour, builder: (column) => column);

  GeneratedColumn<String> get language =>
      $composableBuilder(column: $table.language, builder: (column) => column);

  GeneratedColumn<String> get techLevel =>
      $composableBuilder(column: $table.techLevel, builder: (column) => column);

  GeneratedColumn<String> get city =>
      $composableBuilder(column: $table.city, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$UserProfilesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UserProfilesTable,
          UserProfile,
          $$UserProfilesTableFilterComposer,
          $$UserProfilesTableOrderingComposer,
          $$UserProfilesTableAnnotationComposer,
          $$UserProfilesTableCreateCompanionBuilder,
          $$UserProfilesTableUpdateCompanionBuilder,
          (
            UserProfile,
            BaseReferences<_$AppDatabase, $UserProfilesTable, UserProfile>,
          ),
          UserProfile,
          PrefetchHooks Function()
        > {
  $$UserProfilesTableTableManager(_$AppDatabase db, $UserProfilesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$UserProfilesTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$UserProfilesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () =>
                  $$UserProfilesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<DateTime?> birthDate = const Value.absent(),
                Value<String?> sex = const Value.absent(),
                Value<double?> height = const Value.absent(),
                Value<double?> weight = const Value.absent(),
                Value<String> diagnosis = const Value.absent(),
                Value<String?> copdStage = const Value.absent(),
                Value<double?> fev1 = const Value.absent(),
                Value<bool> usesOxygen = const Value.absent(),
                Value<bool> usesPulseOximeter = const Value.absent(),
                Value<String?> regularMedication = const Value.absent(),
                Value<String?> rescueInhaler = const Value.absent(),
                Value<int?> rescueUsageFrequency = const Value.absent(),
                Value<bool> wakesUpBreathless = const Value.absent(),
                Value<bool> snores = const Value.absent(),
                Value<bool> hasAnxiety = const Value.absent(),
                Value<String?> physicalActivityLevel = const Value.absent(),
                Value<bool> canWalkFlat = const Value.absent(),
                Value<bool> canClimbStairs = const Value.absent(),
                Value<bool> makesFrequentPauses = const Value.absent(),
                Value<int> preferredStartHour = const Value.absent(),
                Value<int> sleepHour = const Value.absent(),
                Value<String> language = const Value.absent(),
                Value<String> techLevel = const Value.absent(),
                Value<String?> city = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => UserProfilesCompanion(
                id: id,
                name: name,
                birthDate: birthDate,
                sex: sex,
                height: height,
                weight: weight,
                diagnosis: diagnosis,
                copdStage: copdStage,
                fev1: fev1,
                usesOxygen: usesOxygen,
                usesPulseOximeter: usesPulseOximeter,
                regularMedication: regularMedication,
                rescueInhaler: rescueInhaler,
                rescueUsageFrequency: rescueUsageFrequency,
                wakesUpBreathless: wakesUpBreathless,
                snores: snores,
                hasAnxiety: hasAnxiety,
                physicalActivityLevel: physicalActivityLevel,
                canWalkFlat: canWalkFlat,
                canClimbStairs: canClimbStairs,
                makesFrequentPauses: makesFrequentPauses,
                preferredStartHour: preferredStartHour,
                sleepHour: sleepHour,
                language: language,
                techLevel: techLevel,
                city: city,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<DateTime?> birthDate = const Value.absent(),
                Value<String?> sex = const Value.absent(),
                Value<double?> height = const Value.absent(),
                Value<double?> weight = const Value.absent(),
                Value<String> diagnosis = const Value.absent(),
                Value<String?> copdStage = const Value.absent(),
                Value<double?> fev1 = const Value.absent(),
                Value<bool> usesOxygen = const Value.absent(),
                Value<bool> usesPulseOximeter = const Value.absent(),
                Value<String?> regularMedication = const Value.absent(),
                Value<String?> rescueInhaler = const Value.absent(),
                Value<int?> rescueUsageFrequency = const Value.absent(),
                Value<bool> wakesUpBreathless = const Value.absent(),
                Value<bool> snores = const Value.absent(),
                Value<bool> hasAnxiety = const Value.absent(),
                Value<String?> physicalActivityLevel = const Value.absent(),
                Value<bool> canWalkFlat = const Value.absent(),
                Value<bool> canClimbStairs = const Value.absent(),
                Value<bool> makesFrequentPauses = const Value.absent(),
                Value<int> preferredStartHour = const Value.absent(),
                Value<int> sleepHour = const Value.absent(),
                Value<String> language = const Value.absent(),
                Value<String> techLevel = const Value.absent(),
                Value<String?> city = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => UserProfilesCompanion.insert(
                id: id,
                name: name,
                birthDate: birthDate,
                sex: sex,
                height: height,
                weight: weight,
                diagnosis: diagnosis,
                copdStage: copdStage,
                fev1: fev1,
                usesOxygen: usesOxygen,
                usesPulseOximeter: usesPulseOximeter,
                regularMedication: regularMedication,
                rescueInhaler: rescueInhaler,
                rescueUsageFrequency: rescueUsageFrequency,
                wakesUpBreathless: wakesUpBreathless,
                snores: snores,
                hasAnxiety: hasAnxiety,
                physicalActivityLevel: physicalActivityLevel,
                canWalkFlat: canWalkFlat,
                canClimbStairs: canClimbStairs,
                makesFrequentPauses: makesFrequentPauses,
                preferredStartHour: preferredStartHour,
                sleepHour: sleepHour,
                language: language,
                techLevel: techLevel,
                city: city,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$UserProfilesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UserProfilesTable,
      UserProfile,
      $$UserProfilesTableFilterComposer,
      $$UserProfilesTableOrderingComposer,
      $$UserProfilesTableAnnotationComposer,
      $$UserProfilesTableCreateCompanionBuilder,
      $$UserProfilesTableUpdateCompanionBuilder,
      (
        UserProfile,
        BaseReferences<_$AppDatabase, $UserProfilesTable, UserProfile>,
      ),
      UserProfile,
      PrefetchHooks Function()
    >;
typedef $$EmergencyContactsTableCreateCompanionBuilder =
    EmergencyContactsCompanion Function({
      Value<int> id,
      required int userId,
      required String name,
      required String relationship,
      required String phone,
      Value<int> priority,
      Value<bool> receivesSms,
      Value<bool> receivesEmail,
      Value<String?> email,
      Value<DateTime> createdAt,
    });
typedef $$EmergencyContactsTableUpdateCompanionBuilder =
    EmergencyContactsCompanion Function({
      Value<int> id,
      Value<int> userId,
      Value<String> name,
      Value<String> relationship,
      Value<String> phone,
      Value<int> priority,
      Value<bool> receivesSms,
      Value<bool> receivesEmail,
      Value<String?> email,
      Value<DateTime> createdAt,
    });

class $$EmergencyContactsTableFilterComposer
    extends Composer<_$AppDatabase, $EmergencyContactsTable> {
  $$EmergencyContactsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get relationship => $composableBuilder(
    column: $table.relationship,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get priority => $composableBuilder(
    column: $table.priority,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get receivesSms => $composableBuilder(
    column: $table.receivesSms,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get receivesEmail => $composableBuilder(
    column: $table.receivesEmail,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$EmergencyContactsTableOrderingComposer
    extends Composer<_$AppDatabase, $EmergencyContactsTable> {
  $$EmergencyContactsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get relationship => $composableBuilder(
    column: $table.relationship,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get priority => $composableBuilder(
    column: $table.priority,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get receivesSms => $composableBuilder(
    column: $table.receivesSms,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get receivesEmail => $composableBuilder(
    column: $table.receivesEmail,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$EmergencyContactsTableAnnotationComposer
    extends Composer<_$AppDatabase, $EmergencyContactsTable> {
  $$EmergencyContactsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get relationship => $composableBuilder(
    column: $table.relationship,
    builder: (column) => column,
  );

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<int> get priority =>
      $composableBuilder(column: $table.priority, builder: (column) => column);

  GeneratedColumn<bool> get receivesSms => $composableBuilder(
    column: $table.receivesSms,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get receivesEmail => $composableBuilder(
    column: $table.receivesEmail,
    builder: (column) => column,
  );

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$EmergencyContactsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $EmergencyContactsTable,
          EmergencyContact,
          $$EmergencyContactsTableFilterComposer,
          $$EmergencyContactsTableOrderingComposer,
          $$EmergencyContactsTableAnnotationComposer,
          $$EmergencyContactsTableCreateCompanionBuilder,
          $$EmergencyContactsTableUpdateCompanionBuilder,
          (
            EmergencyContact,
            BaseReferences<
              _$AppDatabase,
              $EmergencyContactsTable,
              EmergencyContact
            >,
          ),
          EmergencyContact,
          PrefetchHooks Function()
        > {
  $$EmergencyContactsTableTableManager(
    _$AppDatabase db,
    $EmergencyContactsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$EmergencyContactsTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer:
              () => $$EmergencyContactsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => $$EmergencyContactsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> userId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> relationship = const Value.absent(),
                Value<String> phone = const Value.absent(),
                Value<int> priority = const Value.absent(),
                Value<bool> receivesSms = const Value.absent(),
                Value<bool> receivesEmail = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => EmergencyContactsCompanion(
                id: id,
                userId: userId,
                name: name,
                relationship: relationship,
                phone: phone,
                priority: priority,
                receivesSms: receivesSms,
                receivesEmail: receivesEmail,
                email: email,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int userId,
                required String name,
                required String relationship,
                required String phone,
                Value<int> priority = const Value.absent(),
                Value<bool> receivesSms = const Value.absent(),
                Value<bool> receivesEmail = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => EmergencyContactsCompanion.insert(
                id: id,
                userId: userId,
                name: name,
                relationship: relationship,
                phone: phone,
                priority: priority,
                receivesSms: receivesSms,
                receivesEmail: receivesEmail,
                email: email,
                createdAt: createdAt,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$EmergencyContactsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $EmergencyContactsTable,
      EmergencyContact,
      $$EmergencyContactsTableFilterComposer,
      $$EmergencyContactsTableOrderingComposer,
      $$EmergencyContactsTableAnnotationComposer,
      $$EmergencyContactsTableCreateCompanionBuilder,
      $$EmergencyContactsTableUpdateCompanionBuilder,
      (
        EmergencyContact,
        BaseReferences<
          _$AppDatabase,
          $EmergencyContactsTable,
          EmergencyContact
        >,
      ),
      EmergencyContact,
      PrefetchHooks Function()
    >;
typedef $$DailyFlowsTableCreateCompanionBuilder =
    DailyFlowsCompanion Function({
      Value<int> id,
      required DateTime flowDate,
      Value<String> status,
      Value<String?> dayClassification,
      Value<double?> morningScore,
      Value<double?> respiratoryStabilityScore,
      Value<String?> eveningNotes,
      Value<bool> checklistCompleted,
      Value<bool> morningQuestionnaireCompleted,
      Value<bool> eveningQuestionnaireCompleted,
      Value<bool?> medicationTaken,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> archivedAt,
    });
typedef $$DailyFlowsTableUpdateCompanionBuilder =
    DailyFlowsCompanion Function({
      Value<int> id,
      Value<DateTime> flowDate,
      Value<String> status,
      Value<String?> dayClassification,
      Value<double?> morningScore,
      Value<double?> respiratoryStabilityScore,
      Value<String?> eveningNotes,
      Value<bool> checklistCompleted,
      Value<bool> morningQuestionnaireCompleted,
      Value<bool> eveningQuestionnaireCompleted,
      Value<bool?> medicationTaken,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> archivedAt,
    });

class $$DailyFlowsTableFilterComposer
    extends Composer<_$AppDatabase, $DailyFlowsTable> {
  $$DailyFlowsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get flowDate => $composableBuilder(
    column: $table.flowDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get dayClassification => $composableBuilder(
    column: $table.dayClassification,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get morningScore => $composableBuilder(
    column: $table.morningScore,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get respiratoryStabilityScore => $composableBuilder(
    column: $table.respiratoryStabilityScore,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get eveningNotes => $composableBuilder(
    column: $table.eveningNotes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get checklistCompleted => $composableBuilder(
    column: $table.checklistCompleted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get morningQuestionnaireCompleted => $composableBuilder(
    column: $table.morningQuestionnaireCompleted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get eveningQuestionnaireCompleted => $composableBuilder(
    column: $table.eveningQuestionnaireCompleted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get medicationTaken => $composableBuilder(
    column: $table.medicationTaken,
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

  ColumnFilters<DateTime> get archivedAt => $composableBuilder(
    column: $table.archivedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$DailyFlowsTableOrderingComposer
    extends Composer<_$AppDatabase, $DailyFlowsTable> {
  $$DailyFlowsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get flowDate => $composableBuilder(
    column: $table.flowDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dayClassification => $composableBuilder(
    column: $table.dayClassification,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get morningScore => $composableBuilder(
    column: $table.morningScore,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get respiratoryStabilityScore => $composableBuilder(
    column: $table.respiratoryStabilityScore,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get eveningNotes => $composableBuilder(
    column: $table.eveningNotes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get checklistCompleted => $composableBuilder(
    column: $table.checklistCompleted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get morningQuestionnaireCompleted => $composableBuilder(
    column: $table.morningQuestionnaireCompleted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get eveningQuestionnaireCompleted => $composableBuilder(
    column: $table.eveningQuestionnaireCompleted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get medicationTaken => $composableBuilder(
    column: $table.medicationTaken,
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

  ColumnOrderings<DateTime> get archivedAt => $composableBuilder(
    column: $table.archivedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DailyFlowsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DailyFlowsTable> {
  $$DailyFlowsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get flowDate =>
      $composableBuilder(column: $table.flowDate, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get dayClassification => $composableBuilder(
    column: $table.dayClassification,
    builder: (column) => column,
  );

  GeneratedColumn<double> get morningScore => $composableBuilder(
    column: $table.morningScore,
    builder: (column) => column,
  );

  GeneratedColumn<double> get respiratoryStabilityScore => $composableBuilder(
    column: $table.respiratoryStabilityScore,
    builder: (column) => column,
  );

  GeneratedColumn<String> get eveningNotes => $composableBuilder(
    column: $table.eveningNotes,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get checklistCompleted => $composableBuilder(
    column: $table.checklistCompleted,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get morningQuestionnaireCompleted => $composableBuilder(
    column: $table.morningQuestionnaireCompleted,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get eveningQuestionnaireCompleted => $composableBuilder(
    column: $table.eveningQuestionnaireCompleted,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get medicationTaken => $composableBuilder(
    column: $table.medicationTaken,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get archivedAt => $composableBuilder(
    column: $table.archivedAt,
    builder: (column) => column,
  );
}

class $$DailyFlowsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DailyFlowsTable,
          DailyFlow,
          $$DailyFlowsTableFilterComposer,
          $$DailyFlowsTableOrderingComposer,
          $$DailyFlowsTableAnnotationComposer,
          $$DailyFlowsTableCreateCompanionBuilder,
          $$DailyFlowsTableUpdateCompanionBuilder,
          (
            DailyFlow,
            BaseReferences<_$AppDatabase, $DailyFlowsTable, DailyFlow>,
          ),
          DailyFlow,
          PrefetchHooks Function()
        > {
  $$DailyFlowsTableTableManager(_$AppDatabase db, $DailyFlowsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$DailyFlowsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$DailyFlowsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$DailyFlowsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime> flowDate = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String?> dayClassification = const Value.absent(),
                Value<double?> morningScore = const Value.absent(),
                Value<double?> respiratoryStabilityScore = const Value.absent(),
                Value<String?> eveningNotes = const Value.absent(),
                Value<bool> checklistCompleted = const Value.absent(),
                Value<bool> morningQuestionnaireCompleted =
                    const Value.absent(),
                Value<bool> eveningQuestionnaireCompleted =
                    const Value.absent(),
                Value<bool?> medicationTaken = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> archivedAt = const Value.absent(),
              }) => DailyFlowsCompanion(
                id: id,
                flowDate: flowDate,
                status: status,
                dayClassification: dayClassification,
                morningScore: morningScore,
                respiratoryStabilityScore: respiratoryStabilityScore,
                eveningNotes: eveningNotes,
                checklistCompleted: checklistCompleted,
                morningQuestionnaireCompleted: morningQuestionnaireCompleted,
                eveningQuestionnaireCompleted: eveningQuestionnaireCompleted,
                medicationTaken: medicationTaken,
                createdAt: createdAt,
                updatedAt: updatedAt,
                archivedAt: archivedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required DateTime flowDate,
                Value<String> status = const Value.absent(),
                Value<String?> dayClassification = const Value.absent(),
                Value<double?> morningScore = const Value.absent(),
                Value<double?> respiratoryStabilityScore = const Value.absent(),
                Value<String?> eveningNotes = const Value.absent(),
                Value<bool> checklistCompleted = const Value.absent(),
                Value<bool> morningQuestionnaireCompleted =
                    const Value.absent(),
                Value<bool> eveningQuestionnaireCompleted =
                    const Value.absent(),
                Value<bool?> medicationTaken = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> archivedAt = const Value.absent(),
              }) => DailyFlowsCompanion.insert(
                id: id,
                flowDate: flowDate,
                status: status,
                dayClassification: dayClassification,
                morningScore: morningScore,
                respiratoryStabilityScore: respiratoryStabilityScore,
                eveningNotes: eveningNotes,
                checklistCompleted: checklistCompleted,
                morningQuestionnaireCompleted: morningQuestionnaireCompleted,
                eveningQuestionnaireCompleted: eveningQuestionnaireCompleted,
                medicationTaken: medicationTaken,
                createdAt: createdAt,
                updatedAt: updatedAt,
                archivedAt: archivedAt,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$DailyFlowsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DailyFlowsTable,
      DailyFlow,
      $$DailyFlowsTableFilterComposer,
      $$DailyFlowsTableOrderingComposer,
      $$DailyFlowsTableAnnotationComposer,
      $$DailyFlowsTableCreateCompanionBuilder,
      $$DailyFlowsTableUpdateCompanionBuilder,
      (DailyFlow, BaseReferences<_$AppDatabase, $DailyFlowsTable, DailyFlow>),
      DailyFlow,
      PrefetchHooks Function()
    >;
typedef $$ChecklistItemsTableCreateCompanionBuilder =
    ChecklistItemsCompanion Function({
      Value<int> id,
      required int dailyFlowId,
      required String type,
      required String name,
      Value<bool> isRequired,
      Value<bool> completed,
      Value<DateTime?> completedAt,
    });
typedef $$ChecklistItemsTableUpdateCompanionBuilder =
    ChecklistItemsCompanion Function({
      Value<int> id,
      Value<int> dailyFlowId,
      Value<String> type,
      Value<String> name,
      Value<bool> isRequired,
      Value<bool> completed,
      Value<DateTime?> completedAt,
    });

class $$ChecklistItemsTableFilterComposer
    extends Composer<_$AppDatabase, $ChecklistItemsTable> {
  $$ChecklistItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get dailyFlowId => $composableBuilder(
    column: $table.dailyFlowId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isRequired => $composableBuilder(
    column: $table.isRequired,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get completed => $composableBuilder(
    column: $table.completed,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ChecklistItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $ChecklistItemsTable> {
  $$ChecklistItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get dailyFlowId => $composableBuilder(
    column: $table.dailyFlowId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isRequired => $composableBuilder(
    column: $table.isRequired,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get completed => $composableBuilder(
    column: $table.completed,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ChecklistItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ChecklistItemsTable> {
  $$ChecklistItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get dailyFlowId => $composableBuilder(
    column: $table.dailyFlowId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<bool> get isRequired => $composableBuilder(
    column: $table.isRequired,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get completed =>
      $composableBuilder(column: $table.completed, builder: (column) => column);

  GeneratedColumn<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => column,
  );
}

class $$ChecklistItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ChecklistItemsTable,
          ChecklistItem,
          $$ChecklistItemsTableFilterComposer,
          $$ChecklistItemsTableOrderingComposer,
          $$ChecklistItemsTableAnnotationComposer,
          $$ChecklistItemsTableCreateCompanionBuilder,
          $$ChecklistItemsTableUpdateCompanionBuilder,
          (
            ChecklistItem,
            BaseReferences<_$AppDatabase, $ChecklistItemsTable, ChecklistItem>,
          ),
          ChecklistItem,
          PrefetchHooks Function()
        > {
  $$ChecklistItemsTableTableManager(
    _$AppDatabase db,
    $ChecklistItemsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$ChecklistItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () =>
                  $$ChecklistItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$ChecklistItemsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> dailyFlowId = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<bool> isRequired = const Value.absent(),
                Value<bool> completed = const Value.absent(),
                Value<DateTime?> completedAt = const Value.absent(),
              }) => ChecklistItemsCompanion(
                id: id,
                dailyFlowId: dailyFlowId,
                type: type,
                name: name,
                isRequired: isRequired,
                completed: completed,
                completedAt: completedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int dailyFlowId,
                required String type,
                required String name,
                Value<bool> isRequired = const Value.absent(),
                Value<bool> completed = const Value.absent(),
                Value<DateTime?> completedAt = const Value.absent(),
              }) => ChecklistItemsCompanion.insert(
                id: id,
                dailyFlowId: dailyFlowId,
                type: type,
                name: name,
                isRequired: isRequired,
                completed: completed,
                completedAt: completedAt,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ChecklistItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ChecklistItemsTable,
      ChecklistItem,
      $$ChecklistItemsTableFilterComposer,
      $$ChecklistItemsTableOrderingComposer,
      $$ChecklistItemsTableAnnotationComposer,
      $$ChecklistItemsTableCreateCompanionBuilder,
      $$ChecklistItemsTableUpdateCompanionBuilder,
      (
        ChecklistItem,
        BaseReferences<_$AppDatabase, $ChecklistItemsTable, ChecklistItem>,
      ),
      ChecklistItem,
      PrefetchHooks Function()
    >;
typedef $$RoutineBlocksTableCreateCompanionBuilder =
    RoutineBlocksCompanion Function({
      Value<int> id,
      required int dailyFlowId,
      required int blockIndex,
      required String blockName,
      required String scheduledTime,
      Value<String> status,
      Value<int?> estimatedDurationMinutes,
      Value<int?> actualDurationMinutes,
      Value<int?> perceivedEffort,
      Value<DateTime?> completedAt,
    });
typedef $$RoutineBlocksTableUpdateCompanionBuilder =
    RoutineBlocksCompanion Function({
      Value<int> id,
      Value<int> dailyFlowId,
      Value<int> blockIndex,
      Value<String> blockName,
      Value<String> scheduledTime,
      Value<String> status,
      Value<int?> estimatedDurationMinutes,
      Value<int?> actualDurationMinutes,
      Value<int?> perceivedEffort,
      Value<DateTime?> completedAt,
    });

class $$RoutineBlocksTableFilterComposer
    extends Composer<_$AppDatabase, $RoutineBlocksTable> {
  $$RoutineBlocksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get dailyFlowId => $composableBuilder(
    column: $table.dailyFlowId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get blockIndex => $composableBuilder(
    column: $table.blockIndex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get blockName => $composableBuilder(
    column: $table.blockName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get scheduledTime => $composableBuilder(
    column: $table.scheduledTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get estimatedDurationMinutes => $composableBuilder(
    column: $table.estimatedDurationMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get actualDurationMinutes => $composableBuilder(
    column: $table.actualDurationMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get perceivedEffort => $composableBuilder(
    column: $table.perceivedEffort,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$RoutineBlocksTableOrderingComposer
    extends Composer<_$AppDatabase, $RoutineBlocksTable> {
  $$RoutineBlocksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get dailyFlowId => $composableBuilder(
    column: $table.dailyFlowId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get blockIndex => $composableBuilder(
    column: $table.blockIndex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get blockName => $composableBuilder(
    column: $table.blockName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get scheduledTime => $composableBuilder(
    column: $table.scheduledTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get estimatedDurationMinutes => $composableBuilder(
    column: $table.estimatedDurationMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get actualDurationMinutes => $composableBuilder(
    column: $table.actualDurationMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get perceivedEffort => $composableBuilder(
    column: $table.perceivedEffort,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$RoutineBlocksTableAnnotationComposer
    extends Composer<_$AppDatabase, $RoutineBlocksTable> {
  $$RoutineBlocksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get dailyFlowId => $composableBuilder(
    column: $table.dailyFlowId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get blockIndex => $composableBuilder(
    column: $table.blockIndex,
    builder: (column) => column,
  );

  GeneratedColumn<String> get blockName =>
      $composableBuilder(column: $table.blockName, builder: (column) => column);

  GeneratedColumn<String> get scheduledTime => $composableBuilder(
    column: $table.scheduledTime,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<int> get estimatedDurationMinutes => $composableBuilder(
    column: $table.estimatedDurationMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<int> get actualDurationMinutes => $composableBuilder(
    column: $table.actualDurationMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<int> get perceivedEffort => $composableBuilder(
    column: $table.perceivedEffort,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => column,
  );
}

class $$RoutineBlocksTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RoutineBlocksTable,
          RoutineBlock,
          $$RoutineBlocksTableFilterComposer,
          $$RoutineBlocksTableOrderingComposer,
          $$RoutineBlocksTableAnnotationComposer,
          $$RoutineBlocksTableCreateCompanionBuilder,
          $$RoutineBlocksTableUpdateCompanionBuilder,
          (
            RoutineBlock,
            BaseReferences<_$AppDatabase, $RoutineBlocksTable, RoutineBlock>,
          ),
          RoutineBlock,
          PrefetchHooks Function()
        > {
  $$RoutineBlocksTableTableManager(_$AppDatabase db, $RoutineBlocksTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$RoutineBlocksTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () =>
                  $$RoutineBlocksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$RoutineBlocksTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> dailyFlowId = const Value.absent(),
                Value<int> blockIndex = const Value.absent(),
                Value<String> blockName = const Value.absent(),
                Value<String> scheduledTime = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<int?> estimatedDurationMinutes = const Value.absent(),
                Value<int?> actualDurationMinutes = const Value.absent(),
                Value<int?> perceivedEffort = const Value.absent(),
                Value<DateTime?> completedAt = const Value.absent(),
              }) => RoutineBlocksCompanion(
                id: id,
                dailyFlowId: dailyFlowId,
                blockIndex: blockIndex,
                blockName: blockName,
                scheduledTime: scheduledTime,
                status: status,
                estimatedDurationMinutes: estimatedDurationMinutes,
                actualDurationMinutes: actualDurationMinutes,
                perceivedEffort: perceivedEffort,
                completedAt: completedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int dailyFlowId,
                required int blockIndex,
                required String blockName,
                required String scheduledTime,
                Value<String> status = const Value.absent(),
                Value<int?> estimatedDurationMinutes = const Value.absent(),
                Value<int?> actualDurationMinutes = const Value.absent(),
                Value<int?> perceivedEffort = const Value.absent(),
                Value<DateTime?> completedAt = const Value.absent(),
              }) => RoutineBlocksCompanion.insert(
                id: id,
                dailyFlowId: dailyFlowId,
                blockIndex: blockIndex,
                blockName: blockName,
                scheduledTime: scheduledTime,
                status: status,
                estimatedDurationMinutes: estimatedDurationMinutes,
                actualDurationMinutes: actualDurationMinutes,
                perceivedEffort: perceivedEffort,
                completedAt: completedAt,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$RoutineBlocksTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RoutineBlocksTable,
      RoutineBlock,
      $$RoutineBlocksTableFilterComposer,
      $$RoutineBlocksTableOrderingComposer,
      $$RoutineBlocksTableAnnotationComposer,
      $$RoutineBlocksTableCreateCompanionBuilder,
      $$RoutineBlocksTableUpdateCompanionBuilder,
      (
        RoutineBlock,
        BaseReferences<_$AppDatabase, $RoutineBlocksTable, RoutineBlock>,
      ),
      RoutineBlock,
      PrefetchHooks Function()
    >;
typedef $$RoutineTasksTableCreateCompanionBuilder =
    RoutineTasksCompanion Function({
      Value<int> id,
      required int routineBlockId,
      required String exerciseType,
      required String title,
      Value<String> description,
      required int durationSeconds,
      Value<String?> videoAssetPath,
      Value<int> orderIndex,
      Value<String> status,
      Value<bool> postponed,
      Value<DateTime?> completedAt,
    });
typedef $$RoutineTasksTableUpdateCompanionBuilder =
    RoutineTasksCompanion Function({
      Value<int> id,
      Value<int> routineBlockId,
      Value<String> exerciseType,
      Value<String> title,
      Value<String> description,
      Value<int> durationSeconds,
      Value<String?> videoAssetPath,
      Value<int> orderIndex,
      Value<String> status,
      Value<bool> postponed,
      Value<DateTime?> completedAt,
    });

class $$RoutineTasksTableFilterComposer
    extends Composer<_$AppDatabase, $RoutineTasksTable> {
  $$RoutineTasksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get routineBlockId => $composableBuilder(
    column: $table.routineBlockId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get exerciseType => $composableBuilder(
    column: $table.exerciseType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get durationSeconds => $composableBuilder(
    column: $table.durationSeconds,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get videoAssetPath => $composableBuilder(
    column: $table.videoAssetPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get postponed => $composableBuilder(
    column: $table.postponed,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$RoutineTasksTableOrderingComposer
    extends Composer<_$AppDatabase, $RoutineTasksTable> {
  $$RoutineTasksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get routineBlockId => $composableBuilder(
    column: $table.routineBlockId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get exerciseType => $composableBuilder(
    column: $table.exerciseType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get durationSeconds => $composableBuilder(
    column: $table.durationSeconds,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get videoAssetPath => $composableBuilder(
    column: $table.videoAssetPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get postponed => $composableBuilder(
    column: $table.postponed,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$RoutineTasksTableAnnotationComposer
    extends Composer<_$AppDatabase, $RoutineTasksTable> {
  $$RoutineTasksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get routineBlockId => $composableBuilder(
    column: $table.routineBlockId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get exerciseType => $composableBuilder(
    column: $table.exerciseType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<int> get durationSeconds => $composableBuilder(
    column: $table.durationSeconds,
    builder: (column) => column,
  );

  GeneratedColumn<String> get videoAssetPath => $composableBuilder(
    column: $table.videoAssetPath,
    builder: (column) => column,
  );

  GeneratedColumn<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<bool> get postponed =>
      $composableBuilder(column: $table.postponed, builder: (column) => column);

  GeneratedColumn<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => column,
  );
}

class $$RoutineTasksTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RoutineTasksTable,
          RoutineTask,
          $$RoutineTasksTableFilterComposer,
          $$RoutineTasksTableOrderingComposer,
          $$RoutineTasksTableAnnotationComposer,
          $$RoutineTasksTableCreateCompanionBuilder,
          $$RoutineTasksTableUpdateCompanionBuilder,
          (
            RoutineTask,
            BaseReferences<_$AppDatabase, $RoutineTasksTable, RoutineTask>,
          ),
          RoutineTask,
          PrefetchHooks Function()
        > {
  $$RoutineTasksTableTableManager(_$AppDatabase db, $RoutineTasksTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$RoutineTasksTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$RoutineTasksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () =>
                  $$RoutineTasksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> routineBlockId = const Value.absent(),
                Value<String> exerciseType = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<int> durationSeconds = const Value.absent(),
                Value<String?> videoAssetPath = const Value.absent(),
                Value<int> orderIndex = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<bool> postponed = const Value.absent(),
                Value<DateTime?> completedAt = const Value.absent(),
              }) => RoutineTasksCompanion(
                id: id,
                routineBlockId: routineBlockId,
                exerciseType: exerciseType,
                title: title,
                description: description,
                durationSeconds: durationSeconds,
                videoAssetPath: videoAssetPath,
                orderIndex: orderIndex,
                status: status,
                postponed: postponed,
                completedAt: completedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int routineBlockId,
                required String exerciseType,
                required String title,
                Value<String> description = const Value.absent(),
                required int durationSeconds,
                Value<String?> videoAssetPath = const Value.absent(),
                Value<int> orderIndex = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<bool> postponed = const Value.absent(),
                Value<DateTime?> completedAt = const Value.absent(),
              }) => RoutineTasksCompanion.insert(
                id: id,
                routineBlockId: routineBlockId,
                exerciseType: exerciseType,
                title: title,
                description: description,
                durationSeconds: durationSeconds,
                videoAssetPath: videoAssetPath,
                orderIndex: orderIndex,
                status: status,
                postponed: postponed,
                completedAt: completedAt,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$RoutineTasksTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RoutineTasksTable,
      RoutineTask,
      $$RoutineTasksTableFilterComposer,
      $$RoutineTasksTableOrderingComposer,
      $$RoutineTasksTableAnnotationComposer,
      $$RoutineTasksTableCreateCompanionBuilder,
      $$RoutineTasksTableUpdateCompanionBuilder,
      (
        RoutineTask,
        BaseReferences<_$AppDatabase, $RoutineTasksTable, RoutineTask>,
      ),
      RoutineTask,
      PrefetchHooks Function()
    >;
typedef $$ExerciseFeedbacksTableCreateCompanionBuilder =
    ExerciseFeedbacksCompanion Function({
      Value<int> id,
      required int routineTaskId,
      Value<DateTime?> startedAt,
      Value<DateTime?> endedAt,
      required String completedStatus,
      Value<int?> preExerciseState,
      Value<int?> postExerciseState,
      Value<int?> breathlessnessLevel,
      Value<int> pauseCount,
      Value<bool> rescueInhalerUsed,
      Value<String?> rescueInhalerTiming,
      Value<int?> recoveryMinutes,
      Value<int?> perceivedEffort,
      Value<String?> toleranceRating,
      Value<bool?> repeatSameLevelTomorrow,
      Value<String?> notes,
      Value<DateTime> createdAt,
    });
typedef $$ExerciseFeedbacksTableUpdateCompanionBuilder =
    ExerciseFeedbacksCompanion Function({
      Value<int> id,
      Value<int> routineTaskId,
      Value<DateTime?> startedAt,
      Value<DateTime?> endedAt,
      Value<String> completedStatus,
      Value<int?> preExerciseState,
      Value<int?> postExerciseState,
      Value<int?> breathlessnessLevel,
      Value<int> pauseCount,
      Value<bool> rescueInhalerUsed,
      Value<String?> rescueInhalerTiming,
      Value<int?> recoveryMinutes,
      Value<int?> perceivedEffort,
      Value<String?> toleranceRating,
      Value<bool?> repeatSameLevelTomorrow,
      Value<String?> notes,
      Value<DateTime> createdAt,
    });

class $$ExerciseFeedbacksTableFilterComposer
    extends Composer<_$AppDatabase, $ExerciseFeedbacksTable> {
  $$ExerciseFeedbacksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get routineTaskId => $composableBuilder(
    column: $table.routineTaskId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startedAt => $composableBuilder(
    column: $table.startedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get endedAt => $composableBuilder(
    column: $table.endedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get completedStatus => $composableBuilder(
    column: $table.completedStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get preExerciseState => $composableBuilder(
    column: $table.preExerciseState,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get postExerciseState => $composableBuilder(
    column: $table.postExerciseState,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get breathlessnessLevel => $composableBuilder(
    column: $table.breathlessnessLevel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get pauseCount => $composableBuilder(
    column: $table.pauseCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get rescueInhalerUsed => $composableBuilder(
    column: $table.rescueInhalerUsed,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get rescueInhalerTiming => $composableBuilder(
    column: $table.rescueInhalerTiming,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get recoveryMinutes => $composableBuilder(
    column: $table.recoveryMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get perceivedEffort => $composableBuilder(
    column: $table.perceivedEffort,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get toleranceRating => $composableBuilder(
    column: $table.toleranceRating,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get repeatSameLevelTomorrow => $composableBuilder(
    column: $table.repeatSameLevelTomorrow,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ExerciseFeedbacksTableOrderingComposer
    extends Composer<_$AppDatabase, $ExerciseFeedbacksTable> {
  $$ExerciseFeedbacksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get routineTaskId => $composableBuilder(
    column: $table.routineTaskId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startedAt => $composableBuilder(
    column: $table.startedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get endedAt => $composableBuilder(
    column: $table.endedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get completedStatus => $composableBuilder(
    column: $table.completedStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get preExerciseState => $composableBuilder(
    column: $table.preExerciseState,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get postExerciseState => $composableBuilder(
    column: $table.postExerciseState,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get breathlessnessLevel => $composableBuilder(
    column: $table.breathlessnessLevel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get pauseCount => $composableBuilder(
    column: $table.pauseCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get rescueInhalerUsed => $composableBuilder(
    column: $table.rescueInhalerUsed,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get rescueInhalerTiming => $composableBuilder(
    column: $table.rescueInhalerTiming,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get recoveryMinutes => $composableBuilder(
    column: $table.recoveryMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get perceivedEffort => $composableBuilder(
    column: $table.perceivedEffort,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get toleranceRating => $composableBuilder(
    column: $table.toleranceRating,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get repeatSameLevelTomorrow => $composableBuilder(
    column: $table.repeatSameLevelTomorrow,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ExerciseFeedbacksTableAnnotationComposer
    extends Composer<_$AppDatabase, $ExerciseFeedbacksTable> {
  $$ExerciseFeedbacksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get routineTaskId => $composableBuilder(
    column: $table.routineTaskId,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get startedAt =>
      $composableBuilder(column: $table.startedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get endedAt =>
      $composableBuilder(column: $table.endedAt, builder: (column) => column);

  GeneratedColumn<String> get completedStatus => $composableBuilder(
    column: $table.completedStatus,
    builder: (column) => column,
  );

  GeneratedColumn<int> get preExerciseState => $composableBuilder(
    column: $table.preExerciseState,
    builder: (column) => column,
  );

  GeneratedColumn<int> get postExerciseState => $composableBuilder(
    column: $table.postExerciseState,
    builder: (column) => column,
  );

  GeneratedColumn<int> get breathlessnessLevel => $composableBuilder(
    column: $table.breathlessnessLevel,
    builder: (column) => column,
  );

  GeneratedColumn<int> get pauseCount => $composableBuilder(
    column: $table.pauseCount,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get rescueInhalerUsed => $composableBuilder(
    column: $table.rescueInhalerUsed,
    builder: (column) => column,
  );

  GeneratedColumn<String> get rescueInhalerTiming => $composableBuilder(
    column: $table.rescueInhalerTiming,
    builder: (column) => column,
  );

  GeneratedColumn<int> get recoveryMinutes => $composableBuilder(
    column: $table.recoveryMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<int> get perceivedEffort => $composableBuilder(
    column: $table.perceivedEffort,
    builder: (column) => column,
  );

  GeneratedColumn<String> get toleranceRating => $composableBuilder(
    column: $table.toleranceRating,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get repeatSameLevelTomorrow => $composableBuilder(
    column: $table.repeatSameLevelTomorrow,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$ExerciseFeedbacksTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ExerciseFeedbacksTable,
          ExerciseFeedback,
          $$ExerciseFeedbacksTableFilterComposer,
          $$ExerciseFeedbacksTableOrderingComposer,
          $$ExerciseFeedbacksTableAnnotationComposer,
          $$ExerciseFeedbacksTableCreateCompanionBuilder,
          $$ExerciseFeedbacksTableUpdateCompanionBuilder,
          (
            ExerciseFeedback,
            BaseReferences<
              _$AppDatabase,
              $ExerciseFeedbacksTable,
              ExerciseFeedback
            >,
          ),
          ExerciseFeedback,
          PrefetchHooks Function()
        > {
  $$ExerciseFeedbacksTableTableManager(
    _$AppDatabase db,
    $ExerciseFeedbacksTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$ExerciseFeedbacksTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer:
              () => $$ExerciseFeedbacksTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => $$ExerciseFeedbacksTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> routineTaskId = const Value.absent(),
                Value<DateTime?> startedAt = const Value.absent(),
                Value<DateTime?> endedAt = const Value.absent(),
                Value<String> completedStatus = const Value.absent(),
                Value<int?> preExerciseState = const Value.absent(),
                Value<int?> postExerciseState = const Value.absent(),
                Value<int?> breathlessnessLevel = const Value.absent(),
                Value<int> pauseCount = const Value.absent(),
                Value<bool> rescueInhalerUsed = const Value.absent(),
                Value<String?> rescueInhalerTiming = const Value.absent(),
                Value<int?> recoveryMinutes = const Value.absent(),
                Value<int?> perceivedEffort = const Value.absent(),
                Value<String?> toleranceRating = const Value.absent(),
                Value<bool?> repeatSameLevelTomorrow = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => ExerciseFeedbacksCompanion(
                id: id,
                routineTaskId: routineTaskId,
                startedAt: startedAt,
                endedAt: endedAt,
                completedStatus: completedStatus,
                preExerciseState: preExerciseState,
                postExerciseState: postExerciseState,
                breathlessnessLevel: breathlessnessLevel,
                pauseCount: pauseCount,
                rescueInhalerUsed: rescueInhalerUsed,
                rescueInhalerTiming: rescueInhalerTiming,
                recoveryMinutes: recoveryMinutes,
                perceivedEffort: perceivedEffort,
                toleranceRating: toleranceRating,
                repeatSameLevelTomorrow: repeatSameLevelTomorrow,
                notes: notes,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int routineTaskId,
                Value<DateTime?> startedAt = const Value.absent(),
                Value<DateTime?> endedAt = const Value.absent(),
                required String completedStatus,
                Value<int?> preExerciseState = const Value.absent(),
                Value<int?> postExerciseState = const Value.absent(),
                Value<int?> breathlessnessLevel = const Value.absent(),
                Value<int> pauseCount = const Value.absent(),
                Value<bool> rescueInhalerUsed = const Value.absent(),
                Value<String?> rescueInhalerTiming = const Value.absent(),
                Value<int?> recoveryMinutes = const Value.absent(),
                Value<int?> perceivedEffort = const Value.absent(),
                Value<String?> toleranceRating = const Value.absent(),
                Value<bool?> repeatSameLevelTomorrow = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => ExerciseFeedbacksCompanion.insert(
                id: id,
                routineTaskId: routineTaskId,
                startedAt: startedAt,
                endedAt: endedAt,
                completedStatus: completedStatus,
                preExerciseState: preExerciseState,
                postExerciseState: postExerciseState,
                breathlessnessLevel: breathlessnessLevel,
                pauseCount: pauseCount,
                rescueInhalerUsed: rescueInhalerUsed,
                rescueInhalerTiming: rescueInhalerTiming,
                recoveryMinutes: recoveryMinutes,
                perceivedEffort: perceivedEffort,
                toleranceRating: toleranceRating,
                repeatSameLevelTomorrow: repeatSameLevelTomorrow,
                notes: notes,
                createdAt: createdAt,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ExerciseFeedbacksTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ExerciseFeedbacksTable,
      ExerciseFeedback,
      $$ExerciseFeedbacksTableFilterComposer,
      $$ExerciseFeedbacksTableOrderingComposer,
      $$ExerciseFeedbacksTableAnnotationComposer,
      $$ExerciseFeedbacksTableCreateCompanionBuilder,
      $$ExerciseFeedbacksTableUpdateCompanionBuilder,
      (
        ExerciseFeedback,
        BaseReferences<
          _$AppDatabase,
          $ExerciseFeedbacksTable,
          ExerciseFeedback
        >,
      ),
      ExerciseFeedback,
      PrefetchHooks Function()
    >;
typedef $$SymptomChecksTableCreateCompanionBuilder =
    SymptomChecksCompanion Function({
      Value<int> id,
      required int dailyFlowId,
      required String moment,
      Value<int?> breathingToday,
      Value<int?> fatigue,
      Value<int?> cough,
      Value<int?> phlegm,
      Value<int?> awakenings,
      Value<double?> saturation,
      Value<int?> pulse,
      Value<String?> notes,
      Value<DateTime> createdAt,
    });
typedef $$SymptomChecksTableUpdateCompanionBuilder =
    SymptomChecksCompanion Function({
      Value<int> id,
      Value<int> dailyFlowId,
      Value<String> moment,
      Value<int?> breathingToday,
      Value<int?> fatigue,
      Value<int?> cough,
      Value<int?> phlegm,
      Value<int?> awakenings,
      Value<double?> saturation,
      Value<int?> pulse,
      Value<String?> notes,
      Value<DateTime> createdAt,
    });

class $$SymptomChecksTableFilterComposer
    extends Composer<_$AppDatabase, $SymptomChecksTable> {
  $$SymptomChecksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get dailyFlowId => $composableBuilder(
    column: $table.dailyFlowId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get moment => $composableBuilder(
    column: $table.moment,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get breathingToday => $composableBuilder(
    column: $table.breathingToday,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get fatigue => $composableBuilder(
    column: $table.fatigue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get cough => $composableBuilder(
    column: $table.cough,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get phlegm => $composableBuilder(
    column: $table.phlegm,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get awakenings => $composableBuilder(
    column: $table.awakenings,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get saturation => $composableBuilder(
    column: $table.saturation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get pulse => $composableBuilder(
    column: $table.pulse,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SymptomChecksTableOrderingComposer
    extends Composer<_$AppDatabase, $SymptomChecksTable> {
  $$SymptomChecksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get dailyFlowId => $composableBuilder(
    column: $table.dailyFlowId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get moment => $composableBuilder(
    column: $table.moment,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get breathingToday => $composableBuilder(
    column: $table.breathingToday,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get fatigue => $composableBuilder(
    column: $table.fatigue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get cough => $composableBuilder(
    column: $table.cough,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get phlegm => $composableBuilder(
    column: $table.phlegm,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get awakenings => $composableBuilder(
    column: $table.awakenings,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get saturation => $composableBuilder(
    column: $table.saturation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get pulse => $composableBuilder(
    column: $table.pulse,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SymptomChecksTableAnnotationComposer
    extends Composer<_$AppDatabase, $SymptomChecksTable> {
  $$SymptomChecksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get dailyFlowId => $composableBuilder(
    column: $table.dailyFlowId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get moment =>
      $composableBuilder(column: $table.moment, builder: (column) => column);

  GeneratedColumn<int> get breathingToday => $composableBuilder(
    column: $table.breathingToday,
    builder: (column) => column,
  );

  GeneratedColumn<int> get fatigue =>
      $composableBuilder(column: $table.fatigue, builder: (column) => column);

  GeneratedColumn<int> get cough =>
      $composableBuilder(column: $table.cough, builder: (column) => column);

  GeneratedColumn<int> get phlegm =>
      $composableBuilder(column: $table.phlegm, builder: (column) => column);

  GeneratedColumn<int> get awakenings => $composableBuilder(
    column: $table.awakenings,
    builder: (column) => column,
  );

  GeneratedColumn<double> get saturation => $composableBuilder(
    column: $table.saturation,
    builder: (column) => column,
  );

  GeneratedColumn<int> get pulse =>
      $composableBuilder(column: $table.pulse, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$SymptomChecksTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SymptomChecksTable,
          SymptomCheck,
          $$SymptomChecksTableFilterComposer,
          $$SymptomChecksTableOrderingComposer,
          $$SymptomChecksTableAnnotationComposer,
          $$SymptomChecksTableCreateCompanionBuilder,
          $$SymptomChecksTableUpdateCompanionBuilder,
          (
            SymptomCheck,
            BaseReferences<_$AppDatabase, $SymptomChecksTable, SymptomCheck>,
          ),
          SymptomCheck,
          PrefetchHooks Function()
        > {
  $$SymptomChecksTableTableManager(_$AppDatabase db, $SymptomChecksTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$SymptomChecksTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () =>
                  $$SymptomChecksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$SymptomChecksTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> dailyFlowId = const Value.absent(),
                Value<String> moment = const Value.absent(),
                Value<int?> breathingToday = const Value.absent(),
                Value<int?> fatigue = const Value.absent(),
                Value<int?> cough = const Value.absent(),
                Value<int?> phlegm = const Value.absent(),
                Value<int?> awakenings = const Value.absent(),
                Value<double?> saturation = const Value.absent(),
                Value<int?> pulse = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => SymptomChecksCompanion(
                id: id,
                dailyFlowId: dailyFlowId,
                moment: moment,
                breathingToday: breathingToday,
                fatigue: fatigue,
                cough: cough,
                phlegm: phlegm,
                awakenings: awakenings,
                saturation: saturation,
                pulse: pulse,
                notes: notes,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int dailyFlowId,
                required String moment,
                Value<int?> breathingToday = const Value.absent(),
                Value<int?> fatigue = const Value.absent(),
                Value<int?> cough = const Value.absent(),
                Value<int?> phlegm = const Value.absent(),
                Value<int?> awakenings = const Value.absent(),
                Value<double?> saturation = const Value.absent(),
                Value<int?> pulse = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => SymptomChecksCompanion.insert(
                id: id,
                dailyFlowId: dailyFlowId,
                moment: moment,
                breathingToday: breathingToday,
                fatigue: fatigue,
                cough: cough,
                phlegm: phlegm,
                awakenings: awakenings,
                saturation: saturation,
                pulse: pulse,
                notes: notes,
                createdAt: createdAt,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SymptomChecksTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SymptomChecksTable,
      SymptomCheck,
      $$SymptomChecksTableFilterComposer,
      $$SymptomChecksTableOrderingComposer,
      $$SymptomChecksTableAnnotationComposer,
      $$SymptomChecksTableCreateCompanionBuilder,
      $$SymptomChecksTableUpdateCompanionBuilder,
      (
        SymptomCheck,
        BaseReferences<_$AppDatabase, $SymptomChecksTable, SymptomCheck>,
      ),
      SymptomCheck,
      PrefetchHooks Function()
    >;
typedef $$BreathlessnessEpisodesTableCreateCompanionBuilder =
    BreathlessnessEpisodesCompanion Function({
      Value<int> id,
      required int dailyFlowId,
      Value<String?> context,
      Value<int?> intensity,
      Value<bool> inhalerUsed,
      Value<int> microSessionCount,
      Value<String?> improvement,
      Value<int?> durationMinutes,
      Value<bool> calledFamily,
      Value<bool> escalatedEmergency,
      Value<DateTime> createdAt,
    });
typedef $$BreathlessnessEpisodesTableUpdateCompanionBuilder =
    BreathlessnessEpisodesCompanion Function({
      Value<int> id,
      Value<int> dailyFlowId,
      Value<String?> context,
      Value<int?> intensity,
      Value<bool> inhalerUsed,
      Value<int> microSessionCount,
      Value<String?> improvement,
      Value<int?> durationMinutes,
      Value<bool> calledFamily,
      Value<bool> escalatedEmergency,
      Value<DateTime> createdAt,
    });

class $$BreathlessnessEpisodesTableFilterComposer
    extends Composer<_$AppDatabase, $BreathlessnessEpisodesTable> {
  $$BreathlessnessEpisodesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get dailyFlowId => $composableBuilder(
    column: $table.dailyFlowId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get context => $composableBuilder(
    column: $table.context,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get intensity => $composableBuilder(
    column: $table.intensity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get inhalerUsed => $composableBuilder(
    column: $table.inhalerUsed,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get microSessionCount => $composableBuilder(
    column: $table.microSessionCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get improvement => $composableBuilder(
    column: $table.improvement,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get durationMinutes => $composableBuilder(
    column: $table.durationMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get calledFamily => $composableBuilder(
    column: $table.calledFamily,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get escalatedEmergency => $composableBuilder(
    column: $table.escalatedEmergency,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$BreathlessnessEpisodesTableOrderingComposer
    extends Composer<_$AppDatabase, $BreathlessnessEpisodesTable> {
  $$BreathlessnessEpisodesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get dailyFlowId => $composableBuilder(
    column: $table.dailyFlowId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get context => $composableBuilder(
    column: $table.context,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get intensity => $composableBuilder(
    column: $table.intensity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get inhalerUsed => $composableBuilder(
    column: $table.inhalerUsed,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get microSessionCount => $composableBuilder(
    column: $table.microSessionCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get improvement => $composableBuilder(
    column: $table.improvement,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get durationMinutes => $composableBuilder(
    column: $table.durationMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get calledFamily => $composableBuilder(
    column: $table.calledFamily,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get escalatedEmergency => $composableBuilder(
    column: $table.escalatedEmergency,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$BreathlessnessEpisodesTableAnnotationComposer
    extends Composer<_$AppDatabase, $BreathlessnessEpisodesTable> {
  $$BreathlessnessEpisodesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get dailyFlowId => $composableBuilder(
    column: $table.dailyFlowId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get context =>
      $composableBuilder(column: $table.context, builder: (column) => column);

  GeneratedColumn<int> get intensity =>
      $composableBuilder(column: $table.intensity, builder: (column) => column);

  GeneratedColumn<bool> get inhalerUsed => $composableBuilder(
    column: $table.inhalerUsed,
    builder: (column) => column,
  );

  GeneratedColumn<int> get microSessionCount => $composableBuilder(
    column: $table.microSessionCount,
    builder: (column) => column,
  );

  GeneratedColumn<String> get improvement => $composableBuilder(
    column: $table.improvement,
    builder: (column) => column,
  );

  GeneratedColumn<int> get durationMinutes => $composableBuilder(
    column: $table.durationMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get calledFamily => $composableBuilder(
    column: $table.calledFamily,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get escalatedEmergency => $composableBuilder(
    column: $table.escalatedEmergency,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$BreathlessnessEpisodesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BreathlessnessEpisodesTable,
          BreathlessnessEpisode,
          $$BreathlessnessEpisodesTableFilterComposer,
          $$BreathlessnessEpisodesTableOrderingComposer,
          $$BreathlessnessEpisodesTableAnnotationComposer,
          $$BreathlessnessEpisodesTableCreateCompanionBuilder,
          $$BreathlessnessEpisodesTableUpdateCompanionBuilder,
          (
            BreathlessnessEpisode,
            BaseReferences<
              _$AppDatabase,
              $BreathlessnessEpisodesTable,
              BreathlessnessEpisode
            >,
          ),
          BreathlessnessEpisode,
          PrefetchHooks Function()
        > {
  $$BreathlessnessEpisodesTableTableManager(
    _$AppDatabase db,
    $BreathlessnessEpisodesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$BreathlessnessEpisodesTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer:
              () => $$BreathlessnessEpisodesTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => $$BreathlessnessEpisodesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> dailyFlowId = const Value.absent(),
                Value<String?> context = const Value.absent(),
                Value<int?> intensity = const Value.absent(),
                Value<bool> inhalerUsed = const Value.absent(),
                Value<int> microSessionCount = const Value.absent(),
                Value<String?> improvement = const Value.absent(),
                Value<int?> durationMinutes = const Value.absent(),
                Value<bool> calledFamily = const Value.absent(),
                Value<bool> escalatedEmergency = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => BreathlessnessEpisodesCompanion(
                id: id,
                dailyFlowId: dailyFlowId,
                context: context,
                intensity: intensity,
                inhalerUsed: inhalerUsed,
                microSessionCount: microSessionCount,
                improvement: improvement,
                durationMinutes: durationMinutes,
                calledFamily: calledFamily,
                escalatedEmergency: escalatedEmergency,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int dailyFlowId,
                Value<String?> context = const Value.absent(),
                Value<int?> intensity = const Value.absent(),
                Value<bool> inhalerUsed = const Value.absent(),
                Value<int> microSessionCount = const Value.absent(),
                Value<String?> improvement = const Value.absent(),
                Value<int?> durationMinutes = const Value.absent(),
                Value<bool> calledFamily = const Value.absent(),
                Value<bool> escalatedEmergency = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => BreathlessnessEpisodesCompanion.insert(
                id: id,
                dailyFlowId: dailyFlowId,
                context: context,
                intensity: intensity,
                inhalerUsed: inhalerUsed,
                microSessionCount: microSessionCount,
                improvement: improvement,
                durationMinutes: durationMinutes,
                calledFamily: calledFamily,
                escalatedEmergency: escalatedEmergency,
                createdAt: createdAt,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$BreathlessnessEpisodesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BreathlessnessEpisodesTable,
      BreathlessnessEpisode,
      $$BreathlessnessEpisodesTableFilterComposer,
      $$BreathlessnessEpisodesTableOrderingComposer,
      $$BreathlessnessEpisodesTableAnnotationComposer,
      $$BreathlessnessEpisodesTableCreateCompanionBuilder,
      $$BreathlessnessEpisodesTableUpdateCompanionBuilder,
      (
        BreathlessnessEpisode,
        BaseReferences<
          _$AppDatabase,
          $BreathlessnessEpisodesTable,
          BreathlessnessEpisode
        >,
      ),
      BreathlessnessEpisode,
      PrefetchHooks Function()
    >;
typedef $$RescueInhalerUsesTableCreateCompanionBuilder =
    RescueInhalerUsesCompanion Function({
      Value<int> id,
      Value<int?> dailyFlowId,
      required DateTime timestamp,
      required String usageContext,
      Value<int> puffs,
      Value<int?> reliefLevel,
      Value<int?> recoveryMinutes,
      Value<String?> activityContext,
      Value<String?> notes,
      Value<DateTime> createdAt,
    });
typedef $$RescueInhalerUsesTableUpdateCompanionBuilder =
    RescueInhalerUsesCompanion Function({
      Value<int> id,
      Value<int?> dailyFlowId,
      Value<DateTime> timestamp,
      Value<String> usageContext,
      Value<int> puffs,
      Value<int?> reliefLevel,
      Value<int?> recoveryMinutes,
      Value<String?> activityContext,
      Value<String?> notes,
      Value<DateTime> createdAt,
    });

class $$RescueInhalerUsesTableFilterComposer
    extends Composer<_$AppDatabase, $RescueInhalerUsesTable> {
  $$RescueInhalerUsesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get dailyFlowId => $composableBuilder(
    column: $table.dailyFlowId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get usageContext => $composableBuilder(
    column: $table.usageContext,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get puffs => $composableBuilder(
    column: $table.puffs,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get reliefLevel => $composableBuilder(
    column: $table.reliefLevel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get recoveryMinutes => $composableBuilder(
    column: $table.recoveryMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get activityContext => $composableBuilder(
    column: $table.activityContext,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$RescueInhalerUsesTableOrderingComposer
    extends Composer<_$AppDatabase, $RescueInhalerUsesTable> {
  $$RescueInhalerUsesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get dailyFlowId => $composableBuilder(
    column: $table.dailyFlowId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get usageContext => $composableBuilder(
    column: $table.usageContext,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get puffs => $composableBuilder(
    column: $table.puffs,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get reliefLevel => $composableBuilder(
    column: $table.reliefLevel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get recoveryMinutes => $composableBuilder(
    column: $table.recoveryMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get activityContext => $composableBuilder(
    column: $table.activityContext,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$RescueInhalerUsesTableAnnotationComposer
    extends Composer<_$AppDatabase, $RescueInhalerUsesTable> {
  $$RescueInhalerUsesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get dailyFlowId => $composableBuilder(
    column: $table.dailyFlowId,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);

  GeneratedColumn<String> get usageContext => $composableBuilder(
    column: $table.usageContext,
    builder: (column) => column,
  );

  GeneratedColumn<int> get puffs =>
      $composableBuilder(column: $table.puffs, builder: (column) => column);

  GeneratedColumn<int> get reliefLevel => $composableBuilder(
    column: $table.reliefLevel,
    builder: (column) => column,
  );

  GeneratedColumn<int> get recoveryMinutes => $composableBuilder(
    column: $table.recoveryMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<String> get activityContext => $composableBuilder(
    column: $table.activityContext,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$RescueInhalerUsesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RescueInhalerUsesTable,
          RescueInhalerUse,
          $$RescueInhalerUsesTableFilterComposer,
          $$RescueInhalerUsesTableOrderingComposer,
          $$RescueInhalerUsesTableAnnotationComposer,
          $$RescueInhalerUsesTableCreateCompanionBuilder,
          $$RescueInhalerUsesTableUpdateCompanionBuilder,
          (
            RescueInhalerUse,
            BaseReferences<
              _$AppDatabase,
              $RescueInhalerUsesTable,
              RescueInhalerUse
            >,
          ),
          RescueInhalerUse,
          PrefetchHooks Function()
        > {
  $$RescueInhalerUsesTableTableManager(
    _$AppDatabase db,
    $RescueInhalerUsesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$RescueInhalerUsesTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer:
              () => $$RescueInhalerUsesTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => $$RescueInhalerUsesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> dailyFlowId = const Value.absent(),
                Value<DateTime> timestamp = const Value.absent(),
                Value<String> usageContext = const Value.absent(),
                Value<int> puffs = const Value.absent(),
                Value<int?> reliefLevel = const Value.absent(),
                Value<int?> recoveryMinutes = const Value.absent(),
                Value<String?> activityContext = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => RescueInhalerUsesCompanion(
                id: id,
                dailyFlowId: dailyFlowId,
                timestamp: timestamp,
                usageContext: usageContext,
                puffs: puffs,
                reliefLevel: reliefLevel,
                recoveryMinutes: recoveryMinutes,
                activityContext: activityContext,
                notes: notes,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> dailyFlowId = const Value.absent(),
                required DateTime timestamp,
                required String usageContext,
                Value<int> puffs = const Value.absent(),
                Value<int?> reliefLevel = const Value.absent(),
                Value<int?> recoveryMinutes = const Value.absent(),
                Value<String?> activityContext = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => RescueInhalerUsesCompanion.insert(
                id: id,
                dailyFlowId: dailyFlowId,
                timestamp: timestamp,
                usageContext: usageContext,
                puffs: puffs,
                reliefLevel: reliefLevel,
                recoveryMinutes: recoveryMinutes,
                activityContext: activityContext,
                notes: notes,
                createdAt: createdAt,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$RescueInhalerUsesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RescueInhalerUsesTable,
      RescueInhalerUse,
      $$RescueInhalerUsesTableFilterComposer,
      $$RescueInhalerUsesTableOrderingComposer,
      $$RescueInhalerUsesTableAnnotationComposer,
      $$RescueInhalerUsesTableCreateCompanionBuilder,
      $$RescueInhalerUsesTableUpdateCompanionBuilder,
      (
        RescueInhalerUse,
        BaseReferences<
          _$AppDatabase,
          $RescueInhalerUsesTable,
          RescueInhalerUse
        >,
      ),
      RescueInhalerUse,
      PrefetchHooks Function()
    >;
typedef $$FunctionalTestsTableCreateCompanionBuilder =
    FunctionalTestsCompanion Function({
      Value<int> id,
      required int dailyFlowId,
      required String type,
      required DateTime timestamp,
      Value<int> pauses,
      Value<int?> difficulty,
      Value<String?> resultText,
      Value<DateTime> createdAt,
    });
typedef $$FunctionalTestsTableUpdateCompanionBuilder =
    FunctionalTestsCompanion Function({
      Value<int> id,
      Value<int> dailyFlowId,
      Value<String> type,
      Value<DateTime> timestamp,
      Value<int> pauses,
      Value<int?> difficulty,
      Value<String?> resultText,
      Value<DateTime> createdAt,
    });

class $$FunctionalTestsTableFilterComposer
    extends Composer<_$AppDatabase, $FunctionalTestsTable> {
  $$FunctionalTestsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get dailyFlowId => $composableBuilder(
    column: $table.dailyFlowId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get pauses => $composableBuilder(
    column: $table.pauses,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get difficulty => $composableBuilder(
    column: $table.difficulty,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get resultText => $composableBuilder(
    column: $table.resultText,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$FunctionalTestsTableOrderingComposer
    extends Composer<_$AppDatabase, $FunctionalTestsTable> {
  $$FunctionalTestsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get dailyFlowId => $composableBuilder(
    column: $table.dailyFlowId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get pauses => $composableBuilder(
    column: $table.pauses,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get difficulty => $composableBuilder(
    column: $table.difficulty,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get resultText => $composableBuilder(
    column: $table.resultText,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$FunctionalTestsTableAnnotationComposer
    extends Composer<_$AppDatabase, $FunctionalTestsTable> {
  $$FunctionalTestsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get dailyFlowId => $composableBuilder(
    column: $table.dailyFlowId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<DateTime> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);

  GeneratedColumn<int> get pauses =>
      $composableBuilder(column: $table.pauses, builder: (column) => column);

  GeneratedColumn<int> get difficulty => $composableBuilder(
    column: $table.difficulty,
    builder: (column) => column,
  );

  GeneratedColumn<String> get resultText => $composableBuilder(
    column: $table.resultText,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$FunctionalTestsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FunctionalTestsTable,
          FunctionalTest,
          $$FunctionalTestsTableFilterComposer,
          $$FunctionalTestsTableOrderingComposer,
          $$FunctionalTestsTableAnnotationComposer,
          $$FunctionalTestsTableCreateCompanionBuilder,
          $$FunctionalTestsTableUpdateCompanionBuilder,
          (
            FunctionalTest,
            BaseReferences<
              _$AppDatabase,
              $FunctionalTestsTable,
              FunctionalTest
            >,
          ),
          FunctionalTest,
          PrefetchHooks Function()
        > {
  $$FunctionalTestsTableTableManager(
    _$AppDatabase db,
    $FunctionalTestsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () =>
                  $$FunctionalTestsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$FunctionalTestsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => $$FunctionalTestsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> dailyFlowId = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<DateTime> timestamp = const Value.absent(),
                Value<int> pauses = const Value.absent(),
                Value<int?> difficulty = const Value.absent(),
                Value<String?> resultText = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => FunctionalTestsCompanion(
                id: id,
                dailyFlowId: dailyFlowId,
                type: type,
                timestamp: timestamp,
                pauses: pauses,
                difficulty: difficulty,
                resultText: resultText,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int dailyFlowId,
                required String type,
                required DateTime timestamp,
                Value<int> pauses = const Value.absent(),
                Value<int?> difficulty = const Value.absent(),
                Value<String?> resultText = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => FunctionalTestsCompanion.insert(
                id: id,
                dailyFlowId: dailyFlowId,
                type: type,
                timestamp: timestamp,
                pauses: pauses,
                difficulty: difficulty,
                resultText: resultText,
                createdAt: createdAt,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$FunctionalTestsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FunctionalTestsTable,
      FunctionalTest,
      $$FunctionalTestsTableFilterComposer,
      $$FunctionalTestsTableOrderingComposer,
      $$FunctionalTestsTableAnnotationComposer,
      $$FunctionalTestsTableCreateCompanionBuilder,
      $$FunctionalTestsTableUpdateCompanionBuilder,
      (
        FunctionalTest,
        BaseReferences<_$AppDatabase, $FunctionalTestsTable, FunctionalTest>,
      ),
      FunctionalTest,
      PrefetchHooks Function()
    >;
typedef $$ActivityLogsTableCreateCompanionBuilder =
    ActivityLogsCompanion Function({
      Value<int> id,
      Value<int?> userId,
      required String type,
      required String title,
      Value<int?> durationMinutes,
      Value<int?> perceivedEffort,
      Value<String> source,
      Value<DateTime> createdAt,
    });
typedef $$ActivityLogsTableUpdateCompanionBuilder =
    ActivityLogsCompanion Function({
      Value<int> id,
      Value<int?> userId,
      Value<String> type,
      Value<String> title,
      Value<int?> durationMinutes,
      Value<int?> perceivedEffort,
      Value<String> source,
      Value<DateTime> createdAt,
    });

class $$ActivityLogsTableFilterComposer
    extends Composer<_$AppDatabase, $ActivityLogsTable> {
  $$ActivityLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get durationMinutes => $composableBuilder(
    column: $table.durationMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get perceivedEffort => $composableBuilder(
    column: $table.perceivedEffort,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ActivityLogsTableOrderingComposer
    extends Composer<_$AppDatabase, $ActivityLogsTable> {
  $$ActivityLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get durationMinutes => $composableBuilder(
    column: $table.durationMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get perceivedEffort => $composableBuilder(
    column: $table.perceivedEffort,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ActivityLogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ActivityLogsTable> {
  $$ActivityLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<int> get durationMinutes => $composableBuilder(
    column: $table.durationMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<int> get perceivedEffort => $composableBuilder(
    column: $table.perceivedEffort,
    builder: (column) => column,
  );

  GeneratedColumn<String> get source =>
      $composableBuilder(column: $table.source, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$ActivityLogsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ActivityLogsTable,
          ActivityLog,
          $$ActivityLogsTableFilterComposer,
          $$ActivityLogsTableOrderingComposer,
          $$ActivityLogsTableAnnotationComposer,
          $$ActivityLogsTableCreateCompanionBuilder,
          $$ActivityLogsTableUpdateCompanionBuilder,
          (
            ActivityLog,
            BaseReferences<_$AppDatabase, $ActivityLogsTable, ActivityLog>,
          ),
          ActivityLog,
          PrefetchHooks Function()
        > {
  $$ActivityLogsTableTableManager(_$AppDatabase db, $ActivityLogsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$ActivityLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$ActivityLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () =>
                  $$ActivityLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> userId = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<int?> durationMinutes = const Value.absent(),
                Value<int?> perceivedEffort = const Value.absent(),
                Value<String> source = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => ActivityLogsCompanion(
                id: id,
                userId: userId,
                type: type,
                title: title,
                durationMinutes: durationMinutes,
                perceivedEffort: perceivedEffort,
                source: source,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> userId = const Value.absent(),
                required String type,
                required String title,
                Value<int?> durationMinutes = const Value.absent(),
                Value<int?> perceivedEffort = const Value.absent(),
                Value<String> source = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => ActivityLogsCompanion.insert(
                id: id,
                userId: userId,
                type: type,
                title: title,
                durationMinutes: durationMinutes,
                perceivedEffort: perceivedEffort,
                source: source,
                createdAt: createdAt,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ActivityLogsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ActivityLogsTable,
      ActivityLog,
      $$ActivityLogsTableFilterComposer,
      $$ActivityLogsTableOrderingComposer,
      $$ActivityLogsTableAnnotationComposer,
      $$ActivityLogsTableCreateCompanionBuilder,
      $$ActivityLogsTableUpdateCompanionBuilder,
      (
        ActivityLog,
        BaseReferences<_$AppDatabase, $ActivityLogsTable, ActivityLog>,
      ),
      ActivityLog,
      PrefetchHooks Function()
    >;
typedef $$EmergencyEventsTableCreateCompanionBuilder =
    EmergencyEventsCompanion Function({
      Value<int> id,
      Value<int?> userId,
      Value<int?> dailyFlowId,
      required DateTime timestamp,
      required String type,
      Value<String?> contactCalled,
      Value<bool> smsSent,
      Value<String?> result,
      Value<DateTime> createdAt,
    });
typedef $$EmergencyEventsTableUpdateCompanionBuilder =
    EmergencyEventsCompanion Function({
      Value<int> id,
      Value<int?> userId,
      Value<int?> dailyFlowId,
      Value<DateTime> timestamp,
      Value<String> type,
      Value<String?> contactCalled,
      Value<bool> smsSent,
      Value<String?> result,
      Value<DateTime> createdAt,
    });

class $$EmergencyEventsTableFilterComposer
    extends Composer<_$AppDatabase, $EmergencyEventsTable> {
  $$EmergencyEventsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get dailyFlowId => $composableBuilder(
    column: $table.dailyFlowId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get contactCalled => $composableBuilder(
    column: $table.contactCalled,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get smsSent => $composableBuilder(
    column: $table.smsSent,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get result => $composableBuilder(
    column: $table.result,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$EmergencyEventsTableOrderingComposer
    extends Composer<_$AppDatabase, $EmergencyEventsTable> {
  $$EmergencyEventsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get dailyFlowId => $composableBuilder(
    column: $table.dailyFlowId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get contactCalled => $composableBuilder(
    column: $table.contactCalled,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get smsSent => $composableBuilder(
    column: $table.smsSent,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get result => $composableBuilder(
    column: $table.result,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$EmergencyEventsTableAnnotationComposer
    extends Composer<_$AppDatabase, $EmergencyEventsTable> {
  $$EmergencyEventsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<int> get dailyFlowId => $composableBuilder(
    column: $table.dailyFlowId,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get contactCalled => $composableBuilder(
    column: $table.contactCalled,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get smsSent =>
      $composableBuilder(column: $table.smsSent, builder: (column) => column);

  GeneratedColumn<String> get result =>
      $composableBuilder(column: $table.result, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$EmergencyEventsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $EmergencyEventsTable,
          EmergencyEvent,
          $$EmergencyEventsTableFilterComposer,
          $$EmergencyEventsTableOrderingComposer,
          $$EmergencyEventsTableAnnotationComposer,
          $$EmergencyEventsTableCreateCompanionBuilder,
          $$EmergencyEventsTableUpdateCompanionBuilder,
          (
            EmergencyEvent,
            BaseReferences<
              _$AppDatabase,
              $EmergencyEventsTable,
              EmergencyEvent
            >,
          ),
          EmergencyEvent,
          PrefetchHooks Function()
        > {
  $$EmergencyEventsTableTableManager(
    _$AppDatabase db,
    $EmergencyEventsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () =>
                  $$EmergencyEventsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$EmergencyEventsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => $$EmergencyEventsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> userId = const Value.absent(),
                Value<int?> dailyFlowId = const Value.absent(),
                Value<DateTime> timestamp = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<String?> contactCalled = const Value.absent(),
                Value<bool> smsSent = const Value.absent(),
                Value<String?> result = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => EmergencyEventsCompanion(
                id: id,
                userId: userId,
                dailyFlowId: dailyFlowId,
                timestamp: timestamp,
                type: type,
                contactCalled: contactCalled,
                smsSent: smsSent,
                result: result,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> userId = const Value.absent(),
                Value<int?> dailyFlowId = const Value.absent(),
                required DateTime timestamp,
                required String type,
                Value<String?> contactCalled = const Value.absent(),
                Value<bool> smsSent = const Value.absent(),
                Value<String?> result = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => EmergencyEventsCompanion.insert(
                id: id,
                userId: userId,
                dailyFlowId: dailyFlowId,
                timestamp: timestamp,
                type: type,
                contactCalled: contactCalled,
                smsSent: smsSent,
                result: result,
                createdAt: createdAt,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$EmergencyEventsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $EmergencyEventsTable,
      EmergencyEvent,
      $$EmergencyEventsTableFilterComposer,
      $$EmergencyEventsTableOrderingComposer,
      $$EmergencyEventsTableAnnotationComposer,
      $$EmergencyEventsTableCreateCompanionBuilder,
      $$EmergencyEventsTableUpdateCompanionBuilder,
      (
        EmergencyEvent,
        BaseReferences<_$AppDatabase, $EmergencyEventsTable, EmergencyEvent>,
      ),
      EmergencyEvent,
      PrefetchHooks Function()
    >;
typedef $$ExerciseVideoResourcesTableCreateCompanionBuilder =
    ExerciseVideoResourcesCompanion Function({
      Value<int> id,
      required String videoId,
      required String title,
      required String category,
      required String assetPath,
      required int estimatedDurationSeconds,
      Value<String> shortDescription,
      Value<String> tags,
      Value<bool> isAvailable,
    });
typedef $$ExerciseVideoResourcesTableUpdateCompanionBuilder =
    ExerciseVideoResourcesCompanion Function({
      Value<int> id,
      Value<String> videoId,
      Value<String> title,
      Value<String> category,
      Value<String> assetPath,
      Value<int> estimatedDurationSeconds,
      Value<String> shortDescription,
      Value<String> tags,
      Value<bool> isAvailable,
    });

class $$ExerciseVideoResourcesTableFilterComposer
    extends Composer<_$AppDatabase, $ExerciseVideoResourcesTable> {
  $$ExerciseVideoResourcesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get videoId => $composableBuilder(
    column: $table.videoId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get assetPath => $composableBuilder(
    column: $table.assetPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get estimatedDurationSeconds => $composableBuilder(
    column: $table.estimatedDurationSeconds,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get shortDescription => $composableBuilder(
    column: $table.shortDescription,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tags => $composableBuilder(
    column: $table.tags,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isAvailable => $composableBuilder(
    column: $table.isAvailable,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ExerciseVideoResourcesTableOrderingComposer
    extends Composer<_$AppDatabase, $ExerciseVideoResourcesTable> {
  $$ExerciseVideoResourcesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get videoId => $composableBuilder(
    column: $table.videoId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get assetPath => $composableBuilder(
    column: $table.assetPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get estimatedDurationSeconds => $composableBuilder(
    column: $table.estimatedDurationSeconds,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get shortDescription => $composableBuilder(
    column: $table.shortDescription,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tags => $composableBuilder(
    column: $table.tags,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isAvailable => $composableBuilder(
    column: $table.isAvailable,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ExerciseVideoResourcesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ExerciseVideoResourcesTable> {
  $$ExerciseVideoResourcesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get videoId =>
      $composableBuilder(column: $table.videoId, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get assetPath =>
      $composableBuilder(column: $table.assetPath, builder: (column) => column);

  GeneratedColumn<int> get estimatedDurationSeconds => $composableBuilder(
    column: $table.estimatedDurationSeconds,
    builder: (column) => column,
  );

  GeneratedColumn<String> get shortDescription => $composableBuilder(
    column: $table.shortDescription,
    builder: (column) => column,
  );

  GeneratedColumn<String> get tags =>
      $composableBuilder(column: $table.tags, builder: (column) => column);

  GeneratedColumn<bool> get isAvailable => $composableBuilder(
    column: $table.isAvailable,
    builder: (column) => column,
  );
}

class $$ExerciseVideoResourcesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ExerciseVideoResourcesTable,
          ExerciseVideoResource,
          $$ExerciseVideoResourcesTableFilterComposer,
          $$ExerciseVideoResourcesTableOrderingComposer,
          $$ExerciseVideoResourcesTableAnnotationComposer,
          $$ExerciseVideoResourcesTableCreateCompanionBuilder,
          $$ExerciseVideoResourcesTableUpdateCompanionBuilder,
          (
            ExerciseVideoResource,
            BaseReferences<
              _$AppDatabase,
              $ExerciseVideoResourcesTable,
              ExerciseVideoResource
            >,
          ),
          ExerciseVideoResource,
          PrefetchHooks Function()
        > {
  $$ExerciseVideoResourcesTableTableManager(
    _$AppDatabase db,
    $ExerciseVideoResourcesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$ExerciseVideoResourcesTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer:
              () => $$ExerciseVideoResourcesTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => $$ExerciseVideoResourcesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> videoId = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> category = const Value.absent(),
                Value<String> assetPath = const Value.absent(),
                Value<int> estimatedDurationSeconds = const Value.absent(),
                Value<String> shortDescription = const Value.absent(),
                Value<String> tags = const Value.absent(),
                Value<bool> isAvailable = const Value.absent(),
              }) => ExerciseVideoResourcesCompanion(
                id: id,
                videoId: videoId,
                title: title,
                category: category,
                assetPath: assetPath,
                estimatedDurationSeconds: estimatedDurationSeconds,
                shortDescription: shortDescription,
                tags: tags,
                isAvailable: isAvailable,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String videoId,
                required String title,
                required String category,
                required String assetPath,
                required int estimatedDurationSeconds,
                Value<String> shortDescription = const Value.absent(),
                Value<String> tags = const Value.absent(),
                Value<bool> isAvailable = const Value.absent(),
              }) => ExerciseVideoResourcesCompanion.insert(
                id: id,
                videoId: videoId,
                title: title,
                category: category,
                assetPath: assetPath,
                estimatedDurationSeconds: estimatedDurationSeconds,
                shortDescription: shortDescription,
                tags: tags,
                isAvailable: isAvailable,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ExerciseVideoResourcesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ExerciseVideoResourcesTable,
      ExerciseVideoResource,
      $$ExerciseVideoResourcesTableFilterComposer,
      $$ExerciseVideoResourcesTableOrderingComposer,
      $$ExerciseVideoResourcesTableAnnotationComposer,
      $$ExerciseVideoResourcesTableCreateCompanionBuilder,
      $$ExerciseVideoResourcesTableUpdateCompanionBuilder,
      (
        ExerciseVideoResource,
        BaseReferences<
          _$AppDatabase,
          $ExerciseVideoResourcesTable,
          ExerciseVideoResource
        >,
      ),
      ExerciseVideoResource,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UserProfilesTableTableManager get userProfiles =>
      $$UserProfilesTableTableManager(_db, _db.userProfiles);
  $$EmergencyContactsTableTableManager get emergencyContacts =>
      $$EmergencyContactsTableTableManager(_db, _db.emergencyContacts);
  $$DailyFlowsTableTableManager get dailyFlows =>
      $$DailyFlowsTableTableManager(_db, _db.dailyFlows);
  $$ChecklistItemsTableTableManager get checklistItems =>
      $$ChecklistItemsTableTableManager(_db, _db.checklistItems);
  $$RoutineBlocksTableTableManager get routineBlocks =>
      $$RoutineBlocksTableTableManager(_db, _db.routineBlocks);
  $$RoutineTasksTableTableManager get routineTasks =>
      $$RoutineTasksTableTableManager(_db, _db.routineTasks);
  $$ExerciseFeedbacksTableTableManager get exerciseFeedbacks =>
      $$ExerciseFeedbacksTableTableManager(_db, _db.exerciseFeedbacks);
  $$SymptomChecksTableTableManager get symptomChecks =>
      $$SymptomChecksTableTableManager(_db, _db.symptomChecks);
  $$BreathlessnessEpisodesTableTableManager get breathlessnessEpisodes =>
      $$BreathlessnessEpisodesTableTableManager(
        _db,
        _db.breathlessnessEpisodes,
      );
  $$RescueInhalerUsesTableTableManager get rescueInhalerUses =>
      $$RescueInhalerUsesTableTableManager(_db, _db.rescueInhalerUses);
  $$FunctionalTestsTableTableManager get functionalTests =>
      $$FunctionalTestsTableTableManager(_db, _db.functionalTests);
  $$ActivityLogsTableTableManager get activityLogs =>
      $$ActivityLogsTableTableManager(_db, _db.activityLogs);
  $$EmergencyEventsTableTableManager get emergencyEvents =>
      $$EmergencyEventsTableTableManager(_db, _db.emergencyEvents);
  $$ExerciseVideoResourcesTableTableManager get exerciseVideoResources =>
      $$ExerciseVideoResourcesTableTableManager(
        _db,
        _db.exerciseVideoResources,
      );
}
