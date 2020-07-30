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
            home: Container(
            
            
            child:UserHomePage()
          ),
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
            
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        "assets/images/background.jpg"
                    ),

                    fit: BoxFit.cover
                )
            ),
            
          
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
                          color: Colors.transparent,
                         
                          child: GridView.builder(
                            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: posts.length,
                            itemBuilder: (context, i) {
                              return InkWell(
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
                          color: Colors.black,
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
      padding: EdgeInsets.fromLTRB(10,10,10,0),
      height: 223,
      width: double.maxFinite,
      child: Card(
        shadowColor: Color.fromRGBO(192,192,192, 0.9),
        color: Color.fromRGBO(195,195,195, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 6,
        child: Container(
          child: Column(
            children: [
              Container(
                height: 135,
                color: Colors.white,
                child: Stack(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 7.5),
                      
                      
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        image: DecorationImage(
                          fit: BoxFit.contain,
                          image:NetworkImage(widget.post.getImage2()),

                        )
                      )
                      
                    
                    ),
                    
                    
                
                  ],

                ),
              ),
              SizedBox(
                        height:7,
                      ),
              //photo and then tag
              Align(
                child: Container(
                  height: 38,
                  padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                  child: Text(widget.post.getName(), textAlign: TextAlign.center ,style: TextStyle(
                    
                  ),),
              ),
              ),
            ]
          )
        ),
        
      ),
    );
         
       
    
      /*
      color: Colors.black,
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
      ),*/
       

  }
}
