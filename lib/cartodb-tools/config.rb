
module CartodbTools
  class Config
    def self.config
      {}.tap do |config|
        rc_path = "#{ENV['HOME']}/.cartodbrc"

        config.merge!(YAML.load_file(rc_path)) if File.exists?(rc_path)

        config_from_env = {}
        config_from_env['host']                      = ENV['CARTODB_HOST'] if ENV['CARTODB_HOST']
        config_from_env['oauth_key']                 = ENV['CARTODB_OAUTHKEY']  if ENV['CARTODB_OAUTHKEY']
        config_from_env['oauth_secret']              = ENV['CARTODB_OAUTHSECRET'] if ENV['CARTODB_OAUTHSECRET']
        config_from_env['oauth_access_token']        = ENV['CARTODB_OAUTHACCESSTOKEN'] if ENV['CARTODB_OAUTHACCESSTOKEN']
        config_from_env['oauth_access_token_secret'] = ENV['CARTODB_OAUTHACCESSTOKENSECRET'] if ENV['CARTODB_OAUTHACCESSTOKENSECRET']
        config_from_env['username']                  = ENV['CARTODB_USERNAME'] if ENV['CARTODB_USERNAME']
        config_from_env['password']                  = ENV['CARTODB_PASSWORD'] if ENV['CARTODB_PASSWORD']

        config.merge!(config_from_env)
      end
    end
  end
end
