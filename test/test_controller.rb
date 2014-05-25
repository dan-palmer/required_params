class TestController < ActionController::Base
  include RequiredParams
  
  required_params :foo, params: %i{ bar baz }
  
  rescue_from RequiredParams::ParameterMissingError, with: -> { render nothing: true, status: 500 }
  
  def foo
    render nothing: true, status: 200
  end

end