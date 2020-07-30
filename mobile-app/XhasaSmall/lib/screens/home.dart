import 'package:XhasaSmall/models/business.dart';
import 'package:XhasaSmall/screens/postpage.dart';
import 'package:XhasaSmall/services/api.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   
    return MaterialApp(
      theme: ThemeData(
            accentColor: Colors.white,
            // the color of the logo
            unselectedWidgetColor:Colors.white
                
            ),
            home: UserHomePage(),
            );
          }
  }

class UserHomePage extends StatefulWidget {
  @override
  _UserHomePageState createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: _Home(),
      appBar:AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Image.asset(
                  'assets/images/logo.png',
                    fit: BoxFit.contain,
                    height: 60,
                ),
            ),     
          ], 
        ),
      ),
         
        );
  }
}


class _Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<_Home> {
List<Business> posts;


void refresh() {
    setState(() async {
      var temp = await fetchAll();
      this.posts = temp;
    });
  } 

      
      
        @override
        Widget build(BuildContext context) {
          return Container(
      child: 
          Row(
            children: <Widget>[
              FutureBuilder<List<Business>>(
                  future: fetchAll(),
                  builder: (context, snapshot) {
                    // if data isn't here yet...
                    if (snapshot.connectionState != ConnectionState.done)
                      return Expanded(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );

                    // if the data is here
                    if (snapshot.hasData) {
                      List<Business> posts = snapshot.data;
                     
                      return Flexible(
                        child: Container(
                          color: Colors.white,
                         
                          child: ListView.builder(
                            itemCount: posts.length,
                            itemBuilder: (context, i) {
                              return Container(
                                width: 132,
                                height: 132,
                                padding: const EdgeInsets.fromLTRB(6, 6, 6, 0),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                              builder: (context) => PostPage(
                                                post: posts[i],
                                              ),
                                      )
                                    );
                                  },
                                  child: PostCard(
                                    post: posts[i],
                                  ),
                                ),
                              );
                            }
                          ),
                        ),
                      );
                    }
                    // dummy return
                    return Expanded(
                      child: Center(
                        child: Icon(
                          Icons.error,
                          color: Colors.white,
                          size: 50,
                        )
                      )
                    );
                  },
                )
            ],
          )
        
      
    );
        }
      }

class PostCard extends StatefulWidget {
  final Business post;
  

  PostCard({@required this.post});

  @override
  _PostCardState createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  
  // build method
  @override
  Widget build(BuildContext context) {

    return Container(
      width: 132,
      height: 132,
      padding: EdgeInsets.all(20),
      color: Colors.grey,
      child: Column(
        children: <Widget>[
          Container(
            child: Text(widget.post.getName(), style: TextStyle(
            color: Colors.white,fontSize: 16
          ),),
          ),
          Container(
            child:Text(widget.post.getTag(), style: TextStyle(
            color: Colors.white,fontSize: 16
          ),),),
          
          
        ],
      ),
    );    

  }
}
