json.extract! user, :id, :keycloak_uid, :email, :full_name, :avatar_url, :google_access_token, :google_token_expire_at, :created_at, :updated_at
json.url user_url(user, format: :json)
