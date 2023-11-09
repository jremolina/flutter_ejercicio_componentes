import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  const AvatarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: [
          Container(
            padding: EdgeInsets.all(2.0),
            child: const CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://graffica.info/wp-content/uploads/2018/11/URnaMrya_400x400.jpg"),
              radius: 20,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10),
            child: CircleAvatar(
              child: Text('SL'),
              backgroundColor: Colors.blue[900],
            ),
          )
        ],
      ),
      body: const Center(
          child: FadeInImage(
              image: NetworkImage(
                  "https://media.es.wired.com/photos/631ecb16eca5c77cdd70b8df/4:3/w_2132,h_1599,c_limit/Marvel-To-Digitally-Resurrect-Stan-Lee-Culture-627159542.jpg"),
              placeholder: AssetImage('assets/jar-loading.gif'),
              fadeInDuration: Duration(milliseconds: 200))),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
