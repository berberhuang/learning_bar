require 'test_helper'

class CompaniesControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    sign_in FactoryGirl.create :admin, :email=>'ber@gmail.com', :password=>'a1234567'
    @company = companies(:one)
  end

  test "should get index" do
    sign_out :admin
    get :index
    assert_response :success
    assert_not_nil assigns(:companies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create company" do
    assert_difference('Company.count') do
      post :create, company: @company.attributes
    end

    assert_redirected_to company_path(assigns(:company))
  end

  test "should show company" do
    sign_out :admin
    get :show, id: @company
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @company
    assert_response :success
  end

  test "should update company" do
    put :update, id: @company, company: @company.attributes
    assert_redirected_to company_path(assigns(:company))
  end

  test "should destroy company" do
    assert_difference('Company.count', -1) do
      delete :destroy, id: @company
    end

    assert_redirected_to companies_path
  end
end
