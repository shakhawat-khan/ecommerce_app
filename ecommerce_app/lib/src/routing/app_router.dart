import 'package:ecommerce_app/src/features/account/account_screen.dart';
import 'package:ecommerce_app/src/features/not_found/not_found_screen.dart';
import 'package:ecommerce_app/src/features/orders_list/orders_list_screen.dart';
import 'package:ecommerce_app/src/features/product_page/product_screen.dart';
import 'package:ecommerce_app/src/features/shopping_cart/shopping_cart_screen.dart';
import 'package:ecommerce_app/src/features/sign_in/email_password_sign_in_screen.dart';
import 'package:ecommerce_app/src/features/sign_in/email_password_sign_in_state.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/products_list/products_list_screen.dart';

enum AppRoute {
  home,
  cart,
  order,
  account,
  singIn,
  prroduct,
}

final GoRouter router = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
        path: "/",
        name: AppRoute.home.name,
        builder: (context, state) => const ProductsListScreen(),
        routes: [
          GoRoute(
            path: 'product/:id',
            name: AppRoute.prroduct.name,
            builder: (context, state) {
              final productId = state.params['id']!;
              return ProductScreen(productId: productId);
            },
          ),
          GoRoute(
            path: "cart",
            name: AppRoute.cart.name,
            pageBuilder: (context, state) {
              return MaterialPage(
                fullscreenDialog: true,
                key: state.pageKey,
                child: const ShoppingCartScreen(),
              );
            },
          ),
          GoRoute(
            path: "orders",
            name: AppRoute.order.name,
            pageBuilder: (context, state) {
              return MaterialPage(
                fullscreenDialog: true,
                key: state.pageKey,
                child: const OrdersListScreen(),
              );
            },
          ),
          GoRoute(
            path: "account",
            name: AppRoute.account.name,
            pageBuilder: (context, state) {
              return MaterialPage(
                fullscreenDialog: true,
                key: state.pageKey,
                child: const AccountScreen(),
              );
            },
          ),
          GoRoute(
            path: "signIn",
            name: AppRoute.singIn.name,
            pageBuilder: (context, state) {
              return MaterialPage(
                fullscreenDialog: true,
                key: state.pageKey,
                child: const EmailPasswordSignInScreen(
                    formType: EmailPasswordSignInFormType.signIn),
              );
            },
          ),
        ]),
  ],
  errorBuilder: (context, state) {
    return const NotFoundScreen();
  },
);
