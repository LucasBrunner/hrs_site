// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'inventory.dart';

class InventoryItemMapper extends ClassMapperBase<InventoryItem> {
  InventoryItemMapper._();
  static InventoryItemMapper? _instance;
  static InventoryItemMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = InventoryItemMapper._());
      OptionInternallyTaggedMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'InventoryItem';

  static double _$cost(InventoryItem v) => v.cost;
  static const Field<InventoryItem, double> _f$cost = Field('cost', _$cost);
  static double _$listPrice(InventoryItem v) => v.listPrice;
  static const Field<InventoryItem, double> _f$listPrice =
      Field('listPrice', _$listPrice);
  static int _$brandId(InventoryItem v) => v.brandId;
  static const Field<InventoryItem, int> _f$brandId =
      Field('brandId', _$brandId);
  static String _$brandName(InventoryItem v) => v.brandName;
  static const Field<InventoryItem, String> _f$brandName =
      Field('brandName', _$brandName);
  static String _$model(InventoryItem v) => v.model;
  static const Field<InventoryItem, String> _f$model = Field('model', _$model);
  static OptionInternallyTagged<String> _$description(InventoryItem v) =>
      v.description;
  static const Field<InventoryItem, OptionInternallyTagged<String>>
      _f$description = Field('description', _$description);
  static OptionInternallyTagged<String> _$imageUrl(InventoryItem v) =>
      v.imageUrl;
  static const Field<InventoryItem, OptionInternallyTagged<String>>
      _f$imageUrl = Field('imageUrl', _$imageUrl);

  @override
  final Map<Symbol, Field<InventoryItem, dynamic>> fields = const {
    #cost: _f$cost,
    #listPrice: _f$listPrice,
    #brandId: _f$brandId,
    #brandName: _f$brandName,
    #model: _f$model,
    #description: _f$description,
    #imageUrl: _f$imageUrl,
  };

  static InventoryItem _instantiate(DecodingData data) {
    return InventoryItem(
        data.dec(_f$cost),
        data.dec(_f$listPrice),
        data.dec(_f$brandId),
        data.dec(_f$brandName),
        data.dec(_f$model),
        data.dec(_f$description),
        data.dec(_f$imageUrl));
  }

  @override
  final Function instantiate = _instantiate;

  static InventoryItem fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<InventoryItem>(map));
  }

  static InventoryItem fromJson(String json) {
    return _guard((c) => c.fromJson<InventoryItem>(json));
  }
}

mixin InventoryItemMappable {
  String toJson() {
    return InventoryItemMapper._guard((c) => c.toJson(this as InventoryItem));
  }

  Map<String, dynamic> toMap() {
    return InventoryItemMapper._guard((c) => c.toMap(this as InventoryItem));
  }
}
