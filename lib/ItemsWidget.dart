import 'package:flutter/material.dart';
import 'package:nhom4_appraovat/chitietsp.dart';


class ItemsWidget extends StatelessWidget{
  final List<String> productImages = [
    'assets/images/iphone-14-pro-vang.jpg',
    'assets/images/laptop-rog.jpg',
    'assets/images/winner.jpg',
    'assets/images/ex.jpg',
    'assets/images/dong-ho-deo-tay-ELLE-Man.jpg',
    'assets/images/iphone-14-pro-vang.jpg',
    'assets/images/iphone-14-pro-vang.jpg', // Thêm các tên hình ảnh khác ở đây
    // ...
  ];
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
        imageUrl: "assets/images/laptop-rog.jpg",
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
  Widget build(BuildContext context){
    return GridView.count(
      childAspectRatio: 0.68, // Tỷ lệ chiều cao so với chiều rộng của mỗi ô sản phẩm
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 2, // Số cột sản phẩm
      shrinkWrap: true,
      children: [
        for (int i = 0; i < productImages.length; i++)
        Container(
          padding: EdgeInsets.only(left: 15,right: 15, top: 10),
          margin: EdgeInsets.symmetric(vertical: 8,horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailPage(product:products[i])));
                },
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Image.asset(productImages[i], // Sử dụng tên hình ảnh từ danh sách 
                  height: 120,
                  width: 120,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 8),
                alignment: Alignment.center,
                child: Text('Iphone 14 pro vàng',
                style: TextStyle(fontSize: 17,
                color: Colors.orange,
                fontWeight: FontWeight.bold,
                ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text('Điện thoại',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('23.890.000 đ',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.red),
                    ),
                  ],
                ),
              ),
            ],
            ),
            ),
            ],
    );
  }
}