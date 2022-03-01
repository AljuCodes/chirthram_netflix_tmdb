import 'package:chithram_netflix_tmdb/main.dart';
import 'package:flutter/material.dart';

class CommingSoon extends StatefulWidget {
  const CommingSoon({Key? key}) : super(key: key);

  @override
  _CommingSoonState createState() => _CommingSoonState();
}

class _CommingSoonState extends State<CommingSoon> {
  bool isComing = true;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          SizedBox(
            height: 30,
          ),
          firstStack1(height: height, width: width),
          Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 5,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      isComing = true;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: (isComing) ? Colors.white : Colors.grey,
                    ),
                    child: Row(children: [
                      Icon(
                        Icons.movie,
                      ),
                      Text9(
                        "Coming Soon",
                      ),
                    ]),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      isComing = false;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: isComing ? Colors.grey : Colors.white,
                    ),
                    child: Row(children: [
                      Icon(
                        Icons.movie_filter_outlined,
                      ),
                      Text9(
                        "Everyone's Watching",
                      ),
                    ]),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.grey,
                  ),
                  child: Row(children: [
                    Icon(
                      Icons.ten_k_rounded,
                    ),
                    Text9(
                      "Top 10",
                    ),
                  ]),
                ),
              ],
            ),
          ),
          isComing
              ? FutureBuilder<List<dynamic>>(
                  future: contentController.getUpComming(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final upcomingList = snapshot.data;
                      return Column(
                        children: [
                          Container(
                            height: height,
                            child: ListView.builder(
                                itemCount: upcomingList!.length,
                                itemBuilder: (context, index) {
                           
                                  return CommingListViews(
                                    height: height,
                                    uri: upcomingList[index]["backdrop_path"],
                                    name: upcomingList[index]
                                            ['original_title'] ??
                                        "ww",
                                    date: upcomingList[index]["release_date"],
                                    subtitle: upcomingList[index]["overview"],
                                  );
                                }),
                          ),
                        ],
                      );
                    }
                    return Center(child: CircularProgressIndicator());
                  })
              : FutureBuilder<List<dynamic>>(
                  future: contentController.getTrending(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final upcomingList = snapshot.data;
                      return Column(
                        children: [
                          Container(
                            height: height,
                            child: ListView.builder(
                                itemCount: upcomingList!.length,
                                itemBuilder: (context, index) {
                                   String? date =
                                      upcomingList[index]["release_date"];
                                                  print("212 ${date}");
                                  date ??=
                                      upcomingList[index]["first_air_date"];
                                      print("212 ${upcomingList[index]["name"] }${date}");
                                  return CommingListViews1(
                                    height: height,
                                    uri: upcomingList[index]["backdrop_path"],
                                    name: upcomingList[index]['name'] ??
                                        upcomingList[index]['title'],
                                    date: date,
                                    subtitle: upcomingList[index]["overview"],
                                  );
                                }),
                          ),
                        ],
                      );
                    }
                    return Center(child: CircularProgressIndicator());
                  })
        ]),
      ),
    );
  }
}

class firstStack1 extends StatelessWidget {
  const firstStack1({
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
              child: Text("New & Hot",
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
                      Icons.notifications,
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

class CommingListViews extends StatelessWidget {
  CommingListViews(
      {required this.height,
      required this.uri,
      required this.name,
      required this.date,
      this.subtitle});
  final height;
  final String uri;
  final String name;
  final date;
  final subtitle;
   Widget DateWidget=Container();
  @override
  Widget build(BuildContext context) {
    if(date!=null){
        final day = date[8] + date[9];
    final  month = date[5] + date[6];
    print("888 $name");
    print("888 date is ${date}");
    print("888 day is $day and month is $month");
     DateWidget =  getDate(day , month);
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // image and playButton
        Row(
          children: [
            Spacer(),
            DateWidget,
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(top: 0),
              child: Container(
                
                child: Icon(
                  Icons.play_circle_outline_outlined,
                  color: Colors.white,
                  size: 60,
                ),
                height: height * .27,
                width: height * .44 ,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    image: NetworkImage('http://image.tmdb.org/t/p/w500' + uri),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            SizedBox(width: 10,)
          ],
        ),
        //
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
            //  margin: EdgeInsets.only(right: 15),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Column(
                        children: [
                          Icon(
                            Icons.notifications_none_outlined,
                            color: Colors.white,
                            size: 24,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              "Reminder Me",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Column(
                        children: [
                          Icon(
                            Icons.info_outline,
                            color: Colors.white,
                            size: 24,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text("info",
                                style: TextStyle(color: Colors.white)),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            "Releasing on ${date} ",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            name,
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w900),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            subtitle,
            style:
                TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 15),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 70),
          child: Text(
            "Serial * Dark * Emotional * Mystery * Drama ",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Divider(
          color: Colors.white.withOpacity(0.5),
        ),
      ],
    );
  }

  Widget getDate(String day, String month) {
    String monthName = getMonthName(month);
    return Container(
child: Column(
  children: [
   
    Text(monthName,style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
     Text(day,style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w800),),
  ],
),
    );
  }

  String getMonthName(String month) {
    String month2;
    switch(month){
      
      case "01":
        month2 = "Jan";
        break;
      case "02":
        month2 = "Feb";
        break;
      case "03":
        month2 = "Mar";
        break;
      case "04":
        month2 = "Apr";
        break;
      case "05":
        month2 = "May";
        break;
      case "06":
        month2 = "Jun";
        break;
      case "07":
        month2 = "Jul";
        break;
      case "08":
        month2 = "Aug";
        break;
      case "09":
        month2 = "Sep";
        break;
      case "10":
        month2 = "Oct";
        break;
      case "11":
        month2 = "Nov";
        break;
      case "12":
        month2 = "Dec";
        break;
        default:
          month2 = "January";  
    }
    return month2;
  }
}

Widget Text9(String text) {
  return Text(
    text,
    style: TextStyle(
      fontSize: 15,
      color: Colors.black,
      fontWeight: FontWeight.w600,
    ),
  );
}

class CommingListViews1 extends StatelessWidget {
  CommingListViews1(
      {required this.height,
      required this.uri,
      required this.name,
      required this.date,
      this.subtitle});
  final height;
  final String uri;
  final String name;
  final date;
  final subtitle;
  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // image and playButton
        Padding(
          padding: const EdgeInsets.only(top: 0),
          child: Container(
            child: Icon(
              Icons.play_circle_outline_outlined,
              color: Colors.white,
              size: 60,
            ),
            height: height * .29,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('http://image.tmdb.org/t/p/w500' + uri),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        //
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
            //  margin: EdgeInsets.only(right: 15),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Column(
                        children: [
                          Icon(
                            Icons.notifications_none_outlined,
                            color: Colors.white,
                            size: 24,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              "Reminder Me",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Column(
                        children: [
                          Icon(
                            Icons.info_outline,
                            color: Colors.white,
                            size: 24,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text("info",
                                style: TextStyle(color: Colors.white)),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            "Released  on ${date} ",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            name,
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w900),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            subtitle,
            style:
                TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 15),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 70),
          child: Text(
            "Serial * Dark * Emotional * Mystery * Drama ",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Divider(
          color: Colors.white.withOpacity(0.5),
        ),
      ],
    );
  }
}
