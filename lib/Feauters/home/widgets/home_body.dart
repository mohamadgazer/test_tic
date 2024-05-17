import 'package:flutter/material.dart';
import 'package:test_tic/Feauters/home/data/local_data/local_data.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    var homeModel = homeData();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
          itemCount: homeModel.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            mainAxisExtent: 100,
            crossAxisCount: 2,
          ),
          itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  if (homeModel[index].route != null &&
                      homeModel[index].route != "") {
                    Navigator.pushNamed(context, homeModel[index].route!);
                  }
                },
                child: Card(
                  child: Center(
                    child: ListTile(
                      title: Text(homeModel[index].title),
                      subtitle: homeModel[index].body != null
                          ? Text(homeModel[index].body!)
                          : null,
                      leading: Icon(homeModel[index].icon),
                    ),
                  ),
                ),
              )),
    );
  }
}
