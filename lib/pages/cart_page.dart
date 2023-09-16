import 'package:aostes/components/custome_widget.dart';
import 'package:aostes/components/text.dart';
import 'package:aostes/cubit/categories_cubit.dart';
import 'package:aostes/cubit/categories_state.dart';
import 'package:aostes/pages/detail_page.dart';
import 'package:aostes/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: ListView(
        children: [
          Container(
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
                    height: MediaQuery.of(context).size.height/2.5,
                    child: ListView.builder(
                        physics:  const NeverScrollableScrollPhysics(),
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          var data = notif[index];
                          return Container(
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
                                                  .BLACK,
                                              size: 18,
                                            ),
                                          ),
                                          Icon(Icons.add_box_sharp),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize:
                                        MainAxisSize.max,
                                        mainAxisAlignment:
                                        MainAxisAlignment
                                            .spaceBetween,
                                        children: [
                                          Text(
                                            data.mount!,
                                            style: texth7(
                                              color:
                                              ColorUI.PRIMARY_TEXT,
                                              size: 15,
                                            ),
                                          ),
                                          Container(
                                            width: 25,
                                            child: Text(
                                              "4",
                                              style: texth7(
                                                color:
                                                ColorUI.PRIMARY_TEXT,
                                                size: 15,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ],
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
                                                ColorUI.WHITE,
                                                border: Border.all(
                                                    color: ColorUI
                                                        .WHITE),
                                                borderRadius:
                                                const BorderRadius
                                                    .all(Radius
                                                    .circular(
                                                    5))),
                                            padding: const EdgeInsets
                                                .symmetric(
                                                vertical: 1,
                                                horizontal: 3),
                                            child: Row(
                                              mainAxisSize:
                                              MainAxisSize.min,
                                              children: [
                                                Text(
                                                  "Size : L",
                                                  style: texth7(
                                                    color: ColorUI
                                                        .BLACK,
                                                    size: 14,
                                                  ),
                                                ),

                                              ],
                                            ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                "Color : ",
                                                style: texth7(
                                                  color: ColorUI
                                                      .BLACK,
                                                  size: 14,
                                                ),
                                              ),
                                              Container(
                                                color: ColorUI.BLUE_ACCENT,
                                                width: 20,
                                                height: 20,
                                              )
                                            ],
                                          ),
                                          const Icon(
                                            Icons.remove,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  color: ColorUI.BTN_GREY,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Billing Information",
                        style: texth7(
                            color: ColorUI.PRIMARY_TEXT,
                            size: 18,
                            fontweight: FontWeight.w500),
                      ),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Order Total",
                            style: texth7(
                                color: ColorUI.PRIMARY_TEXT,
                                size: 16,fontweight: FontWeight.w500),
                          ),
                          Text(
                            "\$961",
                            style: texth7(
                                color: ColorUI.PRIMARY_TEXT,
                                size: 16,fontweight: FontWeight.w500),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Tax",
                            style: texth7(
                                color: ColorUI.PRIMARY_TEXT,
                                size: 16,fontweight: FontWeight.w500),
                          ),
                          Text(
                            "\$30",
                            style: texth7(
                                color: ColorUI.PRIMARY_TEXT,
                                size: 16,fontweight: FontWeight.w500),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "--------",
                            style: texth7(
                                color: ColorUI.PRIMARY_TEXT,
                                size: 16,fontweight: FontWeight.w500),),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Grand Total",
                            style: texth7(
                                color: ColorUI.PRIMARY_TEXT,
                                size: 16,fontweight: FontWeight.w500),
                          ),
                          Text(
                            "\$941",
                            style: texth7(
                                color: ColorUI.PRIMARY_TEXT,
                                size: 16,fontweight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15,),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: ColorUI.TEXT_1,
                      border: Border.all(color: ColorUI.TEXT_1),
                      borderRadius:
                      BorderRadius.all(Radius.circular(8))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add_shopping_cart_outlined,
                        size: 30,
                        color: Colors.white,
                      ),
                      SizedBox(width: 20,),
                      Text("Add to Cart", textAlign: TextAlign.center,style: texth7(
                        color:
                        ColorUI.WHITE,
                        size: 14,
                      ),),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
