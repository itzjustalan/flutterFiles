//custom textstyle flutter


//You can create a class to hold your style and then call it from anywhere in your app.


class CustomTextStyle {
  static TextStyle titles(BuildContext context) {
    return Theme.of(context).textTheme.headline6.copyWith(fontSize: 18.0,color: Colors.blue);
  }
}


//And the use it as


Text(
   'Wow',
   style: CustomTextStyle.display5(context),
),
