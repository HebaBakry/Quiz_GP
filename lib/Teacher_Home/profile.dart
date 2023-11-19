import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
//import 'package:sizer/sizer.dart';


class ProfileScreen extends StatefulWidget{
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();

}

class _ProfileScreenState extends State<ProfileScreen> {
  Color color = const Color(0xff82498d);
  File? _imageFile; // Variable to store the selected image file
  Future<void> _openImagePicker(BuildContext context, ImageSource source) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: source);
    if (pickedImage != null) {
      // If an image is picked, update the _imageFile variable with the selected image file
      setState(() {
        _imageFile = File(pickedImage.path);
      });
    }
  }
  void _showImagePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.delete,color: Colors.red,),
                title: const Text('Remove image'),
                onTap: () {
                  setState(() {
                    _imageFile = null;
                    Navigator.of(context).pop();// Close the bottom sheet
                  });
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Choose from Gallery'),
                onTap: () {
                  _openImagePicker(context, ImageSource.gallery);
                  Navigator.of(context).pop();// Close the bottom sheet
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Take a Picture'),
                onTap: () {
                  _openImagePicker(context, ImageSource.camera);
                  Navigator.of(context).pop();// Close the bottom sheet
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return   SafeArea(
        child: Column(
          children: [
            SizedBox(
                height: 220,
                child: Stack(
                    children: [
                      Container(
                        height: 150,
                        width: double.infinity,
                        color: color,
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child:
                        SizedBox(
                          child: CircleAvatar(
                            radius: 60.0,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 58.0,
                              backgroundImage: _imageFile != null
                                  ? FileImage(_imageFile!) // Display the selected image file
                                  : const AssetImage('assets/unknown_pp.jpg') as ImageProvider,
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 15.0,
                                    child:InkWell(
                                      child:  Icon(
                                          Icons.camera_alt,
                                          color: color
                                      ),
                                      onTap: () { _showImagePicker(context); },
                                    )
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                    ])
            ),
            const Padding(
                padding: EdgeInsets.only(top: 2),
                child: SelectableText('Heba Bakry',style: TextStyle(fontSize: 22),))

          ],
        ));
  }

}