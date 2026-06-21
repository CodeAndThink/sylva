// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_record.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetHistoryRecordCollection on Isar {
  IsarCollection<HistoryRecord> get historyRecords => this.collection();
}

const HistoryRecordSchema = CollectionSchema(
  name: r'HistoryRecord',
  id: -4305771715677521449,
  properties: {
    r'createdAt': PropertySchema(
      id: 0,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'imagePath': PropertySchema(
      id: 1,
      name: r'imagePath',
      type: IsarType.string,
    ),
    r'selectedColor': PropertySchema(
      id: 2,
      name: r'selectedColor',
      type: IsarType.long,
    ),
    r'userColors': PropertySchema(
      id: 3,
      name: r'userColors',
      type: IsarType.longList,
    ),
  },

  estimateSize: _historyRecordEstimateSize,
  serialize: _historyRecordSerialize,
  deserialize: _historyRecordDeserialize,
  deserializeProp: _historyRecordDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},

  getId: _historyRecordGetId,
  getLinks: _historyRecordGetLinks,
  attach: _historyRecordAttach,
  version: '3.3.2',
);

int _historyRecordEstimateSize(
  HistoryRecord object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.imagePath.length * 3;
  bytesCount += 3 + object.userColors.length * 8;
  return bytesCount;
}

void _historyRecordSerialize(
  HistoryRecord object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createdAt);
  writer.writeString(offsets[1], object.imagePath);
  writer.writeLong(offsets[2], object.selectedColor);
  writer.writeLongList(offsets[3], object.userColors);
}

HistoryRecord _historyRecordDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = HistoryRecord(
    createdAt: reader.readDateTime(offsets[0]),
    imagePath: reader.readString(offsets[1]),
    selectedColor: reader.readLongOrNull(offsets[2]),
    userColors: reader.readLongList(offsets[3]) ?? [],
  );
  object.id = id;
  return object;
}

P _historyRecordDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readLongList(offset) ?? []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _historyRecordGetId(HistoryRecord object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _historyRecordGetLinks(HistoryRecord object) {
  return [];
}

void _historyRecordAttach(
  IsarCollection<dynamic> col,
  Id id,
  HistoryRecord object,
) {
  object.id = id;
}

extension HistoryRecordQueryWhereSort
    on QueryBuilder<HistoryRecord, HistoryRecord, QWhere> {
  QueryBuilder<HistoryRecord, HistoryRecord, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension HistoryRecordQueryWhere
    on QueryBuilder<HistoryRecord, HistoryRecord, QWhereClause> {
  QueryBuilder<HistoryRecord, HistoryRecord, QAfterWhereClause> idEqualTo(
    Id id,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<HistoryRecord, HistoryRecord, QAfterWhereClause> idNotEqualTo(
    Id id,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<HistoryRecord, HistoryRecord, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<HistoryRecord, HistoryRecord, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<HistoryRecord, HistoryRecord, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerId,
          includeLower: includeLower,
          upper: upperId,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension HistoryRecordQueryFilter
    on QueryBuilder<HistoryRecord, HistoryRecord, QFilterCondition> {
  QueryBuilder<HistoryRecord, HistoryRecord, QAfterFilterCondition>
  createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'createdAt', value: value),
      );
    });
  }

  QueryBuilder<HistoryRecord, HistoryRecord, QAfterFilterCondition>
  createdAtGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'createdAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<HistoryRecord, HistoryRecord, QAfterFilterCondition>
  createdAtLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'createdAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<HistoryRecord, HistoryRecord, QAfterFilterCondition>
  createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'createdAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<HistoryRecord, HistoryRecord, QAfterFilterCondition> idEqualTo(
    Id value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<HistoryRecord, HistoryRecord, QAfterFilterCondition>
  idGreaterThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<HistoryRecord, HistoryRecord, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<HistoryRecord, HistoryRecord, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'id',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<HistoryRecord, HistoryRecord, QAfterFilterCondition>
  imagePathEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'imagePath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<HistoryRecord, HistoryRecord, QAfterFilterCondition>
  imagePathGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'imagePath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<HistoryRecord, HistoryRecord, QAfterFilterCondition>
  imagePathLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'imagePath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<HistoryRecord, HistoryRecord, QAfterFilterCondition>
  imagePathBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'imagePath',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<HistoryRecord, HistoryRecord, QAfterFilterCondition>
  imagePathStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'imagePath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<HistoryRecord, HistoryRecord, QAfterFilterCondition>
  imagePathEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'imagePath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<HistoryRecord, HistoryRecord, QAfterFilterCondition>
  imagePathContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'imagePath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<HistoryRecord, HistoryRecord, QAfterFilterCondition>
  imagePathMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'imagePath',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<HistoryRecord, HistoryRecord, QAfterFilterCondition>
  imagePathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'imagePath', value: ''),
      );
    });
  }

  QueryBuilder<HistoryRecord, HistoryRecord, QAfterFilterCondition>
  imagePathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'imagePath', value: ''),
      );
    });
  }

  QueryBuilder<HistoryRecord, HistoryRecord, QAfterFilterCondition>
  selectedColorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'selectedColor'),
      );
    });
  }

  QueryBuilder<HistoryRecord, HistoryRecord, QAfterFilterCondition>
  selectedColorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'selectedColor'),
      );
    });
  }

  QueryBuilder<HistoryRecord, HistoryRecord, QAfterFilterCondition>
  selectedColorEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'selectedColor', value: value),
      );
    });
  }

  QueryBuilder<HistoryRecord, HistoryRecord, QAfterFilterCondition>
  selectedColorGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'selectedColor',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<HistoryRecord, HistoryRecord, QAfterFilterCondition>
  selectedColorLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'selectedColor',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<HistoryRecord, HistoryRecord, QAfterFilterCondition>
  selectedColorBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'selectedColor',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<HistoryRecord, HistoryRecord, QAfterFilterCondition>
  userColorsElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'userColors', value: value),
      );
    });
  }

  QueryBuilder<HistoryRecord, HistoryRecord, QAfterFilterCondition>
  userColorsElementGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'userColors',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<HistoryRecord, HistoryRecord, QAfterFilterCondition>
  userColorsElementLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'userColors',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<HistoryRecord, HistoryRecord, QAfterFilterCondition>
  userColorsElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'userColors',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<HistoryRecord, HistoryRecord, QAfterFilterCondition>
  userColorsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'userColors', length, true, length, true);
    });
  }

  QueryBuilder<HistoryRecord, HistoryRecord, QAfterFilterCondition>
  userColorsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'userColors', 0, true, 0, true);
    });
  }

  QueryBuilder<HistoryRecord, HistoryRecord, QAfterFilterCondition>
  userColorsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'userColors', 0, false, 999999, true);
    });
  }

  QueryBuilder<HistoryRecord, HistoryRecord, QAfterFilterCondition>
  userColorsLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'userColors', 0, true, length, include);
    });
  }

  QueryBuilder<HistoryRecord, HistoryRecord, QAfterFilterCondition>
  userColorsLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'userColors', length, include, 999999, true);
    });
  }

  QueryBuilder<HistoryRecord, HistoryRecord, QAfterFilterCondition>
  userColorsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'userColors',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension HistoryRecordQueryObject
    on QueryBuilder<HistoryRecord, HistoryRecord, QFilterCondition> {}

