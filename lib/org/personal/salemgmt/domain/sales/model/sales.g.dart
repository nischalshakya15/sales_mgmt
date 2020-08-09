// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sales _$SalesFromJson(Map<String, dynamic> json) {
  return Sales(
    goodsId: json['goodsId'] as String,
    description: json['description'] as String,
    pricePerUnit: (json['pricePerUnit'] as num)?.toDouble(),
    quantity: json['quantity'] as int,
    totalSales: (json['totalSales'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$SalesToJson(Sales instance) => <String, dynamic>{
      'goodsId': instance.goodsId,
      'description': instance.description,
      'pricePerUnit': instance.pricePerUnit,
      'quantity': instance.quantity,
      'totalSales': instance.totalSales,
    };
