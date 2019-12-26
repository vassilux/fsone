import 'package:flutter/material.dart';
import 'package:fsone/config/assets.dart';
import 'package:fsone/widgets/headers/wavy_header.dart';
import 'package:flutter/animation.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;
  @override
  void initState() {
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animation = Tween<double>(begin: 0, end: 900).animate(controller)
      ..addListener(() {
        setState(() {
          // The state that has changed here is the animation object’s value.
        });
      });
    controller.forward();
    super.initState();
  }

  Widget build(BuildContext context) {
    final TextStyle titleStyle = TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 50.0,
        color: Theme.of(context).accentColor);

        return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(Assets.app_icon_bg), fit: BoxFit.cover)),
        ),       
        Align(
          alignment: AlignmentDirectional.bottomCenter,
          child: AnimatedContainer(
            duration: Duration(seconds: 3),
            child: Container(
              height: animation.value,
              width: animation.value,
              child: Image.asset(Assets.app_icon),
            ),
          ),
        ),
        Align(
          alignment: AlignmentDirectional.bottomCenter,
          child: RaisedButton(
            onPressed: ()=>{},
            child: Text(
              "S1",
              textAlign: TextAlign.center,
              style: titleStyle,
            ),
            color: Colors.red,
            textColor: Colors.white,
            shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30))),
          ),
        ),
        WavyHeader()
      ],
    );
     
  }

  void dispose() {
    print("Splash dispose");
    controller.dispose();
    super.dispose();
  }
}
