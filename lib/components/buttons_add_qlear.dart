import 'package:flutter/material.dart';

class ButtonsAddClear extends StatelessWidget {
  const ButtonsAddClear({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 60, right: 60, top: 30, bottom: 15),
      child: Row(
        children: [
          SizedBox(
            width: 150,
            height: 50,
            child: TextButton(
              onPressed: () {},
              child: const Text(
                'Add',
                style: TextStyle(
                    color: Color.fromARGB(255, 48, 47, 47), fontSize: 20),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
          ),
          const Spacer(),
          SizedBox(
            width: 150,
            height: 50,
            child: TextButton(
              onPressed: () {},
              child: const Text(
                'Clear',
                style: TextStyle(
                    color: Color.fromARGB(255, 48, 47, 47), fontSize: 20),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
