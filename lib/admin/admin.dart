
import 'package:eshop/admin/adminServices.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'addProduct.dart';

enum Page { dashboard, manage }

class Admin extends StatefulWidget {
  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  MaterialColor active = Colors.red;
  MaterialColor notActive = Colors.grey;
  Page _selectedPage = Page.dashboard;
  TextEditingController _category = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> _categoryformKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Expanded(
                child: FlatButton.icon(
              onPressed: () {
                setState(() {
                  _selectedPage = Page.dashboard;
                });
              },
              icon: Icon(Icons.dashboard),
              label: Text('Dashboard'),
            )),
            Expanded(
                child: FlatButton.icon(
              onPressed: () {
                setState(() {
                  _selectedPage = Page.manage;
                });
              },
              icon: Icon(Icons.dashboard),
              label: Text('Manage'),
            )),
          ],
        ),
      ),
      body: _loadScreen(),
    );
  }

  Widget _loadScreen() {
    switch (_selectedPage) {
      case Page.dashboard:
        return Column(
          children: [
            ListTile(
              subtitle: FlatButton.icon(
                icon: Icon(Icons.attach_money),
                label: Text('12'),
                onPressed: () {},
              ),
              title: Text('Revenue'),
            ),
            Expanded(
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: ListTile(
                        title: FlatButton.icon(
                          icon: Icon(Icons.shopping_bag),
                          label: Text('lslkde'),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        );

        break;
      case Page.manage:
        return ListView(
          children: [
            ListTile(
              leading: Icon(Icons.add),
              title: Text('Add product'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddProductPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.add),
              title: Text('Category'),
              onTap: () => _categoryAlert(),
            ),
            ListTile(
              leading: Icon(Icons.add),
              title: Text('Add Brand'),
              onTap:()=>_brandAlert()
            ),
            
          ],
        );

      default:
    }
  }

  _categoryAlert() {
    var alert = AlertDialog(
      title: Text('Add Category'),
      content: Form(
        key: _categoryformKey,
        child: TextFormField(
          controller: _category,
          decoration: InputDecoration(hintText: 'Enter category'),
          validator: (value) {
            if (value.isEmpty) {
              return 'Category cannot be empty';
            }
          },
        ),
      ),
      actions: [
        FlatButton.icon(
          icon: Icon(Icons.add),
          label: Text('ADD'),
          onPressed: () {
            if (_category.text != null) {
              AdminServices().createCategory(_category.text);
            }
            Fluttertoast.showToast(msg: 'Category creatd');
            Navigator.of(context).pop();
          },
        ),
        FlatButton.icon(
          icon: Icon(Icons.add),
          label: Text('CANCEL'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ],
    );
    showDialog(context: context, builder: (_) => alert);
  }

  _brandAlert() {
    var alert = AlertDialog(
      title: Text('Add Brand'),
      content: Form(
        key: _categoryformKey,
        child: TextFormField(
          controller: _category,
          decoration: InputDecoration(hintText: 'Enter category'),
          validator: (value) {
            if (value.isEmpty) {
              return 'Category cannot be empty';
            }
          },
        ),
      ),
      actions: [
        FlatButton.icon(
          icon: Icon(Icons.add),
          label: Text('ADD'),
          onPressed: () {
            if (_category.text != null) {
              AdminServices().createBrand(_category.text);
            }
            Fluttertoast.showToast(msg: 'Brand creatd');
            Navigator.of(context).pop();
          },
        ),
        FlatButton.icon(
          icon: Icon(Icons.add),
          label: Text('CANCEL'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ],
    );
    showDialog(context: context, builder: (_) => alert);
  }
}

