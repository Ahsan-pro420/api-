import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Uploadimage extends StatefulWidget {
  const Uploadimage({Key? key}) : super(key: key);

  @override
  State<Uploadimage> createState() => _UploadimageState();
}

File? image;
final _picker = ImagePicker();
bool showSpinner = false;

Future getImage() async {
  final pickedfile =
      await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
  if (pickedfile != null) {
    image = File(pickedfile.path);
    setState(({}));
  } else {
    print('no image');
  }
}

void setState(Map map) {}

Future<void> uploadimage() async {
  setState() {
    showSpinner = true;
  }

  var stream = new http.ByteStream(image!.openRead());
  stream.cast();
  var length = await image!.length();
  var uri = Uri.parse("https://fakestoreapi.com/products");
  var request = new http.MultipartRequest('POST', uri);
  request.fields['title'] = 'Static title';

  var multiport = new http.MultipartFile('image', stream, length);
  request.files.add(multiport);
  var response = await request.send();

  if (response.statusCode == 200) {
    print("Image Uploaded");
    setState() {
      showSpinner = true;
    }
  } else {
    print("Falied");
    setState() {
      showSpinner = true;
    }
  }
}

class _UploadimageState extends State<Uploadimage> {
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Upload Image"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                getImage();
              },
              child: Container(
                  child: image == null
                      ? Center(
                          child: Text('Pick Image'),
                        )
                      : Container(
                          child: Center(
                            child: Image.file(
                              File(image!.path).absolute,
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                        )),
            ),
            SizedBox(
              height: 100,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  uploadimage();
                },
                child: Container(
                  child: Center(child: Text("Upload")),
                  height: 50,
                  width: 200,
                  color: Colors.green,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
