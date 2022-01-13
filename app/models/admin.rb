class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: [:full_access, :restricted_access]

  scope :with_full_access, -> { where(role: 0)}
  scope :with_full_access, -> { where(role: 1)}

  def role_description_br
    self.role == 'full_access' ? 'Acesso Completo' : 'Acesso Restrito'
  end
end
