require 'test_helper'

class ConsultantRolesControllerTest < ActionController::TestCase
  setup do
    @consultant_role = consultant_roles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:consultant_roles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create consultant_role" do
    assert_difference('ConsultantRole.count') do
      post :create, consultant_role: { actual_cost: @consultant_role.actual_cost, actual_hours: @consultant_role.actual_hours, budgeted_hours: @consultant_role.budgeted_hours, employee_id: @consultant_role.employee_id, search_id: @consultant_role.search_id, type: @consultant_role.type }
    end

    assert_redirected_to consultant_role_path(assigns(:consultant_role))
  end

  test "should show consultant_role" do
    get :show, id: @consultant_role
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @consultant_role
    assert_response :success
  end

  test "should update consultant_role" do
    put :update, id: @consultant_role, consultant_role: { actual_cost: @consultant_role.actual_cost, actual_hours: @consultant_role.actual_hours, budgeted_hours: @consultant_role.budgeted_hours, employee_id: @consultant_role.employee_id, search_id: @consultant_role.search_id, type: @consultant_role.type }
    assert_redirected_to consultant_role_path(assigns(:consultant_role))
  end

  test "should destroy consultant_role" do
    assert_difference('ConsultantRole.count', -1) do
      delete :destroy, id: @consultant_role
    end

    assert_redirected_to consultant_roles_path
  end
end
