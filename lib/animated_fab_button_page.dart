import 'dart:math';

import 'package:animated_fab_button/get_location_info_page.dart';
import 'package:animated_fab_button/image_picker_page.dart';
import 'package:flutter/material.dart';

class AnimatedFabButtonPage extends StatefulWidget {
  const AnimatedFabButtonPage({super.key});

  @override
  State<AnimatedFabButtonPage> createState() => _AnimatedFabButtonPageState();
}

class _AnimatedFabButtonPageState extends State<AnimatedFabButtonPage> with TickerProviderStateMixin {

late AnimationController animationControl;

late Animation<double> scaleAnimationValue;
late Animation<double> rotateAnimationValue;

bool fabDurum = false;


@override
  void initState() {
    super.initState();
    animationControl = AnimationController(vsync: this, duration:const Duration(milliseconds: 200));

    scaleAnimationValue = Tween(begin: 0.0, end: 1.0).animate(animationControl)..addListener(() { 
      setState(() {
        
      });
    });

    rotateAnimationValue = Tween(begin: 0.0, end: pi/4).animate(animationControl)..addListener(() { 
      setState(() {
        
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    animationControl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text(""),
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[],
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Transform.scale(
              scale: scaleAnimationValue.value,
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ImagePickerPage()));
                },
                tooltip: "Add Image",
                backgroundColor: Colors.yellow,
                child: const Icon(Icons.photo_camera),
              ),
            ),
            Transform.scale(
              scale: scaleAnimationValue.value,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>const GetLocationInfoPage()));
                  },
                  tooltip: "Add Location",
                  backgroundColor: Colors.orange,
                  child: const Icon(Icons.alarm),
                ),
              ),
            ),
            Transform.rotate(
              angle: rotateAnimationValue.value,
              child: FloatingActionButton(
                onPressed: () {
                  debugPrint("Fab Main tıklandı");
                  if(fabDurum) {
                  animationControl.reverse();
                  fabDurum = false;
                  } else {
                    animationControl.forward();
                    fabDurum = true;
                  }
                },
                tooltip: "Fab Main",
                backgroundColor: Colors.red,
                child: const Icon(Icons.add),
              ),
            ),
          ],
        ));
  }
}