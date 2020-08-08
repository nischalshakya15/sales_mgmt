import 'dart:ffi';

class Sales {
  String goodsId;
  String description;
  Double pricePerUnit;
  int quantity;
  Double totalSales;

  Sales(
      {this.goodsId,
      this.description,
      this.pricePerUnit,
      this.quantity,
      this.totalSales});
}
