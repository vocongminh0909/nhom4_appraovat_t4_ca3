import 'package:flutter/material.dart';

class Shopping_cartPage extends StatelessWidget {
  // Danh sách các sản phẩm trong giỏ hàng (ví dụ)
  final List<String> cartItems = [
    'Sản phẩm 1',
    'Sản phẩm 2',
    'Sản phẩm 3',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Giỏ hàng'),
      ),
      body: ListView.separated(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final item = cartItems[index];
          return ListTile(
            title: Text(item),
            trailing: IconButton(
              icon: Icon(Icons.remove_shopping_cart), // Biểu tượng xóa sản phẩm khỏi giỏ hàng
              onPressed: () {
                // Xử lý xóa sản phẩm khỏi giỏ hàng ở đây
                // Có thể cập nhật danh sách và giao diện
              },
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Divider(); // Tạo đường ngăn cách giữa các mục
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Tổng tiền: 1000đ'), // Hiển thị tổng tiền
              ElevatedButton(
                onPressed: () {
                  // Xử lý thanh toán ở đây
                },
                child: Text('Thanh toán'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
