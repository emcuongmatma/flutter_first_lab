import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.blueAccent)),
      home: const MyWidget(),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadiusGeometry.all(Radius.circular(16)),
        ),
        child: Column(
          children: [
            Card(
              margin: EdgeInsets.all(0),
              color: Colors.blueAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 16,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.arrow_back),
                          color: Colors.white,
                        ),
                        Text(
                          "Profile",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.settings),
                          color: Colors.white,
                        ),
                      ],
                    ),
                    Container(
                      width: 108,
                      height: 108,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 4),
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://cellphones.com.vn/sforum/wp-content/uploads/2024/02/avatar-anh-meo-cute-3.jpg',
                          ),
                        ),
                      ),
                    ),
                    Text(
                      "Em Cuong Mat Ma",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "Android Developer Intern",
                      style: TextStyle(
                        color: Colors.white38,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 16,),
                    SizedBox(
                      height: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _customSpanText(1000, "Follower"),
                          VerticalDivider(
                            color: Colors.white60,
                            thickness: 1,
                            indent: 2.0,
                            endIndent: 2.0,
                          ),
                          _customSpanText(1200, "Following"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 8),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  _informationItem2(
                    Icon(Icons.email),
                    "Email",
                    "abc1234@gmail.com",
                  ),
                  _informationItem2(
                    Icon(Icons.phone_android),
                    "Mobile",
                    "0123456789",
                  ),
                  _informationItem2(
                    Image.asset("images/ic_twitter.png"),
                    "Twitter",
                    "@ecmm",
                  ),
                  _informationItem2(
                    Image.asset("images/ic_behance.png"),
                    "Behance",
                    "www.behance.net/ecmm",
                  ),
                  _informationItem2(
                    Image.asset("images/ic_facebook.png"),
                    "Facebook",
                    "www.facebook.com/ecmm",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _customSpanText(int number, String text) {
  return RichText(
    text: TextSpan(
      children: <TextSpan>[
        TextSpan(
          text: "$number",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 14,
          ),
        ),
        TextSpan(
          text: " $text",
          style: TextStyle(color: Colors.white, fontSize: 12),
        ),
      ],
    ),
  );
}

Widget _informationItem(Widget widget, String text, String info) {
  return Material(
    color: Colors.white,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: 24, height: 24, child: widget),
              SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      text,
                      style: TextStyle(color: Colors.black26, fontSize: 16),
                    ),
                    SizedBox(height: 4),
                    Text(
                      info,
                      style: TextStyle(color: Colors.black45, fontSize: 16),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
          Divider(height: 1, thickness: 1),
        ],
      ),
    ),
  );
}

Widget _informationItem2(Widget widget, String text, String info) {
  return Material(
    color: Colors.white,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          ListTile(
            leading: widget,
            title: Text(
              text,
              style: TextStyle(color: Colors.black26, fontSize: 16),
            ),
            subtitle: Text(
              info,
              style: TextStyle(color: Colors.black45, fontSize: 16),
            ),
          ),
          Divider(height: 1, thickness: 1),
        ],
      ),
    ),
  );
}

