require 'test_helper'

class TestController < ActionController::Base
  include RequiredParams
  required_params :foo, params: %i{ bar baz }
  def foo; end
end

class RequiredParamsTest < ActionController::TestCase
  tests TestController

  test "extends ActiveSupports Concern module" do
    assert_kind_of ActiveSupport::Concern, RequiredParams
  end

  test "extends controller with class level method" do
    assert @controller.class.respond_to? :required_params
  end

  test "adds a before action filter to the controller" do
    method_name = "validate_required_params_for_some_method"
    TestController.expects(:before_action).with(method_name, { only: :some_method } )
    
    @controller.class.required_params :some_method, params: %i{ foo bar }
  end

  test "adds an instance level method to the controller which verifies params" do
    assert @controller.respond_to? :validate_required_params_for_foo
  end

  test "throws a paramter missing error if param is not present" do
    @controller.params = { baz: "baz" }

    assert_raises RequiredParams::ParameterMissingError do
      @controller.validate_required_params_for_foo
    end
  end

  test "does not throw an error if the required params exist" do
    @controller.params = { bar: "bar", baz: "baz" }

    assert_nothing_raised RequiredParams::ParameterMissingError do
      @controller.validate_required_params_for_foo
    end
  end

end
