class AdminPolicy < ApplicationPolicy

  def new?
    user.full_access? 
  end

  def permitted_attributes
    if user.full_access?
      [:email, :name, :role, :password, :password_confirmation]
    else
      [:email, :name, :password, :password_confirmation]
    end
  end

  class Scope < Scope
    def resolve
      if user.full_access?
        scope.all
      else
        scope.with_restricted_access
      end
    end
  end
end
