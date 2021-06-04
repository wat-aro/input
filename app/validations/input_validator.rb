class InputValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, input)
    if input.respond_to?(:each)
      input.each do |i|
        validate_input(record, attribute, i)
      end
    else
      validate_input(record, attribute, input)
    end
  end

  private

  def validate_input(record, attribute, input)
    if input.respond_to?(:valid?)
      return if input.valid?

      input.errors.messages.each do |key, values|
        values.each do |value|
          record.errors.add("#{record.class.to_s.tableize.singularize}/#{attribute}.#{key}", value)
        end
      end
    else
      record.errors.add(attribute, :invalid)
    end
  end
end
