import 'package:flutter/material.dart';
import 'package:flutter_provider_state_management/constants/themes.dart';
import 'package:flutter_provider_state_management/providers/favorite_providers.dart';
import 'package:provider/provider.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key});

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
        title: const Text('Product Details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<FavoriteProviders>(builder: (context, provider, child) {
          final items = provider.productdetails;
          final favorite = provider.favorites.contains(items);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: size.width,
                height: size.height * 0.36,
                margin: const EdgeInsets.only(bottom: 16.0),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white,
                  boxShadow: [
                    AppBoxShadow.s0BoxShadow(
                        color: Colors.black.withOpacity(0.036))
                  ],
                ),
                child: Stack(
                  alignment: Alignment.center,
                  fit: StackFit.expand,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Image.network(
                        items!.image,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Positioned(
                      top: 0.0,
                      child: Container(
                        width: size.width,
                        height: 62.0,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.black45,
                              Colors.transparent,
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 16.0,
                      top: 16.0,
                      child: InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () => provider.addToFavorites(context, items),
                        child: Container(
                          padding: const EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:
                                favorite ? Colors.pink.shade50 : Colors.white30,
                          ),
                          child: Icon(
                            favorite
                                ? Icons.favorite_rounded
                                : Icons.favorite_border_rounded,
                            size: 24.0,
                            color: favorite ? Colors.pink : Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                items.title,
                style: AppTextStyle.h0TextStyle(
                    size: 18.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              const SizedBox(height: 10.0),
              Text(
                items.category,
                style: AppTextStyle.h0TextStyle(
                    size: 15.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54),
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('\$${items.price.toStringAsFixed(2)}',
                      maxLines: 1,
                      style: AppTextStyle.h0TextStyle(
                          color: APP_PRIMARY_TEXT_THEME,
                          size: 20.0,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(width: 16.0),
                  Container(
                    height: 42.0,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.indigo,
                    ),
                    child: Center(
                      child: Text(
                        'Add to cart',
                        style: AppTextStyle.h0TextStyle(
                            color: Colors.white,
                            size: 15.0,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              Text(
                'Description',
                style: AppTextStyle.h0TextStyle(
                    size: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const SizedBox(height: 10.0),
              Text(
                items.description,
                style: AppTextStyle.h0TextStyle(
                    size: 14.0,
                    fontWeight: FontWeight.normal,
                    color: Colors.black45),
              ),
            ],
          );
        }),
      ),
    );
  }
}
