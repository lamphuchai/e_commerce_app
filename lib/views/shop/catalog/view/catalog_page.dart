import 'package:e_commerce_app/views/shop/shop.dart';
import 'package:e_commerce_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.3,
        centerTitle: true,
        title: const Text("Women’s tops", style: TextStyle(fontSize: 18)),
        actions: [
          IconButton(
              splashRadius: 25,
              onPressed: () {},
              splashColor: Colors.transparent,
              icon: const Icon(Icons.search))
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: SizedBox(
            height: 80,
            child: Column(
              children: const [
                Expanded(
                  flex: 1,
                  child: BuildTagSelected(),
                ),
                Expanded(flex: 2, child: BuildFilters())
              ],
            ),
          ),
        ),
      ),
      body: const BuildGridView(),
    );
  }
}

class BuildGridView extends StatelessWidget {
  const BuildGridView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: BlocBuilder<CatalogCubit, CatalogState>(
          builder: (context, state) {
            if (state.products.isEmpty) {
              return const Center(
                child: Text("Empty"),
              );
            }
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 10,
                  childAspectRatio: (164 / 270)),
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                final product = state.products[index];
                return ProductCardGrid(
                  product: product,
                );
              },
            );
          },
        ));
  }
}

class BuildTagSelected extends StatelessWidget {
  const BuildTagSelected({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> tags = ["T-shirts", "Crop tops", "Blouses", "Shirts"];

    return ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: tags.length,
        itemBuilder: ((context, index) {
          final tag = tags[index];
          return Padding(
            padding: index == 0
                ? const EdgeInsets.only(left: 16, right: 3.5)
                : const EdgeInsets.symmetric(horizontal: 3.5),
            child: ElevatedButton(
                onPressed: () =>
                    context.read<FiltersCubit>().filtersTagProduct(tag),
                style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 7),
                  child: Text(
                    tag,
                    style: const TextStyle(fontSize: 14, color: Colors.white),
                  ),
                )),
          );
        }));
  }
}

class BuildFilters extends StatelessWidget {
  const BuildFilters({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
              flex: 1,
              child: InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () => Navigator.of(context, rootNavigator: true)
                    .pushNamed("filter_view"),
                child: Row(
                  children: const [
                    Icon(Icons.filter_list),
                    SizedBox(
                      width: 7,
                    ),
                    Text("Filters",
                        style: TextStyle(fontSize: 11, color: Colors.black))
                  ],
                ),
              )),
          Flexible(
              flex: 2,
              child: InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  _showModalBottomSortBy(context,
                      filtersCubit: context.read<FiltersCubit>());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.swap_vert),
                    const SizedBox(
                      width: 7,
                    ),
                    BlocBuilder<FiltersCubit, FiltersState>(
                      buildWhen: (previous, current) =>
                          previous.sortBy != current.sortBy,
                      builder: (context, state) {
                        return Text(state.sortBy,
                            style: const TextStyle(
                                fontSize: 11, color: Colors.black));
                      },
                    )
                  ],
                ),
              )),
          Flexible(
              flex: 1,
              child: Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () => _showModalBottomSelectSize(context),
                  child: const Icon(Icons.menu),
                ),
              )),
        ],
      ),
    );
  }

  _showModalBottomSelectSize(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    List<String> sizeProduct = ["XS", "S", "M", "L", "XL"];
    return showModalBottomSheet(
        useRootNavigator: true,
        backgroundColor: const Color(0xfff5f5f5),
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
        builder: (context) => SizedBox(
              height: 300,
              child: Column(
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 14),
                      width: 60,
                      height: 6,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(5)),
                    ),
                  ),
                  const Text(
                    "Select size",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    child: GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 22,
                          mainAxisSpacing: 16,
                          childAspectRatio: (width * 1 / 3 / 45)),
                      itemCount: sizeProduct.length,
                      itemBuilder: (context, index) {
                        String size = sizeProduct[index];
                        return InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border:
                                    Border.all(color: Colors.grey, width: 0.5),
                                borderRadius: BorderRadius.circular(8)),
                            child: Text(
                              size,
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.black),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Theme(
                    data: ThemeData(splashColor: Colors.transparent),
                    child: ListTile(
                      focusColor: Colors.transparent,
                      title: const Text(
                        "Size info",
                        style: TextStyle(color: Colors.black87, fontSize: 16),
                      ),
                      trailing: const Icon(Icons.arrow_right),
                      onTap: () {},
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ButtonLarge(label: "ADD TO CART", onPressed: () {}),
                  )
                ],
              ),
            ));
  }

  _showModalBottomSortBy(BuildContext context,
      {required FiltersCubit filtersCubit}) {
    List<String> itemsSort = [
      "Popular",
      "Newest",
      "Customer review",
      "Price: lowest to high",
      "Price: highest to low"
    ];

    return showModalBottomSheet(
        useRootNavigator: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
        context: context,
        builder: (context) => BlocProvider.value(
              value: filtersCubit,
              child: SizedBox(
                height: 352,
                child: Column(
                  children: [
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 14),
                        width: 60,
                        height: 6,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ),
                    const Text(
                      "Sort by",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    ...itemsSort
                        .map((item) => Builder(builder: (context) {
                              return ListTile(
                                tileColor: filtersCubit.state.sortBy == item
                                    ? Colors.red
                                    : null,
                                title: Text(item,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight:
                                            filtersCubit.state.sortBy == item
                                                ? FontWeight.bold
                                                : null,
                                        color: filtersCubit.state.sortBy == item
                                            ? Colors.white
                                            : Colors.grey)),
                                onTap: () {
                                  context.read<FiltersCubit>().setSortBy(item);
                                  Navigator.pop(context);
                                },
                              );
                            }))
                        .toList(),
                  ],
                ),
              ),
            ));
  }
}
