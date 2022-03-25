import 'package:flutter/material.dart';
class BuidButton extends StatelessWidget {
  String title;
  Function() onTap;
 BuidButton({Key? key,required this.title,required this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        width: Size.infinite.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Center(
            child: Row(
              children:  [
                const Icon(Icons.account_balance),
                const SizedBox(width: 20,),
                Text(title,style: const TextStyle(fontSize: 20),)
              ],
            ),
          ),
        ),

      ),
    );
  }
}
