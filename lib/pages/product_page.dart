import 'package:aostes/components/custome_widget.dart';
import 'package:aostes/components/text.dart';
import 'package:aostes/cubit/categories_cubit.dart';
import 'package:aostes/cubit/categories_state.dart';
import 'package:aostes/pages/detail_page.dart';
import 'package:aostes/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  fetchHome() async {
    context.read<CategoriesCubit>().refetch();
  }

  @override
  void initState() {
    super.initState();
    fetchHome();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: BlocBuilder<CategoriesCubit, CategoriesState>(
          builder: (context, state) {
            if (state is CategoriesLoading) {
              return CustomWidgets.shimmerList(6,
                  heightScale: 0.6, padding: 0);
            } else if (state is CategoriesInitial) {
              return const Text("is empty");
            } else if (state is CategoriesFetched) {
              var notif = state.dummys;
              return Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                    itemCount: notif.length,
                    itemBuilder: (context, index) {
                      var data = notif[index];
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailPage(
                                  title: data.name!,
                                  image: data.image!,
                                  mount: data.mount!,
                                  name: data.name!,
                                  rating: data.rating!,
                                )),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          margin: EdgeInsets.only(bottom: 10),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(),
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(8))),
                          child: Row(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(),
                                    borderRadius:
                                    const BorderRadius.all(
                                        Radius.circular(8))),
                                child: Image.asset(data.image!,
                                    height: 40),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisSize:
                                      MainAxisSize.max,
                                      mainAxisAlignment:
                                      MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        Text(
                                          data.name!,
                                          style: texth7(
                                            color: ColorUI
                                                .PRIMARY_TEXT,
                                            size: 16,
                                          ),
                                        ),
                                        Icon(Icons.favorite),
                                      ],
                                    ),
                                    Text(
                                      data.mount!,
                                      style: texth7(
                                        color:
                                        ColorUI.PRIMARY_TEXT,
                                        size: 15,
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize:
                                      MainAxisSize.max,
                                      mainAxisAlignment:
                                      MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              color:
                                              ColorUI.TEXT_1,
                                              border: Border.all(
                                                  color: ColorUI
                                                      .TEXT_1),
                                              borderRadius:
                                              BorderRadius
                                                  .all(Radius
                                                  .circular(
                                                  5))),
                                          padding: EdgeInsets
                                              .symmetric(
                                              vertical: 1,
                                              horizontal: 3),
                                          child: Row(
                                            mainAxisSize:
                                            MainAxisSize.min,
                                            children: [
                                              Icon(
                                                Icons.star,
                                                color:
                                                ColorUI.WHITE,
                                                size: 18,
                                              ),
                                              Text(
                                                data.rating!,
                                                style: texth7(
                                                  color: ColorUI
                                                      .WHITE,
                                                  size: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const Icon(
                                          Icons.add,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
