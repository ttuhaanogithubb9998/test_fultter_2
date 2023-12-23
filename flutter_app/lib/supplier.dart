import 'dart:convert';

class Supplier {
  final int id;
  final String name;
  final String phone;
  final String address;

  Supplier(
      {required this.id,
      required this.name,
      required this.phone,
      required this.address});

  static List<Supplier> fromJsonToList(String jsonString) {
    List<dynamic> list = json.decode(jsonString);
    print(list);
    if (list.isEmpty) {
      return List.empty();
    }
    return list
        .map((e) => Supplier(
            id: e['id'],
            name: e['name'],
            phone: e['phone'],
            address: e['address']))
        .toList();
  }
}
