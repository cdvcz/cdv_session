module CdvSession
  class ConfigGenerator < Rails::Generators::Base
    def create_initializer_file
      create_file "config/initializers/cdv_session.rb",
        "CdvSession.application_code = 'app'\t # nastavte kod teto aplikace\n" +
        "CdvSession.accounts_service_url = 'http://localhost:3001'\t # nastavte URL, na ktere komunikuje AccountsService"
    end

    def mount_engine
      route("mount CdvSession::Engine, at: '/'")
    end
  end
end
