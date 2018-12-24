class CharityModel{
  final String title;
  final String totalRaisedNow;
  final String totalRaisedPrev;
  final String img;

  const CharityModel({this.title, this.totalRaisedNow, this.totalRaisedPrev, this.img});

  static final List<CharityModel> charities = [
    const CharityModel(
      title : 'St. Loueis Welfare Org.',
      totalRaisedNow: '\$12,500',
      totalRaisedPrev: '\$10,000',
      img : 'images/pic4.jpg'
    ),
    const CharityModel(
      title : 'Nigeria.',
      totalRaisedNow: '\$12,500',
      totalRaisedPrev: '\$10,000',
      img : 'images/pic2.jpg'
    ),
    const CharityModel(
      title : 'Ghana Residential Fund',
      totalRaisedNow: '\$50,000',
      totalRaisedPrev: '\$40,000',
      img : 'images/pic1.jpg'
    ),
    const CharityModel(
      title : 'South Africa.',
      totalRaisedNow: '\$12,500',
      totalRaisedPrev: '\$10,000',
      img : 'images/pic3.jpg'
    ),

  ];
}



