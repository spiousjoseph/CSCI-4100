import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

void main() {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //the 2 tweets
  static TweetWidget tweet1 = new TweetWidget(
      'NASA',
      '@NASA',
      '2h',
      '#SuitUp 👩‍🚀👨‍🚀 We’re moving forward with the spacesuits our #Artemis astronauts will wear on the Moon. '
          '\n On Tues., Oct. 15 at 2 p.m. EDT, tune in for an up-close look and live demo with spacesuit engineers: https://t.co/MYnmHLBN9j',
      'https://pbs.twimg.com/media/EG4Dmc7X4AE3WwR?format=jpg&name=medium',
      223,
      56,
      90);
  static TweetWidget tweet2 = new TweetWidget(
      'Elon Musk',
      '@elonmusk',
      '10h',
      'Space Jam should’ve won the Oscar',
      'https://pbs.twimg.com/media/EGv5PCZU8AA7PZJ.jpg',
      14545,
      225,
      26);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab 03 04',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Lab 03 04'),
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage('https://pbs.twimg.com/profile_images/1091070803184177153/TI2qItoi_400x400.jpg'),
              ),
              title: tweet1.build(), // Row main
            ),// end of L1
            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage('https://pbs.twimg.com/profile_images/1178009465674747907/k5fzT65B_400x400.jpg'),
              ),
              title: tweet2.build(),
            )
          ],

        ),
      ),
    );
  }
}


class TweetWidget{
  String userShortName, userLongName, timeString, description, imageURL;
  int numComments, numRetweets, numLikes;
  TweetWidget(String snm, String ln, String ts, String d, String i, int nc, int nr, int nl){
    userShortName = snm;
    userLongName = ln;
    timeString = ts;
    description = d;
    imageURL = i;
    numComments = nc;
    numRetweets = nr;
    numLikes = nl;
  }

  Widget build(){
    var tweetrow =  Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(userShortName,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(userLongName,
                      style: TextStyle(fontWeight: FontWeight.w100),
                    ),
                    Text(timeString,
                      style: TextStyle(fontWeight: FontWeight.w100),
                    ),
                    Icon(
                      Icons.expand_more,
                      color: Colors.grey,
                    ),
                  ],
                ),
                Text(description),
                Image.network(imageURL),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                          Icons.chat_bubble_outline,
                          color: Colors.grey,
                        ),
                        Text(numComments.toString(),
                          style: TextStyle(fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                          Icons.repeat,
                          color: Colors.grey,
                        ),
                        Text(numRetweets.toString(),
                          style: TextStyle(fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                          Icons.favorite_border,
                          color: Colors.grey,
                        ),
                        Text(numLikes.toString(),
                          style: TextStyle(fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                          Icons.bookmark_border,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ); //main row
    return tweetrow;
  } // end of build
} // end of Tweet class



