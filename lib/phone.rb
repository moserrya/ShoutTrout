module Phone
  def normalize_phone_number
    number = self.phone_number.to_s.scan(/[0-9]/).join
    if number.size == 11 && number.start_with?("1")
      self.phone_number = number[1..-1]
    else number.size == 10
      self.phone_number = number
    end
  end
end
