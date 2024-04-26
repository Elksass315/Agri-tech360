import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/Feature/auth/presentation/widgets/login/views/login_view_body.dart';
import 'package:smartsoil/Feature/auth/presentation/widgets/sign_up/views/sign_up_view_body.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';
import 'package:smartsoil/core/widgets/agritech_app_bar.dart';

class AuthViewBody extends StatefulWidget {
  static const String routeName = 'AuthViewBody';

  const AuthViewBody({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyTabbedPageState createState() => _MyTabbedPageState();
}

class _MyTabbedPageState extends State<AuthViewBody>
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
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: Agritech360AppBar(),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              width: 220.h,
              child: TabBar(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                tabs: [
                  Text('SIGN IN', style: AppStyle.font14Blacksemibold),
                  Text('SIGN UP', style: AppStyle.font14Blacksemibold),
                ],
                indicatorWeight: 4,
                indicatorColor: ColorManger.primaryColor,
                indicatorSize: TabBarIndicatorSize.label,
                controller: _tabController,
                dividerColor: Colors.transparent,
              ),
            ),
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    const LoginViewBody(),
                    SignUpViewBody(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
