import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/models/models.dart';
import 'package:flutter/material.dart';

class ProductCardGrid extends StatelessWidget {
  const ProductCardGrid({Key? key, required this.product, this.onTap})
      : super(key: key);
  final Product product;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Padding(
        padding: const EdgeInsets.only(right: 0),
        child: InkWell(
            onTap: onTap,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: SizedBox(
              height: constraints.maxHeight,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        width: constraints.maxWidth,
                        height: 195,
                        imageUrl: product.image),
                  ),
                  product.typeProduct == "sale"
                      ? Positioned(
                          top: 8,
                          left: 9,
                          child: Container(
                            alignment: Alignment.center,
                            width: 40,
                            height: 24,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(20)),
                            child: Text("-" + product.priceSale.toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(color: Colors.white)),
                          ),
                        )
                      : Container(),
                  Positioned(top: 195, child: _buildRatingProduct()),
                  Positioned(top: 177, right: 2, child: _buildButtonFavorite()),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildBrandName(context, name: product.brandName),
                        _buildTitleProduct(context, title: product.title),
                        _buildPriceProduct(context)
                      ],
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }

  Widget _buildPriceProduct(BuildContext context) {
    double priceSale = (product.price / 100) * product.priceSale!;
    return Row(
      children: [
        if (product.typeProduct == "sale") ...[
          Text(
              product.price.toString() + String.fromCharCodes(Runes('\u0024 ')),
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Colors.grey, decoration: TextDecoration.lineThrough)),
          Text(priceSale.toString() + String.fromCharCodes(Runes('\u0024')),
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Colors.red)),
        ] else ...[
          Text(
              product.price.toString() + String.fromCharCodes(Runes('\u0024 ')),
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Colors.black)),
        ]
      ],
    );
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
            itemCount: product.rating + 1,
            itemBuilder: (context, index) {
              if (product.rating == index) {
                return Center(
                  child: Text("(" + product.numberRating.toString() + ")",
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