extension HistoryRecordQueryLinks
    on QueryBuilder<HistoryRecord, HistoryRecord, QFilterCondition> {}

extension HistoryRecordQuerySortBy
    on QueryBuilder<HistoryRecord, HistoryRecord, QSortBy> {
  QueryBuilder<HistoryRecord, HistoryRecord, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<HistoryRecord, HistoryRecord, QAfterSortBy>
  sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<HistoryRecord, HistoryRecord, QAfterSortBy> sortByImagePath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imagePath', Sort.asc);
    });
  }

  QueryBuilder<HistoryRecord, HistoryRecord, QAfterSortBy>
  sortByImagePathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imagePath', Sort.desc);
    });
  }

  QueryBuilder<HistoryRecord, HistoryRecord, QAfterSortBy>
  sortBySelectedColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'selectedColor', Sort.asc);
    });
  }

  QueryBuilder<HistoryRecord, HistoryRecord, QAfterSortBy>
  sortBySelectedColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'selectedColor', Sort.desc);
    });
  }
}

extension HistoryRecordQuerySortThenBy
    on QueryBuilder<HistoryRecord, HistoryRecord, QSortThenBy> {
  QueryBuilder<HistoryRecord, HistoryRecord, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<HistoryRecord, HistoryRecord, QAfterSortBy>
  thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<HistoryRecord, HistoryRecord, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<HistoryRecord, HistoryRecord, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<HistoryRecord, HistoryRecord, QAfterSortBy> thenByImagePath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imagePath', Sort.asc);
    });
  }

  QueryBuilder<HistoryRecord, HistoryRecord, QAfterSortBy>
  thenByImagePathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imagePath', Sort.desc);
    });
  }

  QueryBuilder<HistoryRecord, HistoryRecord, QAfterSortBy>
  thenBySelectedColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'selectedColor', Sort.asc);
    });
  }

  QueryBuilder<HistoryRecord, HistoryRecord, QAfterSortBy>
  thenBySelectedColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'selectedColor', Sort.desc);
    });
  }
}

extension HistoryRecordQueryWhereDistinct
    on QueryBuilder<HistoryRecord, HistoryRecord, QDistinct> {
  QueryBuilder<HistoryRecord, HistoryRecord, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<HistoryRecord, HistoryRecord, QDistinct> distinctByImagePath({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'imagePath', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<HistoryRecord, HistoryRecord, QDistinct>
  distinctBySelectedColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'selectedColor');
    });
  }

  QueryBuilder<HistoryRecord, HistoryRecord, QDistinct> distinctByUserColors() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userColors');
    });
  }
}

extension HistoryRecordQueryProperty
    on QueryBuilder<HistoryRecord, HistoryRecord, QQueryProperty> {
  QueryBuilder<HistoryRecord, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<HistoryRecord, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<HistoryRecord, String, QQueryOperations> imagePathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'imagePath');
    });
  }

  QueryBuilder<HistoryRecord, int?, QQueryOperations> selectedColorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'selectedColor');
    });
  }

  QueryBuilder<HistoryRecord, List<int>, QQueryOperations>
  userColorsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userColors');
    });
  }
}
