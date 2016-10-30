require 'test_helper'

class TransactionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @transaction = transactions(:one)
  end

  test "should get index" do
    get transactions_url
    assert_response :success
  end

  test "should get new" do
    get new_transaction_url
    assert_response :success
  end

  test "should create transaction" do
    assert_difference('Transaction.count') do
      post transactions_url, params: { transaction: { escrow_pay: @transaction.escrow_pay, trans_dec_1: @transaction.trans_dec_1, trans_dec_2: @transaction.trans_dec_2, trans_dec_3: @transaction.trans_dec_3, trans_int_1: @transaction.trans_int_1, trans_int_2: @transaction.trans_int_2, trans_str_1: @transaction.trans_str_1, trans_str_2: @transaction.trans_str_2, trans_str_3: @transaction.trans_str_3, week_pay: @transaction.week_pay } }
    end

    assert_redirected_to transaction_url(Transaction.last)
  end

  test "should show transaction" do
    get transaction_url(@transaction)
    assert_response :success
  end

  test "should get edit" do
    get edit_transaction_url(@transaction)
    assert_response :success
  end

  test "should update transaction" do
    patch transaction_url(@transaction), params: { transaction: { escrow_pay: @transaction.escrow_pay, trans_dec_1: @transaction.trans_dec_1, trans_dec_2: @transaction.trans_dec_2, trans_dec_3: @transaction.trans_dec_3, trans_int_1: @transaction.trans_int_1, trans_int_2: @transaction.trans_int_2, trans_str_1: @transaction.trans_str_1, trans_str_2: @transaction.trans_str_2, trans_str_3: @transaction.trans_str_3, week_pay: @transaction.week_pay } }
    assert_redirected_to transaction_url(@transaction)
  end

  test "should destroy transaction" do
    assert_difference('Transaction.count', -1) do
      delete transaction_url(@transaction)
    end

    assert_redirected_to transactions_url
  end
end
