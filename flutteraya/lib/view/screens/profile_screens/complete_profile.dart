import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
class CompleteProfile extends StatefulWidget {
  const CompleteProfile({Key? key}) : super(key: key);

  @override
  _CompleteProfileState createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {
  double prog = 0.1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("garab"),
      ),
      floatingActionButton: ElevatedButton(
        child: Text("press"),
        onPressed: () {
          setState(() {
            prog += 0.1;
          });
        },
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularPercentIndicator(
              radius: 80.0,
              lineWidth: 15.0,
              percent: prog,
              center: Text("${prog*100}%"),
              progressColor: Colors.green,
            )
            ],
        ),
      ),
    );
  }
}
