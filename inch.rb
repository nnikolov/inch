class String
  def to_inch
    Inch.new(self)
  end
end

class Fixnum
  def to_inch
    self.to_s.to_inch
  end
end

class Float
  def to_inch
    self.to_r.to_inch
  end
end

class Rational
  def to_inch
    whole = self.to_i
    numerator = "#{self.numerator % self.denominator}"
    fraction = self.denominator > 1 ? "#{numerator}/#{self.denominator}" : ''
    return Inch.new("#{whole}") if fraction == ''
    Inch.new("#{whole} #{fraction}")
  end
end

class Inch < String

  def +(other)
    (self.to_inch.to_r + other.to_inch.to_r).to_inch
  end

  def -(other)
    (self.to_r - other.to_r).to_inch
  end

  def *(other)
    (self.to_r * other.to_r).to_inch
  end

  def /(other)
    (self.to_r / other.to_r).to_inch
  end

  def fraction
    has_space? ? self.split(' ')[1].to_s.to_r : self.to_s.to_r
  end

  def to_r
    has_space? ? self.fraction + self.to_i : self.fraction
  end

  def to_f
    self.to_r.to_f
  end

  def to_mm
    (self.to_f * 25.4).round(2)
  end

  def self.mm_to_inch(mm)
    #precision = 0.03125 # 1/32
    precision = 0.0625  # 1/16
    (((mm * 0.0393701) / precision).round * precision).to_inch
  end

  private

  def has_space?
    self.include?(" ")
  end

end
