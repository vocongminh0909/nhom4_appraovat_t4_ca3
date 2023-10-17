import 'package:flutter/material.dart';


class Product {
  final String name;
  final String description;
  final String imageUrl;
  final String price; // Thêm trường price vào lớp Product
  final String detailDescription; // Thêm trường mô tả chi tiết riêng cho từng sản phẩm

  Product({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.detailDescription,
  });
}

class Chitiet_SP extends StatelessWidget {
  final List<Product> products = [
    Product(
      name: "Exciter khóa smartkey 2020 mới 90% bstp chính chủ",
      price: "36.000.000 VND",
      description:
      "Màu: Trắng,Xanh,Đen\n"
          "Xe té cong chảng ba\n"
          "trầy nhiều\n"
          "mất gù\n"
          "odo 3000km.",
      imageUrl: "assets/images/xemay.jpg",
      detailDescription: "Xe máy Thái Nguyên cần bán Yamaha Exciter khóa smartkey 2022 mới 99% biển số thành phố\n"
          "chính chủ bao công chứng bảo hành 1 năm bao trả đổi có hỗ trợ trả góp\n"
          "chỉ cần căn cước công dân xe dưới 20 triệu không cần trả trước xe trên 20 triệu trả trước 20%,\n"
          "góp qua thẻ tín dụng trả trước 0đ góp cửa hàng cần căn cước công dân bằng lái trả trước 40%\n"
          "cửa hàng có thu mua trao đổi tất cả các dòng xe thân chiều địa chỉ 101 tân thới nhất 5 TPHCM",

    ),
    Product(name: "Đồng hồ ELLE-Man",
      price: "800.000 VND",
      description: "Màu cổ điển\n"
      ,
      imageUrl: "assets/images/dong-ho-deo-tay-ELLE-Man.jpg" ,
    detailDescription: "do không còn nhu cầu sử dụng nữa nên mình bán lại ạ\n"
        "Máy dùng cái nhân, giữ kỹ, chưa qua sửa chữa\n"
        "Bán đồng hồ có đi kèm dây và cáp sạc.\n"

        "COD tại khu vực HCM"),
    Product(name: "Laptop Rog Zephyrus",
        price: "28.000.000VND",
        description: "Ram 8gb\n"
        "Card đồ họa : NVIDIA GeForce RTX 3050 4GB GDDR6, Boost Clock 1740MHz, TGP 85W\n"
            "itel core i5\n"
            "Màn hình 15.6 FHD(1920x1080) IPS 250nits Anti-glare, 120Hz, 45% NTSC, DC dimmer",
        imageUrl: "assets/images/laptop.jpg",
    detailDescription: "CẦN BÁN LAPTOP ACER E5-571, CPU CORE I3-4005U, RAM 4GB, Ổ CỨNG SSD 128GB VGA\n"
        "INTEL HD GRAPHICS LCD 15.6''INCHS. PHÙ hợp cho các bạn học sinh, sinh viên, và các bạn văn phòng,\n"
        "anh chị nào cần ủng hộ mình nha, LH: CHỊ MINH"),
    Product(
      name: "Iphone-14pro",
      price: "25.000.000 VND",
      description:
      "Màu: Vàng kim \n"
          "Không trầy xước\n"
          "Nguyên zin chưa thay phụ kiên\n"
          "Dung lượng pin:87%\n"
          "Sài được 1 năm.",
      imageUrl: "assets/images/iphone-14-pro-vang.jpg",
      detailDescription: "Đồng tháp bán Iphone14 Pro bản 256 Gb hàng VN máy màu Tím mua tại Clickbuy,\n"
          "còn 10 ngày bảo hành hãng. Máy chính chủ dùng nguyên bản 100% ,máy đẹp 99% như mới ,\n" 
          "Pin 89%, full box và phụ kiện theo máy từ đầu. Ae quan tâm inbox ạ."
    ),

  ];


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Danh Sách Sản Phẩm'),
          backgroundColor: Colors.orange,
        ),
        body: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Image.asset(products[index].imageUrl),
              title: Text(products[index].name),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailPage(product: products[index]),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class ProductDetailPage extends StatelessWidget {
  final Product product;

  ProductDetailPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Center(
              child: Image.asset(
                product.imageUrl,
                width: 350,
                height: 350,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: RichText(
              text: TextSpan(
                style: const TextStyle(fontSize: 18, color: Colors.black),
                children: [
                  const TextSpan(text: "Giá: "),
                  TextSpan(
                    text: product.price,
                    style: const TextStyle(fontSize: 18, color: Colors.red),
                  ),
                  const TextSpan(text: "\n"),
                  TextSpan(
                    text: product.description,
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Divider(color: Colors.grey, thickness: 1),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Mô tả chi tiết :",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              product.detailDescription,
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
          ),
        ],
      ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () {
                // Xử lý khi người dùng nhấn nút yêu thích
              },
            ),
            IconButton(
              icon: Icon(Icons.call), // Icon liên hệ
              onPressed: () {
                // Xử lý khi người dùng nhấn nút liên hệ
              },
            ),
            IconButton(
              icon: Icon(Icons.add_shopping_cart),
              onPressed: () {
                // Xử lý khi người dùng nhấn nút thêm vào giỏ hàng
              },
            ),
          ],
        ),
      ),
    );
  }
}