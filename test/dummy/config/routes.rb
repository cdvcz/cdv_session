Rails.application.routes.draw do

  mount CdvSession::Engine => "/cdv_session"
end
