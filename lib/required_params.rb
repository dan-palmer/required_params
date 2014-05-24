require "active_record"
require "active_support/concern"

require "required_params/parameter_missing_error"

module RequiredParams
  extend ActiveSupport::Concern

  included do
    def self.required_params(method_name, options)
      self.send(:before_action, "validate_required_params_for_#{ method_name }", only: method_name )

      define_method("validate_required_params_for_#{ method_name }") do
        options[:params].each do |param|
          raise ParameterMissingError.new(param) unless params[param].present?
        end
      end
    end
  end

end