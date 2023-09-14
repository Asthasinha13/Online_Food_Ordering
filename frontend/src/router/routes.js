const routes = [
  {
    path: "/",
    component: () => import("layouts/blank.vue"),
    children: [
      {
        path: "login",
        component: () => import("pages/frontend/UserLoginPage.vue"),
      },
    ],
  },
  {
    path: "/",
    component: () => import("layouts/WebLayout.vue"),
    children: [
      { path: "//", component: () => import("pages/IndexPage.vue") },
      // { path: 'login', component: () => import('pages/frontend/UserLoginPage.vue') },
      {
        path: "login",
        component: () => import("pages/frontend/login.vue"),
      },
      {
        path: "account",
        component: () => import("pages/frontend/account.vue"),
        children: [
          {
            path: "orders",
            component: () => import("src/pages/frontend/account/orders.vue")
          },
          // {
          //   path: "payments",
          //   component: () => import("src/pages/frontend/account/payments.vue")
          // },
          {
            path: "favorites",
            component: () => import("src/pages/frontend/account/favorites.vue")
          },
          {
            path: "addresses",
            component: () => import("src/pages/frontend/account/addresses.vue")
          },
          {
            path: "settings",
            component: () => import("src/pages/frontend/account/settings.vue")
          }
        ]
      },
      {
        path: "restaurant/:restaurant_name",
        component: () => import("src/pages/frontend/restaurant-single.vue"),
      },
      {
        path: "cart",
        component: () => import("pages/frontend/cart.vue"),
      },
      {
        path: "cart/success",
        component: () => import("pages/frontend/cart_success.vue"),
      },
      {
        path: "search",
        component: () => import("src/pages/frontend/search.vue"),
      },
      {
        path: "restaurants",
        component: () => import("src/pages/frontend/restaurants.vue"),
      },
      {
        path: "dishes",
        component: () => import("src/pages/frontend/dishes.vue"),
      },
    ],
  },
  {
    path: "/admin/",
    component: () => import("layouts/MainLayout.vue"),
    children: [
      {
        path: "actions",
        component: () => import("src/components/backend/modules/action.vue")
      },
      {
        path: "customers/",
        component: () => import("src/components/backend/modules/customer.vue")
      },
      {
        path: "delivery-staffs/",
        component: () => import("src/components/backend/modules/delivery-staff.vue")
      },
      {
        path: "menu/",
        component: () => import("src/components/backend/modules/menu.vue")
      },

      {
        path: "modules/",
        component: () => import("src/components/backend/modules/module.vue")
      },
      {
        path: "order-details/",
        component: () => import("src/components/backend/modules/order-detail.vue")
      },

      {
        path: "orders/",
        component: () => import("src/components/backend/modules/order.vue")
      },

      {
        path: "payments/",
        component: () => import("src/components/backend/modules/payment.vue")

      },

      {
        path: "restaurants/",
        component: () => import("src/components/backend/modules/restaurant.vue")
      },

      {
        path: "authorizations/",
        component: () => import("src/components/backend/modules/authorization.vue")
      },
      {
        path: "roles/",
        component: () => import("src/components/backend/modules/role.vue")
      },

      {
        path: "users/",
        component: () => import("src/components/backend/modules/user.vue")
      },
    ]
  },

  // Always leave this as last one,
  // but you can also remove it
  {
    path: "/:catchAll(.*)*",
    component: () => import("pages/ErrorNotFound.vue"),
  },
];


export default routes;
