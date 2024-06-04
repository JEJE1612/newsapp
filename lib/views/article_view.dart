import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {
  String ?blogUrl;
 ArticleView({super.key,required this.blogUrl});

  @override
  State<ArticleView> createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title:const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget> [
            Text("Flutter"),
            Text("Newa", style: TextStyle(
              color: Colors.blue
            ),)
          ],
        ),
      actions: [
        Opacity(
          opacity: 0,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal:16),
            child: Icon(Icons.save),
          ),
          )
      ],  
      centerTitle: true,
      elevation: 0.0,  
      ),

      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
         child: WebViewWidget(
          controller: WebViewController()..loadRequest(Uri.parse(widget.blogUrl!)),
           )
      
          ),
    );
  }
}
