class EmployeeBudget < ActiveRecord::Base
  attr_accessible :annual_hours, :annual_salary_paid, :base_salary, :budget_id, :factor_goal, :percent_revenue_generating, :projected_revenue, :revenue_generating_wages, :employee_id

  belongs_to :budget
  belongs_to :employee

  validates :employee_id, :uniqueness => {:scope => :budget_id}

  def billable_rate
    desired_profit = (self.budget.total_expenses / (1 - self.budget.target_profit_percent)) - self.budget.total_expenses
    overhead = self.budget.total_expenses - self.budget.revenue_generating_wages + desired_profit
    percent_revenue_generating_array = self.budget.employees.map do |employee|
      employee.percent_revenue_generating
    end
    total_overhead_percent = percent_revenue_generating_array.sum
    allocation = self.employee.percent_revenue_generating.to_f / total_overhead_percent
    overhead_allocation = allocation * overhead

    employee_total_cost = overhead_allocation + (self.annual_salary_paid.to_f * self.employee.percent_revenue_generating)
    hours = self.employee.hours_per_year * self.employee.percent_revenue_generating
    if hours == 0
      return 0
    else
      return employee_total_cost / hours
    end
  end


end
