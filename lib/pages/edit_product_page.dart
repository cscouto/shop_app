import 'package:flutter/material.dart';

class EditProductPage extends StatefulWidget {
  static const routeName = '/edit-product';
  @override
  _EditProductPageState createState() => _EditProductPageState();
}

class _EditProductPageState extends State<EditProductPage> {
  final _priceFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();

  @override
  void dispose() {
    _priceFocusNode.dispose();
    _descriptionFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: 4),
                Container(
                  height: 50,
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Title',
                      border: OutlineInputBorder(),
                    ),
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_priceFocusNode);
                    },
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  height: 50,
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Price',
                      border: OutlineInputBorder(),
                    ),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    focusNode: _priceFocusNode,
                    onFieldSubmitted: (_){
                      FocusScope.of(context).requestFocus(_descriptionFocusNode);
                    },
                  ),
                ),
                SizedBox(height: 8),
                TextFormField(
                  maxLines: 3,
                  decoration: InputDecoration(
                    labelText: 'Description',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.multiline,
                  focusNode: _descriptionFocusNode,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
