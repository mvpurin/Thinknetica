module Accessors
  def attr_accessor_with_history(*attributes)
    attributes.each do |attribute|
      var = "@#{attribute}".to_sym
      var_history = "@#{attribute}_history".to_sym

      define_method(attribute) {instance_variable_get(var)}

      define_method("#{attribute}=".to_sym) do |value|
        instance_variable_set(var_history, []) if instance_variable_get(var_history).nil? #создает пустой массив var_history\
                                                                                          #в случае, если переменная var_history
                                                                                          #ранее не инициализирована
        instance_variable_get(var_history) << value
        instance_variable_set(var, value)
      end

      define_method("#{attribute}_history") {instance_variable_get(var_history)}
    end
  end

  def strong_attr_accessor(attribute, attribute_class)
    var = "@#{attribute}".to_sym

    define_method(attribute) {instance_variable_get(var)}
    define_method("#{attribute}=".to_sym) do |value|
      raise "Wrong class for attribute '#{attribute}'!" if value.class != attribute_class
      instance_variable_set(var, value)
    end
  rescue StandardError => e
    puts e
  end
end
