class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: [:full_access, :restricted_access]

  def role_description_br
    self.role == 'full_access' ? 'Acesso Completo' : 'Acesso Restrito'
  end
end
