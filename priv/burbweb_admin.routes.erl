#{prefix => "/admin",
  security => false,
  routes => [
             {"/", burbweb_admin_dashboard, index},
             {"/router", burbweb_admin_routes, list},
             {"/sessions", burbweb_admin_session, index}
            ],
  statics => [
              {"/assets/[...]", "assets"}
             ]
 }.
