import 'package:flutter/material.dart';
import 'package:hofe/features/auth/data/datasource/auth_local_datasource.dart';
import 'package:hofe/injection.dart';

class HomeCircleProfile extends StatefulWidget {
  const HomeCircleProfile({super.key});

  @override
  State<HomeCircleProfile> createState() => _HomeCircleProfileState();
}

class _HomeCircleProfileState extends State<HomeCircleProfile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: showBottomSheet,
      child: CircleAvatar(
        radius: 24,
      ),
    );
  }

  void showBottomSheet() {
    AuthLocalDatasource authLocalDatasourceImpl = locator();
    authLocalDatasourceImpl.removeToken();
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column();
      },
    );
  }
}
