# rubocop:disable Layout/LineLength
# == Route Map
#
#                                Prefix Verb   URI Pattern                                                                              Controller#Action
#                 group_recommendations GET    /groups/:group_id/recommendations(.:format)                                              recommendations#index
#                           group_reads GET    /groups/:group_id/reads(.:format)                                                        reads#index
#                            group_read GET    /groups/:group_id/reads/:id(.:format)                                                    reads#show
#                                groups GET    /groups(.:format)                                                                        groups#index
#                                       POST   /groups(.:format)                                                                        groups#create
#                             new_group GET    /groups/new(.:format)                                                                    groups#new
#                            edit_group GET    /groups/:id/edit(.:format)                                                               groups#edit
#                                 group GET    /groups/:id(.:format)                                                                    groups#show
#                                       PATCH  /groups/:id(.:format)                                                                    groups#update
#                                       PUT    /groups/:id(.:format)                                                                    groups#update
#                                       DELETE /groups/:id(.:format)                                                                    groups#destroy
#         rails_postmark_inbound_emails POST   /rails/action_mailbox/postmark/inbound_emails(.:format)                                  action_mailbox/ingresses/postmark/inbound_emails#create
#            rails_relay_inbound_emails POST   /rails/action_mailbox/relay/inbound_emails(.:format)                                     action_mailbox/ingresses/relay/inbound_emails#create
#         rails_sendgrid_inbound_emails POST   /rails/action_mailbox/sendgrid/inbound_emails(.:format)                                  action_mailbox/ingresses/sendgrid/inbound_emails#create
#   rails_mandrill_inbound_health_check GET    /rails/action_mailbox/mandrill/inbound_emails(.:format)                                  action_mailbox/ingresses/mandrill/inbound_emails#health_check
#         rails_mandrill_inbound_emails POST   /rails/action_mailbox/mandrill/inbound_emails(.:format)                                  action_mailbox/ingresses/mandrill/inbound_emails#create
#          rails_mailgun_inbound_emails POST   /rails/action_mailbox/mailgun/inbound_emails/mime(.:format)                              action_mailbox/ingresses/mailgun/inbound_emails#create
#        rails_conductor_inbound_emails GET    /rails/conductor/action_mailbox/inbound_emails(.:format)                                 rails/conductor/action_mailbox/inbound_emails#index
#                                       POST   /rails/conductor/action_mailbox/inbound_emails(.:format)                                 rails/conductor/action_mailbox/inbound_emails#create
#     new_rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/new(.:format)                             rails/conductor/action_mailbox/inbound_emails#new
#    edit_rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/:id/edit(.:format)                        rails/conductor/action_mailbox/inbound_emails#edit
#         rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#show
#                                       PATCH  /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#update
#                                       PUT    /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#update
#                                       DELETE /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#destroy
# rails_conductor_inbound_email_reroute POST   /rails/conductor/action_mailbox/:inbound_email_id/reroute(.:format)                      rails/conductor/action_mailbox/reroutes#create
#                    rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
#             rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#                    rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
#             update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#                  rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create
# rubocop:enable Layout/LineLength

Rails.application.routes.draw do
  root to: 'pages#home'
  get 'pages/home'
  resources :book_searches, only: %w[index new create]
  resources :books
  resources :groups do
    resources :recommendations, only: %w[index]
    resources :reads, only: %w[index show]
    resources :voting_sessions
  end
  scope 'voting_session_recommendations/:voting_session_recommendation_id' do
    resources :votes, only: %w[new create edit update]
  end
end
