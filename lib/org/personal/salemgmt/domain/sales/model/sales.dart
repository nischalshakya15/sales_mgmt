import 'package:json_annotation/json_annotation.dart';

part 'sales.g.dart';

@JsonSerializable()
class Sales {
  String goodsId;
  String description;
  double pricePerUnit;
  int quantity;
  double totalSales;

  Sales(
      {this.goodsId,
      this.description,
      this.pricePerUnit,
      this.quantity,
      this.totalSales});

  factory Sales.fromJson(
      Map<String, dynamic> authenticationRequest) =>
      _$SalesFromJson(authenticationRequest);

  Map<String, dynamic> toJson() => _$SalesToJson(this);

  @override
  String toString() {
    return 'Sales{goodsId: $goodsId, description: $description, pricePerUnit: $pricePerUnit, quantity: $quantity, totalSales: $totalSales}';
  }
}
