import 'package:flutter/material.dart';

class PageTwo extends StatefulWidget {
  const PageTwo({super.key,
    required this.title,
  });

  final String title;
  @override
  State<PageTwo> createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  bool active = false;

  void setActive() {
    setState(() {
      active = !active;
    });
  }
  
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      
      AppBar(
        backgroundColor: Colors.red[900],
        title: Text('${widget.title} Page 2', style: TextStyle(color: Colors.white),),
      ),
      
      body:
      
      Padding(padding: EdgeInsets.all(12),
        child: Column( mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
              child: InkWell(
                onTap: () {
                  setActive();
                },
                
                child: Card(
                  color: Colors.black,
                  child: Center(child: Text('Tap me!', style: TextStyle(color: Colors.white),),),
                ),
              ),
            ),

            active ?

            SizedBox(
              height: 100,
              child: Card(
                color: Colors.black,
                child: Center(child: Text('Hello!', style: TextStyle(color: Colors.white),),),
              ),
            )

            :

            SizedBox()
          ],
        ),
      )
    );
  }
}