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
    return GestureDetector(
      onTap: (){},
      child: Container(
        height: 125,
        width: 120,
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
                    style: TextStyle(fontSize: 15, color: kFieldBorderColor),
                  )
                ],
              ),
            ),
            CircularStepProgressIndicator(
              totalSteps: 10000,
              currentStep: chartWalk,
              stepSize: 12,
              selectedColor: Color(0xFF38E6F0),
              unselectedColor: Colors.black,
              width: 80,
              height: 80,
              selectedStepSize: 12,
              // roundedCap: (_, __) => true,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    chartWalk.toString(),
                    style: TextStyle(fontSize: 12, color: kDefaultTextColor),
                  ),
                  Text(
                    '/ 10,000',
                    style: TextStyle(fontSize: 12, color: kFieldBorderColor),
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
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 125,
        width: 120,
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
                    style: TextStyle(fontSize: 12, color: kFieldBorderColor),
                  )
                ],
              ),
            ),
            CircularStepProgressIndicator(
              totalSteps: 10000,
              currentStep: chartBurn,
              stepSize: 12,
              selectedColor: Color(0xFF38E6F0),
              unselectedColor: Colors.black,
              width: 80,
              height: 80,
              selectedStepSize: 12,
              // roundedCap: (_, __) => true,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    chartBurn.toString(),
                    style: TextStyle(fontSize: 12, color: kDefaultTextColor),
                  ),
                  Text(
                    '/ 10,000',
                    style: TextStyle(fontSize: 12, color: kFieldBorderColor),
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
  const AboutyouWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 20, 10, 0),
          child: Row(
            children: [
              Icon(
                Icons.person,
                size: 30,
                color: Colors.yellow,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'Overview',
                style: TextStyle(
                    fontSize: 16,
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
                  style: TextStyle(fontSize: 10, color: kFieldBorderColor),
                ),
                Text(
                  'Mele',
                  style: TextStyle(fontSize: 14, color: kDefaultTextColor),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  'Weight',
                  style: TextStyle(fontSize: 10, color: kFieldBorderColor),
                ),
                Text(
                  '75.0',
                  style: TextStyle(fontSize: 14, color: kDefaultTextColor),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  'High',
                  style: TextStyle(fontSize: 10, color: kFieldBorderColor),
                ),
                Text(
                  '175.5',
                  style: TextStyle(fontSize: 14, color: kDefaultTextColor),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  'BMI',
                  style: TextStyle(fontSize: 10, color: kFieldBorderColor),
                ),
                Text(
                  '25.0',
                  style: TextStyle(fontSize: 14, color: kDefaultTextColor),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
