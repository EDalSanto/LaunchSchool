class Integer
  MAP = {
    1000 =>   'M',
    900  =>   'CM',
    500  =>   'D',
    400  =>   'CD',
    100  =>   'C',
    90   =>   'XC',
    50   =>   'L',
    40   =>   'XL',
    10   =>   'X',
    9    =>   'IX',
    5    =>   'V',
    4    =>   'IV',
    1    =>   'I'
  }.freeze

  def to_roman
    num = self
    roman_numeral = ''
    MAP.each do |arabic_num, roman_symbol|
      num_symbols = num / arabic_num
      next if num_symbols.zero?

      roman_numeral << roman_symbol * num_symbols
      num -= num_symbols * arabic_num
    end
    roman_numeral
  end
end
