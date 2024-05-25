import 'package:final_project/core/helpers/extensions.dart';
import 'package:final_project/core/routing/routes.dart';
import 'package:final_project/core/theming/colors.dart';
import 'package:final_project/core/theming/styles.dart';
import 'package:final_project/features/home_details/data/models/home_properties_response.dart';
import 'package:final_project/features_admin/admin/home/logic/admin_home_cubit.dart';
import 'package:final_project/features_admin/admin/home/logic/admin_home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class User {
  final String name;
  final String email;

  User({
    required this.name,
    required this.email,
  });
}

class LawyerScreen extends StatefulWidget {
  const LawyerScreen({super.key});

  @override
  State<LawyerScreen> createState() => _LawyerScreenState();
}

class _LawyerScreenState extends State<LawyerScreen> {

  @override
  void initState() {
    super.initState();
    context.read<AdminHomeCubit>().getPendingProperties(1);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 234, 225),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 255, 234, 225),
          leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                context.pushReplacementNamed(Routes.loginScreen);
              }),
          title: Text(
            "MAZ 'S Lawyer",
            style: TextStyles.font32darkGreenBold.copyWith(fontSize: 24.sp),
          ),
          centerTitle: true,
        ),
        body: BlocConsumer<AdminHomeCubit, AdminHomeState>(
          listener: (context, state) {},
          builder: (context, state) {
            return state.when(
              initial: () => const SizedBox.shrink(),
              loading: () => const Center(child: CircularProgressIndicator()),
              success: (data) {
                final list =
                    (data as HomePropertiesResponse).data?.properties ?? [];
                return ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    final property = list[index];
                    return Card(
                      color: ColorsManager.green,
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 60.r,
                          backgroundImage:
                              const AssetImage('assets/imgs/profile.png'),
                        ),
                        title: Text(
                          property.name!,
                          style: TextStyles.font35BlackBold
                              .copyWith(color: Colors.white),
                        ),
                        subtitle: Text(property.owner!.name!),
                        trailing: const Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                        onTap: () {
                          context.pushNamed(Routes.lawyerDetailsScreen,arguments: list[index]);
                        },
                      ),
                    );
                  },
                );
              },
              error: (e) => const SizedBox.shrink(),
            );
          },
        ));
  }
}
