import 'package:flutter/material.dart';

import '../../utils/custom_text_styles.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 2,
        centerTitle: true,
        title: const Text('Explore'),
      ),
      body: Center(
        child: Text(
          'Explore content here',
          style: subTitle2_14ptRegular(),
        ),
      ),
    );
  }
}
