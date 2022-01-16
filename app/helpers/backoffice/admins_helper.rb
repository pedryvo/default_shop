module Backoffice::AdminsHelper
  OptionsForRoles = Struct.new(:id, :description)

  def options_for_roles
    options = []
    Admin.roles.each do |key, value|
      options.push(OptionsForRoles.new(key, value))
    end

    options.each {|option| option.description == 0 ? option.description = 'Acesso completo' : option.description = 'Acesso Restrito' }

    options
  end
end
