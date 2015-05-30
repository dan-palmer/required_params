## required_params

Verify parameters exist in the request's params map before allowing the intended action to be called.

### install

```ruby 
gem install required_params
```

### usage

```ruby
class TestController < ActionController::Base
  include RequiredParams

  required_params :foo_action, params: %i{ required_param yet_another_required_param }

  rescue_from RequiredParams::ParameterMissingError, with: :parameter_missing_handler

  def foo_action
    # do some funky controllerish stuff
  end

  protected

  def parameter_missing_handler
    # do some funky error handling stuff
  end

end
```
