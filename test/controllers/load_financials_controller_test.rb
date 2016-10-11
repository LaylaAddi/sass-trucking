require 'test_helper'

class LoadFinancialsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @load_financial = load_financials(:one)
  end

  test "should get index" do
    get load_financials_url
    assert_response :success
  end

  test "should get new" do
    get new_load_financial_url
    assert_response :success
  end

  test "should create load_financial" do
    assert_difference('LoadFinancial.count') do
      post load_financials_url, params: { load_financial: { after_percent_deducted_rpm: @load_financial.after_percent_deducted_rpm, dollars_deducted_based_on_percent: @load_financial.dollars_deducted_based_on_percent, gross_rate: @load_financial.gross_rate, gross_rate_after_percent: @load_financial.gross_rate_after_percent, gross_rpm: @load_financial.gross_rpm, load_expense: @load_financial.load_expense, load_id: @load_financial.load_id, miles: @load_financial.miles, net_load_rate: @load_financial.net_load_rate, net_rpm: @load_financial.net_rpm, percent_deducted: @load_financial.percent_deducted, percent_deducted: @load_financial.percent_deducted } }
    end

    assert_redirected_to load_financial_url(LoadFinancial.last)
  end

  test "should show load_financial" do
    get load_financial_url(@load_financial)
    assert_response :success
  end

  test "should get edit" do
    get edit_load_financial_url(@load_financial)
    assert_response :success
  end

  test "should update load_financial" do
    patch load_financial_url(@load_financial), params: { load_financial: { after_percent_deducted_rpm: @load_financial.after_percent_deducted_rpm, dollars_deducted_based_on_percent: @load_financial.dollars_deducted_based_on_percent, gross_rate: @load_financial.gross_rate, gross_rate_after_percent: @load_financial.gross_rate_after_percent, gross_rpm: @load_financial.gross_rpm, load_expense: @load_financial.load_expense, load_id: @load_financial.load_id, miles: @load_financial.miles, net_load_rate: @load_financial.net_load_rate, net_rpm: @load_financial.net_rpm, percent_deducted: @load_financial.percent_deducted, percent_deducted: @load_financial.percent_deducted } }
    assert_redirected_to load_financial_url(@load_financial)
  end

  test "should destroy load_financial" do
    assert_difference('LoadFinancial.count', -1) do
      delete load_financial_url(@load_financial)
    end

    assert_redirected_to load_financials_url
  end
end
