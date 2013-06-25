class Budget < ActiveRecord::Base
  attr_accessible :revenue_generating_wages, :target_profit_percent, :total_expenses, :year, :is_active

  has_many :employee_budgets, :dependent => :destroy
  has_many :employees, :through => :employee_budgets

  def annual_hours(category)
    employees = self.employees.where(:category => category)
    employees_hours_array = employees.map do |employee|
      employee.hours_per_year
    end
    return employees_hours_array.sum
  end

  def rev_generating_annual_hours(category)
    employees = self.employees.where(:category => category)
    employees_hours_array = employees.map do |employee|
      employee.hours_per_year * employee.percent_revenue_generating
    end
    return employees_hours_array.sum
  end

  def current_budget
    Budget.where(:is_active => true).first
  end

  def desired_revenue
    self.total_expenses / (1 - self.target_profit_percent)
  end

  def projected_revenue
    array = self.employees.map do |employee|
      if employee.factor_goal != nil && employee.current_employee_budget.annual_salary_paid != nil
        employee.factor_goal * employee.current_employee_budget.annual_salary_paid
      else
        0
      end
    end
    array.sum
  end

end
