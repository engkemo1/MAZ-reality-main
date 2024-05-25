import 'package:final_project/core/di/dependencey_injection.dart';
import 'package:final_project/core/theming/colors.dart';
import 'package:final_project/core/theming/styles.dart';
import 'package:final_project/features/cities/ui/cities_widget.dart';
import 'package:final_project/features/home_details/data/models/home_properties_response.dart';
import 'package:final_project/features/home_details/logic/home_cubit.dart';
import 'package:final_project/features/home_details/logic/home_state.dart';
import 'package:final_project/features/search/ui/filter_screen.dart';
import 'package:final_project/features/search/ui/search_posts.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:string_similarity/string_similarity.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../data/model/filter_model.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<HomeCubit>(),
      child: const _Body(),
    );
  }
}

class _Body extends StatefulWidget {
  const _Body();

  @override
  State<_Body> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<_Body> {
  TextEditingController searchTextController = TextEditingController();
  List<FilterData> filterList = [];

  bool showFilters = false;
  List data = [];
  List resultSearch = [];

  @override
  void initState() {
    context.read<HomeCubit>().getAllPosts2().then((val) => setState(() {
          data = val;
        }));
    print(data); // TODO: implement initState
    super.initState();
  }

  String hintText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 234, 225),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 234, 225),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 10.0.h, right: 10.h),
          child: Column(
            children: [
              TextFormField(
                onChanged: (value) {
                  print(value);
                  addSearchToList(value, data);
                  setState(() {});
                  print(resultSearch.length);
                  //filter by price and location and and
                  searchTextController.text = value;
                },
                controller: searchTextController,
                decoration: InputDecoration(
                    isDense: true,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 15.w, vertical: 9.h),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: ColorsManager.green, width: 1.3.w),
                        borderRadius: BorderRadius.circular(45.r)),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: ColorsManager.gray, width: 1.3.w),
                        borderRadius: BorderRadius.circular(35.r)),
                    hintText: "Search...",
                    helperStyle: TextStyles.font25DarkGrayRegular,
                    suffixIcon: searchTextController.text.isNotEmpty
                        ? IconButton(
                            onPressed: () {
                              // searchTextController.clear();
                            },
                            icon: const Icon(
                              Icons.search,
                              size: 21,
                              color: ColorsManager.gray,
                            ))
                        : null),
              ),
              Text(hintText),
              Padding(
                padding: EdgeInsets.only(left: 15.0.h, top: 10.h, right: 8.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Filter By",
                      style: TextStyles.font35BlackBold,
                    ),
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35.r),
                            color: ColorsManager.green.withOpacity(0.5)),
                        child: IconButton(
                            onPressed: () async {
                              searchTextController.clear();
                              resultSearch.clear();
                              final result = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const FilterScreen()));

                              // Handling the result returned from the second screen
                              if (result != null) {
                                filterList = [];
                                setState(() {
                                  filterList = result;
                                });
                                print(
                                    'Received result from second screen: ${filterList.length}');
                              }
                            },
                            icon: const Icon(
                              IconlyBold.filter,
                              size: 20,
                            )))
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              resultSearch.isEmpty

                  ?searchTextController.text.isEmpty? filterList.isNotEmpty
                      ? SearchPosts(properties: filterList)
                      : Container(
                          // You can customize the body of your widget here
                          alignment: Alignment.center,
                          child: const Text(
                            'No Data',
                            style: TextStyle(fontSize: 20.0),
                          ),
                        )
                  :  Container(
                // You can customize the body of your widget here
                alignment: Alignment.center,
                child: const Text(
                  'No Data',
                  style: TextStyle(fontSize: 20.0),
                ),
              ):SearchPosts(properties: resultSearch)
            ],
          ),
        ),
      ),
    );
  }

  void addSearchToList(var searchName, List items) {
    resultSearch = [];
    searchName = searchName.toLowerCase();
    print(items);
    resultSearch = items.where((search) {
      var searchTitle = search.name.toLowerCase();

      return searchTitle.contains(searchName);
    }).toList();

    if (searchName == "") {
      resultSearch.clear();
    } else {}
  }
}
