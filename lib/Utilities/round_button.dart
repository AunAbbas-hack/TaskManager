import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final VoidCallback ontap;
  final bool loading;
  const RoundButton({super.key,required this.title,required this.ontap,this.loading=false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: Colors.deepPurple,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(child: loading?CircularProgressIndicator(
          color: Colors.white,
          strokeWidth: 2,
        ):Text(title,style: TextStyle(color: Colors.white),)),
      ),
    );
  }
}
