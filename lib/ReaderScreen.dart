import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';


class ReaderScreen extends StatefulWidget {
  

  final int chapterId;
  ReaderScreen(this.chapterId);

  @override
  _ReaderScreenState createState() => _ReaderScreenState();
}



class _ReaderScreenState extends State<ReaderScreen> {

  late WebViewController _controller;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chapter"+widget.chapterId.toString()),
      ),
      body: WebView(
        initialUrl: 'about:blank',
        onWebViewCreated: (WebViewController webViewController) async {
          _controller = webViewController;
          if(widget.chapterId==1){
            String fileText = await rootBundle.loadString("assets/ch1.html");
            _controller.loadUrl(Uri.dataFromString(fileText, mimeType: 'text/html', encoding: Encoding.getByName('utf-8')).toString());
          }
        },
      ),
      
    );
  }
}


