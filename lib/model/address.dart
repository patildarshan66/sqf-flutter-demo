class Address {
  Address({
    required this.address,
    required this.pincode,
    required this.number,
    required this.landmark,
    required this.name,
    this.id,
  });

  final String address;
  final String pincode;
  final String number;
  final String landmark;
  final String name;
  final int? id;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    address: json["address"]  ?? '',
    pincode: json["pincode"] ?? '',
    number: json["number"] ?? '',
    landmark: json["landmark"] ?? '',
    name: json["name"] ?? '',
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "address": address,
    "pincode": pincode,
    "number": number,
    "landmark": landmark,
    "name": name,
    "id":id
  };
}
