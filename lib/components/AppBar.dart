import 'package:flutter/material.dart';
import 'CustomTabIndicator.dart';

PreferredSize pglAppBar() {
  return PreferredSize(
    preferredSize: Size.fromHeight(88.0),
    child: Theme(
      data: ThemeData(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
      ),
      child: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        flexibleSpace: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                SizedBox(
                  width: 40,
                ),
                Container(
                  width: 350,
                  child: TabBar(
                    //indicatorColor: Color(0xFF151311),
                    //indicatorSize: TabBarIndicatorSize.label,
                    //indicatorWeight: 2,
                    indicator: CustomTabIndicator(
                        color: Color(0xFF151311), length: 74.07),
                    unselectedLabelColor: Color(0xFF151311).withOpacity(0.5),
                    labelStyle: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Fira Sans',
                    ),
                    labelColor: Color(0xFF151311),
                    tabs: [
                      Tab(
                        text: 'Light Novels',
                      ),
                      Tab(
                        text: 'Manga',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

