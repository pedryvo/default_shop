module Backoffice::AdminsHelper
  OptionsForRoles = Struct.new(:id, :description)

  def options_for_roles
    Admin.roles.map do |key, value|
      ops = OptionsForRoles.new(key, value)
      
      if ops.description == 0
        ops.description = 'Acesso Completo'
      else
        ops.description = 'Acesso Restrito'
      end

      ops
    end
  end
end
