import 'package:aostes/components/custome_widget.dart';
import 'package:aostes/cubit/categories_cubit.dart';
import 'package:aostes/cubit/categories_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriePage extends StatefulWidget {
  const CategoriePage({super.key});

  @override
  State<CategoriePage> createState() => _CategoriePageState();
}

class _CategoriePageState extends State<CategoriePage> {
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
        title: Text("Category"),
      ),
      body: Container(
        child: BlocBuilder<CategoriesCubit, CategoriesState>(
          builder: (context, state){
            if(state is CategoriesLoading){
              return CustomWidgets.shimmerList(6, heightScale: 0.6, padding: 0);
            }else if(state is CategoriesInitial){
              return const Text("is empty");
            }else if(state is CategoriesFetched){
              var notif = state.dummys;
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                    itemCount: notif.length,
                    itemBuilder: (context, index){
                      var data = notif[index];
                      return Container(
                        padding: EdgeInsets.all(15),
                        margin: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: Image.asset(data.image!, height: 30),
                      );
                    }
                ),
              );
            }else{
              return Container();
            }
          },
        ),
      ),
    );
  }
}
