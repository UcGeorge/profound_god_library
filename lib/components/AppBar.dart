import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profoundgodlibrary/bloc/theme_bloc.dart';
import 'package:profoundgodlibrary/models/theme.dart';
import 'CustomTabIndicator.dart';

PreferredSize pglAppBar() {
  return PreferredSize(
    preferredSize: Size.fromHeight(88.0),
    child: BlocBuilder<ThemeBloc, Map<ThemedComponent, dynamic>>(
      builder: (_, theme){
        return AppBar(
          backgroundColor: theme[ThemedComponent.scaffold_bg],
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
                      indicator: CustomTabIndicator(color: theme[ThemedComponent.tab_head_active], length: 74.07),
                      labelStyle: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Fira Sans',
                      ),
                      labelColor: theme[ThemedComponent.tab_head_active],
                      unselectedLabelColor: theme[ThemedComponent.tab_head_inactive],
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
        );
      },
    ),
    );
}

