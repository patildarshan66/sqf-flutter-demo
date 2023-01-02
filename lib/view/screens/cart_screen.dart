import 'package:flutter/material.dart';

import '../../utils/custom_text_styles.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 2,
        centerTitle: true,
        title: const Text('Cart'),
      ),
      body: Center(
        child: Text(
          'Cart content here',
          style: subTitle2_14ptRegular(),
        ),
      ),
    );
  }
}
