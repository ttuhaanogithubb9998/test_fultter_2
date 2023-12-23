import 'package:flutter_app/domain.dart';
import 'package:flutter_app/supplier.dart';
import 'package:http/http.dart' as http;

class Repository {
  Repository._();
  factory Repository() => Repository._();

  Future<List<Supplier>> getAll() async {
    final res = await http.get(Uri.parse("$apidomain/suppliers.json"));
    return Supplier.fromJsonToList(res.body);
  }
}
