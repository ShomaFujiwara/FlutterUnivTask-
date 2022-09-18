import 'package:flutter/material.dart';

/// ファイル名は expanded_text.dart のようなスネークケースがよい
/// 参考：https://dart.dev/guides/language/effective-dart/style#do-name-libraries-and-source-files-using-lowercase_with_underscores
import 'expandedText.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
//_______________________________________________________________

          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0, //影を消す
            title: Center(
              child: Row(
                children: [
                  SizedBox(
                      width: 120,
                      height: 40,
                      child: Image.asset(
                        'images/insta_logo.png',
                        fit: BoxFit.cover,
                      )),
                  const SizedBox(width: 90),
                  IconButton(
                    onPressed: () => {},
                    icon: Stack(children: [
                      Center(
                        child: Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                            border: Border.all(
                                //全方位
                                width: 2, //太さ
                                color: Colors.black),
                            borderRadius: BorderRadius.circular(10), //角丸
                          ),
                        ),
                      ),
                      const Center(child: Icon(Icons.add)),
                    ]),
                    iconSize: 20,
                    color: Colors.black,
                  ),
                  IconButton(
                      onPressed: () => {},
                      icon: const Icon(Icons.favorite_border),
                      color: Colors.black),
                  IconButton(
                      onPressed: () => {},
                      icon: SizedBox(
                          width: 25,
                          height: 25,
                          child: Image.asset('images/insta_comment.jpg')))
                ],
              ),
            ),
          ),
//_________________________________________________________________

          body: SingleChildScrollView(
            //ストーリーズ
            child: Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: const [
                      Users(
                        userType: UserType.honer,
                        pageType: PageType.story,
                      ),
                      Users(
                        userType: UserType.guests,
                        pageType: PageType.story,
                      ),
                      Users(
                        userType: UserType.guests,
                        pageType: PageType.story,
                      ),
                      Users(
                        userType: UserType.guests,
                        pageType: PageType.story,
                      ),
                      Users(
                        userType: UserType.guests,
                        pageType: PageType.story,
                      ),
                      Users(
                        userType: UserType.guests,
                        pageType: PageType.story,
                      ),
                    ],
                  ),
                ),
                Container(
                  //ストーリーズとの区切り
                  height: 6,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                    color: Colors.black,
                    width: 0.1,
                  ))),
                ),
                // userの名前とアイコン
                //userの名前に左右されないように、絶対位置で固定
                const ViewPage(),
                const ViewPage(),
                const ViewPage(),
              ],
            ),
          ),
          bottomNavigationBar: SizedBox(
            height: 70,
            child: BottomNavigationBar(
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: Colors.black,
                  ),
                  label: " ",
                  tooltip: 'Home',
                  //アイコンを長押ししたときに表示されるテキスト
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  label: ' ',
                  tooltip: 'Search',
                ),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.slideshow,
                      color: Colors.black,
                    ),
                    label: ' ',
                    tooltip: 'reel'),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.shopping_bag,
                    color: Colors.black,
                  ),
                  label: ' ',
                  tooltip: 'shopping',
                ),
                BottomNavigationBarItem(
                    icon: CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 13,
                    ),
                    label: ' ',
                    tooltip: 'MyPage')
              ],

              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              enableFeedback: true, //選択されたときに音が出るかないか
              iconSize: 30,
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.black,
              // unselectedFontSize: 30,
            ),
          ),
        ));
  }
}

//________________________________________________________

class ViewPage extends StatefulWidget {
  const ViewPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            const Align(
              alignment: Alignment.topLeft,
              child: Users(
                userType: UserType.guests,
                pageType: PageType.home,
              ),
            ),
            Align(
              alignment: const Alignment(-0.8, -1),
              child: TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 13),
                ),
                onPressed: () {},
                child: const Text('userName'),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                  onPressed: () => {}, icon: const Icon(Icons.more_horiz)),
            ),
          ],
        ),
        // 投稿の写真を入れる箱
        Container(
          height: 400,
          color: Colors.blue,
        ),
        // いいねボタンなど
        Row(
          children: [
            IconButton(
                onPressed: () => {}, icon: const Icon(Icons.favorite_border)),
            IconButton(
                onPressed: () => {},
                icon: SizedBox(
                    width: 25,
                    height: 25,
                    child: Image.asset('images/insta_textbox.jpg'))),
            IconButton(onPressed: () => {}, icon: const Icon(Icons.near_me)),
            const SizedBox(width: 200),
            IconButton(
                onPressed: () => {},
                icon: SizedBox(
                    width: 25,
                    height: 25,
                    child: Image.asset('images/insta_save.jpg'))),
          ],
        ),
        // いいねの表示
        const Align(
            alignment: Alignment.topLeft,
            child: Text(
              '「いいね！」  件',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
        // 投稿欄

        const Padding(
          padding: EdgeInsets.all(15.0),
          child: ExpandableText(
              "description___________________aaaaaaaaaaaaaaccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"),
        ),
      ],
    );
  }
}

///_______________________________________________________
//ユーザーアイコン画面widget

/// 表示形式をわけるだけなら enum をつかって分岐させるとよりスマートです。

enum UserType {
  honer,
  guests,
}

enum PageType {
  home,
  story,
}

class Users extends StatelessWidget {
  const Users({
    super.key,
    required this.userType,
    required this.pageType,
  });
  final UserType userType;
  final PageType pageType;

  @override
  Widget build(BuildContext context) {
    /// 三項演算子を使うとよりスッキリかけます。
    final radiusSize = pageType == PageType.home ? 13.0 : 30.0;
    return Stack(children: [
      Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            InkWell(
              onTap: () => {},
              child: CircleAvatar(
                radius: radiusSize,
                backgroundColor: Colors.blueGrey,
                child: Text(
                  userType.name,
                  style: const TextStyle(fontSize: 10),
                ),
              ),
            ),
            const SizedBox(height: 5),
            if (pageType == PageType.story) const Text('name')
          ],
        ),
      ),

      //____________________________________________
      //ストーリーズ追加ボタン（自分）
      if (userType == UserType.honer) ...[
        const Positioned(
          top: 34,
          left: 37,
          child: Icon(
            Icons.circle,
            size: 34,
            color: Colors.white,
          ),
        ),
        Positioned(
          top: 27,
          left: 30,
          child: IconButton(
            onPressed: () => {},
            icon: const Icon(Icons.add_circle),
            color: Colors.blue,
            iconSize: 28,
          ),
        ),
      ],
    ]);
  }
}
