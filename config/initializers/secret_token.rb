# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
require 'securerandom'

def secure_token
  token_file = Rails.root.join('.secret')
  if File.exist?(token_file)
    #Use the existing token.
    File.read(token_file).chomp
  else 
    #generate a new token and store it in token_file
    token = SecretRandom.hex(64)
    File.write(token_file, token)
    token
  end
end

Railstest::Application.config.secret_key_base = '58cc30e35ca86bc9cc5df2351c56294de7173fed2f8d7644088e45422771b435c38d76dde8554b6802a047135bf9a69d11954baa2bf613a354092fb88ea12b59'
