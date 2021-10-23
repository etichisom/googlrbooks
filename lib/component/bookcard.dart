
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:googlebooks/component/text.dart';
import 'package:googlebooks/model/book.dart';
import 'package:googlebooks/services/navigate.dart';
import 'package:googlebooks/ui/views/bookdetails.dart';

Widget bookcard(Item item,int index,BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8,top: 8),
    child: GestureDetector(
      onTap: (){
       next(context,item,index);
      },
      child: PhysicalModel(
        color: Colors.grey,
        elevation: 3,
        borderRadius: BorderRadius.circular(17),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15) ,
              color: Colors.white
          ),
          child: Padding(
            padding: EdgeInsets.only(bottom:10,top:10,left: 10,right: 10),
            child: Row(
              children: [
               Image.network(item.volumeInfo.imageLinks.thumbnail),
                Expanded(
                  flex: 3,
                  child: Container(
                    child: Hero(
                      tag: index.toString(),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15,right: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 5,),
                            text(item.volumeInfo.authors!=null?item.volumeInfo.authors[0].toString():
                            item.volumeInfo.publisher.toString(),
                                16,color: Colors.grey[500]),
                            SizedBox(height: 5,),
                            Container(
                              child: text(item.volumeInfo.title.toString(), 18,color: Colors.black,isbold: true),
                            ),
                            SizedBox(height: 7,),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(CupertinoIcons.star_fill,color: Colors.yellow[800],size: 15,),
                                SizedBox(width: 5,),
                                text(item.volumeInfo.ratingsCount.toString(), 15,color:Colors.grey[400])
                              ],
                            ),
                            SizedBox(height:10,),
                            Container(
                                decoration: BoxDecoration(
                                  color: Colors.blue.withOpacity(0.4),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left:12,right: 12,top: 2,bottom: 2),
                                  child: text(
                                      item.volumeInfo.categories!=null?item.volumeInfo.categories[0].toString():"", 13,
                                      color: Colors.blue,isbold: true),
                                )),
                            SizedBox(height: 5,),

                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

void next(BuildContext context,Item item,int index) {
  nav(context, Bookdetails(desc:item.volumeInfo.description.toString(),
      publisher: item.volumeInfo.publisher.toString(),
      title:item.volumeInfo.title, image:item.volumeInfo.imageLinks.thumbnail,
      bookid: item.id.toString(), index: index,
      booklink:item.volumeInfo.previewLink));
}

