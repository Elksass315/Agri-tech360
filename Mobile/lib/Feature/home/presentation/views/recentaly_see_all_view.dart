import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartsoil/Feature/explor/logic/cubit/explor_cubit.dart';
import 'package:smartsoil/Feature/home/presentation/widgets/see_all_items.dart';
import 'package:smartsoil/core/widgets/custom_sliver_app_bar.dart';

class RecentlySeeAllView extends StatelessWidget {
  const RecentlySeeAllView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: <Widget>[
            const CustomSliverAppBar(
              titleText: 'Recently Viewed',
              centerTitle: false,
            ),
            SliverToBoxAdapter(
              child: SeeAllItems(
                plants: BlocProvider.of<ExplorCubit>(context).plantsresult,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
