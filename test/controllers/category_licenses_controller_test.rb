require 'test_helper'

class CategoryLicensesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category_license = category_licenses(:one)
  end

  test "should get index" do
    get category_licenses_url
    assert_response :success
  end

  test "should get new" do
    get new_category_license_url
    assert_response :success
  end

  test "should create category_license" do
    assert_difference('CategoryLicense.count') do
      post category_licenses_url, params: { category_license: { category_id: @category_license.category_id, license_id: @category_license.license_id } }
    end

    assert_redirected_to category_license_url(CategoryLicense.last)
  end

  test "should show category_license" do
    get category_license_url(@category_license)
    assert_response :success
  end

  test "should get edit" do
    get edit_category_license_url(@category_license)
    assert_response :success
  end

  test "should update category_license" do
    patch category_license_url(@category_license), params: { category_license: { category_id: @category_license.category_id, license_id: @category_license.license_id } }
    assert_redirected_to category_license_url(@category_license)
  end

  test "should destroy category_license" do
    assert_difference('CategoryLicense.count', -1) do
      delete category_license_url(@category_license)
    end

    assert_redirected_to category_licenses_url
  end
end
