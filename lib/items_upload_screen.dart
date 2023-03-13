import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ItemsUploadScreen extends StatefulWidget {

  @override
  State<ItemsUploadScreen> createState() => _ItemsUploadScreenState();
}

class _ItemsUploadScreenState extends State<ItemsUploadScreen> {

  Uint8List? imageFileUint8list;
  bool isUploading = false;
  TextEditingController sellerNameTextEditingController = TextEditingController();
  TextEditingController sellerPhoneTextEditingController = TextEditingController();
  TextEditingController itemNameTextEditingController = TextEditingController();
  TextEditingController itemDescriptionTextEditingController = TextEditingController();
  TextEditingController itemPriceTextEditingController = TextEditingController();

  //Upload form Screen when the app is running
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
        actions: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: IconButton(
                onPressed: (){

                },
                icon: const Icon(
                  Icons.cloud_upload_outlined,
                  color: Colors.white,
                )
            ),
          ),
        ],
        centerTitle: true,
      ),
      body: ListView(
        children: [

          isUploading == true
              ? const LinearProgressIndicator(color: Colors.deepPurpleAccent,)
              : Container(),

          //Image
          SizedBox(
            height: 230,
            width: MediaQuery.of(context).size.width * 0.8,
            child: Center(
              child: imageFileUint8list != null
                  ? Image.memory(imageFileUint8list!)
                  : const Icon(
                Icons.image_not_supported_outlined,
                color: Colors.redAccent,
                size: 50,
              ),
            ),
          ),
          const Divider(
            color: Colors.white70,
            thickness: 2,
          ),

          //Sellar Name
          ListTile(
            leading: const Icon(
              Icons.person_pin_rounded,
              color: Colors.white,
            ),
            title: SizedBox(
              width: 250,
              child: TextField(
                style: const TextStyle(
                    color: Colors.grey
                ),
                controller: sellerNameTextEditingController,
                decoration: const InputDecoration(
                  hintText: "Seller name",
                  hintStyle: TextStyle(
                    color: Colors.grey
                  ),
                  border: InputBorder.none
                ),
              ),
            ),
          ),
          const Divider(
            color: Colors.white70,
            thickness: 1,
          ),

          //Sellar Phone
          ListTile(
            leading: const Icon(
              Icons.phone,
              color: Colors.white,
            ),
            title: SizedBox(
              width: 250,
              child: TextField(
                style: const TextStyle(
                    color: Colors.grey
                ),
                controller: sellerPhoneTextEditingController,
                decoration: const InputDecoration(
                    hintText: "Seller Phone Number",
                    hintStyle: TextStyle(
                        color: Colors.grey
                    ),
                    border: InputBorder.none
                ),
              ),
            ),
          ),
          const Divider(
            color: Colors.white70,
            thickness: 1,
          ),

          //Item Name
          ListTile(
            leading: const Icon(
              Icons.title,
              color: Colors.white,
            ),
            title: SizedBox(
              width: 250,
              child: TextField(
                style: const TextStyle(
                    color: Colors.grey
                ),
                controller: itemNameTextEditingController,
                decoration: const InputDecoration(
                    hintText: "Item Name",
                    hintStyle: TextStyle(
                        color: Colors.grey
                    ),
                    border: InputBorder.none
                ),
              ),
            ),
          ),
          const Divider(
            color: Colors.white70,
            thickness: 1,
          ),

          //Item description
          ListTile(
            leading: const Icon(
              Icons.format_align_left,
              color: Colors.white,
            ),
            title: SizedBox(
              width: 250,
              child: TextField(
                style: const TextStyle(
                    color: Colors.grey
                ),
                controller: itemDescriptionTextEditingController,
                decoration: const InputDecoration(
                    hintText: "Item Description",
                    hintStyle: TextStyle(
                        color: Colors.grey
                    ),
                    border: InputBorder.none
                ),
              ),
            ),
          ),
          const Divider(
            color: Colors.white70,
            thickness: 1,
          ),

          //Item Price
          ListTile(
            leading: const Icon(
              Icons.monetization_on,
              color: Colors.white,
            ),
            title: SizedBox(
              width: 250,
              child: TextField(
                style: const TextStyle(
                    color: Colors.grey
                ),
                controller: itemPriceTextEditingController,
                decoration: const InputDecoration(
                    hintText: "The Price of the Item",
                    hintStyle: TextStyle(
                        color: Colors.grey
                    ),
                    border: InputBorder.none
                ),
              ),
            ),
          ),
          const Divider(
            color: Colors.white70,
            thickness: 1,
          ),

        ],
      ),
    );
  }

  //Default form screen when the app is running
  Widget defaultScreen(){
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Upload new Item",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.add_photo_alternate,
              color: Colors.white,
              size: 200,
            ),
            ElevatedButton(
                onPressed: (){
                  showDialogBox();
                },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.cyan
              ),
                child: const Text(
                  "Add New Item",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }

  //load Dialog Box in the app
  showDialogBox(){
    return showDialog(
        context: context,
        builder: (c){
          return SimpleDialog(
            backgroundColor: Colors.black,
            title: const Text(
                "Load Image...",
              style: TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.bold
              ),
            ),
            children: [
              SimpleDialogOption(
                onPressed: (){
                  captureImageWithPhoneCamera();
                },
                child: const Text(
                  "Capture Image with Camera",
                  style: TextStyle(
                    color: Colors.deepPurpleAccent
                  ),
                ),
              ),
              SimpleDialogOption(
                onPressed: (){
                  chooseImageFromPhoneGallery();
                },
                child: const Text(
                  "Load Image from the Gallery",
                  style: TextStyle(
                      color: Colors.deepPurpleAccent
                  ),
                ),
              ),
              SimpleDialogOption(
                onPressed: (){
                  Navigator.pop(context);
                },
                child: const Text(
                  "Cancel",
                  style: TextStyle(
                      color: Colors.deepPurpleAccent
                  ),
                ),
              ),
            ],
          );
        }
    );
  }

  //Use phone camera to load images to the app
  captureImageWithPhoneCamera() async {
    Navigator.pop(context);
    try{
      final pickedImage = await ImagePicker().pickImage(source: ImageSource.camera);
      if(pickedImage != null){
        String imagePath = pickedImage.path;
        imageFileUint8list = await pickedImage.readAsBytes();

        //Remove the background from image
        //Make the image transparent

        setState(() {
          imageFileUint8list;
        });

      }
    }
    catch(errorMsg){
      print(errorMsg.toString());
      setState(() {
        imageFileUint8list = null;
      });
    }

  }

  //Load images from the gallery
  chooseImageFromPhoneGallery() async{
    Navigator.pop(context);
    try{
      final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
      if(pickedImage != null){
        String imagePath = pickedImage.path;
        imageFileUint8list = await pickedImage.readAsBytes();

        //Remove the background from image
        //Make the image transparent

        setState(() {
          imageFileUint8list;
        });

      }
    }
    catch(errorMsg){
      print(errorMsg.toString());
      setState(() {
        imageFileUint8list = null;
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return imageFileUint8list == null ? defaultScreen() : uploadFormScreen();
  }
}
