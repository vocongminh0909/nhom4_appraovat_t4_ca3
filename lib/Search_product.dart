import 'package:flutter/material.dart';


class SearchProductPage extends StatefulWidget {
  @override
  _SearchProductPageState createState() => _SearchProductPageState();
}

class _SearchProductPageState extends State<SearchProductPage> {
  TextEditingController _searchController = TextEditingController();
  List<String> products = ['Iphone 14pro', 'Ex155 VVA', 'Đồng Hồ', 'Winner X'];
  List<String> filteredProducts = [];

  void _search() {
    setState(() {
      filteredProducts = products
          .where((product) => 
          product.toLowerCase().contains(_searchController.text.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tìm kiếm sản phẩm',style: TextStyle( fontSize: 25.0,  // Đặt kích thước chữ là 30.0
        ),
        ),
        centerTitle: true, // Đặt giữa cả chiều ngang và chiều dọc
        backgroundColor: Color.fromARGB(254, 255, 170, 0),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Tìm kiếm sản phẩm',
              ),
              onChanged: (text) {
                _search();
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(filteredProducts[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}