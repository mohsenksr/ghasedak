import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ghasedak/core/utils/injection.dart';
import 'package:ghasedak/pages/channels_list/presentation/pages/channels_list.dart';
import 'package:ghasedak/pages/login/presentation/pages/login.dart';
import 'package:ghasedak/pages/main/domain/main_cubit.dart';
import 'package:ghasedak/pages/register/presentation/pages/register.dart';

class MainPage extends StatefulWidget {
  static const String pageRoute = '/main';

  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("ورود", style: TextStyle(color: Colors.black)),
      ),
      body: Center(
        child: MultiBlocProvider(
          providers: [
            BlocProvider<MainCubit>(
              create: (BuildContext context) => getIt<MainCubit>(),
            ),
          ],
          child: BlocBuilder<MainCubit, MainState>(builder: (context, state) {
            if (state is MainLoadingState) {
              return CircularProgressIndicator();
            } else if (state is MainLoginRequiredState) {
              return LoginPage();
            } else if (state is MainRegisterRequiredState) {
              return RegisterPage();
            } else if (state is MainLoginState) {
              return ChannelsListPage();
            }
            return Container(
              width: 100,
              height: 100,
              color: Colors.blue,
            );
          }),
        ),
      ),
    );
  }
}
