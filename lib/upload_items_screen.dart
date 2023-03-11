import 'package:flutter/material.dart';

class ItemsUploadScreen extends StatefulWidget {

  @override
  State<ItemsUploadScreen> createState() => _ItemsUploadScreenState();
}

class _ItemsUploadScreenState extends State<ItemsUploadScreen> {

  //Upload form Screen
  Widget uploadFormScreen(){
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Upload new Items",
          style: TextStyle(
            color: Colors.white
          ),
        ),
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return uploadFormScreen();
  }
}
