import 'package:flutter/material.dart';
import 'package:open_ngo/view/utils/circular_dp.dart';

class CharitiesPage extends StatefulWidget {
  @override
  _CharitiesState createState() => _CharitiesState();
}

class _CharitiesState extends State<CharitiesPage> {
  List<DropdownMenuItem<String>> menuItems;

  @override
  void initState() {
    super.initState();
    menuItems = const [
      DropdownMenuItem<String>(
        value: 'Test1',
        child: FittedBox( child: Text('Test1')),
      ),
      DropdownMenuItem<String>(
        value: 'Test2',
        child: FittedBox( child: Text('Test2')),
      ),
      DropdownMenuItem<String>(
        value: 'Test2',
        child: FittedBox( child: Text('Test2')),
      ),
      DropdownMenuItem<String>(
        value: 'Test2',
        child: FittedBox(child: Text('Test2')),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[_topRow()]),
    );
  }

  Widget _topRow() {
    return SingleChildScrollView(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          _dropDown(),
          CircularDP('images/p2.jpg'),
        ],
      ),
    );
  }

  Widget _dropDown() {
    return Container( 
      child: DropdownButton(
        onChanged: _tapped(),
        items: menuItems,
        value: menuItems[0].value,
      ),
    );
  }

  _tapped() {}
}
