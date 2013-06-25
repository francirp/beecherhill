class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :company_id, :avatar, :category, :current_salary, :email, :first_name, :last_name, :password, :password_confirmation, :title

  belongs_to :company
  has_many :searches, :through => :consultant_roles
  has_many :employee_budgets
  belongs_to :employee

  def full_name
    "#{self.employee.first_name} #{self.employee.last_name}"
  end

  def position
    self.employee.category
  end

end
