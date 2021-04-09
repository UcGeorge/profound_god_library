import 'dart:core';
import 'package:flutter/material.dart';

enum ThemedComponent {
  scaffold_bg,
  theme_button_bg,
  theme_button_icon,
  tab_head_active,
  tab_head_inactive,
  section_head_text,
  section_head_line,
  back_button,
  background_image,
  novel_title,
  continue_reading_button_bg,
  continue_reading_button_text,
  chapter_bar_gradient_origin,
  chapter_bar_gradient_end,
  chapter_bar_textIcon,
  chapter_text_bg,
  chapter_text,
  discover_card_bg,
  discover_card_icon,
}

const Map<ThemedComponent, dynamic> LIGHT = {
  // Home page
  ThemedComponent.scaffold_bg : Colors.white,
  ThemedComponent.theme_button_bg : Color(0xFF151311),
  ThemedComponent.theme_button_icon : Color(0xFFEAEAEA),
  ThemedComponent.tab_head_active : Color(0xFF151311),
  ThemedComponent.tab_head_inactive : Color.fromRGBO(21, 19, 17, 0.5),
  ThemedComponent.section_head_text : Color.fromRGBO(21, 19, 17, 0.5),
  ThemedComponent.section_head_line : Color(0xFF707070),
  // Novel View
  ThemedComponent.back_button : Color(0xFF80706A),
  ThemedComponent.background_image : 'assets/images/light-bg.jpg',
  ThemedComponent.novel_title : Color(0xFF2F2F2F),
  ThemedComponent.continue_reading_button_bg : Color(0xFF2F2F2F),
  ThemedComponent.continue_reading_button_text : Color(0xFFEAEAEA),
  // Chapter View
  ThemedComponent.chapter_bar_gradient_origin : Color(0xFF151311),
  ThemedComponent.chapter_bar_gradient_end : Color(0xFF80706A),
  ThemedComponent.chapter_bar_textIcon : Color(0xFFEAEAEA),
  ThemedComponent.chapter_text_bg : Colors.white,
  ThemedComponent.chapter_text : Color(0xFF80706A),
  ThemedComponent.discover_card_bg : Color(0xFFEAEAEA),
  ThemedComponent.discover_card_icon : Color.fromRGBO(151, 151, 151, 0.7),
};

const Map<ThemedComponent, dynamic> DARK = {
  // Home page
  ThemedComponent.scaffold_bg : Color(0xFF151311),
  ThemedComponent.theme_button_bg : Colors.white,
  ThemedComponent.theme_button_icon : Color(0xFF2F2F2F),
  ThemedComponent.tab_head_active : Color(0xFFEAEAEA),
  ThemedComponent.tab_head_inactive : Color.fromRGBO(234, 234, 234, 0.5),
  ThemedComponent.section_head_text : Color.fromRGBO(234, 234, 234, 0.5),
  ThemedComponent.section_head_line : Color(0xFFEAEAEA),
  // Novel View
  ThemedComponent.back_button : Color(0xFFEAEAEA),
  ThemedComponent.background_image : 'assets/images/dark-bg.jpg',
  ThemedComponent.novel_title : Color(0xFFEAEAEA),
  ThemedComponent.continue_reading_button_bg : Color(0xFFEAEAEA),
  ThemedComponent.continue_reading_button_text : Color(0xFF151311),
  // Chapter View
  ThemedComponent.chapter_bar_gradient_origin : Color(0xFFEAEAEA),
  ThemedComponent.chapter_bar_gradient_end : Color(0xFF151311),
  ThemedComponent.chapter_bar_textIcon : Color(0xFF2F2F2F),
  ThemedComponent.chapter_text_bg : Color(0xFF2F2F2F),
  ThemedComponent.chapter_text : Color.fromRGBO(234, 234, 234, 0.7),
  ThemedComponent.discover_card_bg : Color.fromRGBO(234, 234, 234, 0.3),
  ThemedComponent.discover_card_icon : Color.fromRGBO(151, 151, 151, 0.7),
};

class Theme {
  Map<ThemedComponent, dynamic> _dark = DARK;
  get dark => _dark;

  Map<ThemedComponent, dynamic> _light = LIGHT;
  get light => _light;
}