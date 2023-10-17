import 'package:flutter/material.dart';
import 'package:nhom4_appraovat/main.dart';
import 'package:nhom4_appraovat/register_page.dart';



class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RAO VẶT',style: TextStyle( fontSize: 30.0,  // Đặt kích thước chữ là 30.0
        ),
        ),
        backgroundColor:  Color.fromARGB(254, 255, 170, 0),
        iconTheme: const IconThemeData(
          color: Colors.black, // Đặt màu cho biểu tượng (icon) là màu đen
        ),
        actions: const [
        ],
        centerTitle: true, // Đặt giữa cả chiều ngang và chiều dọc
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // Biểu tượng back
          onPressed: () {
            // Xử lý khi nút back được nhấn
            Navigator.pop(context); // Để trở lại trang trước đó (trang chủ)
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/images/logo_rao_vat.jpg'),
              SizedBox(height: 16.0),
              const Align(
                alignment: Alignment.centerLeft, // Căn trái
                child: Text('Đăng nhập',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold // Thêm fontWeight để in đậm
                ),
                ),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(), // Đây là phần quan trọng để có viền cho TextFormField.
                  labelText: 'Số điện thoại',
                ),
                 validator: (value) {
                  if (value!.isEmpty) {
                    return 'Vui lòng nhập số điện thoại';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(), // Đây là phần quan trọng để có viền cho TextFormField.
                  labelText: 'Mật khẩu',
                ),
                 validator: (value) {
                  if (value!.isEmpty) {
                    return 'Vui lòng nhập số điện thoại';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0, width: 50.0),
              Text('Quên mật khẩu?',
                  style:TextStyle( fontSize: 15.0,color: Colors.blue)
              ),
              SizedBox(height: 16.0),
              Row(children: [
                ElevatedButton(
                  onPressed: () {
                    // Điều hướng tới trang chủ (HomePage)
                    Navigator.push(context,MaterialPageRoute(builder: (context) => HomePage()),
                    );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orange,
                      minimumSize: Size(150, 40),
                      ),
                      child: const Text('Đăng nhập'),
                      ),
                const SizedBox(height: 16.0, width: 50.0),
                ElevatedButton(
                  onPressed: () {
                    // Điều hướng tới trang đăng ký (RegisterPage)
                    Navigator.push(context,MaterialPageRoute(builder: (context) => RegisterPage()),
                    );
                    },
                    style: ElevatedButton.styleFrom(
                       primary: Colors.orange,
                       minimumSize: Size(150, 40),
                       ),
                       child: const Text('Đăng ký'),
                       ),
                       ],
                        ),
                        const SizedBox(height: 16.0),
                        Text('Quy chế hoạt động sản-Chính sách bảo mật-Liên hệ hỗ trợ',style: TextStyle(fontSize: 12.0)),
                        const SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
