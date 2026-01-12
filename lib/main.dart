import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:untitled3/route/app_route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreenWidget extends StatelessWidget {
  const HomeScreenWidget({super.key});

  final String _image =
      "https://cellphones.com.vn/sforum/wp-content/uploads/2024/02/avatar-anh-meo-cute-3.jpg";
  final String _placeHolder = 'assets/images/image_refund.png';
  final _iconTw = "assets/images/ic_twitter.png";
  final _iconBe = "assets/images/ic_behance.png";
  final _iconFb = "assets/images/ic_facebook.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push('/refund/emcuongmatma');
          // context.push(Uri(path: "/refund",queryParameters: {'id':'emcuongmatma'}).toString());
          // context.push('refund',Model("emcuongmatma"));
        },
        child: const Icon(Icons.navigate_next),
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadiusGeometry.all(Radius.circular(16)),
          ),
          child: Column(
            children: [
              Card(
                margin: const EdgeInsets.all(0),
                color: Colors.blueAccent,
                shape: const RoundedRectangleBorder(
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
                            icon: const Icon(Icons.arrow_back),
                            color: Colors.white,
                          ),
                          const Text(
                            "Profile",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.settings),
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
                        ),
                        child: ClipOval(
                          child: FadeInImage.assetNetwork(
                            placeholder: _placeHolder,
                            image: _image,
                            fit: BoxFit.cover,
                            imageErrorBuilder: (context, error, stackTrace) {
                              return Image.asset(_placeHolder);
                            },
                          ),
                        ),
                      ),
                      const Text(
                        "Em Cuong Mat Ma",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      const Text(
                        "Android Developer Intern",
                        style: TextStyle(color: Colors.white38, fontSize: 20),
                      ),
                      const SizedBox(height: 16),
                      const SizedBox(
                        height: 30,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FollowTitleWidget(number: 1000, text: "Follower"),
                            VerticalDivider(
                              color: Colors.white60,
                              thickness: 1,
                              indent: 2.0,
                              endIndent: 2.0,
                            ),
                            FollowTitleWidget(number: 1200, text: "Following"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                flex: 1,
                child: ListView(
                  children: [
                    const InformationTitleWidget(
                      widget: Icon(Icons.email),
                      text: "Email",
                      info: "abc1234@gmail.com",
                    ),
                    const InformationTitleWidget(
                      widget: Icon(Icons.phone_android),
                      text: "Mobile",
                      info: "0123456789",
                    ),
                    InformationTitleWidget(
                      widget: Image.asset(_iconTw),
                      text: "Twitter",
                      info: "@ecmm",
                    ),
                    InformationTitleWidget(
                      widget: Image.asset(_iconBe),
                      text: "Behance",
                      info: "www.behance.net/ecmm",
                    ),
                    InformationTitleWidget(
                      widget: Image.asset(_iconFb),
                      text: "Facebook",
                      info: "www.facebook.com/ecmm",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FollowTitleWidget extends StatelessWidget {
  final int number;
  final String text;

  const FollowTitleWidget({
    super.key,
    required this.number,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: "$number",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 14,
            ),
          ),
          TextSpan(
            text: " $text",
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class InformationTitleWidget extends StatelessWidget {
  final Widget widget;
  final String text;
  final String info;

  const InformationTitleWidget({
    super.key,
    required this.widget,
    required this.text,
    required this.info,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          ListTile(
            leading: widget,
            title: Text(
              text,
              style: const TextStyle(color: Colors.black26, fontSize: 16),
            ),
            subtitle: Text(
              info,
              style: const TextStyle(color: Colors.black45, fontSize: 16),
            ),
          ),
          const Divider(height: 1, thickness: 1),
        ],
      ),
    );
  }
}
