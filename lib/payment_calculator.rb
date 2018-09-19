class PaymentCalculator
  def self.calculate_pay(start_time, bed_time, end_time)
    (bed_time - start_time) * 12 +
      (end_time - bed_time) * 8
  end
end
