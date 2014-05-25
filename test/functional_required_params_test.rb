require 'test_helper'
require 'test_controller'

class FunctionalRequiredParamsTest < ActionController::TestCase
  tests TestController

  test "does not call the intended action unless required params are present" do
    params = { bar: "bar" }
    execute_route(params) { assert_response 500 }
  end

  test "calls the intended action if the required params are present" do
    params = { bar: "bar", baz: "baz" }
    execute_route(params) { assert_response 200 }
  end

  def execute_route(params, &block)
    with_routing do |map|
      map.draw { get "foo", controller: "test", action: "foo" }
      get "foo", params, format: :json

      yield
    end
  end
end