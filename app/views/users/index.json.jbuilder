json.array!(@users) do |user|
  json.extract! user, :id, :username, :password_digest, :user_bio
  json.url user_url(user, format: :json)
end
