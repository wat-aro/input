class InputType < ActiveModel::Type::Value
  def initialize(input_class, array: false)
    @input_class = input_class
    @array = array
    super()
  end

  def type
    :"#{@input_class.to_s.tableize.singularize}"
  end

  private

  def cast_value(value)
    if array?
      if value.is_a?(Array)
        value.map {|v| to_input(v) }
      else
        []
      end
    else
      to_input(value)
    end
  end

  def array?
    @array
  end

  def to_input(value)
    @input_class.new(value)
  rescue ArgumentError
    nil
  end
end
