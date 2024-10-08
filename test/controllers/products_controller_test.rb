require 'test_helper'
class ProductsControllerTest < ActionDispatch::IntegrationTest
test 'render a list of products' do
get products_path

assert_response :success
assert_select '.product', 3
assert_select '.category', 3

end
test 'render a list of products filtered by category' do
  get products_path(category_id: categories(:computers).id)

  assert_response :success
  assert_select '.product', 1
end

test 'render a detailed product page' do
  get product_path(products(:ps5))

  assert_response :success
  assert_select '.title', 'ps5'
  assert_select '.description', 'new ps5'
  assert_select '.price', '700$'
end
end
