import 'package:chithram_netflix_tmdb/screens/coming_soon.dart';
import 'package:flutter/material.dart';

class DownloadScreen extends StatelessWidget {
  const DownloadScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
body: SingleChildScrollView(
  child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        SizedBox(height: height * 0.05),
        firstStack2(height: height, width: width),
        SizedBox(height: height * 0.0),
        SmartDownloadHeader(),
        SizedBox(height: height * 0.03),
        Container(
          height: 400,
          width: width,
          child: Center(child: Text("No Downloads Yet", style: TextStyle(color: Colors.grey, fontSize: 20),)),
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
    return Container(
      child: Container(
        child: Row(
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
      ),
    );
  }
}
