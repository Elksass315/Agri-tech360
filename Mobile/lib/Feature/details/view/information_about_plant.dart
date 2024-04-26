import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/Feature/details/widgets/care_instraction_view_body.dart';
import 'package:smartsoil/Feature/details/widgets/descrption_view_body.dart';
import 'package:smartsoil/Feature/explor/data/models/explor_plant_models.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';

class InformationAboutPlant extends StatefulWidget {
  const InformationAboutPlant({
    super.key,
    required this.plant,
  });

  final PlantModle plant;
  @override
  State<InformationAboutPlant> createState() => _InformationAboutPlantState();
}

class _InformationAboutPlantState extends State<InformationAboutPlant>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: ColorManger.whiteColor,
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                width: 350.h,
                child: TabBar(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  tabs: [
                    Text(
                      'Description',
                      style: AppStyle.font14Blacksemibold,
                    ),
                    Text(
                      'Care Instructions',
                      style: AppStyle.font14Blacksemibold,
                    ),
                  ],
                  dividerColor: Colors.transparent,
                  indicatorWeight: 4,
                  indicatorColor: ColorManger.primaryColor,
                  indicatorSize: TabBarIndicatorSize.label,
                  controller: _tabController,
                ),
              ),
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      DescriptionViewBody(
                        plant: widget.plant,
                      ),
                      CareInstractionViewBody(
                        plant: widget.plant,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
