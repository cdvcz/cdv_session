module CdvSession
  class Account < CdvSession::ServiceResource
    self.site = CdvSession.accounts_service_url
  end
end
