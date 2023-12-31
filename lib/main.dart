import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:nhom4_appraovat/CategoriesWidget.dart';
import 'package:nhom4_appraovat/ItemsWidget.dart';
import 'package:nhom4_appraovat/Search_product.dart';
import 'package:nhom4_appraovat/account_page.dart';
import 'package:nhom4_appraovat/ad_detail_page.dart';
import 'package:nhom4_appraovat/main_nav.dart';
import 'package:nhom4_appraovat/shopping_cart_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: main_nav(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final myitems = [
    Image.asset('assets/images/images01.jpg'),
    Image.asset('assets/images/images02.jpg'),
    Image.asset('assets/images/images03.jpg'),
    Image.asset('assets/images/images04.jpg'),
    Image.asset('assets/images/images05.jpg'),
  ];

  int myCurrentIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: CurvedNavigationBar(
      //   backgroundColor: Colors.transparent,
      //   color: Colors.orange,
      //   items: [
      //     Icon(
      //       Icons.home,
      //       color: Colors.white,
      //     ),
      //     Icon(
      //       Icons.shopping_cart,
      //       color: Colors.white,
      //     ),
      //     Icon(
      //       Icons.account_box,
      //       color: Colors.white,
      //     ),
      //   ],
      //   onTap: (index) {
      //     setState(() => myCurrentIndex = index);
      //     if (index == 2) {
      //       // Check if "Account" icon is tapped (index 2)
      //       Navigator.push(context,
      //           MaterialPageRoute(builder: (context) => AccountPage()));
      //     }
      //   },
      // ),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(254, 255, 170, 0),
        actions: [
          Expanded(
            child: Center(
              child: GestureDetector(
                onTap: () {
                  // Điều hướng đến màn hình tìm kiếm khi nhấn vào thanh tìm kiếm.
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SearchProductPage()));
                },
                child: Container(
                  width: 300.0,
                  height: 35.0,
                  child: TextField(
                    style: TextStyle(fontSize: 12.0),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 18.0),
                      hintText: 'Tìm kiếm sản phẩm trên Rao Vặt...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      suffixIcon: IconButton(
                        icon: Icon(
                          Icons.search,
                          color: Colors.orange,
                          ),
                          onPressed: () {
                             Navigator.push(context, MaterialPageRoute(builder: (context) => SearchProductPage()));
                             },
                             ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Thêm IconButton cho tính năng tin nhắn
          IconButton(
            icon: Icon(
              Icons.message_outlined,
              color: Colors.black,
            ),
            onPressed: () {
              // Thêm mã xử lý khi người dùng nhấn vào biểu tượng tin nhắn ở đây
            },
          ),

          // Thêm IconButton cho tính năng thông báo
          IconButton(
            icon: Icon(
              Icons.notifications_active,
              color: Colors.black,
            ),
            onPressed: () {
              // Thêm mã xử lý khi người dùng nhấn vào biểu tượng thông báo ở đây
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                  autoPlay: true,
                  height: 85,
                  onPageChanged: ((index, reason) {
                    setState(() {
                      myCurrentIndex = index;
                    });
                  })),
             items: myitems.asMap().entries.map((entry) {
              final index = entry.key;
              final imagePath = myitems[index].image.toString(); // Access the asset path
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AdDetailPage(imagePath),
          ),
        );
      },
      child: Image(image: myitems[index].image),
    );
  }).toList(),
),
            AnimatedSmoothIndicator(
              activeIndex: myCurrentIndex,
              count: myitems.length,
              effect: WormEffect(
                dotHeight: 10,
                dotWidth: 10,
                spacing: 5,
                dotColor: Color.fromARGB(255, 152, 174, 181),
                activeDotColor: Colors.grey.shade900,
                paintStyle: PaintingStyle.fill,
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 10,
              ),
              child: Text(
                'Danh mục sản phẩm',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange),
              ),
            ),
            CategoriesWidget(),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 10,
              ),
              child: Text(
                'Danh sách sản phẩm',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange),
              ),
            ),
            ItemsWidget(),
          ],
        ),
      ),
    );
  }
}
