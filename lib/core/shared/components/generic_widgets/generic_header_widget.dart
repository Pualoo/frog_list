import 'package:flutter/material.dart';

class GenericHeaderWidget extends StatelessWidget {
  const GenericHeaderWidget({super.key, this.title, this.trailing,});
  final Widget? title;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 18,
        right: 18,
        top: 8,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Builder(
                builder: (context) {
                  if(title != null){
                    return title!;
                  }
                  return Container();
                }
              ),
              Builder(
                  builder: (context) {
                    if(trailing != null){
                      return trailing!;
                    }
                    return Container();
                  }
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 12.0),
            child: Divider(color: Colors.grey, height: 0, thickness: 1,),
          ),
        ],
      ),
    );
  }
}
