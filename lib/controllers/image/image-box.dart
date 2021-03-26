import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:mp_v1_0/controllers/loader/loader.dart';

class ImageMini {
  String url;
  bool visitExcept;

  ImageMini ({String url, bool visitExcept=false}) {
    this.url = url;
    this.visitExcept = visitExcept;
  }

  Widget build () {
    try {
      return Image.network(
        this.url, 
        fit: BoxFit.cover,
        errorBuilder: (BuildContext context, Object exception, StackTrace stackTrace) {
          return this.exceptWidget();
        },
      );
    } catch (e) {
      return this.exceptWidget();
    }
  }
  
  Widget exceptWidget () {
    return (this.visitExcept) ? Container(
      color: Colors.grey[300],
      child: Center(
        child: Text(
          (this.url != null) ? 'โหลดรูปภาพไม่สำเสร็จ!' : 'ไม่รูปภาพ',
          style: TextStyle(
            fontSize: 12,
            color: (this.url != null) ? Colors.red : Colors.grey[800]
          ),
        )
      )
    ) : Container();
  }
}