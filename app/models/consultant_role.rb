class ConsultantRole < ActiveRecord::Base
  attr_accessible :actual_cost, :actual_hours, :budgeted_hours, :employee_id, :search_id, :role, :percent_attributable

  belongs_to :search
  belongs_to :employee

  before_save :adjust_percents
  before_create :create_budgeted_hours

    def self.import(file)
      CSV.foreach(file.path, headers: true) do |row|
        ConsultantRole.create! row.to_hash
      end
    end

    def total_rev_generating_percent_attributable
      consultant_roles = ConsultantRole.where(:search_id => self.search_id)
      array = consultant_roles.map do |consultant_role|
        if consultant_role.employee.revenue_generating
          consultant_role.percent_attributable
        else 0
        end
      end
      array.sum
    end

    def total_non_rev_generating_percent_attributable
      consultant_roles = ConsultantRole.where(:search_id => self.search_id)
      array = consultant_roles.map do |consultant_role|
        if consultant_role.employee.non_revenue_generating
          consultant_role.percent_attributable
        else 0
        end
      end
      array.sum
    end

    def hours_variance
      return self.actual_hours - self.budgeted_hours unless self.actual_hours == nil
    end

    private
      def adjust_percents
        if self.percent_attributable > 1
          self.percent_attributable = self.percent_attributable.to_f / 100
        end
      end

      def create_budgeted_hours
        if self.employee.revenue_generating
          budgeted_cost = self.percent_attributable * self.search.fee_amount
          employee_budget = self.employee.current_employee_budget
          self.budgeted_hours = budgeted_cost / employee_budget.billable_rate unless employee_budget.billable_rate == nil
        else
          projected_revenue = Budget.where(:is_active => true).first.projected_revenue
          percent_of_projected_revenue = self.search.fee_amount / projected_revenue
          annual_research_hours_array = Employee.all.map do |employee|
            if employee.category == 'Research'
              employee.hours_per_year
            else
              0
            end
          end
          annual_research_hours = annual_research_hours_array.sum
          hours_for_search = annual_research_hours * percent_of_projected_revenue
          self.budgeted_hours = hours_for_search * percent_attributable
        end
      end
end








