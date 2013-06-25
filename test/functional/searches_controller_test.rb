require 'test_helper'

class SearchesControllerTest < ActionController::TestCase
  setup do
    @search = searches(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:searches)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create search" do
    assert_difference('Search.count') do
      post :create, search: { be_lead: @search.be_lead, client_id: @search.client_id, diversity: @search.diversity, engagement_letter_signed_date: @search.engagement_letter_signed_date, equity: @search.equity, fee_percent: @search.fee_percent, function: @search.function, gender: @search.gender, introduced_by: @search.introduced_by, introduction: @search.introduction, level: @search.level, name_of_hire: @search.name_of_hire, network: @search.network, new_client?: @search.new_client?, notes: @search.notes, placement_start_date: @search.placement_start_date, reason_closed: @search.reason_closed, reference_num: @search.reference_num, relocation_from: @search.relocation_from, relocation_to: @search.relocation_to, salary: @search.salary, search_start_date: @search.search_start_date, signed_offer_date: @search.signed_offer_date, signing_bonus: @search.signing_bonus, source: @search.source, status: @search.status, target_bonus_percent: @search.target_bonus_percent, title: @search.title }
    end

    assert_redirected_to search_path(assigns(:search))
  end

  test "should show search" do
    get :show, id: @search
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @search
    assert_response :success
  end

  test "should update search" do
    put :update, id: @search, search: { be_lead: @search.be_lead, client_id: @search.client_id, diversity: @search.diversity, engagement_letter_signed_date: @search.engagement_letter_signed_date, equity: @search.equity, fee_percent: @search.fee_percent, function: @search.function, gender: @search.gender, introduced_by: @search.introduced_by, introduction: @search.introduction, level: @search.level, name_of_hire: @search.name_of_hire, network: @search.network, new_client?: @search.new_client?, notes: @search.notes, placement_start_date: @search.placement_start_date, reason_closed: @search.reason_closed, reference_num: @search.reference_num, relocation_from: @search.relocation_from, relocation_to: @search.relocation_to, salary: @search.salary, search_start_date: @search.search_start_date, signed_offer_date: @search.signed_offer_date, signing_bonus: @search.signing_bonus, source: @search.source, status: @search.status, target_bonus_percent: @search.target_bonus_percent, title: @search.title }
    assert_redirected_to search_path(assigns(:search))
  end

  test "should destroy search" do
    assert_difference('Search.count', -1) do
      delete :destroy, id: @search
    end

    assert_redirected_to searches_path
  end
end
