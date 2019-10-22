import 'package:flutter/material.dart';
import 'package:instory/utils/colors.dart';
import 'package:instory/wave_clipper.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _Home();
}

class _Home extends State<Home> with TickerProviderStateMixin {
  bool loading = false;
  bool fetchingStories = false;
  // ApiResponse profile;
  TextEditingController _controller;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  // HighLightResponse _highLightResponse;

  @override
  void initState() {
    super.initState();
    _controller = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    double totalHeight = MediaQuery.of(context).size.height;
    double waveSection = totalHeight/2.5;

    return SafeArea(
      bottom: true,
      top: false,
      child: Scaffold(
        key: _scaffoldKey,
        resizeToAvoidBottomPadding: true,
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: waveSection,
                  child: ClipPath(
                    clipper: WaveClipper(),
                    clipBehavior: Clip.antiAlias,
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(gradient: LinearGradient(colors: [instaRed, instaViolet])),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset("assets/Instory_white.png", width: 64, height: 64,),
                          Padding(
                            padding: const EdgeInsets.only(top: 22),
                            child: Text(
                              "Instory",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: "MoonlightsOnTheBeach",
                                fontWeight: FontWeight.normal,
                              ),
                              textScaleFactor: 4,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 50),
                  child: Material(
                    elevation: 10,
                    shadowColor: Colors.grey[100],
                    type: MaterialType.card,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(33)),
                    child: TextField(
                      controller: _controller,
                      maxLines: 1,
                      textInputAction: TextInputAction.done,
                      textAlign: TextAlign.center,
                      decoration: new InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[500]),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        enabledBorder: new OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[300]),
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(30.0),
                          ),
                        ),
                        filled: true,
                        prefixIcon: InkWell(
                          child: Container(
                            child: Image.asset(
                              "assets/instagram.png",
                              scale: 2.5,
                              color: Colors.grey[500]
                            ),
                          ),
                        ),
                        suffixIcon: Container(
                          padding: EdgeInsets.only(right: 4),
                          child: FloatingActionButton(
                            heroTag: "_MAIN_FAB_",
                            mini: true,
                            elevation: 0,
                            backgroundColor: instaRed,
                            onPressed: () {
                              // fetchData(context);
                            },
                            child: loading ?
                                   CircularProgressIndicator(
                                     valueColor: AlwaysStoppedAnimation<Color>(instaViolet),
                                     strokeWidth: 3,
                                   )
                                   : Icon(Icons.arrow_forward),
                          ),
                        ),
                        hintStyle: new TextStyle(color: Colors.grey[500]),
                        hintText: "instagram username",
                        fillColor: Colors.white70,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 200,
                  // child: profile != null
                  //        ? Dismissible(
                  //           background: Container(color: Colors.grey[200],),
                  //           onDismissed: (DismissDirection dis) {
                  //             setState(() {
                  //               profile = null;
                  //               loading = false;
                  //               fetchingStories = false;
                  //               _highLightsResponse = null;
                  //             });
                  //           },
                  //           key: Key("_KEY_"),
                  //           movementDuration: Duration(microseconds: 120),
                  //           child: InkWell(
                  //             onTap: () {
                  //               routeProfile();
                  //             },
                  //             child: Hero(child: UserProfile(profile), tag: profile.id,),
                  //           ),
                  //        )
                        //  : Container(),
                  child: Container(),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  margin: EdgeInsets.only(bottom: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(fetchingStories ? "Fetching stories..." : ""),
                      fetchingStories
                      ? Container(
                        width: 18,
                        margin: EdgeInsets.only(left: 12),
                        height: 18,
                        alignment: Alignment(0, 0),
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                      : Container()
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}