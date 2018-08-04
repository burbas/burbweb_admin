#{prefix => "/admin",
  security => false,
  routes => [
             {"/", get, burbweb_admin_dashboard, index},
             {"/router", get, burbweb_admin_routes, list},
             {"/sessions", get, burbweb_admin_session, index}
            ],
  statics => [
              {"/assets/[...]", "assets"}
             ]
 }.
