RailsAdmin.config do |config|

  config.authorize_with do
    puts "a"
    puts "a"
    puts "a"
    puts "a"
    redirect_to main_app.root_path unless warden.user.emp == true
    puts warden.user
  end
''
  ### Popular gems integration
  
  # == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == CancanCan ==
  # config.authorize_with :cancancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true
#   module RailsAdmin
#     module Config
#       module Actions
#         class My_action < RailsAdmin::Config::Actions::Base
#           RailsAdmin::Config::Actions.register(self)
#          register_instance_option :my_option do
#            :default_value
#         end
#       end
#     end
#   end
# end

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app
    
    # my_action do
    #   my_option :another_value
    # end

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
  
  config.navigation_static_links = {
    'Play Briefing' => 'rails_admin/data/playbriefing',
    'Google Maps' => 'pages/customers_location',
    'Intervention' => 'interventions/new'
  }

  
end

