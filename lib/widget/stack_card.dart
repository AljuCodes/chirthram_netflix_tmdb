import 'package:bordered_text/bordered_text.dart';
import 'package:chithram_netflix_tmdb/main.dart';
import 'package:flutter/material.dart';

class StackCard extends StatelessWidget {
  StackCard(
      {Key? key, })
      : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        SizedBox(
          height: 200,
          child: FutureBuilder<List<dynamic>>(
            future: contentController.getTrending(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                List data = snapshot.data;
                return ListView.builder(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      String uri = data[index]['poster_path'];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Container(
                                width: 135,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            'http://image.tmdb.org/t/p/w500' +
                                                uri),
                                        fit: BoxFit.fill),
                                    borderRadius: BorderRadius.circular(6)),
                              ),
                            ),
                            Positioned(
                                left: -3,
                                bottom: -29,
                                child: BorderedText(
                                    strokeWidth: 6.0,
                                    strokeColor: Colors.white,
                                    child: Text(
                                      '${index + 1}',
                                      style: TextStyle(
                                        fontSize: 120,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    )))
                          ],
                        ),
                      );
                    });
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ),
      ],
    );
  }
}
