import 'package:flutter/material.dart';

class ItemsUploadScreen extends StatefulWidget {
  const ItemsUploadScreen({Key? key}) : super(key: key);

  @override
  State<ItemsUploadScreen> createState() => _ItemsUploadScreenState();
}

class _ItemsUploadScreenState extends State<ItemsUploadScreen> {

  //Upload form Screen
  Widget uploadFormScreen(){
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          "Upload new Items",
          style: TextStyle(
            color: Colors.white
          ),
        ),
        centerTitle: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
