import 'package:flutter/material.dart';
import 'package:flutter_provider_state_management/components/loading_dialog.dart';
import 'package:provider/provider.dart';
import '../../constants/themes.dart';
import '../../providers/favorite_providers.dart';
import '../../utilities/navigators.dart';
import 'components/product_details_page.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 16.0,
        centerTitle: true,
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, size: 20.0),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Your Favorites'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child:
              Consumer<FavoriteProviders>(builder: (context, provider, child) {
            return provider.isLoading
                ? showLoadingDialog2()
                : Column(
                    children: [
                      ListView.builder(
                        itemCount: provider.favorites.length,
                        shrinkWrap: true,
                        padding: const EdgeInsets.only(top: 16.0),
                        clipBehavior: Clip.none,
                        reverse: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final items = provider.favorites[index];

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
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Image.network(
                                        items.image,
                                        fit: BoxFit.contain,
                                      ),
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
                                              items.rateCount.toString(),
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
                                  const SizedBox(width: 16.0),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () =>
                                        provider.addToFavorites(context, items),
                                    child: const Icon(
                                      Icons.favorite_rounded,
                                      size: 24.0,
                                      color: Colors.pink,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  );
          }),
        ),
      ),
    );
  }
}
