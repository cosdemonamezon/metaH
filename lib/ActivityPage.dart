import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:metah/activityModel.dart';
import 'package:metah/activityWidget.dart';
import 'package:metah/constants/color.dart';
import 'package:metah/constants/icon.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ActivityPage extends StatefulWidget {
  ActivityPage({Key? key}) : super(key: key);

  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  final Duration animDuration = const Duration(milliseconds: 250);
  final _controller = ScrollController();

  int touchedIndex = -1;

  bool isPlaying = false;

  int chartWalk = 5000;
  int chartBurn = 5000;

  double mass = 77;
  final double _weigth = 0;
  final double _high = 0;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        SingleChildScrollView(
          child: Container(
            height: size.height,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                leading: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.arrow_back_ios),
                ),
                automaticallyImplyLeading: false,
                toolbarHeight: 75,
                backgroundColor: Colors.transparent,
                elevation: 0,
                flexibleSpace: Container(
                  height: size.height * 0.30,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/BarUser.png'),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(15, 15, 15, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                                width: size.width * 0.15,
                                height: size.height * 0.15,
                                child: Image.asset(
                                  'assets/profile_img.png',
                                  fit: BoxFit.fitHeight,
                                )),
                            Container(
                              //color: Colors.amber,
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(15, 15, 0, 0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        SizedBox(
                                                          width:
                                                              size.width * 0.30,
                                                          child: Text(
                                                            "Jeon Jungkook",
                                                            style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  kDefaultTextColor,
                                                            ),
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            maxLines: 1,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          children: const [
                                                            Image(
                                                                image:
                                                                    kLevelIcon),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            Text(
                                                              "9",
                                                              style: TextStyle(
                                                                  fontSize: 14,
                                                                  color:
                                                                      kDefaultTextColor),
                                                            )
                                                          ],
                                                        ),
                                                        SizedBox(),
                                                        Row(
                                                          children: const [
                                                            Image(
                                                                image:
                                                                    kAtkIcon),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            Text(
                                                              "200K",
                                                              style: TextStyle(
                                                                  fontSize: 14,
                                                                  color:
                                                                      kDefaultTextColor),
                                                            )
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Text(
                                                          "ID: 1234",
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              color:
                                                                  kDefaultTextColor),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {},
                                                          child: SizedBox(
                                                            child: Image(
                                                                image:
                                                                    kWalletIcon),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {},
                                                          child: Image(
                                                            image:
                                                                kNotificationIcon,
                                                            width: 36,
                                                            height: 36,
                                                          ),
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        LinearPercentIndicator(
                                          width: size.width * 0.40,
                                          animation: true,
                                          animationDuration: 1000,
                                          lineHeight: 10.0,
                                          percent: 1.0,
                                          center: Text(
                                            "100/100%",
                                            style: TextStyle(
                                                fontSize: 9,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          //progressColor: Colors.red,
                                          linearGradient: LinearGradient(
                                              colors: [
                                                Color.fromARGB(255, 253, 190, 1),
                                                Color.fromARGB(255, 255, 153, 19),
                                                Color.fromARGB(255, 255, 60, 0),
                                                Color.fromARGB(255, 219, 14, 255),
                                                Color.fromARGB(255, 148, 6, 6),
                                                Color.fromARGB(255, 119, 31, 23)
                                              ]),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 50,
                          width: 240,
                          decoration: BoxDecoration(
                              //color: Colors.amber,
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.orange,
                                  Colors.amber,
                                ],
                              )),
                          child: Text(
                            'SHOOT WHIT AVATAR',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    //Image.asset('assets/Setting_bg1.png'),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: 115,
                              width: 260,
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18)),
                                  color: Color.fromARGB(255, 120, 1, 1),
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image(
                                          image: AssetImage(
                                              'assets/BGactivity2.png'),
                                          height: 115,
                                          width: 260,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.all(3.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      3, 3, 0, 0),
                                                  child: Row(
                                                    children: [
                                                      Image.asset(
                                                          'assets/Icon/AcFrie.png'),
                                                      Text(
                                                        'Calories',
                                                        style: TextStyle(
                                                            color:
                                                                kDefaultTextColor,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                          '300',
                                                          style: TextStyle(
                                                              color:
                                                                  kDefaultTextColor,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        Text(
                                                          'Min',
                                                          style: TextStyle(
                                                              color:
                                                                  kFieldBorderColor,
                                                              fontSize: 10,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          'Daily Avg.',
                                                          style: TextStyle(
                                                              color:
                                                                  kFieldBorderColor,
                                                              fontSize: 10,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        Text(
                                                          '30',
                                                          style: TextStyle(
                                                              color:
                                                                  kDefaultTextColor,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        Text(
                                                          'Min',
                                                          style: TextStyle(
                                                              color:
                                                                  kFieldBorderColor,
                                                              fontSize: 10,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 1.0),
                                              child: BarChart(
                                                isPlaying
                                                    ? randomData()
                                                    : mainBarData(),
                                                swapAnimationDuration:
                                                    animDuration,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            //card two
                            SizedBox(
                              height: 110,
                              width: 255,
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: Card(
                                  margin: EdgeInsets.zero,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18)),
                                  color: Color.fromARGB(255, 120, 1, 1),
                                  child: Stack(
                                    children: <Widget>[
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image(
                                          image: AssetImage(
                                              'assets/BGactivity2.png'),
                                          height: 115,
                                          width: 258,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Padding(
                                            padding: EdgeInsets.all(5.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      3, 5, 0, 0),
                                                  child: Row(
                                                    children: [
                                                      Image.asset(
                                                          'assets/Icon/AcWorkout.png'),
                                                      Text(
                                                        'Workout',
                                                        style: TextStyle(
                                                            color:
                                                                kDefaultTextColor,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                          '300',
                                                          style: TextStyle(
                                                              color:
                                                                  kDefaultTextColor,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        Text(
                                                          'Min',
                                                          style: TextStyle(
                                                              color:
                                                                  kFieldBorderColor,
                                                              fontSize: 10,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          'Daily Avg.',
                                                          style: TextStyle(
                                                              color:
                                                                  kFieldBorderColor,
                                                              fontSize: 10,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        Text(
                                                          '30',
                                                          style: TextStyle(
                                                              color:
                                                                  kDefaultTextColor,
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        Text(
                                                          'Min',
                                                          style: TextStyle(
                                                              color:
                                                                  kFieldBorderColor,
                                                              fontSize: 10,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 1.0),
                                              child: BarChart(
                                                isPlaying
                                                    ? randomData()
                                                    : mainBarData2(),
                                                swapAnimationDuration:
                                                    animDuration,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            //
                            SizedBox(
                              height: 3,
                            ),
                            Row(
                              children: [
                                WalkChartWidget(chartWalk: chartWalk),
                                BurnChartWidget(chartBurn: chartBurn),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 95,
                              width: 260,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/BGAbout.png'),
                                    fit: BoxFit.fill),
                              ),
                              child: AboutyouWidget(),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 125,
                                  width: 125,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color:
                                              Color.fromARGB(255, 253, 76, 64)),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/BGactivity3.png'),
                                          fit: BoxFit.cover),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 10, 0, 0),
                                        child: Row(
                                          children: [
                                            Image.asset(
                                                'assets/Icon/AcWeight.png'),
                                            Text(
                                              'Weight',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: kDefaultTextColor),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            mass.toString(),
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: kDefaultTextColor),
                                          ),
                                          Text(
                                            'kg',
                                            style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold,
                                                color: kFieldBorderColor),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      GestureDetector(
                                        onTap: () {},
                                        child: Text(
                                          'Updete',
                                          style: TextStyle(color: Colors.blue),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Container(
                                  height: 125,
                                  width: 125,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color:
                                              Color.fromARGB(255, 253, 76, 64)),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/BGactivity3.png'),
                                          fit: BoxFit.cover),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 10, 0, 0),
                                        child: Row(
                                          children: [
                                            Image.asset(
                                                'assets/Icon/AcBMI.png'),
                                            Text(
                                              'BMI',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: kDefaultTextColor),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        '25.0',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: kDefaultTextColor),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 125,
                                  width: 125,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color:
                                              Color.fromARGB(255, 253, 76, 64)),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/BGactivity3.png'),
                                          fit: BoxFit.cover),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(20, 10, 0, 0),
                                        child: Row(
                                          children: [
                                            Image.asset(
                                                'assets/Icon/AcFat.png'),
                                            Text(
                                              'Fat mass',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: kDefaultTextColor),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '15',
                                            style: TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold,
                                                color: kDefaultTextColor),
                                          ),
                                          Text(
                                            '%',
                                            style: TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold,
                                                color: kFieldBorderColor),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      GestureDetector(
                                        onTap: () {},
                                        child: Text(
                                          'Updete',
                                          style: TextStyle(color: Colors.blue),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  height: 125,
                                  width: 125,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color:
                                              Color.fromARGB(255, 253, 76, 64)),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/BGactivity3.png'),
                                          fit: BoxFit.cover),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(20, 10, 0, 0),
                                        child: Row(
                                          children: [
                                            Image.asset(
                                                'assets/Icon/AcMuscle.png'),
                                            Text(
                                              'Muscle',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: kDefaultTextColor),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '15',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: kDefaultTextColor),
                                          ),
                                          Text(
                                            '%',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: kFieldBorderColor),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      GestureDetector(
                                        onTap: () {},
                                        child: Text(
                                          'Updete',
                                          style: TextStyle(color: Colors.blue),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 125,
                                  width: 125,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color:
                                              Color.fromARGB(255, 253, 76, 64)),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/BGactivity3.png'),
                                          fit: BoxFit.cover),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 10, 0, 0),
                                        child: Row(
                                          children: [
                                            Image.asset(
                                                'assets/Icon/AcWeight.png'),
                                            Text(
                                              'Weight',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: kDefaultTextColor),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '55',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: kDefaultTextColor),
                                          ),
                                          Text(
                                            'kg',
                                            style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold,
                                                color: kFieldBorderColor),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      GestureDetector(
                                        onTap: () {},
                                        child: Text(
                                          'Change',
                                          style: TextStyle(color: Colors.blue),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  height: 125,
                                  width: 125,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color:
                                              Color.fromARGB(255, 253, 76, 64)),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/BGactivity3.png'),
                                          fit: BoxFit.cover),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 10, 0, 0),
                                        child: Row(
                                          children: [
                                            Image.asset(
                                                'assets/Icon/AcMuscle.png'),
                                            Text(
                                              'Muscle',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: kDefaultTextColor),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '30',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: kDefaultTextColor),
                                          ),
                                          Text(
                                            '%',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: kFieldBorderColor),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      GestureDetector(
                                        onTap: () {},
                                        child: Text(
                                          'Change',
                                          style: TextStyle(color: Colors.blue),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: 125,
                                  width: 125,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color:
                                              Color.fromARGB(255, 253, 76, 64)),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/BGactivity3.png'),
                                          fit: BoxFit.cover),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 10, 0, 0),
                                        child: Row(
                                          children: [
                                            Image.asset(
                                                'assets/Icon/AcFat.png'),
                                            Text(
                                              'Fat mass',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: kDefaultTextColor),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '15',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: kDefaultTextColor),
                                          ),
                                          Text(
                                            '%',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: kFieldBorderColor),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      GestureDetector(
                                        onTap: () async {},
                                        child: Text(
                                          'Change',
                                          style: TextStyle(color: Colors.blue),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  BarChartGroupData makeGroupData(
    int x,
    double y, {
    bool isTouched = false,
    // Color barColor = Colors.yellow,
    double width = 8,
    List<int> showTooltips = const [],
  }) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: isTouched ? y + 1 : y,
          color: isTouched ? Color(0xFF38E6F0) : Color(0xFF38E6F0),
          width: width,
          borderSide: isTouched
              ? BorderSide(color: Colors.blue.darken(), width: 2)
              : const BorderSide(color: Colors.white, width: 0),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 300,
            color: Colors.black,
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  //Goup1
  List<BarChartGroupData> showingGroups() => List.generate(7, (i) {
        switch (i) {
          case 0:
            return makeGroupData(0, 250, isTouched: i == touchedIndex);
          case 1:
            return makeGroupData(1, 200, isTouched: i == touchedIndex);
          case 2:
            return makeGroupData(2, 150, isTouched: i == touchedIndex);
          case 3:
            return makeGroupData(3, 50, isTouched: i == touchedIndex);
          case 4:
            return makeGroupData(4, 200, isTouched: i == touchedIndex);
          case 5:
            return makeGroupData(5, 100, isTouched: i == touchedIndex);
          case 6:
            return makeGroupData(6, 130, isTouched: i == touchedIndex);
          default:
            return throw Error();
        }
      });

  BarChartData mainBarData() {
    return BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
            tooltipBgColor: Colors.blueGrey,
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              String weekDay;
              switch (group.x.toInt()) {
                case 0:
                  weekDay = 'Monday';
                  break;
                case 1:
                  weekDay = 'Tuesday';
                  break;
                case 2:
                  weekDay = 'Wednesday';
                  break;
                case 3:
                  weekDay = 'Thursday';
                  break;
                case 4:
                  weekDay = 'Friday';
                  break;
                case 5:
                  weekDay = 'Saturday';
                  break;
                case 6:
                  weekDay = 'Sunday';
                  break;
                default:
                  throw Error();
              }
              return BarTooltipItem(
                weekDay + '\n',
                const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: (rod.toY - 1).toString(),
                    style: const TextStyle(
                      color: Colors.yellowAccent,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              );
            }),
        touchCallback: (FlTouchEvent event, barTouchResponse) {
          setState(() {
            if (!event.isInterestedForInteractions ||
                barTouchResponse == null ||
                barTouchResponse.spot == null) {
              touchedIndex = -1;
              return;
            }
            touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
          });
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getTitles,
            reservedSize: 20,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: showingGroups(),
      gridData: FlGridData(show: false),
    );
  }

  // Group2
  List<BarChartGroupData> showingGroups2() => List.generate(7, (i) {
        switch (i) {
          case 0:
            return makeGroupData(0, 150, isTouched: i == touchedIndex);
          case 1:
            return makeGroupData(1, 50, isTouched: i == touchedIndex);
          case 2:
            return makeGroupData(2, 100, isTouched: i == touchedIndex);
          case 3:
            return makeGroupData(3, 190, isTouched: i == touchedIndex);
          case 4:
            return makeGroupData(4, 300, isTouched: i == touchedIndex);
          case 5:
            return makeGroupData(5, 250, isTouched: i == touchedIndex);
          case 6:
            return makeGroupData(6, 290, isTouched: i == touchedIndex);
          default:
            return throw Error();
        }
      });

  BarChartData mainBarData2() {
    return BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
            tooltipBgColor: Colors.blueGrey,
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              String weekDay;
              switch (group.x.toInt()) {
                case 0:
                  weekDay = 'Monday';
                  break;
                case 1:
                  weekDay = 'Tuesday';
                  break;
                case 2:
                  weekDay = 'Wednesday';
                  break;
                case 3:
                  weekDay = 'Thursday';
                  break;
                case 4:
                  weekDay = 'Friday';
                  break;
                case 5:
                  weekDay = 'Saturday';
                  break;
                case 6:
                  weekDay = 'Sunday';
                  break;
                default:
                  throw Error();
              }
              return BarTooltipItem(
                weekDay + '\n',
                const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: (rod.toY - 1).toString(),
                    style: const TextStyle(
                      color: Colors.yellowAccent,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              );
            }),
        touchCallback: (FlTouchEvent event, barTouchResponse) {
          setState(() {
            if (!event.isInterestedForInteractions ||
                barTouchResponse == null ||
                barTouchResponse.spot == null) {
              touchedIndex = -1;
              return;
            }
            touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
          });
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getTitles,
            reservedSize: 25,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: showingGroups2(),
      gridData: FlGridData(show: false),
    );
  }
  // Group2

  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 12,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text('Sun', style: style);
        break;
      case 1:
        text = const Text('Mon', style: style);
        break;
      case 2:
        text = const Text('Tue', style: style);
        break;
      case 3:
        text = const Text('Wed', style: style);
        break;
      case 4:
        text = const Text('Thu', style: style);
        break;
      case 5:
        text = const Text('Fri', style: style);
        break;
      case 6:
        text = const Text('Sat', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 5,
      child: text,
    );
  }

  BarChartData randomData() {
    return BarChartData(
      barTouchData: BarTouchData(
        enabled: false,
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getTitles,
            reservedSize: 20,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      // barGroups: List.generate(7, (i) {
      //   switch (i) {
      //     case 0:
      //       return makeGroupData(0, Random().nextInt(15).toDouble() + 6,
      //           barColor: widget.availableColors[
      //               Random().nextInt(widget.availableColors.length)]);
      //     case 1:
      //       return makeGroupData(1, Random().nextInt(15).toDouble() + 6,
      //           barColor: widget.availableColors[
      //               Random().nextInt(widget.availableColors.length)]);
      //     case 2:
      //       return makeGroupData(2, Random().nextInt(15).toDouble() + 6,
      //           barColor: widget.availableColors[
      //               Random().nextInt(widget.availableColors.length)]);
      //     case 3:
      //       return makeGroupData(3, Random().nextInt(15).toDouble() + 6,
      //           barColor: widget.availableColors[
      //               Random().nextInt(widget.availableColors.length)]);
      //     case 4:
      //       return makeGroupData(4, Random().nextInt(15).toDouble() + 6,
      //           barColor: widget.availableColors[
      //               Random().nextInt(widget.availableColors.length)]);
      //     case 5:
      //       return makeGroupData(5, Random().nextInt(15).toDouble() + 6,
      //           barColor: widget.availableColors[
      //               Random().nextInt(widget.availableColors.length)]);
      //     case 6:
      //       return makeGroupData(6, Random().nextInt(15).toDouble() + 6,
      //           barColor: widget.availableColors[
      //               Random().nextInt(widget.availableColors.length)]);
      //     default:
      //       return throw Error();
      //   }
      // }),
      // gridData: FlGridData(show: false),
    );
  }
}
