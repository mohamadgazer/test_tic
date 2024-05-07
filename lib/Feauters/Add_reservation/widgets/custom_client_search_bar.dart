import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:test_tic/Core/shared/constant.dart';
import 'package:test_tic/Core/shared/model/clinet_model.dart';
import 'package:test_tic/Feauters/Add_client/view/add_clinet.dart';
import 'package:test_tic/Feauters/Add_reservation/manger/client_cubit/cubit/client_cubit.dart';
import 'package:test_tic/Feauters/Add_reservation/widgets/custom_form_field.dart';

class CustomClientSearchBar extends StatefulWidget {
  const CustomClientSearchBar({
    super.key,
  });

  @override
  State<CustomClientSearchBar> createState() => _CustomClientSearchBarState();
}

class _CustomClientSearchBarState extends State<CustomClientSearchBar> {
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
    return Column(
      children: [
        TypeAheadField<ClinetModel>(
          suggestionsCallback: (pattern) async {
            return dataList.where((data) {
              return data.name.toLowerCase().contains(pattern.toLowerCase()) ||
                  data.number.toLowerCase().contains(pattern.toLowerCase()) ||
                  data.address.toLowerCase().contains(pattern.toLowerCase());
            }).toList();
          },
          emptyBuilder: (context) {
            return const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: Center(child: Text(Const.noData)),
                ),
              ],
            );
          },
          builder: (context, controller, focusNode) {
            return TextFormField(
              controller: controller,
              focusNode: focusNode,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(Const.r80)),
                ),
                labelText: Const.search,
                hintText: Const.searchClient,
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 10),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: AppColors.blue,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AddClient()),
                        ).then((newClient) {
                          if (newClient != null) {
                            setState(() {
                              selectedClient = newClient as ClinetModel;
                            });
                          }
                        });
                      },
                      color: Colors.white,
                      icon: const Icon(
                        Icons.add,
                      ),
                    ),
                  ),
                ),
              ),
              onChanged: (value) {
                // يمكنك هنا تنفيذ عمليات بحث إضافية بناءً على القيمة المكتوبة
                _filterList(value);
              },
            );
          },
          itemBuilder: (context, suggestion) {
            return ListTile(
              title: Text("${Const.name}: ${suggestion.name ?? ''}"),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${Const.number}: ${suggestion.number ?? ''}"),
                  Text(
                      "${Const.createdAt}: ${suggestion.createdAt.year}/${suggestion.createdAt.month}/${suggestion.createdAt.day}"),
                ],
              ),
              trailing: Text("${Const.address}: ${suggestion.address ?? ''}"),
              leading: Text(suggestion.id.toString()),
            );
          },
          onSelected: (ClinetModel value) async {
            setState(() {
              selectedClientID = value.id;
              selectedClient = (box.get(selectedClientID))!;
            });
          },
        ),
        SizedBox(height: 40.h),
        ListTile(
          title: Text("${Const.name}: ${selectedClient?.name ?? ''}"),
          subtitle: Text("${Const.number}: ${selectedClient?.number ?? ''}"),
          trailing: Text("${Const.address}: ${selectedClient?.address ?? ''}"),
        ),
        Card(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Const.w50, vertical: Const.h30),
            child: CustomFormField(
              id: selectedClientID,
              formKey: BlocProvider.of<ClientCubit>(context).formKey,
            ),
          ),
        ),
        SizedBox(height: 40.h),
        ElevatedButton(
            onPressed: () async {
              print(selectedClient?.name);
            },
            child: const Text("data")),
      ],
    );
  }
}
