import 'dart:io';

import 'package:final_project/core/di/dependencey_injection.dart';
import 'package:final_project/core/theming/colors.dart';
import 'package:final_project/core/theming/styles.dart';
import 'package:final_project/core/widgets/loader.dart';
import 'package:final_project/features/add_post_screen/logic/add_property_state.dart';
import 'package:final_project/features/add_post_screen/ui/widgets/add_post.dart';
import 'package:final_project/features/cities/ui/cities_widget.dart';
import 'package:final_project/features/login/ui/widgets/login_bloc_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../logic/add_property_cubit.dart';

class AddPostScreen extends StatelessWidget {
  AddPostScreen({super.key});

  List<File> images = [];
  List<File> contract = [];
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AddPropertyCubit>(),
      child: BlocConsumer<AddPropertyCubit, AddPropertyState>(
        listener: (context, state) {
          state.whenOrNull(
            loading: () {
              Loader.instance.show(context);
            },
            success: (loginResponse) {
              Loader.instance.hide();
              setupSuccessState(context, "Property Added Successfully");
            },
            error: (error) {
              Loader.instance.hide();
              setupErrorState(context, error);
            },
          );
        },
        builder: (context, state) {
          return Scaffold(
              extendBody: true,
              backgroundColor: const Color.fromARGB(255, 255, 234, 225),
              body: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(16.sp),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 50.h,
                        ),
                        const Text("Select Images"),
                        SizedBox(height: 5.h),
                        AddImageFromCameraAndStorage(
                          isContract: false,
                          onImagesFetched: (images) {
                            this.images = images;
                          },
                        ),
                        SizedBox(height: 5.h),
                        TextFormField(
                          controller: context.read<AddPropertyCubit>().name,
                          decoration: const InputDecoration(
                              label: Text("Property Name"),
                              prefixIcon: Icon(Icons.near_me)),
                        ),
                        SizedBox(height: 12.h),
                        const Text("Select City"),
                        CitiesWidget(onCitySelected: (cityId) {
                          context.read<AddPropertyCubit>().onChangeCity(cityId);
                        },),
                        SizedBox(height: 5.h),
                        const Text("Upload Contract"),
                        SizedBox(height: 5.h),
                        AddImageFromCameraAndStorage(
                          isContract: true,
                          onImagesFetched: (images) {
                            contract = images;
                          },
                        ),
                        TextFormField(
                          controller:
                              context.read<AddPropertyCubit>().description,
                          decoration: const InputDecoration(
                              label: Text("Description"),
                              prefixIcon: Icon(Icons.description)),
                        ),
                        SizedBox(height: 5.h),
                        TextFormField(
                          keyboardType: TextInputType.phone,
                          controller: context.read<AddPropertyCubit>().area,
                          decoration: const InputDecoration(
                            label: Text("Area"),
                            prefixIcon: Icon(Icons.phone),
                          ),
                        ),  TextFormField(
                          keyboardType: TextInputType.phone,
                          controller: context.read<AddPropertyCubit>().address,
                          decoration: const InputDecoration(
                            label: Text("Address"),
                            prefixIcon: Icon(Icons.location_on),
                          ),
                        ),
                        TextFormField(
                          keyboardType: TextInputType.phone,
                          controller: context.read<AddPropertyCubit>().price,
                          decoration: const InputDecoration(
                            label: Text("Price"),
                            // prefixIcon: Icon(Icons.phone),
                          ),
                        ),
                        SizedBox(height: 5.h),
                        TextFormField(
                          keyboardType: TextInputType.phone,
                          controller: context.read<AddPropertyCubit>().bedrooms,
                          decoration: const InputDecoration(
                            label: Text("bedrooms"),
                            // prefixIcon: Icon(Icons.phone),
                          ),
                        ),
                        SizedBox(height: 5.h),
                        TextFormField(
                          keyboardType: TextInputType.phone,
                          controller:
                              context.read<AddPropertyCubit>().bathrooms,
                          decoration: const InputDecoration(
                            label: Text("bathrooms"),
                            // prefixIcon: Icon(Icons.phone),
                          ),
                        ),
                        SizedBox(height: 5.h),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  context.read<AddPropertyCubit>().addProperty(
                                      images: images, contract: contract.first);
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: ColorsManager.linear,
                                  side: BorderSide.none,
                                  shape: const StadiumBorder()),
                              child: Text(
                                "Add Property",
                                style: TextStyles.font35BlackBold.copyWith(
                                  fontSize: 16.sp,
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ));
        },
      ),
    );
  }
}
