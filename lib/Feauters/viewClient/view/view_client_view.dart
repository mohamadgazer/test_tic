import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:test_tic/Core/Routes/routes.dart';
import 'package:test_tic/Core/shared/constant.dart';
import 'package:test_tic/Core/shared/model/clinet_model.dart';
import 'package:test_tic/Feauters/Add_reservation/manger/client_cubit/cubit/client_cubit.dart';

class ViewClientView extends StatelessWidget {
  const ViewClientView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      floatingActionButton: AddClinetFloatActionButton2(),
      // appBar: AppBar(title: const Text("View Client")),
      body: CustomClientSearchBar1(),
    );
  }
}

class AddClinetFloatActionButton2 extends StatelessWidget {
  const AddClinetFloatActionButton2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.pushNamed(context, Routes.addClient);
      },
      child: const Icon(Icons.add),
    );
  }
}

class CustomClientSearchBar1 extends StatefulWidget {
  const CustomClientSearchBar1({
    super.key,
  });

  @override
  State<CustomClientSearchBar1> createState() => _CustomClientSearchBarState();
}

class _CustomClientSearchBarState extends State<CustomClientSearchBar1> {
  @override
  late List<ClinetModel> dataList;
  late List<ClinetModel> filteredList;

  @override
  void initState() {
    super.initState();
    dataList = BlocProvider.of<ClientCubit>(context).box;
    filteredList = List.from(dataList);
  }

  void _filterList(String searchText) {
    setState(() {
      filteredList = dataList.where((data) {
        return data.name.toLowerCase().contains(searchText.toLowerCase()) ||
            data.number.toLowerCase().contains(searchText.toLowerCase()) ||
            data.address.toLowerCase().contains(searchText.toLowerCase());
      }).toList();
    });
  }

  int selectedClientID = 0;
  var box = Hive.box<ClinetModel>(Const.clinet);
  ClinetModel? selectedClient;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            centerTitle: true,
            title: const Text(Const.clientList),
            actions: const [
              // IconButton(
              //     onPressed: () {}, icon: const Icon(Icons.arrow_back_ios))
            ],
            leading: Center(
              child: IconButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, Routes.home, (route) => false);
                  },
                  icon: const Center(child: Icon(Icons.arrow_back_ios))),
            ),
            automaticallyImplyLeading: false,
            // floating: true,
            // actions: [
            //   IconButton(
            //     onPressed: () {
            //       _filterList('');
            //     },
            //     icon: const Icon(Icons.search),
            //   ),
            // ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SearchBar(
                controller:
                    BlocProvider.of<ClientCubit>(context).searchController,
                trailing: [
                  IconButton(
                    onPressed: () {
                      BlocProvider.of<ClientCubit>(context)
                          .searchController
                          .clear();
                      _filterList("");
                    },
                    icon: const Icon(Icons.clear),
                  ),
                ],
                hintText: Const.search,
                onChanged: (value) {
                  _filterList(value);
                },
                leading: const Icon(Icons.search),
                shadowColor: const MaterialStatePropertyAll(null),
                elevation: const MaterialStatePropertyAll(0.0),
              ),
            ),
          ),
          BlocConsumer<ClientCubit, ClientState>(
            listener: (context, state) {
              if (state is ClientAdd) {
                dataList = state.list;
                _filterList("");
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(Const.addCliensuccess),
                  ),
                );
              }
            },
            builder: (context, state) {
              return BlocBuilder<ClientCubit, ClientState>(
                  builder: (context, state) {
                if (state is ClientInitial) {
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return ListTile(
                          title: Text(
                              "${Const.name}: ${filteredList[index].name ?? ''}"),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  "${Const.number}: ${filteredList[index].number ?? ''}"),
                              Text(
                                "${Const.createdAt}: ${filteredList[index].createdAt.year}/${filteredList[index].createdAt.month}/${filteredList[index].createdAt.day}",
                              ),
                            ],
                          ),
                          trailing: Text(
                              "${Const.address}: ${filteredList[index].address ?? ''}"),
                          leading: Text(index.toString()),
                        );
                      },
                      childCount: filteredList.length,
                    ),
                  );
                }
                if (state is ClientAdd) {
                  dataList = state.list;
                  _filterList("");
                  return SliverList(
                      delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return ListTile(
                        title: Text(
                            "${Const.name}: ${filteredList[index].name ?? ''}"),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                "${Const.number}: ${filteredList[index].number ?? ''}"),
                            Text(
                              "${Const.createdAt}: ${filteredList[index].createdAt.year}/${filteredList[index].createdAt.month}/${filteredList[index].createdAt.day}",
                            ),
                          ],
                        ),
                        trailing: Text(
                            "${Const.address}: ${filteredList[index].address ?? ''}"),
                        leading: Text(index.toString()),
                      );
                    },
                    childCount: filteredList.length,
                  ));
                } else {
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return ListTile(
                          title: Text(
                              "${Const.name}: ${filteredList[index].name ?? ''}"),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  "${Const.number}: ${filteredList[index].number ?? ''}"),
                              Text(
                                "${Const.createdAt}: ${filteredList[index].createdAt.year}/${filteredList[index].createdAt.month}/${filteredList[index].createdAt.day}",
                              ),
                            ],
                          ),
                          trailing: Text(
                              "${Const.address}: ${filteredList[index].address ?? ''}"),
                          leading: Text(index.toString()),
                        );
                      },
                      childCount: filteredList.length,
                    ),
                  );
                }
              });
            },
          ),
        ],
      ),
    );
  }
}
