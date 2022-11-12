import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:metah/activityController.dart';
import 'package:metah/activityModel.dart';
import 'package:metah/activityService.dart';
import 'package:metah/activityWidget.dart';
import 'package:metah/constants/LoadingDialog.dart';
import 'package:metah/constants/color.dart';
import 'package:metah/constants/icon.dart';
import 'package:metah/models/user.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ActivityPage extends StatefulWidget {
  ActivityPage({Key? key}) : super(key: key);

  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  final Duration animDuration = const Duration(milliseconds: 250);
  final _controller = ScrollController();
  final GlobalKey _gLobalkey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
  String barcode = "";
  String showText = '';

  int touchedIndex = -1;

  bool isPlaying = false;

  int chartWalk = 5000;
  int chartBurn = 5000;

  double mass = 77;
  final double _weigth = 0;
  final double _high = 0;
  User? user;

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

  scan() async {
    ScanResult _barcode = await BarcodeScanner.scan();
    setState(() {
      barcode = _barcode.rawContent;
    });
    if (barcode != '') {
      final _user = await ActivityService.getUserByCode(barcode);
      if (mounted) {
        setState(() {
          user = _user;
        });
      }
    }

    // try {
    //   ScanResult _barcode = await BarcodeScanner.scan();
    //   setState(() {
    //     barcode = _barcode.rawContent;
    //   });

    //   if (barcode != '') {
    //     //LoadingDialog.open(context);
    //     //await context.read<ActivityController>().getUser('0000001');
    //     final user = await ActivityService.getUserByCode('0000001');
    //     if (mounted) {
    //       setState(() {});
    //     }
    //     //LoadingDialog.close(context);
    //     //LoadingDialog.open(context);
    //     // final scan = await ScanApi.getScanTicket(barcode);
    //     // if (scan != null) {
    //     //   if (scan['statusCode'] == 200) {
    //     //     setState(() {
    //     //       data = scan;
    //     //       showText = '';
    //     //     });
    //     //     //LoadingDialog.close(context);
    //     //     print('200');
    //     //   } else if (scan['statusCode'] == 400) {
    //     //     setState(() {
    //     //       data.clear();
    //     //       showText = scan['message'];
    //     //     });
    //     //     //LoadingDialog.close(context);
    //     //   } else {
    //     //     print('format barcode not true');
    //     //     setState(() {
    //     //       //data.clear();
    //     //       showText = 'ไม่พบตั๋วคอนเสิร์ต';
    //     //     });
    //     //     //LoadingDialog.close(context);
    //     //   }
    //     //} else {}
    //   } else {}
    // } on PlatformException catch (e) {
    //   if (e.code == BarcodeScanner.cameraAccessDenied) {
    //     // The user did not grant the camera permission.
    //   } else {
    //     // Unknown error.
    //   }
    // } on FormatException {
    //   // User returned using the "back"-button before scanning anything.
    // } catch (e) {
    //   // Unknown error.
    // }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isPhone = MediaQuery.of(context).size.shortestSide < 550;
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
                  icon: Icon(
                    Icons.arrow_back_ios,
                    size: isPhone ? 20 : 35,
                  ),
                ),
                automaticallyImplyLeading: false,
                toolbarHeight: isPhone ?size.height * 0.165 :size.height * 0.145,
                backgroundColor: Colors.transparent,
                elevation: 0,
                flexibleSpace: Container(
                  height: isPhone ? size.height * 0.30 : size.height * 0.50,
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
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Column(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        SizedBox(
                                                          width: isPhone ?size.width * 0.30 : size.width * 0.50,
                                                          child: user != null
                                                              ? Text("${user!.name}",
                                                                  style: TextStyle(
                                                                    fontSize: isPhone ?16 :25,
                                                                    fontWeight: FontWeight.bold,
                                                                    color: kDefaultTextColor,
                                                                  ),
                                                                  overflow: TextOverflow.ellipsis,
                                                                  maxLines: 1,
                                                                )
                                                              : Text('null',
                                                                  style: TextStyle(
                                                                    fontSize: isPhone ?16 :25,
                                                                    fontWeight: FontWeight.bold,
                                                                    color: kDefaultTextColor,
                                                                  )),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Image(
                                                              image: kLevelIcon,
                                                              width: isPhone ?16 :26,
                                                              height: isPhone ?16 :26,
                                                              fit: BoxFit.fill,
                                                            ),
                                                            SizedBox(width: isPhone ?5 : 10,),
                                                            user != null
                                                                ? Text(
                                                                    "${user!.level}",
                                                                    style: TextStyle(
                                                                        fontSize: isPhone ?14 :20,
                                                                        color: kDefaultTextColor),
                                                                  )
                                                                : Text(
                                                                    "null",
                                                                    style: TextStyle(
                                                                        fontSize:isPhone ?14 :20,
                                                                        color: kDefaultTextColor),
                                                                  )
                                                          ],
                                                        ),
                                                        SizedBox(),
                                                        Row(
                                                          children: [
                                                            Image(
                                                              image: kAtkIcon,
                                                              width: isPhone ?16 :26,
                                                              height: isPhone ?16 :26,
                                                              fit: BoxFit.fill,
                                                            ),
                                                            SizedBox(width: isPhone ?5 :10,),
                                                            user != null
                                                                ? Text(
                                                                    "${user!.str}K",
                                                                    style: TextStyle(
                                                                        fontSize: isPhone ?14 :20,
                                                                        color: kDefaultTextColor),
                                                                  )
                                                                : Text(
                                                                    "null",
                                                                    style: TextStyle(
                                                                        fontSize: isPhone ?14 :20,
                                                                        color: kDefaultTextColor),
                                                                  )
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        user != null
                                                            ? Text(
                                                                "ID: ${user!.code}",
                                                                style: TextStyle(
                                                                    fontSize: isPhone ?14 :20,
                                                                    color: kDefaultTextColor),
                                                              )
                                                            : Text(
                                                                "null",
                                                                style: TextStyle(
                                                                    fontSize: isPhone ?14 :20,
                                                                    color: kDefaultTextColor),
                                                              ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {},
                                                          child: SizedBox(
                                                            child: Image(
                                                              image: kWalletIcon,
                                                              width: isPhone ?36 :46,
                                                              height: isPhone ?36 :46,
                                                              fit: BoxFit.fill,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {},
                                                          child: Image(
                                                            image: kNotificationIcon,
                                                            width: isPhone ?36 :46,
                                                            height: isPhone ?36 :46,
                                                            fit: BoxFit.fill,
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
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        LinearPercentIndicator(
                                          width: isPhone ?size.width * 0.42 :size.width * 0.585,
                                          animation: true,
                                          animationDuration: 1000,
                                          lineHeight: isPhone ?10.0 :20.0,
                                          percent: 1.0,
                                          center: Text(
                                            "100/100%",
                                            style: TextStyle(
                                                fontSize: isPhone ?9 :14,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          //progressColor: Colors.red,
                                          linearGradient:
                                              LinearGradient(colors: [
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
                          height: isPhone ?50 :60,
                          width: isPhone ?240 :260,
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
                              fontSize: isPhone ?14 :20,
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
                child: user != null
                    ? Column(
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
                                    height: isPhone ?115 :190,
                                    width: isPhone ?260 :390,
                                    child: AspectRatio(
                                      aspectRatio: 1,
                                      child: Card(
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                                        color: Color.fromARGB(255, 120, 1, 1),
                                        child: Stack(
                                          children: [
                                            ClipRRect(
                                              borderRadius: BorderRadius.circular(20),
                                              child: Image(
                                                image: AssetImage('assets/BGactivity2.png'),
                                                height: isPhone ?115 :190,
                                                width: isPhone ?260 :390,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.stretch,
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.all(3.0),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Padding(
                                                        padding: EdgeInsets.fromLTRB(3, 3, 0, 0),
                                                        child: Row(
                                                          children: [
                                                            Image.asset('assets/Icon/AcFrie.png'),
                                                            Text(
                                                              'Calories',
                                                              style: TextStyle(
                                                                  color: kDefaultTextColor,
                                                                  fontSize: isPhone ?16 :25,
                                                                  fontWeight: FontWeight.bold),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Column(
                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Text(
                                                                '300',
                                                                style: TextStyle(
                                                                    color: kDefaultTextColor,
                                                                    fontSize: isPhone ?14 :20,
                                                                    fontWeight: FontWeight.bold),
                                                              ),
                                                              Text(
                                                                'Min',
                                                                style: TextStyle(
                                                                    color: kFieldBorderColor,
                                                                    fontSize: isPhone ?10 :14,
                                                                    fontWeight: FontWeight.bold),
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              Text(
                                                                'Daily Avg.',
                                                                style: TextStyle(
                                                                    color: kFieldBorderColor,
                                                                    fontSize: isPhone ?10 :14,
                                                                    fontWeight: FontWeight.bold),
                                                              ),
                                                              Text(
                                                                '30',
                                                                style: TextStyle(
                                                                    color: kDefaultTextColor,
                                                                    fontSize: isPhone ?14 :20,
                                                                    fontWeight: FontWeight.bold),
                                                              ),
                                                              Text(
                                                                'Min',
                                                                style: TextStyle(
                                                                    color: kFieldBorderColor,
                                                                    fontSize: isPhone ?10 :14,
                                                                    fontWeight: FontWeight.bold),
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
                                                    padding: EdgeInsets.symmetric(horizontal: 1.0),
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
                                    height: isPhone ?115 :190,
                                    width: isPhone ?260 :390,
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
                                                image: AssetImage('assets/BGactivity2.png'),
                                                height: isPhone ?115 :190,
                                                width: isPhone ?260 :390,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.stretch,
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.max,
                                              children: <Widget>[
                                                Padding(
                                                  padding: EdgeInsets.all(5.0),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Padding(
                                                        padding: EdgeInsets.fromLTRB(3, 5, 0, 0),
                                                        child: Row(
                                                          children: [
                                                            Image.asset('assets/Icon/AcWorkout.png'),
                                                            Text(
                                                              'Workout',
                                                              style: TextStyle(
                                                                  color: kDefaultTextColor,
                                                                  fontSize: isPhone ?16 :25,
                                                                  fontWeight: FontWeight.bold),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Column(
                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Text(
                                                                '300',
                                                                style: TextStyle(
                                                                    color: kDefaultTextColor,
                                                                    fontSize: isPhone ?14 :20,
                                                                    fontWeight: FontWeight.bold),
                                                              ),
                                                              Text(
                                                                'Min',
                                                                style: TextStyle(
                                                                    color: kFieldBorderColor,
                                                                    fontSize: isPhone ?10 :14,
                                                                    fontWeight: FontWeight.bold),
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              Text(
                                                                'Daily Avg.',
                                                                style: TextStyle(
                                                                    color: kFieldBorderColor,
                                                                    fontSize: isPhone ?10 :14,
                                                                    fontWeight: FontWeight.bold),
                                                              ),
                                                              Text(
                                                                '30',
                                                                style: TextStyle(
                                                                    color: kDefaultTextColor,
                                                                    fontSize: isPhone ?14 :20,
                                                                    fontWeight: FontWeight.bold),
                                                              ),
                                                              Text(
                                                                'Min',
                                                                style: TextStyle(
                                                                    color: kFieldBorderColor,
                                                                    fontSize: isPhone ?10 :14,
                                                                    fontWeight: FontWeight.bold),
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
                                                    padding: EdgeInsets.symmetric(horizontal: 1.0),
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
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      WalkChartWidget(chartWalk: chartWalk),
                                      SizedBox(width: size.width*0.008,),
                                      BurnChartWidget(chartBurn: chartBurn),
                                    ],
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: size.width *0.005),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: isPhone ?95 :150,
                                      width: isPhone ?260 :390,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage('assets/BGAbout.png'),
                                            fit: BoxFit.fill),
                                      ),
                                      child: AboutyouWidget(
                                        bmi: user!.bmi.toString(),
                                        sex: user!.sex,
                                        higth: user!.higth.toString(),
                                        weight: user!.weight.toString(),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: isPhone ?125 :160,
                                          width: isPhone ?125 :180,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Color.fromARGB(255, 253, 76, 64)),
                                              image: DecorationImage(
                                                  image: AssetImage('assets/BGactivity3.png'),
                                                  fit: BoxFit.cover),
                                              borderRadius: BorderRadius.circular(20)),
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                                                child: Row(
                                                  children: [
                                                    Image.asset('assets/Icon/AcWeight.png'),
                                                    Text(
                                                      'Weight',
                                                      style: TextStyle(
                                                          fontSize: isPhone ?14 :20,
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
                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    //mass.toString(),
                                                    user!.weight.toString(),
                                                    style: TextStyle(
                                                        fontSize: isPhone ?20 :30,
                                                        fontWeight: FontWeight.bold,
                                                        color: kDefaultTextColor),
                                                  ),
                                                  Text(
                                                    'kg',
                                                    style: TextStyle(
                                                        fontSize: isPhone ?10 :16,
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
                                                  style: TextStyle(fontSize: isPhone ?14 :20,
                                                      color: Colors.blue),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: size.width*0.003,
                                        ),
                                        Container(
                                          height: isPhone ?125 :160,
                                          width: isPhone ?125 :180,
                                          decoration: BoxDecoration(
                                              border: Border.all(color: Color.fromARGB(255, 253, 76, 64)),
                                              image: DecorationImage(
                                                  image: AssetImage('assets/BGactivity3.png'),
                                                  fit: BoxFit.cover),
                                              borderRadius: BorderRadius.circular(20)),
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                                                child: Row(
                                                  children: [
                                                    Image.asset('assets/Icon/AcBMI.png'),
                                                    Text(
                                                      'BMI',
                                                      style: TextStyle(
                                                          fontSize: isPhone ?14 :20,
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
                                                '${user!.bmi}',
                                                style: TextStyle(
                                                    fontSize: isPhone ?20 :30,
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
                                          height: isPhone ?125 :160,
                                          width: isPhone ?125 :180,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Color.fromARGB(255, 253, 76, 64)),
                                              image: DecorationImage(
                                                  image: AssetImage('assets/BGactivity3.png'),
                                                  fit: BoxFit.cover),
                                              borderRadius: BorderRadius.circular(20)),
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                                                child: Row(
                                                  children: [
                                                    Image.asset('assets/Icon/AcFat.png'),
                                                    Text(
                                                      'Fat mass',
                                                      style: TextStyle(
                                                          fontSize: isPhone ?16 :25,
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
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    '${user!.fatMass}',
                                                    style: TextStyle(
                                                        fontSize: isPhone ?25 :35,
                                                        fontWeight: FontWeight.bold,
                                                        color: kDefaultTextColor),
                                                  ),
                                                  Text(
                                                    '%',
                                                    style: TextStyle(
                                                        fontSize: isPhone ?25 :35,
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
                                                  style: TextStyle(fontSize: isPhone ?14 :20,
                                                      color: Colors.blue),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: size.width*0.003,
                                        ),
                                        Container(
                                          height: isPhone ?125 :160,
                                          width: isPhone ?125 :180,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Color.fromARGB(255, 253, 76, 64)),
                                              image: DecorationImage(
                                                  image: AssetImage('assets/BGactivity3.png'),
                                                  fit: BoxFit.cover),
                                              borderRadius: BorderRadius.circular(20)),
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                                                child: Row(
                                                  children: [
                                                    Image.asset('assets/Icon/AcMuscle.png'),
                                                    Text(
                                                      'Muscle',
                                                      style: TextStyle(
                                                          fontSize: isPhone ?16 :25,
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
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    '${user!.muscle}',
                                                    style: TextStyle(
                                                        fontSize: isPhone ?20 :30,
                                                        fontWeight: FontWeight.bold,
                                                        color: kDefaultTextColor),
                                                  ),
                                                  Text(
                                                    '%',
                                                    style: TextStyle(
                                                        fontSize: isPhone ?20 :30,
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
                                                  style: TextStyle(fontSize: isPhone ?14 :20,
                                                      color: Colors.blue),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: isPhone ?125 :160,
                                        width: isPhone ?125 :180,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Color.fromARGB(255, 253, 76, 64)),
                                            image: DecorationImage(
                                                image: AssetImage('assets/BGactivity3.png'),
                                                fit: BoxFit.cover),
                                            borderRadius: BorderRadius.circular(20)),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                                              child: Row(
                                                children: [
                                                  Image.asset('assets/Icon/AcWeight.png'),
                                                  Text(
                                                    'Weight',
                                                    style: TextStyle(
                                                        fontSize: isPhone ?16 :25,
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
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  '${user!.weight}',
                                                  style: TextStyle(
                                                      fontSize: isPhone ?20 :30,
                                                      fontWeight: FontWeight.bold,
                                                      color: kDefaultTextColor),
                                                ),
                                                Text(
                                                  'kg',
                                                  style: TextStyle(
                                                      fontSize: isPhone ?10 :16,
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
                                                style: TextStyle(fontSize: isPhone ?14 :20,
                                                    color: Colors.blue),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                        height: isPhone ?125 :160,
                                        width: isPhone ?125 :180,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Color.fromARGB(255, 253, 76, 64)),
                                            image: DecorationImage(
                                                image: AssetImage('assets/BGactivity3.png'),
                                                fit: BoxFit.cover),
                                            borderRadius: BorderRadius.circular(20)),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                                              child: Row(
                                                children: [
                                                  Image.asset('assets/Icon/AcMuscle.png'),
                                                  Text(
                                                    'Muscle',
                                                    style: TextStyle(
                                                        fontSize: isPhone ?16 :25,
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
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  '${user!.muscle}',
                                                  style: TextStyle(
                                                      fontSize: isPhone ?20 :30,
                                                      fontWeight: FontWeight.bold,
                                                      color: kDefaultTextColor),
                                                ),
                                                Text(
                                                  '%',
                                                  style: TextStyle(
                                                      fontSize: isPhone ?20 :30,
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
                                                style: TextStyle(fontSize: isPhone ?14 :20,
                                                    color: Colors.blue),
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
                                        height: isPhone ?125 :160,
                                        width: isPhone ?125 :180,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Color.fromARGB(255, 253, 76, 64)),
                                            image: DecorationImage(
                                                image: AssetImage('assets/BGactivity3.png'),
                                                fit: BoxFit.cover),
                                            borderRadius: BorderRadius.circular(20)),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                                              child: Row(
                                                children: [
                                                  Image.asset('assets/Icon/AcFat.png'),
                                                  Text(
                                                    'Fat mass',
                                                    style: TextStyle(
                                                        fontSize: isPhone ?16 :25,
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
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  '${user!.fatMass}',
                                                  style: TextStyle(
                                                      fontSize: isPhone ?20 :30,
                                                      fontWeight: FontWeight.bold,
                                                      color: kDefaultTextColor),
                                                ),
                                                Text(
                                                  '%',
                                                  style: TextStyle(
                                                      fontSize: isPhone ?16 :25,
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
                                                style: TextStyle(fontSize: isPhone ?14 :20,
                                                    color: Colors.blue),
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
                      )
                    : SizedBox.shrink(),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: scan,
                backgroundColor: Color.fromARGB(255, 253, 76, 64),
                child: const Icon(Icons.qr_code_2),
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
    final isPhone = MediaQuery.of(context).size.shortestSide < 550;
    final style = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: isPhone ?12 :16,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = Text('Sun', style: style);
        break;
      case 1:
        text = Text('Mon', style: style);
        break;
      case 2:
        text = Text('Tue', style: style);
        break;
      case 3:
        text = Text('Wed', style: style);
        break;
      case 4:
        text = Text('Thu', style: style);
        break;
      case 5:
        text = Text('Fri', style: style);
        break;
      case 6:
        text = Text('Sat', style: style);
        break;
      default:
        text = Text('', style: style);
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
