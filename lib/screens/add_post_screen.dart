import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_redesign/model/current_user.dart';
import 'package:instagram_redesign/model/post.dart';
import 'package:instagram_redesign/services/database_services.dart';
import 'package:instagram_redesign/services/storage_services.dart';
import 'package:provider/provider.dart';

class AddPostScreen extends StatefulWidget {
  static const routeName = '/add_post_screen';

  @override
  _AddPostScreenState createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  Size size;
  double statusBarHeight;
  File _pickedImage;
  String _caption = '';
  String _location = '';
  bool _isUploading = false;

  final _captionTextController = TextEditingController();
  final _locationTextController = TextEditingController();

  @override
  void didChangeDependencies() {
    size = MediaQuery.of(context).size;
    statusBarHeight = MediaQuery.of(context).padding.top;
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
    _pickImage();
  }

  @override
  void dispose() {
    _captionTextController.dispose();
    _locationTextController.dispose();
    super.dispose();
  }

  void _pickImage() async {
    final imageFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (imageFile != null) {
      setState(() {
        _pickedImage = File(imageFile.path);
      });
    }
  }

  // when user submit post button
  void _submitPost() async {
    if (_pickedImage != null) {
      setState(() {
        _isUploading = true;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Uploading Post'),
          backgroundColor: Colors.blue,
          duration: Duration(minutes: 1),
        ),
      );

      try {
        String postUrl = await StorageServices.uploadPost(_pickedImage);
        Post post = Post(
          authorId: Provider.of<CurrentUser>(
            context,
            listen: false,
          ).currentUserId,
          postUrl: postUrl,
          likes: 0,
          caption: _caption,
          location: _location,
          timeStamp: DateTime.now(),
        );

        await DatabaseServices.createPost(context: context, post: post);
        ScaffoldMessenger.of(context).hideCurrentSnackBar();

        Navigator.of(context).pop();
      } catch (error) {
        print(error.toString());
      }
    } else {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please pick an image'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Container(
              width: size.width,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30.0),
                    child: Text(
                      'Create Post',
                      style: TextStyle(
                        fontSize: 30,
                        color: Color(0xff262626),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: _isUploading ? null : _pickImage,
                    child: Container(
                      height: size.width - 60,
                      width: size.width - 60,
                      decoration: BoxDecoration(
                        color: Color(0xffeeeeee),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: _pickedImage == null
                          ? Icon(
                              Icons.photo_rounded,
                              color: Colors.grey,
                              size: 200,
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.file(
                                _pickedImage,
                                fit: BoxFit.cover,
                              ),
                            ),
                    ),
                  ),
                  Container(
                    width: size.width - 60,
                    margin: const EdgeInsets.only(
                      top: 30,
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    decoration: BoxDecoration(
                      color: Color(0xffe6e6e6),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextField(
                      enabled: _isUploading ? false : true,
                      controller: _captionTextController,
                      cursorHeight: 20,
                      minLines: 1,
                      maxLines: 10,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Color(0xff262626),
                      ),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                        hintText: 'Caption',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                      ),
                      onChanged: (value) {
                        _caption = value;
                      },
                    ),
                  ),
                  Container(
                    width: size.width - 60,
                    margin: const EdgeInsets.only(top: 10, bottom: 30),
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    decoration: BoxDecoration(
                      color: Color(0xffe6e6e6),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextField(
                      enabled: _isUploading ? false : true,
                      controller: _locationTextController,
                      cursorHeight: 20,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Color(0xff262626),
                      ),
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                        hintText: 'Location',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                      ),
                      onChanged: (value) {
                        _location = value;
                      },
                    ),
                  ),
                  Container(
                    width: size.width - 60,
                    margin: const EdgeInsets.only(bottom: 20),
                    child: ElevatedButton(
                      onPressed: _isUploading ? null : _submitPost,
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: Text(
                        'Post',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
