import 'package:flutter/material.dart';
import 'package:task/models/user_model.dart';

class HomeWidget extends StatelessWidget {
  final UserModel userModel;
  const HomeWidget({Key? key, required this.userModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.white,
          child: Column(
            children: [
              Row(
                children:  [
                  const Text(
                    'Name : ',
                  ),
                  Text(
                    userModel.name,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children:  [
                const  Text(
                    'Age : ',
                  ),
                  Text(
                    userModel.age,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children:  [
                 const Text(
                    'City : ',
                  ),
                  Text(
                    userModel.city,
                  ),
                ],
              ),
            ],
          ),
        ),
       Divider(
        thickness: 2,
        color: Colors.black.withOpacity(0.1),
      )
      ],
    );
  }
}
