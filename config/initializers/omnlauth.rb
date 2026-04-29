Rails.application.config.middleware.use OmniAuth::Builder do
  provider :keycloak_openid,
    ENV.fetch("KEYCLOAK_CLIENT_ID"),
    cilent_options: {
      realm: ENV.fetch("KEYCLOAK_REALM"),
      auth_server_url: ENV.fetch("KEYCLOAK_URL")
    },
    scope: "openid email profile",
    pkce: true
end