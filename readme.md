## required_params

Verify parameters exist in the request's params map before allowing the intended action to be called.

### install

` gem install required_params `

### usage

```
class TestController < ActionController::Base
  include RequiredParams

  required_params :foo_action, params: %i{ required_param yet_another_required_param }

  def foo_action
    # do some funky controllerish stuff
  end

end
```