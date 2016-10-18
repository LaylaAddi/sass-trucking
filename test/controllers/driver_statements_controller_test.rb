require 'test_helper'

class DriverStatementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @driver_statement = driver_statements(:one)
  end

  test "should get index" do
    get driver_statements_url
    assert_response :success
  end

  test "should get new" do
    get new_driver_statement_url
    assert_response :success
  end

  test "should create driver_statement" do
    assert_difference('DriverStatement.count') do
      post driver_statements_url, params: { driver_statement: { insurance1: @driver_statement.insurance1, insurance2_integer: @driver_statement.insurance2_integer, notes: @driver_statement.notes, trailer_rent: @driver_statement.trailer_rent, truck_rent: @driver_statement.truck_rent } }
    end

    assert_redirected_to driver_statement_url(DriverStatement.last)
  end

  test "should show driver_statement" do
    get driver_statement_url(@driver_statement)
    assert_response :success
  end

  test "should get edit" do
    get edit_driver_statement_url(@driver_statement)
    assert_response :success
  end

  test "should update driver_statement" do
    patch driver_statement_url(@driver_statement), params: { driver_statement: { insurance1: @driver_statement.insurance1, insurance2_integer: @driver_statement.insurance2_integer, notes: @driver_statement.notes, trailer_rent: @driver_statement.trailer_rent, truck_rent: @driver_statement.truck_rent } }
    assert_redirected_to driver_statement_url(@driver_statement)
  end

  test "should destroy driver_statement" do
    assert_difference('DriverStatement.count', -1) do
      delete driver_statement_url(@driver_statement)
    end

    assert_redirected_to driver_statements_url
  end
end
