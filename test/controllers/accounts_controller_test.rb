require 'test_helper'

class AccountsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @account = accounts(:one)
  end

  test "should get index" do
    get accounts_url
    assert_response :success
  end

  test "should get new" do
    get new_account_url
    assert_response :success
  end

  test "should create account" do
    assert_difference('Account.count') do
      post accounts_url, params: { account: { acct_dec_1: @account.acct_dec_1, acct_dec_2: @account.acct_dec_2, acct_dec_3: @account.acct_dec_3, acct_int_1: @account.acct_int_1, acct_int_2: @account.acct_int_2, acct_str_1: @account.acct_str_1, acct_str_2: @account.acct_str_2, acct_str_3: @account.acct_str_3, escrow_total: @account.escrow_total, first_week_hb: @account.first_week_hb, notes_1: @account.notes_1, notes_2: @account.notes_2 } }
    end

    assert_redirected_to account_url(Account.last)
  end

  test "should show account" do
    get account_url(@account)
    assert_response :success
  end

  test "should get edit" do
    get edit_account_url(@account)
    assert_response :success
  end

  test "should update account" do
    patch account_url(@account), params: { account: { acct_dec_1: @account.acct_dec_1, acct_dec_2: @account.acct_dec_2, acct_dec_3: @account.acct_dec_3, acct_int_1: @account.acct_int_1, acct_int_2: @account.acct_int_2, acct_str_1: @account.acct_str_1, acct_str_2: @account.acct_str_2, acct_str_3: @account.acct_str_3, escrow_total: @account.escrow_total, first_week_hb: @account.first_week_hb, notes_1: @account.notes_1, notes_2: @account.notes_2 } }
    assert_redirected_to account_url(@account)
  end

  test "should destroy account" do
    assert_difference('Account.count', -1) do
      delete account_url(@account)
    end

    assert_redirected_to accounts_url
  end
end
