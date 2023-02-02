import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider_state_management/components/loading_dialog.dart';
import 'package:flutter_provider_state_management/constants/themes.dart';
import 'package:flutter_provider_state_management/models/favorites_models.dart';
import 'package:flutter_provider_state_management/pages/favorites_example/components/product_details_page.dart';
import 'package:flutter_provider_state_management/pages/favorites_example/favorites_page.dart';
import 'package:flutter_provider_state_management/providers/favorite_providers.dart';
import 'package:flutter_provider_state_management/utilities/navigators.dart';
import 'package:provider/provider.dart';

import '../../database/database_helper.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  DatabaseHelper? dbHelper = DatabaseHelper();

  @override
  void initState() {
    super.initState();
    context.read<FavoriteProviders>().getProducts(context);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leadingWidth: 0.0,
        titleSpacing: 16.0,
        centerTitle: true,
        elevation: 0.0,
        title: const Text('Products Page'),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              alignment: Alignment.center,
              child: InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () =>
                    nextScreenNavigator(context, const FavoritesPage()),
                child: Consumer<FavoriteProviders>(
                    builder: (context, provider, child) {
                  return Badge(
                    showBadge: provider.favorites.isNotEmpty ? true : false,
                    badgeContent: Text(provider.favorites.length.toString(),
                        style: AppTextStyle.h0TextStyle(
                            size: 10.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w600)),
                    position: BadgePosition.topEnd(end: -10.0, top: -10.0),
                    child: const Icon(
                      Icons.favorite_rounded,
                      size: 24.0,
                      color: Colors.white,
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Consumer<FavoriteProviders>(builder: (context, provider, child) {
                return provider.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        itemCount: provider.products.length,
                        shrinkWrap: true,
                        padding: const EdgeInsets.only(top: 16.0),
                        clipBehavior: Clip.none,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final items = provider.products[index];
                          final favorite = provider.favorites.contains(items);

                          return Container(
                            width: size.width,
                            height: size.height * 0.15,
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            margin: const EdgeInsets.only(bottom: 16.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () {
                                context
                                    .read<FavoriteProviders>()
                                    .getProductDetails(items);
                                nextScreenNavigator(
                                    context, const ProductDetailsPage());
                              },
                              child: Row(
                                children: [
                                  Container(
                                    width: size.width * 0.26,
                                    height: size.height * 0.15,
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    margin: const EdgeInsets.only(right: 16.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.0),
                                      color: Colors.white,
                                      boxShadow: [
                                        AppBoxShadow.s0BoxShadow(
                                          color:
                                              Colors.black.withOpacity(0.086),
                                        ),
                                      ],
                                    ),
                                    child: Stack(
                                      fit: StackFit.expand,
                                      alignment: Alignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Image.network(
                                            items.image,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        Positioned(
                                          top: -10.0,
                                          child: Container(
                                            width: size.width,
                                            height: size.height * 0.15 / 2,
                                            decoration: const BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  Colors.black45,
                                                  Colors.transparent
                                                ],
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          right: 8.0,
                                          top: 8.0,
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () => provider
                                                .addToFavorites(context, items),
                                            child: Icon(
                                              provider.favorites.contains(items)
                                                  ? Icons.favorite_rounded
                                                  : Icons
                                                      .favorite_border_rounded,
                                              size: 24.0,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(items.title,
                                            maxLines: 1,
                                            style: AppTextStyle.h0TextStyle(
                                                size: 15.0,
                                                fontWeight: FontWeight.w600)),
                                        const SizedBox(height: 4.0),
                                        Text(items.category,
                                            maxLines: 1,
                                            style: AppTextStyle.h0TextStyle(
                                                color: Colors.black87,
                                                size: 14.0,
                                                fontWeight: FontWeight.normal)),
                                        const SizedBox(height: 6.0),
                                        Row(
                                          children: [
                                            Container(
                                              padding:
                                                  const EdgeInsets.all(2.0),
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.green.shade500,
                                              ),
                                              child: const Icon(
                                                Icons.star_rounded,
                                                size: 12.0,
                                                color: Colors.white,
                                              ),
                                            ),
                                            const SizedBox(width: 6.0),
                                            Text(
                                              items.rating.toStringAsFixed(1),
                                              style: AppTextStyle.h0TextStyle(
                                                  size: 14.0,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            const SizedBox(width: 10.0),
                                            Text(
                                              '(${items.rateCount})',
                                              style: AppTextStyle.h0TextStyle(
                                                  size: 14.0,
                                                  color: Colors.black45,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 6.0),
                                        Text('\$${items.price}',
                                            maxLines: 1,
                                            style: AppTextStyle.h0TextStyle(
                                                color: APP_PRIMARY_TEXT_THEME,
                                                size: 15.0,
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
              })
            ],
          ),
        ),
      ),
    );
  }
}
