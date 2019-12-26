import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback _onPressed;

  LoginButton({Key key, VoidCallback onPressed})
      : _onPressed = onPressed,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    /*return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
        
      ),
      onPressed: _onPressed,
      child: Text('Login'),
    );*/

    return Container(
            margin: const EdgeInsets.only(top: 20.0),
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: new Row(
              children: <Widget>[
                new Expanded(
                  child: FlatButton(
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    splashColor: Theme.of(context).splashColor,
                    color: Theme.of(context).buttonColor,
                    child: new Row(
                      children: <Widget>[
                        new Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text(
                            "LOGIN",
                            style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        new Expanded(
                          child: Container(),
                        ),
                        new Transform.translate(
                          offset: Offset(15.0, 0.0),
                          child: new Container(
                            padding: const EdgeInsets.all(5.0),
                            child: FlatButton(
                              shape: new RoundedRectangleBorder(
                                  borderRadius:
                                  new BorderRadius.circular(28.0)),
                              splashColor: Colors.white,
                              color: Theme.of(context).primaryColor,
                              child: Icon(
                                Icons.arrow_forward,
                                color: Theme.of(context).buttonColor,
                              ),
                              onPressed: _onPressed,
                            ),
                          ),
                        )
                      ],
                    ),
                    onPressed: () => {},
                  ),
                ),
              ],
            ),
          );
  }


}