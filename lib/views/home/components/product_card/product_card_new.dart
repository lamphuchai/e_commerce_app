import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProductCardNew extends StatelessWidget {
  const ProductCardNew({
    Key? key,
    this.onTap
  }) : super(key: key);

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 11),
      child: InkWell(
          onTap: () {},
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: SizedBox(
            height: 265,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      width: 148,
                      height: 184,
                      imageUrl:
                          "https://images.unsplash.com/photo-1542579103-8564461c32ed?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387"),
                ),
                Positioned(
                  top: 8,
                  left: 9,
                  child: Container(
                    alignment: Alignment.center,
                    width: 40,
                    height: 24,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20)),
                    child: Text("-20%",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: Colors.white)),
                  ),
                ),
                Positioned(top: 184, child: _buildRatingProduct()),
                Positioned(top: 166, right: 1, child: _buildButtonFavorite()),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildBrandName(context, name: "Dorothy Perkins"),
                      _buildTitleProduct(context, title: "Evening Dress"),
                      _buildPriceProduct(context)
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }

  Widget _buildPriceProduct(BuildContext context) {
    return Text('15' + String.fromCharCodes(Runes('\u0024')),
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: Colors.grey));
  }

  Container _buildRatingProduct() {
    return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 5),
        height: 22,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 6,
            itemBuilder: (context, index) {
              if (index == 5) {
                return Center(
                  child: Text('(10)',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodySmall),
                );
              }
              return const Icon(
                Icons.grade,
                size: 14,
                color: Colors.orange,
              );
            }));
  }

  Widget _buildTitleProduct(BuildContext context, {required String title}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Text(title, style: Theme.of(context).textTheme.titleLarge),
    );
  }

  Text _buildBrandName(BuildContext context, {required String name}) {
    return Text(name, style: Theme.of(context).textTheme.bodyMedium);
  }

  Widget _buildButtonFavorite() {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {},
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(boxShadow: const [
          BoxShadow(color: Colors.grey, offset: Offset(0.1, 0.6))
        ], color: Colors.white, borderRadius: BorderRadius.circular(20)),
        alignment: Alignment.center,
        child: const Icon(
          Icons.favorite_border,
          size: 24,
          color: Colors.grey,
        ),
      ),
    );
  }
}
