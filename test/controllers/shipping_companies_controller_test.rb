require 'test_helper'

class ShippingCompaniesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shipping_company = shipping_companies(:one)
  end

  test "should get index" do
    get shipping_companies_url
    assert_response :success
  end

  test "should get new" do
    get new_shipping_company_url
    assert_response :success
  end

  test "should create shipping_company" do
    assert_difference('ShippingCompany.count') do
      post shipping_companies_url, params: { shipping_company: { broker_mc: @shipping_company.broker_mc, carrier_mc: @shipping_company.carrier_mc, city: @shipping_company.city, logo: @shipping_company.logo, name: @shipping_company.name, shipper_id: @shipping_company.shipper_id, state: @shipping_company.state, street: @shipping_company.street, telephone: @shipping_company.telephone, us_dot: @shipping_company.us_dot, website: @shipping_company.website, zip: @shipping_company.zip } }
    end

    assert_redirected_to shipping_company_url(ShippingCompany.last)
  end

  test "should show shipping_company" do
    get shipping_company_url(@shipping_company)
    assert_response :success
  end

  test "should get edit" do
    get edit_shipping_company_url(@shipping_company)
    assert_response :success
  end

  test "should update shipping_company" do
    patch shipping_company_url(@shipping_company), params: { shipping_company: { broker_mc: @shipping_company.broker_mc, carrier_mc: @shipping_company.carrier_mc, city: @shipping_company.city, logo: @shipping_company.logo, name: @shipping_company.name, shipper_id: @shipping_company.shipper_id, state: @shipping_company.state, street: @shipping_company.street, telephone: @shipping_company.telephone, us_dot: @shipping_company.us_dot, website: @shipping_company.website, zip: @shipping_company.zip } }
    assert_redirected_to shipping_company_url(@shipping_company)
  end

  test "should destroy shipping_company" do
    assert_difference('ShippingCompany.count', -1) do
      delete shipping_company_url(@shipping_company)
    end

    assert_redirected_to shipping_companies_url
  end
end
