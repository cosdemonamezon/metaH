import 'package:flutter/material.dart';
import 'package:metah/constants/color.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class WalkChartWidget extends StatelessWidget {
  const WalkChartWidget({
    Key? key,
    required this.chartWalk,
  }) : super(key: key);

  final int chartWalk;

  @override
  Widget build(BuildContext context) {
    final isPhone = MediaQuery.of(context).size.shortestSide < 550;
    return GestureDetector(
      onTap: (){},
      child: Container(
        height: isPhone ?125 :180,
        width: isPhone ?120 :180,
        decoration: BoxDecoration(
            border: Border.all(color: Color.fromARGB(255, 253, 76, 64)),
            image: DecorationImage(
                image: AssetImage('assets/BGactivity3.png'), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
              child: Row(
                children: [
                  Image.asset('assets/Icon/Acwalk.png'),
                  Text(
                    'Walk',
                    style: TextStyle(fontSize: isPhone ?15 :22, color: kFieldBorderColor),
                  )
                ],
              ),
            ),
            CircularStepProgressIndicator(
              totalSteps: 10000,
              currentStep: chartWalk,
              stepSize: isPhone ?12 :16,
              selectedColor: Color(0xFF38E6F0),
              unselectedColor: Colors.black,
              width: isPhone ?80 :110,
              height: isPhone ?80 :110,
              selectedStepSize: isPhone ?12 :16,
              // roundedCap: (_, __) => true,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    chartWalk.toString(),
                    style: TextStyle(fontSize: isPhone ?12 :18, color: kDefaultTextColor),
                  ),
                  Text(
                    '/ 10,000',
                    style: TextStyle(fontSize: isPhone ?12 :18, color: kFieldBorderColor),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BurnChartWidget extends StatelessWidget {
  const BurnChartWidget({
    Key? key,
    required this.chartBurn,
  }) : super(key: key);

  final int chartBurn;

  @override
  Widget build(BuildContext context) {
    final isPhone = MediaQuery.of(context).size.shortestSide < 550;
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: isPhone ?125 :180,
        width: isPhone ?120 :180,
        decoration: BoxDecoration(
            border: Border.all(color: Color.fromARGB(255, 253, 76, 64)),
            image: DecorationImage(
                image: AssetImage('assets/BGactivity3.png'), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
              child: Row(
                children: [
                  Image.asset('assets/Icon/AcBurn.png'),
                  Text(
                    'Burn',
                    style: TextStyle(fontSize: isPhone ?15 :22, color: kFieldBorderColor),
                  )
                ],
              ),
            ),
            CircularStepProgressIndicator(
              totalSteps: 10000,
              currentStep: chartBurn,
              stepSize: isPhone ?12 :16,
              selectedColor: Color(0xFF38E6F0),
              unselectedColor: Colors.black,
              width: isPhone ?80 :110,
              height: isPhone ?80 :110,
              selectedStepSize: isPhone ?12 :16,
              // roundedCap: (_, __) => true,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    chartBurn.toString(),
                    style: TextStyle(fontSize: isPhone ?12 :18, color: kDefaultTextColor),
                  ),
                  Text(
                    '/ 10,000',
                    style: TextStyle(fontSize: isPhone ?12 :18, color: kFieldBorderColor),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AboutyouWidget extends StatelessWidget {
  String? sex;
  String? higth;
  String? weight;
  String? bmi;
  AboutyouWidget({
    Key? key,
    this.bmi,this.higth,this.sex,this.weight
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isPhone = MediaQuery.of(context).size.shortestSide < 550;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 20, 10, 0),
          child: Row(
            children: [
              Icon(
                Icons.person,
                size: isPhone ?30 :45,
                color: Colors.yellow,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'Overview',
                style: TextStyle(
                    fontSize: isPhone ?16 :25,
                    fontWeight: FontWeight.bold,
                    color: kDefaultTextColor),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Text(
                  'Gender',
                  style: TextStyle(fontSize: isPhone ?10 :14, color: kFieldBorderColor),
                ),
                Text(
                  sex!,
                  style: TextStyle(fontSize: isPhone ?14 :20, color: kDefaultTextColor),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  'Weight',
                  style: TextStyle(fontSize: isPhone ?10 :14, color: kFieldBorderColor),
                ),
                Text(
                  weight!,
                  style: TextStyle(fontSize: isPhone ?14 :20, color: kDefaultTextColor),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  'High',
                  style: TextStyle(fontSize: isPhone ?10 :14, color: kFieldBorderColor),
                ),
                Text(
                  higth!,
                  style: TextStyle(fontSize: isPhone ?14 :20, color: kDefaultTextColor),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  'BMI',
                  style: TextStyle(fontSize: isPhone ?10 :14, color: kFieldBorderColor),
                ),
                Text(
                  bmi!,
                  style: TextStyle(fontSize: isPhone ?14 :20, color: kDefaultTextColor),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
