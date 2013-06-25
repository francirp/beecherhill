class EmployeeBudgetsController < ApplicationController
  # GET /employee_budgets
  # GET /employee_budgets.json
  def index
    @employee_budgets = EmployeeBudget.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @employee_budgets }
    end
  end

  # GET /employee_budgets/1
  # GET /employee_budgets/1.json
  def show
    @employee_budget = EmployeeBudget.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @employee_budget }
    end
  end

  # GET /employee_budgets/new
  # GET /employee_budgets/new.json
  def new
    @employee_budget = EmployeeBudget.new
    @budget = Budget.find_by_id(params[:budget_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @employee_budget }
    end
  end

  # GET /employee_budgets/1/edit
  def edit
    @employee_budget = EmployeeBudget.find(params[:id])
  end

  # POST /employee_budgets
  # POST /employee_budgets.json
  def create
    employee = Employee.find_by_id(params[:employee_budget][:employee_id])

    @employee_budget = EmployeeBudget.new
    @employee_budget.budget_id = params[:employee_budget][:budget_id]
    @employee_budget.employee_id = employee.id
    @employee_budget.base_salary = employee.current_salary
    @employee_budget.annual_salary_paid = employee.current_salary
    @budget = Budget.find_by_id(@employee_budget.budget_id)

    respond_to do |format|
      if @employee_budget.save
        format.html { redirect_to @budget, notice: 'Employee budget was successfully created.' }
        format.json { render json: @employee_budget, status: :created, location: @employee_budget }
      else
        format.html { render "new" }
        format.json { render json: @employee_budget.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /employee_budgets/1
  # PUT /employee_budgets/1.json
  def update
    @employee_budget = EmployeeBudget.find(params[:id])

    respond_to do |format|
      if @employee_budget.update_attributes(params[:employee_budget])
        format.html { redirect_to @employee_budget.budget, notice: 'Employee budget was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @employee_budget.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employee_budgets/1
  # DELETE /employee_budgets/1.json
  def destroy
    @employee_budget = EmployeeBudget.find(params[:id])
    @employee_budget.destroy

    respond_to do |format|
      format.html { redirect_to employee_budgets_url }
      format.json { head :no_content }
    end
  end
end
