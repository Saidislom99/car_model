// "data": [
// {
// "id": 1,
// "car_model": "Honda",
// "average_price": 200000,
// "logo": "https://www.carlogos.org/car-logos/honda-logo-1700x1150.png",
// "established_year": 1949
// },
// {
// "id": 2,
// "car_model": "Toyota",
// "average_price": 300000,
// "logo": "https://www.pngall.com/wp-content/uploads/2016/04/Toyota-Logo-Free-Download-PNG.png",
// "established_year": 1918
// },

import 'package:json_annotation/json_annotation.dart';




part 'cars_mod.g.dart';

@JsonSerializable()
class Cars {
  @JsonKey(defaultValue: 0, name: 'id')
  int id;

  @JsonKey(defaultValue: '', name: 'car_model')
  String carModel;

  @JsonKey(defaultValue: 0, name: 'average_price')
  int averagePrice;

  @JsonKey(defaultValue: '', name: 'logo')
  String logo;

  @JsonKey(defaultValue: 0, name: 'established_year')
  int establishedYear;

  @JsonKey(defaultValue: "", name: "description")
  String description;

  @JsonKey(defaultValue: [], name: "car_pics")
  List<String> carPics;




  Cars({
   required this.id,
    required this.averagePrice,
    required this.carModel,
    required this.establishedYear,
    required this.logo,
    required this.description,
    required this.carPics
  });

  factory Cars.fromJson(Map<String, dynamic> json) =>
      _$CarsFromJson(json);

  Map<String, dynamic> toJson() => _$CarsToJson(this);
}







