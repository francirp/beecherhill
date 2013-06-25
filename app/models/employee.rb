class Employee < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :email, :category, :company_id, :current_salary, :title, :percent_revenue_generating, :factor_goal, :days_off, :hours_per_day

  has_many :budgets, :through => :employee_budgets
  belongs_to :user, :dependent => :destroy
  has_many :employee_budgets
  has_many :searches, :through => :consultant_roles
  has_many :consultant_roles

  def hours_per_year
    workdays = 5*52
    actual_worked = workdays - self.days_off
    return actual_worked * self.hours_per_day
  end

#TODO: Eliminate the dependency of many formulas to an active budget. What to do when the active budget is deleted?

  def current_employee_budget
    return self.budgets.where(:is_active => true).first.employee_budgets.where(:employee_id => self.id).first
  end

  def revenue_generating
    if self.category == 'Owner' || self.category == 'Relationship Management' || self.category == 'Recruitment'
      return true
    else
      return false
    end
  end

  def non_revenue_generating
    if self.category == 'Research' || self.category == 'Administrative'
      return true
    else
      return false
    end
  end


  before_save :adjust_percentages
  before_save :define_names

    private
      def adjust_percentages
        if self.percent_revenue_generating > 1
          self.percent_revenue_generating = self.percent_revenue_generating.to_f / 100
        end
      end

      def define_names
        self.full_name = "#{self.first_name} #{self.last_name}"
        self.first_initial_name = "#{self.first_name[0]}. #{self.last_name}"
        self.initials = "#{self.first_name[0]}#{self.last_name[0]}"
      end

end



