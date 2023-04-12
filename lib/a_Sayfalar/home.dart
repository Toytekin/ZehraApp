import 'package:flutter/material.dart';
import 'package:myapp/model/user_model.dart';
import 'package:provider/provider.dart';

import '../repo/login/repo_login.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  BuildContext context;
  UserModel? userModel;

  HomeScreen({super.key, required this.context, required this.userModel});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var services = Provider.of<MyLoginServices>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.userModel!.id),
        actions: [
          IconButton(
              onPressed: () async {
                await services.signOuth();
              },
              icon: const Icon(Icons.exit_to_app))
        ],
      ),
      body: Center(
        child: Card(
          child: ListTile(
            title: Text(widget.userModel!.id),
            subtitle: Text(widget.userModel!.mail),
          ),
        ),
      ),
    );
  }
}
