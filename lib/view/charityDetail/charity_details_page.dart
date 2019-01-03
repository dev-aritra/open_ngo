import 'package:flutter/material.dart';
import 'package:open_ngo/model/charitiy_model.dart';
import 'package:open_ngo/styles/custom_colors.dart';
import 'package:open_ngo/view/utils/circular_dp.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class CharityDetailPage extends StatelessWidget {
  CharityModel charityData;
  double _screenWidth;

  CharityDetailPage(this.charityData);

  @override
  Widget build(BuildContext context) {
    _screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Stack(
          children: <Widget>[
            _charityData(context),
            Positioned(
              child: _signInButton(),
            )
          ],
        ),
      ),
    );
  }

  Widget _charityData(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(children: <Widget>[ _listItem(charityData, context) , _publisher() , _details() ])
      ),
    );
  }

  Widget _publisher(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
      child: Row(
        children: <Widget>[
          CircularDP('images/p2.jpg'),
          _publisherName()

        ],
      ),
    );
  }

  Widget _details(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
      child: Text(
        charityData.details,
        style: TextStyle(height: 1.5, color: Colors.black54, fontWeight: FontWeight.w400),
        
      ),
    );
  }

  Widget _publisherName(){
    return Padding(
      padding: const EdgeInsets.only(left: 12),
      child: Text(
        charityData.publisher,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 15,
          color: CustomColors.darkGrey
        ),
      ),
    );
  }

  Widget _listItem(CharityModel charity, BuildContext context) {
    return GestureDetector(
      onTap: () {
              Navigator.push(context, 
              MaterialPageRoute(
                builder: (context) => CharityDetailPage(charity)
              ));
            },
      child: Padding(

        padding: const EdgeInsets.only(bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _image(charity.img),
            _title(charity.title),
            _line(50),
            _fundStatus(charity.totalRaisedPrev, charity.totalRaisedNow),
            
          ],
        ),
      ),
    );
  }

  Widget _line(int percentage) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 18),
      child: LinearPercentIndicator(
        width: _screenWidth - 20,
        lineHeight: 3.0,
        percent: percentage / 100,
        progressColor: CustomColors.lightBlue,
      ),
    );
  }


  Widget _fundStatus(String prev, String now) {
    return Padding(
      padding: const EdgeInsets.only(left: 18, right: 18),
      child: Row(
        children: <Widget>[
          Expanded(
              child: Text(
            'TOTAL RAISED',
            textAlign: TextAlign.start,
            style: TextStyle(
                color: CustomColors.lightGrey,
                fontSize: 13,
                fontWeight: FontWeight.w500),
          )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              prev,
              textAlign: TextAlign.end,
              style: TextStyle(
                fontSize: 16,
                color: CustomColors.lightGrey,
                decoration: TextDecoration.lineThrough
              ),
            ),
          ),
          Text(
            now,
            textAlign: TextAlign.end,
            style: TextStyle(
                fontSize: 19,
                color: CustomColors.lightBlue,
                fontWeight: FontWeight.w600
              ),
          ),
        ],
      ),
    );
  }

  Widget _title(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 18, right: 18),
      child: Text(
        title,
        style: TextStyle(
            fontSize: 20,
            color: CustomColors.darkGrey,
            fontWeight: FontWeight.w600),
      ),
    );
  }


  Widget _image(String imageItem) {

    
    return Container(
      height: 300,
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: DecoratedBox(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              image: DecorationImage(
                fit: BoxFit.fitHeight,
                alignment: FractionalOffset.topCenter,
                image: AssetImage(imageItem),
              )),
        ),
      ),
    );
  }

  Widget _signInButton() {
    return Align(
      alignment: FractionalOffset.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 30.0),
        child: Row(children: <Widget>[
          Expanded(
            child: RaisedButton(
              onPressed: () {},
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7.0)),
              padding: EdgeInsets.all(12.0),
              color: CustomColors.darkBlue,
              child: Text(
                'SUPPORT THIS PROJECT',
                style:
                    TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
