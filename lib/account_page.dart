import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:group_list_view/group_list_view.dart';
import 'package:nhom4_appraovat/account_setting_page.dart';
import 'package:nhom4_appraovat/login_page.dart';
import 'package:nhom4_appraovat/main.dart';

Map<String, List> _elements = {
  'Quản lý đơn hàng': ['Đơn mua', 'Đơn bán'],
  'khác': ['Cài đặt tài khoản', 'Đăng nhập','Đăng xuất'],
  
};

class AccountPage extends StatefulWidget {
  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text('Trang tài khoản', style: TextStyle(fontSize: 22),),
        centerTitle: true, // Center-align the title
        backgroundColor: Color.fromARGB(254, 255, 170, 0),
      ),
      body: GroupListView(
          sectionsCount: _elements.keys.toList().length,
          countOfItemInSection: (int section) {
            return _elements.values.toList()[section].length;
          },
          itemBuilder: _itemBuilder,
          groupHeaderBuilder: (BuildContext context, int section) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              child: Text(
                _elements.keys.toList()[section],
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            );
          },
          separatorBuilder: (context, index) => SizedBox(height: 10),
          sectionSeparatorBuilder: (context, section) => SizedBox(height: 10),
        ),
      );
  }
}
Widget _itemBuilder(BuildContext context, IndexPath index) {
     String item = _elements.values.toList()[index.section][index.index]; // Lấy tên mục

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
        elevation: 8,
        child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 18, vertical: 10.0),
          title: Text(
            item,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),         
         trailing: item == 'Cài đặt tài khoản'
            ? IconButton(
                icon: Icon(Icons.arrow_forward_ios),
                onPressed: () {
                  // Điều hướng tới trang cài đặt tài khoản (AccountSettingsPage)
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AccountSettingsPage()));
                },
              )
            : item == 'Đăng nhập'
                ? IconButton(
                    icon: Icon(Icons.arrow_forward_ios),
                    onPressed: () {
                      // Điều hướng tới trang đăng nhập (LoginPage)
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                  )
            : item == 'Đăng xuất'
                ? IconButton(
                    icon: Icon(Icons.exit_to_app),
                    onPressed: () {
                      // Xử lý đăng xuất ở đây (xóa thông tin đăng nhập, đăng xuất người dùng)
                      // Sau đó điều hướng tới trang đăng nhập (LoginPage)
                      // Ví dụ:
                      // Xóa thông tin đăng nhập (nếu có)
                      // clearUserLoginInfo();

                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                )
            : Icon(Icons.arrow_forward_ios),
      ),
    ),
  );
}
   

  

