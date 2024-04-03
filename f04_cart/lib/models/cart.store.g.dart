// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CartModelX on _CartModelX, Store {
  Computed<CatalogModel>? _$catalogComputed;

  @override
  CatalogModel get catalog =>
      (_$catalogComputed ??= Computed<CatalogModel>(() => super.catalog,
              name: '_CartModelX.catalog'))
          .value;
  Computed<List<Item>>? _$itemsComputed;

  @override
  List<Item> get items => (_$itemsComputed ??=
          Computed<List<Item>>(() => super.items, name: '_CartModelX.items'))
      .value;
  Computed<int>? _$totalPriceComputed;

  @override
  int get totalPrice => (_$totalPriceComputed ??=
          Computed<int>(() => super.totalPrice, name: '_CartModelX.totalPrice'))
      .value;

  late final _$_itemIdsAtom =
      Atom(name: '_CartModelX._itemIds', context: context);

  @override
  ObservableList<int> get _itemIds {
    _$_itemIdsAtom.reportRead();
    return super._itemIds;
  }

  @override
  set _itemIds(ObservableList<int> value) {
    _$_itemIdsAtom.reportWrite(value, super._itemIds, () {
      super._itemIds = value;
    });
  }

  late final _$_CartModelXActionController =
      ActionController(name: '_CartModelX', context: context);

  @override
  void add(Item item) {
    final _$actionInfo =
        _$_CartModelXActionController.startAction(name: '_CartModelX.add');
    try {
      return super.add(item);
    } finally {
      _$_CartModelXActionController.endAction(_$actionInfo);
    }
  }

  @override
  void remove(Item item) {
    final _$actionInfo =
        _$_CartModelXActionController.startAction(name: '_CartModelX.remove');
    try {
      return super.remove(item);
    } finally {
      _$_CartModelXActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
catalog: ${catalog},
items: ${items},
totalPrice: ${totalPrice}
    ''';
  }
}
