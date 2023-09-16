import 'package:aostes/components/custome_widget.dart';
import 'package:aostes/components/text.dart';
import 'package:aostes/cubit/categories_cubit.dart';
import 'package:aostes/cubit/categories_state.dart';
import 'package:aostes/pages/categorie_page.dart';
import 'package:aostes/pages/detail_page.dart';
import 'package:aostes/pages/product_page.dart';
import 'package:aostes/utils/constant.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  final List<Widget> imageSliders = imgList
      .map((item) => Container(
            child: Container(
              margin: EdgeInsets.all(5.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  child: Stack(
                    children: <Widget>[
                      Image.network(item, fit: BoxFit.cover, width: 1000.0),
                      Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(200, 0, 0, 0),
                                Color.fromARGB(0, 0, 0, 0)
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          child: Text(
                            'No. ${imgList.indexOf(item)} image',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          ))
      .toList();

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
        centerTitle: true,
        backgroundColor: Colors.amber,
        leading: Container(
          margin: EdgeInsets.only(top: 10, left: 10),
          child: Text(
            "Marketpedia",
            style: texth7(
                color: ColorUI.PRIMARY_TEXT,
                size: 23,
                fontweight: FontWeight.bold),
          ),
        ),
        leadingWidth: 170,
        actions: const [
          Icon(Icons.notifications),
          SizedBox(
            width: 5,
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Column(children: [
              CarouselSlider(
                items: imageSliders,
                carouselController: _controller,
                options: CarouselOptions(
                    autoPlay: true,
                    enlargeCenterPage: false,
                    aspectRatio: 2.0,
                    viewportFraction: 1.0,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: imgList.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => _controller.animateToPage(entry.key),
                    child: Container(
                      width: 12.0,
                      height: 12.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : Colors.black)
                              .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                    ),
                  );
                }).toList(),
              ),
            ]),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Top Categories",
                      style: texth7(
                          color: ColorUI.PRIMARY_TEXT,
                          size: 18,
                          fontweight: FontWeight.bold),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CategoriePage()),
                        );
                      },
                      child: Text(
                        "View More",
                        style: texth7(
                            color: ColorUI.TEXT_1,
                            size: 14,
                            fontweight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 60,
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
                              scrollDirection: Axis.horizontal,
                              itemCount: notif.length,
                              itemBuilder: (context, index) {
                                var data = notif[index];
                                return Container(
                                  padding: EdgeInsets.all(15),
                                  margin: EdgeInsets.only(left: 10),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8))),
                                  child: Image.asset(data.image!, height: 30),
                                );
                              }),
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "New Arrivals",
                        style: texth7(
                            color: ColorUI.PRIMARY_TEXT,
                            size: 18,
                            fontweight: FontWeight.bold),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProductPage()),
                          );
                        },
                        child: Text(
                          "View More",
                          style: texth7(
                              color: ColorUI.TEXT_1,
                              size: 14,
                              fontweight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: SizedBox(
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
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 10),
                                        margin: EdgeInsets.only(bottom: 10),
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(),
                                            borderRadius: BorderRadius.all(
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
                                                      BorderRadius.all(
                                                          Radius.circular(8))),
                                              child: Image.asset(data.image!,
                                                  height: 40),
                                            ),
                                            SizedBox(
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
                                                      Icon(
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
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
