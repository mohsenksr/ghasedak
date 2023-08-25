import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ghasedak/core/utils/injection.dart';
import 'package:ghasedak/pages/main/domain/main_cubit.dart';
import 'package:ghasedak/pages/profile/domain/profile_cubit.dart';

class ProfilePage extends StatefulWidget {
  static const String pageRoute = '/profile';
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController ccNumberController = TextEditingController();
  final TextEditingController nationalIdController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("ثبت نام", style: TextStyle(color: Colors.black)),
        leading: BackButton(color: Colors.black),
      ),
      body: Center(
        child: MultiBlocProvider(
          providers: [
            BlocProvider<ProfileCubit>(
              create: (BuildContext context) => getIt<ProfileCubit>(),
            ),
          ],
          child: BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              if (state is ProfileShowState) {
                return Container(
                  width: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(height: 10),
                      Text("نام کاربری: " + state.profile.username),
                      Container(height: 5),
                      Text("نام: " + (state.profile.firstName ?? "")),
                      Container(height: 5),
                      Text("نام خانوادگی: " + (state.profile.lastName ?? "")),
                      Container(height: 5),
                      Text("موبایل: " + (state.profile.phone ?? "")),
                      Container(height: 5),
                      Text("ایمیل: " + (state.profile.email ?? "")),
                      Container(height: 5),
                      Text("اعتبار: " + "${state.profile.credit ?? 0}"),
                      Container(height: 5),
                      Text("شماره کارت: " + (state.profile.ccNumber ?? "")),
                      Container(height: 50),
                      ElevatedButton(
                        onPressed: () {
                          getIt<ProfileCubit>().clearAccountBalance();
                        },
                        child: Text("تسویه حساب"),
                      ),
                      Container(height: 50),
                      TextField(
                        controller: firstNameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'نام',
                        ),
                      ),
                      Container(height: 30),
                      TextField(
                        controller: lastNameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'نام خانوادگی',
                        ),
                      ),
                      Container(height: 30),
                      TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'ایمیل',
                        ),
                      ),
                      Container(height: 30),
                      TextField(
                        controller: ccNumberController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'شماره کارت',
                        ),
                      ),
                      Container(height: 30),
                      TextField(
                        controller: nationalIdController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'کد ملی',
                        ),
                      ),
                      Container(height: 30),
                      ElevatedButton(
                        onPressed: () {
                          getIt<ProfileCubit>().updateProfile(
                            firstNameController.text,
                            lastNameController.text,
                            emailController.text,
                            ccNumberController.text,
                            nationalIdController.text,
                          );
                        },
                        child: Text("به روز رسانی"),
                      ),
                    ],
                  ),
                );
              } else if (state is ProfileLoadingState) {
                return CircularProgressIndicator();
              } else if (state is ProfileInitialState) {
                getIt<ProfileCubit>().getProfile();
                return CircularProgressIndicator();
              }

              return Container(
                child: Column(
                  children: [
                    Text("مشکلی پیش آمده‌است."),
                    Container(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        getIt<ProfileCubit>().getProfile();
                      },
                      child: Text("بارگیری دوباره صفحه"),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
