class NormalizePhoneNumber
  def initialize(attribute)
    @attribute = attribute
  end

  def before_create(record)
    record.send("#{@attribute}=", normalize(record.send("#{@attribute}")))
  end

  alias_method :before_validation, :before_create

  private
  def normalize(phone_number)
    number = phone_number.to_s.scan(/[0-9]/).join
    if number.size == 11 && number.start_with?("1")
      "+#{number}"
    else number.size == 10
      "+1#{number}"
    end
  end
end
