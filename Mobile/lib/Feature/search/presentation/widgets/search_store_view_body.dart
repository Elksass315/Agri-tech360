import 'package:flutter/widgets.dart';
import 'package:smartsoil/core/widgets/app_text_formfield.dart';

class SearchStoreViewBody extends StatefulWidget {
  const SearchStoreViewBody({super.key});

  @override
  State<SearchStoreViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchStoreViewBody> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Column(
        children: [
          CustomTextFormFiled(
            hintText: 'Search ',
            obscureText: false,
          ),
          Center(
            child: Text(
              'Search View',
            ),
          )
        ],
      ),
    );
  }
}
