//animated page transition flutter


import 'package:flutter/material.dart';
class SlideRightRoute extends PageRouteBuilder {
  final Widget widget;
  SlideRightRoute({this.widget})
    : super(
        pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
          return widget;
        },
        transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
          return new SlideTransition(
            position: new Tween<Offset>(
              begin: const Offset(-1.0, 0.0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
           );
         }
      );
}

/*




...
import 'package:myapp/slide_right_transition.dart'
...
Navigator.push(
  context,
  SlideRightRoute(widget: DetailScreen()),
);






*/


//fancy scale transition




/*








Notice that the SlideTransition can be replaced by any other transition widgets provided by Flutter such as ScaleTransition or FadeTransition.
So, if you want to create another style of transition, you can then mimic the SlideRightRoute widget above. For example, you want to create an even more fancy transition named ScaleRoute:
import 'package:flutter/material.dart';
class ScaleRoute extends PageRouteBuilder {
  final Widget widget;
  ScaleRoute({this.widget})
    : super(
        pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
          return widget;
        },
        transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
          return new ScaleTransition(
            scale: new Tween<double>(
              begin: 0.0,
              end: 1.0,
            ).animate(
                CurvedAnimation(
                  parent: animation,
                  curve: Interval(
                    0.00,
                    0.50,
                    curve: Curves.linear,
                  ),
                ),
              ),
            child: ScaleTransition(
                     scale: Tween<double>(
                       begin: 1.5,
                       end: 1.0,
                     ).animate(
                       CurvedAnimation(
                         parent: animation,
                         curve: Interval(
                           0.50,
                           1.00,
                           curve: Curves.linear,
                         ),
                       ),
                     ),
                     child: child,
                   ),
           );
         }
      );
}


*/