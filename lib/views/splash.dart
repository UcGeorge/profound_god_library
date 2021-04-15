import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:profoundgodlibrary/bloc/theme_bloc.dart';
import 'package:profoundgodlibrary/constants/constants.dart';
import 'package:profoundgodlibrary/models/theme.dart';
import 'package:profoundgodlibrary/network/api_client.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Client client = Client();

  String _username;
  String _server;
  bool _isLoading = false;

  Future<SharedPreferences> getPrefs() async {
    return await SharedPreferences.getInstance();
  }

  void processName() async {
    try {
      Map<String, dynamic> user = await client.get_user(_username);
      SharedPreferences prefs = await getPrefs();
      if (user == null) {
        Map<String, dynamic> user = await client.add_user(_username);
        if (user == null) {
          errorAlert(
            title: 'Error getting user',
            desc: 'You might not be connected. Check your connection.',
          );
          return;
        }
      }

      prefs.setString('username', user['name']);
      setState(() {
        _isLoading = false;
      });
      WidgetsBinding.instance.addPostFrameCallback(
        (_) => Navigator.pushNamed(context, HOME_SCREEN),
      );
    } catch (Exception) {
      errorAlert(
        title: 'Fatal Error',
        desc: 'Ask Uche to fix it. Sorry!',
      );
      setState(() {
        _isLoading = false;
      });
    }
  }

  void processServer() async {
    try {
      client = Client(BASE: _server);
      if (!await client.is_connected()) {
        enterServerAddress(
          title: 'Invalid Address',
          desc: 'Ask Uche for the server address!',
        );
      }
    } catch (Exception) {
      errorAlert(
        title: 'Fatal Error',
        desc: 'Ask Uche to fix it. Sorry!',
      );
    }

    SharedPreferences prefs = await getPrefs();
    prefs.setString('server', _server);
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, Map<ThemedComponent, dynamic>>(
        builder: (_, theme) {
      return Scaffold(
        backgroundColor: theme[ThemedComponent.scaffold_bg],
        body: FutureBuilder(
          builder: (context, AsyncSnapshot<SharedPreferences> snapshot) {
            return userChecker(snapshot, theme);
          },
          future: getPrefs(),
        ),
      );
    });
  }

  Widget networkChecker(
      AsyncSnapshot<bool> snapshot, Map<ThemedComponent, dynamic> theme) {
    Widget child = Container();
    if (snapshot.hasData) {
      if (snapshot.data) {
        child = enterName(theme);
      } else {
        enterServerAddress();
      }
    } else if (snapshot.hasError) {
      print("Error at networkChecker ${snapshot.error.toString()}");
      enterServerAddress();
    } else {
      child = Center(
        child: loadingIndicator(theme),
      );
    }
    return child;
  }

  Widget userChecker(AsyncSnapshot<SharedPreferences> snapshot,
      Map<ThemedComponent, dynamic> theme) {
    Widget child = Container();
    if (snapshot.hasData) {
      if (snapshot.data.getString('server') != null) {
        client = Client(BASE: snapshot.data.getString('server'));
      }
      if (snapshot.data.getString('username') == null) {
        child = FutureBuilder(
          builder: (context, AsyncSnapshot<bool> snapshot) {
            return networkChecker(snapshot, theme);
          },
          future: client.is_connected(),
        );
      }
      WidgetsBinding.instance.addPostFrameCallback(
        (_) => Navigator.pushNamed(context, HOME_SCREEN),
      );
    } else if (snapshot.hasError) {
      print("Error at userChecker ${snapshot.error.toString()}");
      errorAlert(
        title: "Fatal Error",
        desc: "Ask Uche to fix it. Sorry!",
      );
    } else {
      child = Center(
        child: loadingIndicator(theme),
      );
    }
    return child;
  }

  SpinKitFadingFour loadingIndicator(Map<ThemedComponent, dynamic> theme) {
    return SpinKitFadingFour(
      color: theme[ThemedComponent.continue_reading_button_bg],
      size: 100,
    );
  }

  SpinKitThreeBounce loadingIndicator2(Map<ThemedComponent, dynamic> theme) {
    return SpinKitThreeBounce(
      color: theme[ThemedComponent.continue_reading_button_bg],
      size: 30,
    );
  }

  void errorAlert({String title, String desc}) {
    WidgetsBinding.instance.addPostFrameCallback((_) => Alert(
          context: context,
          type: AlertType.error,
          title: title,
          desc: desc,
        ).show());
  }

  void enterServerAddress({String title, String desc}) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => Alert(
        context: context,
        type: AlertType.error,
        title: title ?? 'Enter Server Address',
        desc: "You need to be connected to access PGL for the first time.",
        content: Container(
          decoration: BoxDecoration(
              border: Border.all(
                color: Color(0xFF2F2F2F),
                width: 1,
              ),
              borderRadius: BorderRadius.all(Radius.circular(100))),
          width: 300,
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: TextField(
                  onChanged: (value) {
                    this._server = value;
                  },
                  onSubmitted: (value) {
                    this._server = value;
                    Navigator.pop(context);
                    setState(() {
                      this._isLoading = true;
                    });
                    processServer();
                  },
                  cursorColor: _isLoading ? Colors.white : Color(0xFF2F2F2F),
                  cursorWidth: .5,
                  cursorRadius: Radius.circular(.5),
                  textAlignVertical: TextAlignVertical.center,
                  style: TextStyle(
                    color: _isLoading ? Colors.white : Color(0xFF2F2F2F),
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter your name",
                      hintStyle: TextStyle(
                        color: _isLoading ? Colors.white : Color(0xFF2F2F2F),
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      )),
                  textAlign: TextAlign.center,
                ),
              ),
              InkWell(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(100),
                    bottomRight: Radius.circular(100)),
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    this._isLoading = true;
                  });
                  processServer();
                },
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xFF2F2F2F),
                        width: 0.5,
                      ),
                      color: Color(0xFF2F2F2F),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(100),
                          bottomRight: Radius.circular(100))),
                  child: Center(
                    child: FaIcon(
                      FontAwesomeIcons.angleDoubleRight,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ).show(),
    );
  }

  Widget enterName(Map<ThemedComponent, dynamic> theme) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Color(0xFF2F2F2F),
      child: Stack(
        children: [
          Text(
            'P G L',
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.height / 1.2,
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.italic,
                color: Colors.white),
          ),
          Center(
            child: ModalProgressHUD(
              inAsyncCall: _isLoading,
              progressIndicator: loadingIndicator2(theme),
              child: Center(
                child: Container(
                  height: 250,
                  width: 500,
                  decoration: BoxDecoration(
                    color: Colors.white, //.withOpacity(0.5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white,
                      ),
                      BoxShadow(
                        color: Color(0xFF2F2F2F),
                        blurRadius: 25.0, // soften the shadow
                        spreadRadius: 5.0, //extend the shadow
                        offset: Offset(
                          15.0, // Move to right 10  horizontally
                          15.0, // Move to bottom 10 Vertically
                        ),
                      )
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xFF2F2F2F),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(100))),
                      width: 300,
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: TextField(
                              onChanged: (value) {
                                this._username = value;
                              },
                              onSubmitted: (value) {
                                this._username = value;
                                setState(() {
                                  this._isLoading = true;
                                });
                                processName();
                              },
                              cursorColor:
                                  _isLoading ? Colors.white : Color(0xFF2F2F2F),
                              cursorWidth: .5,
                              cursorRadius: Radius.circular(.5),
                              textAlignVertical: TextAlignVertical.center,
                              style: TextStyle(
                                color: _isLoading
                                    ? Colors.white
                                    : Color(0xFF2F2F2F),
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Enter your name",
                                  hintStyle: TextStyle(
                                    color: _isLoading
                                        ? Colors.white
                                        : Color(0xFF2F2F2F),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  )),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          InkWell(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(100),
                                bottomRight: Radius.circular(100)),
                            onTap: () {
                              setState(() {
                                this._isLoading = true;
                              });
                              processName();
                            },
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Color(0xFF2F2F2F),
                                    width: 0.5,
                                  ),
                                  color: Color(0xFF2F2F2F),
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(100),
                                      bottomRight: Radius.circular(100))),
                              child: Center(
                                child: FaIcon(
                                  FontAwesomeIcons.angleDoubleRight,
                                  color: Colors.white,
                                  size: 25,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
