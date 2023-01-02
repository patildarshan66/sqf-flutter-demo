import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqlf_demo/routes/route_strings.dart';
import 'package:sqlf_demo/routes/routes.dart';
import 'package:sqlf_demo/sqfLite/sqf_lite_operations.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final sqfController = Get.put(SQFLiteOperations());
  @override
  void initState(){
    sqfController.openDB(addressTableName);
    super.initState();
  }

  @override
  void dispose() async {
    await sqfController.closeDB();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: RoutePath.initialRoute,
      onGenerateRoute: AppRoutes().generateRoute,
    );
  }
}