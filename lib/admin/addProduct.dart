import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eshop/admin/adminServices.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class AddProductPage extends StatefulWidget {
  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<DocumentSnapshot> brands = <DocumentSnapshot>[];
  List<DocumentSnapshot> categories = <DocumentSnapshot>[];
  List<DropdownMenuItem> categoriesDropDown = <DropdownMenuItem>[];
  List<DropdownMenuItem> brandsDropDown = <DropdownMenuItem>[];
  String _currentCategory;
  String _currentBrand;
  Color white = Colors.white;
  Color black = Colors.black;
  Color grey = Colors.grey;
  Color red = Colors.red;
  TextEditingController _productName = TextEditingController();
  TextEditingController _quantity = TextEditingController();
  TextEditingController _price = TextEditingController();
  TextEditingController quatityController = TextEditingController();

  List<String> selectedSizes = <String>[];
  File _fileImage;
  File _fileImage2;
  File _fileImage3;
  bool loading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCategories();
  }

  List<DropdownMenuItem<String>> getCategoreisDropDown() {
    List<DropdownMenuItem<String>> items = [];

    for (DocumentSnapshot category in categories) {
      items.add(DropdownMenuItem(
        child: Text(category['categoryName']),
        value: category['categoryName'],
      ));
    }
    return items;
  }

  List<DropdownMenuItem<String>> getBrandsDropDown() {
    List<DropdownMenuItem<String>> items = [];

    for (DocumentSnapshot category in categories) {
      items.add(DropdownMenuItem(
        child: Text(category['brandName']),
        value: category['brandName'],
      ));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          color: black,
          icon: Icon(
            Icons.close,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'add product',
          style: TextStyle(color: black),
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: loading
              ? CircularProgressIndicator()
              : Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 120,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: OutlineButton(
                                borderSide: BorderSide(
                                    color: grey.withOpacity(.8), width: 1),
                                onPressed: () {
                                  _selectImage(
                                      ImagePicker.pickImage(
                                          source: ImageSource.gallery),
                                      1);
                                },
                                child: _displayChild(),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 120,
                              child: OutlineButton(
                                borderSide: BorderSide(
                                    color: grey.withOpacity(.8), width: 1),
                                onPressed: () {
                                  _selectImage(
                                      ImagePicker.pickImage(
                                          source: ImageSource.gallery),
                                      2);
                                },
                                child: _displayChild2(),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 120,
                              child: OutlineButton(
                                borderSide: BorderSide(
                                    color: grey.withOpacity(.8), width: 1),
                                onPressed: () {
                                  _selectImage(
                                      ImagePicker.pickImage(
                                          source: ImageSource.gallery),
                                      3);
                                },
                                child: _displayChild3(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                      child: Material(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.grey.withOpacity(0.3),
                        elevation: 0.0,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: ListTile(
                            title: TextFormField(
                              controller: _productName,
                              obscureText: false,
                              decoration: InputDecoration(
                                  hintText: "Product Name",
                                  icon: Icon(Icons.shopping_bag),
                                  border: InputBorder.none),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "The name field cannot be empty";
                                } else if (value.length > 6) {
                                  return "the name has to be smaller";
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    Text('Available Sizes'),
                    Row(
                      children: <Widget>[
                        Checkbox(
                            value: selectedSizes.contains('XS'),
                            onChanged: (value) {
                              changeSelectedSize('XS');
                            }),
                        Text('XS'),
                        Checkbox(
                            value: selectedSizes.contains('S'),
                            onChanged: (value) => changeSelectedSize('S')),
                        Text('S'),
                        Checkbox(
                            value: selectedSizes.contains('M'),
                            onChanged: (value) => changeSelectedSize('M')),
                        Text('M'),
                        Checkbox(
                            value: selectedSizes.contains('L'),
                            onChanged: (value) => changeSelectedSize('L')),
                        Text('L'),
                        Checkbox(
                            value: selectedSizes.contains('XL'),
                            onChanged: (value) => changeSelectedSize('XL')),
                        Text('XL'),
                        Checkbox(
                            value: selectedSizes.contains('XXL'),
                            onChanged: (value) => changeSelectedSize('XXL')),
                        Text('XXL'),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Category: ',
                            style: TextStyle(color: red),
                          ),
                        ),
                        DropdownButton(
                          value: _currentCategory,
                          items: categoriesDropDown,
                          onChanged: (value) {
                            changeSelectedCategory(value);
                          },
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Brand: ',
                            style: TextStyle(color: red),
                          ),
                        ),
                        DropdownButton(
                          value: _currentCategory,
                          items: categoriesDropDown,
                          onChanged: (value) {
                            changeSelectedCategory(value);
                          },
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextFormField(
                        controller: _quantity,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: 'Quantity',
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'You must enter the product name';
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextFormField(
                        controller: _price,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: 'Price',
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'You must enter the product name';
                          }
                        },
                      ),
                    ),
                    FlatButton(
                      color: red,
                      textColor: white,
                      child: Text('add product'),
                      onPressed: () {
                        validateAndUpload();
                      },
                    )
                  ],
                ),
        ),
      ),
    );
  }

  getCategories() async {
    try {
      List<DocumentSnapshot> data = await AdminServices().getCategory();
      if (data != null) {
        setState(() {
          categories = data;
        });
        // print(categories.length);
        _currentCategory = categories[0]['categoryName'];
        print(_currentCategory);
        setState(() {
          categoriesDropDown = getCategoreisDropDown();
        });
      } else {
        print('data is null');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  void changeSelectedCategory(String value) {
    setState(() {
      _currentCategory = value;
    });
  }

  getBrand() async {
    try {
      List<DocumentSnapshot> data = await AdminServices().getCategory();
      if (data != null) {
        setState(() {
          brands = data;
        });
        // print(categories.length);
        _currentBrand = categories[0]['categoryName'];
        print(_currentCategory);
        setState(() {
          brandsDropDown = getBrandsDropDown();
        });
      } else {
        print('data is null');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  void changeSelectedBrand(String value) {
    setState(() {
      _currentBrand = value;
    });
  }

  void validateAndUpload() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        loading = true;
      });
      if (_fileImage != null) {
        print('not null');
        if (selectedSizes.isNotEmpty) {
          String imageUrl;
          String imageUrl2;
          String imageUrl3;
          final FirebaseStorage storage = FirebaseStorage.instance;

          final String picture1 =
              '${DateTime.now().millisecondsSinceEpoch.toString()}.jpg';
          UploadTask task1 = storage.ref().child('picture').putFile(_fileImage);
          // final String picture2 =
          //     '${DateTime.now().millisecondsSinceEpoch.toString()}.jpg';
          // UploadTask task2 = storage.ref().child(picture2).putFile(_fileImage2);
          // final String picture3 =
          //     '${DateTime.now().millisecondsSinceEpoch.toString()}.jpg';
          // UploadTask task3 = storage.ref().child(picture3).putFile(_fileImage3);

          task1.snapshotEvents.listen((TaskSnapshot snapshot) async {
            print(
                'Snapshot state: ${snapshot.state}\n  '); // paused, running, complete

            print(
                'Progress: ${snapshot.totalBytes / snapshot.bytesTransferred}');
          }, onError: (Object e) {
            print(e); // FirebaseException
          });

          task1.then((TaskSnapshot snapshot) async {
            // print('Upload complete!');

            imageUrl = await snapshot.ref.getDownloadURL();
            Fluttertoast.showToast(msg: 'Upload complete $imageUrl');
            Navigator.pop(context);
          }).catchError((Object e) {
            print(e); // FirebaseException
          });

          setState(() {
            loading = false;
          });
        } else {
          print('error11');
          loading = false;
        }
      } else {
        print('error');
        loading = false;
      }
    }
  }

  void changeSelectedSize(String size) {
    if (selectedSizes.contains(size)) {
      setState(() {
        selectedSizes.remove(size);
      });
    } else {
      setState(() {
        selectedSizes.insert(0, size);
      });
    }
    print(selectedSizes);
  }

  void _selectImage(Future<File> pickImage, int imageNumber) async {
    File tempImage = await pickImage;
    switch (imageNumber) {
      case 1:
        setState(() {
          _fileImage = tempImage;
        });
        break;
      case 2:
        setState(() {
          _fileImage2 = tempImage;
        });
        break;
      case 3:
        setState(() {
          _fileImage3 = tempImage;
        });
    }
  }

  Widget _displayChild() {
    if (_fileImage == null) {
      return Icon(Icons.add);
    } else {
      return Image.file(_fileImage, fit: BoxFit.fill);
    }
  }

  Widget _displayChild2() {
    if (_fileImage2 == null) {
      return Icon(Icons.add);
    } else {
      return Image.file(_fileImage2, fit: BoxFit.fill);
    }
  }

  Widget _displayChild3() {
    if (_fileImage3 == null) {
      return Icon(Icons.add);
    } else {
      return Image.file(_fileImage3, fit: BoxFit.fitWidth);
    }
  }
}
