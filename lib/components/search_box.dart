import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:profoundgodlibrary/src/SelectedMenu.dart';
import 'package:profoundgodlibrary/src/k_state.dart';
import 'package:profoundgodlibrary/src/search_state.dart';
import 'package:provider/src/provider.dart';

class SearchBox extends StatefulWidget {
  const SearchBox({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  @override
  Widget build(BuildContext context) {
    KState state = context.watch<SelectedMenu>().state;
    String searchTerm =
        state.isNullState ? '' : (state as SearchState).searchTerm!;
    TextEditingController textEditingController =
        TextEditingController(text: state.isNullState ? null : searchTerm);

    return Container(
      height: 30,
      width: 275,
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              FontAwesomeIcons.search,
              size: 15,
              color: Color(0xff262626),
            ),
            SizedBox(width: 13),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: TextField(
                  onSubmitted: (value) => context
                      .read<SelectedMenu>()
                      .select('Search', newState: SearchState(value)),
                  controller: textEditingController,
                  autofocus: true,
                  cursorColor: Color(0xff262626),
                  style: Theme.of(context).inputDecorationTheme.hintStyle,
                  decoration: InputDecoration(
                    fillColor: Colors.amber,
                    hintText: 'Search Manga, Novels',
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(width: 13),
            InkWell(
              onTap: () => textEditingController.clear(),
              child: Icon(
                Icons.close,
                size: 20,
                color: Color(0xff262626),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
