
import 'package:flutter/material.dart';
import 'dart:math';
class DownloadScreen extends StatelessWidget {
  const DownloadScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
body: SingleChildScrollView(
  child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        SizedBox(height: height * 0.05),
        firstStack2(height: height, width: width),
        // SizedBox(height: height * 0.03),
        Container(
          height: height*.8,
          width: width,
          child:ListView(
          children: [
            //  SmartDownloadHeader(),
            Padding(
              padding: const EdgeInsets.only( bottom: 16),
              child: Center(
                  child: Text(
                'Introducing Downloads for you',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w500),
              )),
            ),
            Center(
              child: Text(
                '''We'll download a personalised selection of moves and shows for you. so there's always something to watch on your phone''',
                style: TextStyle(color: Colors.white, fontSize: 17),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .030,
            ),
////////////////////////////////////////////////////////////////////////////
            Container(
              height: size.width * .75,
              child: CircleAvatar(
                backgroundColor: Colors.grey.shade900,
                child: Stack(
                  children: [
                    Center(
                        child: DownloadImage(
                            angel: -20.0,
                            image:
                                'https://i.pinimg.com/474x/73/ec/ab/73ecab3ff586d87a2cfacb9862ba629f.jpg',
                            margin: EdgeInsets.only(right: 170),
                            height: size.width * .50,
                            width: size.width * .55)),
                    Center(
                        child: DownloadImage(
                            angel: 20.0,
                            image:
                                'https://i.pinimg.com/736x/e9/db/05/e9db05b3d5db61b8fbd30bc6c9145c1a.jpg',
                            margin: EdgeInsets.only(left: 170),
                            height: size.width * .50,
                            width: size.width * .55)),
                    Center(
                        child: DownloadImage(
                      angel: 0.0,
                      image:
                          'https://i.pinimg.com/736x/40/6e/c6/406ec63b5fa6b5b4eeb2b7b5ac07da27.jpg',
                      margin: EdgeInsets.only(right: 0),
                      height: size.width * .55,
                      width: size.width * .55,
                      icon: Icon(
                        Icons.play_circle_outline_outlined,
                        size: 70,
                        color: Colors.black,
                      ),
                    )),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .05,
            ),
///////////////////////////////////////////////////////////////////////////
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.blue),
                  child: Center(
                      child: Text(
                    'SET UP',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w900),
                  )),
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  'Find more to download',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 15),
                ),
              ),
            )
          ],
        ),
       )

      ],
    ),
  ),
),
    );
  }
}

class SmartDownloadHeader extends StatelessWidget {
  const SmartDownloadHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Icon(Icons.settings,color: Colors.grey,),Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text("Smart Downloads",style: TextStyle(color: Colors.grey,fontSize: 20),),
      )

    ],);
  }
}



class firstStack2 extends StatelessWidget {
  const firstStack2({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Text("Downloads",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 9.0),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 30,
                    height: 30,
                    child: Image(
                      image: AssetImage("lib/assets/img/user.jpg"),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
     
     
     
      ],
    );
  }
}



class DownloadImage extends StatelessWidget {
  const DownloadImage(
      {Key? key,
      required this.angel,
      required this.image,
      required this.margin,
      required this.height,
      required this.width,
      this.icon})
      : super(key: key);
  final double angel;
  final image;
  final margin;
  final icon;
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angel * pi / 180,
      child: Container(
        child: icon,
        margin: margin,
        width: width,
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                fit: BoxFit.fitHeight, image: NetworkImage(image))),
      ),
    );
  }
}
