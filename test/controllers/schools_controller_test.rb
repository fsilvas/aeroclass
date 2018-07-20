require 'test_helper'

class SchoolsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @school = schools(:one)
  end

  test "should get index" do
    get schools_url
    assert_response :success
  end

  test "should get new" do
    get new_school_url
    assert_response :success
  end

  test "should create school" do
    assert_difference('School.count') do
      post schools_url, params: { school: { address: @school.address, bandwidth: @school.bandwidth, isp: @school.isp, n_teachers_pre: @school.n_teachers_pre, n_teachers_pri: @school.n_teachers_pri, n_teachers_sec: @school.n_teachers_sec, name: @school.name, principal: @school.principal, principal_email: @school.principal_email, principal_phone: @school.principal_phone, rbd: @school.rbd, tic: @school.tic, tic_email: @school.tic_email, tic_phone: @school.tic_phone, utp: @school.utp, utp_email: @school.utp_email, utp_phone: @school.utp_phone } }
    end

    assert_redirected_to school_url(School.last)
  end

  test "should show school" do
    get school_url(@school)
    assert_response :success
  end

  test "should get edit" do
    get edit_school_url(@school)
    assert_response :success
  end

  test "should update school" do
    patch school_url(@school), params: { school: { address: @school.address, bandwidth: @school.bandwidth, isp: @school.isp, n_teachers_pre: @school.n_teachers_pre, n_teachers_pri: @school.n_teachers_pri, n_teachers_sec: @school.n_teachers_sec, name: @school.name, principal: @school.principal, principal_email: @school.principal_email, principal_phone: @school.principal_phone, rbd: @school.rbd, tic: @school.tic, tic_email: @school.tic_email, tic_phone: @school.tic_phone, utp: @school.utp, utp_email: @school.utp_email, utp_phone: @school.utp_phone } }
    assert_redirected_to school_url(@school)
  end

  test "should destroy school" do
    assert_difference('School.count', -1) do
      delete school_url(@school)
    end

    assert_redirected_to schools_url
  end
end
