// ignore_for_file: unrelated_type_equality_checks

import 'package:apiv5/Data/services.dart';
import 'package:apiv5/Model/model.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GetEvent event = GetEvent();
  late List<Tarihtebugun> data;

  Future<void> getData() async {
    data = await event.getEvent();
    print(data);
  }

  @override
  void initState() {
    event.getEvent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Deneme Api"),
        ),
        body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext context, index) {
                  return ListTile(
                    title: Text(data[index].olay!),
                    subtitle: Text(data[index].durum!),
                    leading: Text(data[index].gun!),
                  );
                },
              );
            }
            return const Center();
          },
        ),
      ),
    );
  }
}
