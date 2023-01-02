import 'package:flutter/material.dart';
import 'package:sqlf_demo/utils/custom_text_styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 2,
        centerTitle: true,
        title: const Text('Home'),
      ),
      body: Center(
        child: Text(
          'Home content here',
          style: subTitle2_14ptRegular(),
        ),
      ),
    );
  }
}
