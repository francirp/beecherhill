class BudgetsController < ApplicationController
  # GET /budgets
  # GET /budgets.json
  def index
    @budgets = Budget.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @budgets }
    end
  end

  # GET /budgets/1
  # GET /budgets/1.json
  def show
    @budget = Budget.find(params[:id])
    @employees = Employee.all

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @budget }
    end
  end

  # GET /budgets/new
  # GET /budgets/new.json
  def new
    @budget = Budget.new
    @years = (2000..2050).to_a

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @budget }
    end
  end

  # GET /budgets/1/edit
  def edit
    @budget = Budget.find(params[:id])
  end

  # POST /budgets
  # POST /budgets.json
  def create
    @budget = Budget.new
    @budget.year = params[:year].first
    @budget.total_expenses = params[:total_expenses].scan(/\d|[.]/).join.to_f
    @budget.revenue_generating_wages = params[:revenue_generating_wages].scan(/\d|[.]/).join.to_f
    @budget.target_profit_percent = (params[:target_profit_percent].scan(/\d|[.]/).join.to_f / 100)

    respond_to do |format|
      if @budget.save
        Employee.all.each do |employee|
          @emp_budget = EmployeeBudget.new
          @emp_budget.budget_id = @budget.id
          @emp_budget.employee_id = employee.id
          @emp_budget.base_salary = employee.current_salary
          @emp_budget.annual_salary_paid = employee.current_salary
          @emp_budget.save
        end

        format.html { redirect_to @budget, notice: 'Budget was successfully created.' }
        format.json { render json: @budget, status: :created, location: @budget }
      else
        format.html { render action: "new" }
        format.json { render json: @budget.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /budgets/1
  # PUT /budgets/1.json
  def update
    @budget = Budget.find(params[:id])

    respond_to do |format|
      if @budget.update_attributes(params[:budget])
        format.html { redirect_to @budget, notice: 'Budget was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @budget.errors, status: :unprocessable_entity }
      end
    end
  end

  def new_active_budget
    @budgets = Budget.all
  end


  def update_active_budget
    @budgets = Budget.all
    @budgets.each do |budget|
      budget.is_active = false
      budget.save
    end

    @budget = Budget.find_by_id(params[:budget])
    @budget.is_active = true
    if @budget.save
      redirect_to budgets_url, notice: "#{@budget.year} was successfully set as active budget."
    else render 'budgets/active'
    end
  end

  # DELETE /budgets/1
  # DELETE /budgets/1.json
  def destroy
    @budget = Budget.find(params[:id])
    @budget.destroy

    respond_to do |format|
      format.html { redirect_to budgets_url }
      format.json { head :no_content }
    end
  end
end
