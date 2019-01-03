import 'package:flutter/material.dart';
import 'package:open_ngo/model/charitiy_model.dart';
import 'package:open_ngo/styles/custom_colors.dart';
import 'package:open_ngo/view/charityDetail/charity_details_page.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class CharitiesList extends StatelessWidget {
  double _screenWidth;
  double _listImageHeight;
  List<CharityModel> data;

  CharitiesList(this._listImageHeight, this.data);

  @override
  Widget build(BuildContext context) {
    _screenWidth = MediaQuery.of(context).size.width;
    return ListView.builder(
      itemCount: data.length,

      itemBuilder: (BuildContext ctxt, int index){

        return _listItem(data[index] , context);
      },
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
            _fundStatus(charity.totalRaisedPrev, charity.totalRaisedNow)
          ],
        ),
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

  Widget _image(String imageItem) {

    BoxFit fit = _listImageHeight == 160 ? BoxFit.fitWidth : BoxFit.fitHeight;
    return Container(
      height: _listImageHeight,
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: DecoratedBox(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              image: DecorationImage(
                fit: fit,
                alignment: FractionalOffset.topCenter,
                image: AssetImage(imageItem),
              )),
        ),
      ),
    );
  }
}
