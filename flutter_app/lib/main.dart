import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_app/repository.dart';
import 'package:flutter_app/supplier.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<StatefulWidget> createState() => _StateMainApp();
}

class _StateMainApp extends State<MainApp> {
  final Repository repository = Repository();
  List<Supplier>? suppliers;

  void get() async {
    suppliers = await repository.getAll();
    setState(() {});
  }

  @override
  void initState() {
    get();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(title: const Text("Main App")),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: suppliers == null
                ? const Text("loading...")
                : suppliers!.isEmpty
                    ? const Text("Empty")
                    : ListView.separated(
                        itemBuilder: (ctx, index) => Row(children: [
                              Text(suppliers![index].name),
                              Text(suppliers![index].address),
                              Text(suppliers![index].id.toString()),
                              Text(suppliers![index].phone),
                            ]),
                        separatorBuilder: (ctx, index) => const Divider(
                              thickness: 1.2,
                            ),
                        itemCount: suppliers!.length),
          ),
        ));
  }
}
