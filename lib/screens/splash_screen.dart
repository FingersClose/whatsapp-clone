import 'package:chatify/program/colors_code.dart';
import 'package:chatify/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double calculateLogoSize(double size) {
    if (size > 110) {
      return 110;
    } else if (size < 80) {
      return 80;
    } else {
      return size;
    }
  }

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      if(mounted){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Home(),));
      }
    },);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double size = calculateLogoSize(width * 0.1);
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: height,
          width: width,
          child: Stack(
            children: [
              Center(
                child: SizedBox(
                  height: size,
                  width: size,
                  child: SvgPicture.asset(
                    "assets/images/app_logo.svg",
                    color: const Color.fromARGB(255, 37, 211, 102),
                  ),
                ),
              ),
              const Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SpinKitThreeBounce(color: Colors.black,size: 20,),
                  SizedBox(height: 30)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
