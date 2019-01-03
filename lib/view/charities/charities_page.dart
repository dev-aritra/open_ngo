import 'package:flutter/material.dart';
import 'package:open_ngo/model/charitiy_model.dart';
import 'package:open_ngo/styles/custom_colors.dart';
import 'package:open_ngo/view/utils/charities_list.dart';
import 'package:open_ngo/view/utils/circular_dp.dart';

class CharitiesPage extends StatefulWidget {
  @override
  _CharitiesState createState() => _CharitiesState();
}

class _CharitiesState extends State<CharitiesPage> {
  static var _dropEntries = ['San Francisco', 'Test2', 'Test3', 'Test4'];
  int _index = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 28),
        child: Column(
            children: <Widget>[_topRow() , _listTitle(), Expanded(child : CharitiesList(250, CharityModel.charities2))]),
      ),
    );
  }

  Widget _listTitle() {
    return Container(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(top: 18 , left: 18),
        child: Text(
          'Trending Charities',
          style: TextStyle(
              color: CustomColors.lightGrey,
              fontSize: 13,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Widget _topRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _dropDown(),
          CircularDP('images/p1.jpg'),
        ],
      ),
    );
  }

  Widget _dropDown() {
    return DropdownButton(
        items: _dropEntries.map((String dropDownStringItem) {
          return DropdownMenuItem<String>(
            value: dropDownStringItem,
            child: Text(dropDownStringItem),
          );
        }).toList(),
        value: _dropEntries[_index],
        onChanged: (selectedIndex) {
          setState(() {
            _index = updateEntryAsInt(selectedIndex);
          });
        });
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
