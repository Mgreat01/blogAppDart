import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
        backgroundColor: Colors.blue,
    ),
    body: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 50),

          SizedBox(
            height: 110,
            width: 400,

            child: TextField(
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                hintText: "Recherchez un article.....",

              ),
            ),

          ),

          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(3),
                  width: 400,
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.white,
                    border: Border.all(color:Colors.blue)
                  ),

                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset("assets/images/mec.jpg"),
                      Column(
                        children: [
                          Text("Title "),
                          Text("Content"),
                          Text("Name of author"),
                          Container(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      child: Text("10 comment", style: TextStyle(fontSize: 15)),
                                    )

                                  ],
                                )


                              ],
                            )
                          )
                        ],
                      )
                      
                    ],
                  ),


                ),
        
              ],
            ),
          ),
          SizedBox(height: 50),


          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(3),
                  width: 400,
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color:Colors.blue)
                  ),

                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset("assets/images/mec.jpg"),
                      Column(
                        children: [
                          Text("Title "),
                          Text("Content"),
                          Text("Name of author"),
                          Container(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        child: Text("10 comment", style: TextStyle(fontSize: 15)),
                                      )

                                    ],
                                  )


                                ],
                              )
                          )
                        ],
                      )

                    ],
                  ),


                ),

              ],
            ),
          ),

        ],
      )
    )
    );
  }
}


