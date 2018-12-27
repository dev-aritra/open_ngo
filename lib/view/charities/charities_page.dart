import 'package:flutter/material.dart';
import 'package:open_ngo/view/utils/circular_dp.dart';

class CharitiesPage extends StatefulWidget {
  @override
  _CharitiesState createState() => _CharitiesState();
}

class _CharitiesState extends State<CharitiesPage> {
    static var _dropEntries = ['Test1', 'Test2', 'Test3', 'Test4'];
        int _index = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[_topRow()]),
    );
  }

  Widget _topRow() {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        _dropDown(),
        CircularDP('images/p2.jpg'),
      ],
    );
  }

  Widget _dropDown() {
    return DropdownButton(
      items: _dropEntries.map((String dropDownStringItem) {
        return DropdownMenuItem<String> (
          value: dropDownStringItem,
          child: Text(dropDownStringItem),
        );
      }).toList(),
      value: _dropEntries[_index],

      onChanged: (selectedIndex) {
        setState(() {
          _index = updateEntryAsInt(selectedIndex);
        });
      }
    );
  }

  int updateEntryAsInt(String value) {
    var ret = 0;
    switch (value) {
        case 'Test1':
            ret = 0;
            break;
        case 'Test2':
            ret = 1;
            break;
        case 'Test3':
            ret = 2;
            break;
        case 'Test3':
            ret = 3;
            break;
    }

    return ret;
  }

}