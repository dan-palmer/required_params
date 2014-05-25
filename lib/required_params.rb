require "required_params/parameter_missing_error"

module RequiredParams
  extend ActiveSupport::Concern

  included do
    def self.required_params(method_name, options)
      validate_required_params_method_name = "validate_required_params_for_#{ method_name }"

      define_method validate_required_params_method_name do
        options[:params].each do |param|
          raise ParameterMissingError.new(param) unless params[param].present?
        end
      end

      self.send(:before_action, validate_required_params_method_name, only: method_name )
    end
  end
end