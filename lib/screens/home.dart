import 'package:flutter/material.dart';
import 'package:resthttp/model/user_model.dart';
import 'package:resthttp/api/api_service.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<UserModel>? _userModel = [];
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _userModel = (await Api().getUsers())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('USER DATA'),
      ),
      body: _userModel == null || _userModel!.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),  //MODEL is NUll
            )
          : ListView.builder(                     //ELSE
              itemCount: _userModel!.length,     //length of user model
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(_userModel![index].id.toString()),
                          Text(_userModel![index].username),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(_userModel![index].email),
                          Text(_userModel![index].website),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
