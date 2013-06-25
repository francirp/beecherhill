class ConsultantRolesController < ApplicationController
  # GET /consultant_roles
  # GET /consultant_roles.json
  def index
    if params[:search_id]
      cookies[:search_id] = params[:search_id]
    end
    @consultant_roles = ConsultantRole.order('employee_id ASC').where(:search_id => cookies[:search_id])
    @search = Search.find_by_id(cookies[:search_id])


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @consultant_roles }
    end
  end

  # GET /consultant_roles/1
  # GET /consultant_roles/1.json
  def show
    @consultant_role = ConsultantRole.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @consultant_role }
    end
  end

  # GET /consultant_roles/new
  # GET /consultant_roles/new.json
  def new
    @consultant_role = ConsultantRole.new
    @search = Search.find_by_id(params[:search_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @consultant_role }
    end
  end

  # GET /consultant_roles/1/edit
  def edit
    @consultant_role = ConsultantRole.find(params[:id])
    @search = Search.find_by_id(cookies[:search_id])
  end

  # POST /consultant_roles
  # POST /consultant_roles.json
  def create
    @consultant_role = ConsultantRole.new(params[:consultant_role])

    respond_to do |format|
      if @consultant_role.save
        format.html { redirect_to consultant_roles_path(:search_id => params[:consultant_role][:search_id]), notice: "#{@consultant_role.employee.full_name} was successfully added to this search." }
        format.json { render json: @consultant_role, status: :created, location: @consultant_role }
      else
        format.html { render action: "new" }
        format.json { render json: @consultant_role.errors, status: :unprocessable_entity }
      end
    end
  end

  def import
    ConsultantRole.import(params[:file])
    redirect_to consultant_roles, notice: "Consultants imported."
  end

  # PUT /consultant_roles/1
  # PUT /consultant_roles/1.json
  def update
    @consultant_role = ConsultantRole.find(params[:id])

    respond_to do |format|
      if @consultant_role.update_attributes(params[:consultant_role])
        format.html { redirect_to consultant_roles_path(:search_id => params[:consultant_role][:search_id]), notice: "#{@consultant_role.employee.full_name} was successfully updated on this search." }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @consultant_role.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /consultant_roles/1
  # DELETE /consultant_roles/1.json
  def destroy
    @consultant_role = ConsultantRole.find(params[:id])
    emp_name = @consultant_role.employee.full_name
    @consultant_role.destroy

    respond_to do |format|
      format.html { redirect_to consultant_roles_url, :notice => "#{emp_name} has been removed from the search." }
      format.json { head :no_content }
    end
  end
end
