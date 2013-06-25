require 'test_helper'

class EmployeeBudgetsControllerTest < ActionController::TestCase
  setup do
    @employee_budget = employee_budgets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:employee_budgets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create employee_budget" do
    assert_difference('EmployeeBudget.count') do
      post :create, employee_budget: { annual_hours: @employee_budget.annual_hours, annual_salary_paid: @employee_budget.annual_salary_paid, base_salary: @employee_budget.base_salary, budget_id: @employee_budget.budget_id, emp_id: @employee_budget.emp_id, factor_goal: @employee_budget.factor_goal, percent_revenue_generating: @employee_budget.percent_revenue_generating, projected_revenue: @employee_budget.projected_revenue, revenue_generating_wages: @employee_budget.revenue_generating_wages }
    end

    assert_redirected_to employee_budget_path(assigns(:employee_budget))
  end

  test "should show employee_budget" do
    get :show, id: @employee_budget
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @employee_budget
    assert_response :success
  end

  test "should update employee_budget" do
    put :update, id: @employee_budget, employee_budget: { annual_hours: @employee_budget.annual_hours, annual_salary_paid: @employee_budget.annual_salary_paid, base_salary: @employee_budget.base_salary, budget_id: @employee_budget.budget_id, emp_id: @employee_budget.emp_id, factor_goal: @employee_budget.factor_goal, percent_revenue_generating: @employee_budget.percent_revenue_generating, projected_revenue: @employee_budget.projected_revenue, revenue_generating_wages: @employee_budget.revenue_generating_wages }
    assert_redirected_to employee_budget_path(assigns(:employee_budget))
  end

  test "should destroy employee_budget" do
    assert_difference('EmployeeBudget.count', -1) do
      delete :destroy, id: @employee_budget
    end

    assert_redirected_to employee_budgets_path
  end
end
