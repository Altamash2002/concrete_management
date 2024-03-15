RailsAdmin.config do |config|
  config.asset_source = :sprockets
  config.main_app_name = ["Hiranandani Concrete QA", "Admin"]
  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  ## == CancanCan ==
  config.authorize_with :cancancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/railsadminteam/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    import
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
    
  end

  # config.model 'ProjectMaster' do
  #   object_label_method do
  #    :custom_label_method
  #   end
  # end 

  config.model 'Cement' do
    object_label_method do
     :custom_label_method
    end
  end

  config.model 'MAdmixture' do
    object_label_method do
      :custom_label_method
     end
    register_instance_option :label do
      'Mineral Admixture'
    end
  end

  config.model 'MSilica' do
    object_label_method do
     :custom_label_method
    end
    register_instance_option :label do
      '3rd Binder'
    end
  end

  config.model 'Superplasticizer' do
    object_label_method do
     :custom_label_method
    end
    register_instance_option :label do
      'Super Plasticizer'
    end
  end

  config.model 'StrengthAcceptance' do
    object_label_method do
      :custom_label_method 
    end
    register_instance_option :label do
      'Strength Acceptance'
    end
  end

  config.model 'StrengthTesting' do
    register_instance_option :label do
      'Strength Testing'
    end
  end

  config.model 'StructureMaster' do
    register_instance_option :label do
      'Structure Master'
    end
  end

  config.model 'ZoneMaster' do
    register_instance_option :label do
      'Zone Master'
    end
  end

  config.model 'RmcList' do
    register_instance_option :label do
      'Rmc List'
    end
  end
  config.model 'ProjectMaster' do
    register_instance_option :label do
      'Project Master'
    end
  end
  config.model 'GradeMaster' do
    register_instance_option :label do
      'Grade Master'
    end
  end
  config.model 'BuildingMaster' do
    register_instance_option :label do
      'Building Master'
    end
  end

  config.model 'TestingResult' do
    register_instance_option :label do
      'Testing Result'
    end
  end


 

     
end
