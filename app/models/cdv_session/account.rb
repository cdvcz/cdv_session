module CdvSession
  class Account < ActiveResource::Base
    self.site = CdvSession.accounts_service_url
  end
end
