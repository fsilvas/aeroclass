require 'test_helper'

class ServicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @service = services(:one)
  end

  test "should get index" do
    get services_url
    assert_response :success
  end

  test "should get new" do
    get new_service_url
    assert_response :success
  end

  test "should create service" do
    assert_difference('Service.count') do
      post services_url, params: { service: { begin_address: @service.begin_address, begin_comuna: @service.begin_comuna, client_id: @service.client_id, comment: @service.comment, driver: @service.driver, end_address: @service.end_address, end_comuna: @service.end_comuna, flight: @service.flight, hour: @service.hour, n_bag: @service.n_bag, n_passenger: @service.n_passenger, pay_type: @service.pay_type, price: @service.price, service_date: @service.service_date, status: @service.status } }
    end

    assert_redirected_to service_url(Service.last)
  end

  test "should show service" do
    get service_url(@service)
    assert_response :success
  end

  test "should get edit" do
    get edit_service_url(@service)
    assert_response :success
  end

  test "should update service" do
    patch service_url(@service), params: { service: { begin_address: @service.begin_address, begin_comuna: @service.begin_comuna, client_id: @service.client_id, comment: @service.comment, driver: @service.driver, end_address: @service.end_address, end_comuna: @service.end_comuna, flight: @service.flight, hour: @service.hour, n_bag: @service.n_bag, n_passenger: @service.n_passenger, pay_type: @service.pay_type, price: @service.price, service_date: @service.service_date, status: @service.status } }
    assert_redirected_to service_url(@service)
  end

  test "should destroy service" do
    assert_difference('Service.count', -1) do
      delete service_url(@service)
    end

    assert_redirected_to services_url
  end
end
