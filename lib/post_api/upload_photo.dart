import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UploadPhoto extends StatefulWidget {
  const UploadPhoto({super.key});

  @override
  State<UploadPhoto> createState() => _UploadPhotoState();
}

class _UploadPhotoState extends State<UploadPhoto> {
  File? image;

  final _picker = ImagePicker();
  bool showSpinner = false;

  Future getImage() async {
    final pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (pickedFile != null) {
      image = File(pickedFile.path);
      setState(() {
      });
    } else {
      print('No image');
    }
  }

  Future<void> uploadImage() async {
setState(() {
  showSpinner= true;
});

       var stream = new http.ByteStream(image!.openRead()) ;
       stream.cast();

       var length= await image!.length();
       
       var uri = Uri.parse('https://fakestoreapi.com/products');
       
       var request = new http.MultipartRequest('POST', uri);
       request.fields['title']= 'Static title';
       
       var multipart= new http.MultipartFile('image', stream, length);
       request.files.add(multipart);
       var response =await  request.send();
       if(response.statusCode==200){
         setState(() {
           showSpinner = false;
         });
         print('image uploaded');

       }
       else{
         setState(() {
           showSpinner = false;
         });
         print('failed');

       }
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Upload Photo'),
          centerTitle: true,
          backgroundColor: Colors.teal,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: (){
                getImage();
              },
              child: Container(
                child:
                    image == null
                        ? Center(child: Text('Pick Image'))
                        : Container(
                          child: Image.file(
                            File(image!.path).absolute,
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
              ),
            ),
            SizedBox(height: 150),
          GestureDetector(
            onTap: (){
              uploadImage();
            },
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
             height: 50,
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Center(child: Text('Upload')),
                ),
            ),
          ) 
          ],
        ),
      ),
    );
  }
}
