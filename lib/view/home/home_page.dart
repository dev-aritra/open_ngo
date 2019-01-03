import 'package:flutter/material.dart';
import 'package:open_ngo/model/charitiy_model.dart';
import 'package:open_ngo/styles/custom_colors.dart';
import 'package:open_ngo/view/utils/charities_list.dart';
import 'package:open_ngo/view/utils/circular_dp.dart';

class HomePage extends StatelessWidget{
  @override
    Widget build(BuildContext context) {
      return SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _circularImage(),
              _welcomeWidget(),
              _divider(),
              _listTitle(),
              Expanded(
                child: CharitiesList(160, CharityModel.charities1),
              )
            ],
          ),
        );
    }

    

  Widget _circularImage() {
    return Padding(
      padding: const EdgeInsets.only(right: 40, top: 30),
      child: Container(
        alignment: Alignment.centerRight,
        child: CircularDP('images/p1.jpg'),
      ),
    );
  }

  Widget _listTitle() {
    return Padding(
      padding: const EdgeInsets.only(left: 18, top: 18),
      child: Text(
        'Trending Charities',
        style: TextStyle(
            color: CustomColors.lightGrey,
            fontSize: 13,
            fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _welcomeWidget() {
    return Padding(
      padding: EdgeInsets.only(top: 0, left: 20, right: 20, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _welcomeText(),
          _nameText(),
          _introText(),
          _selectionButtons()
        ],
      ),
    );
  }

  Widget _divider() {
    return Divider(
      height: 10,
      color: CustomColors.lightGrey,
    );
  }

  Widget _welcomeText() {
    return Text(
      'Welcome,',
      style: TextStyle(
          color: CustomColors.lightGrey,
          fontWeight: FontWeight.w500,
          fontSize: 22.0),
    );
  }

  Widget _nameText() {
    return Text(
      'Mathew Anderson',
      style: TextStyle(
          color: CustomColors.darkGrey,
          fontWeight: FontWeight.w600,
          fontSize: 24.0),
    );
  }

  Widget _introText() {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0),
      child: Text(
        'Let\'s get started by adding more information about your profile',
        style: TextStyle(
            color: CustomColors.lightGrey,
            fontWeight: FontWeight.w600,
            fontSize: 14.0),
      ),
    );
  }

  Widget _selectionButtons() {
    return Padding(
      padding: EdgeInsets.only(top: 25.0, bottom: 25.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
        _gotoProfileButton(),
        _dismissButton(),
      ]),
    );
  }

  Widget _gotoProfileButton() {
    return Padding(
      padding: const EdgeInsets.only(right: 30),
      child: RaisedButton(
        onPressed: () {},
        color: CustomColors.darkBlue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 15, right: 15, top: 1, bottom: 1),
          child: Text(
            'GO TO PROFILE',
            style: TextStyle(
                fontSize: 13.0,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _dismissButton() {
    return RaisedButton(
      onPressed: () {},
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      child: Text(
        'DISMISS',
        style: TextStyle(
            fontSize: 13.0,
            fontWeight: FontWeight.bold,
            color: CustomColors.darkGrey),
      ),
    );
  }


}