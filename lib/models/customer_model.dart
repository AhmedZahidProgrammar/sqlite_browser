import 'dart:convert';

class CustomerModel{
  String name;
  String id;
  CustomerModel({
    required this.name,
    required this.id
});
  factory CustomerModel.fromJson(Map<dynamic,dynamic> json){
    return CustomerModel(name: json['name'], id: json['id']);
  }
  factory CustomerModel.fromRawJson(String str) => CustomerModel.fromJson(json.decode(str));
  String toRawJson() => json.encode(toJson());
  Map<String, dynamic> toJson() => {
    "id":id,
    "name":name,
  };
}