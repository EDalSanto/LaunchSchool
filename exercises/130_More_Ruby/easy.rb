#def compute(arg)
#  return 'Does not compute.' unless block_given?
#  yield(arg)
#end
#
#puts compute(5) { |num| num + 3 } == 8
#puts compute('a') { |char| char + 'b' } == 'ab'
#puts compute('hi') == 'Does not compute.'

#def missing(array)
#  (array[0]..array[-1]).to_a.select { |num| !array.include? num }
#end
#
#puts missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
#puts missing([1, 2, 3, 4]) == []
#puts missing([1, 5]) == [2, 3, 4]
#puts missing([6]) == []

#def divisors(n)
#  1.upto(n / 2).select { |i| n % i == 0 }
#end
#
#puts divisors(1) == [1]
#puts divisors(7) == [1, 7]
#puts divisors(12) == [1, 2, 3, 4, 6, 12]
#puts divisors(98) == [1, 2, 7, 14, 49, 98]
#puts divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute

#ENCRYPTED_PIONEERS = [
#  'Nqn Ybirynpr',
#  'Tenpr Ubccre',
#  'Nqryr Tbyqfgvar',
#  'Nyna Ghevat',
#  'Puneyrf Onoontr',
#  'Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv',
#  'Wbua Ngnanfbss',
#  'Ybvf Unyog',
#  'Pynhqr Funaaba',
#  'Fgrir Wbof',
#  'Ovyy Tngrf',
#  'Gvz Orearef-Yrr',
#  'Fgrir Jbmavnx',
#  'Xbaenq Mhfr',
#  'Wbua Ngnanfbss',
#  'Fve Nagbal Ubner',
#  'Zneiva Zvafxl',
#  'Lhxvuveb Zngfhzbgb',
#  'Unllvz Fybavzfxv',
#  'Tregehqr Oynapu'
#].freeze
#
#def decode_13(encoded_str)
#  encoded_str.chars.map { |ch| decipher_character(ch) }.join
#end
#
#def decipher_character(encoded_char)
#  case encoded_char
#  when 'a'..'m', 'A'..'M' then (encoded_char.ord + 13).chr
#  when 'n'..'z', 'N'..'Z' then (encoded_char.ord - 13).chr
#  else                          encoded_char
#  end
#end
#
#ENCRYPTED_PIONEERS.each { |ep| puts decode_13(ep) }

#def any?(array)
#  array.each do |el|
#    return true if yield(el)
#  end
#  false
#end
#
#puts any?([1, 3, 5, 6]) { |value| value.even? } == true
#puts any?([1, 3, 5, 7]) { |value| value.even? } == false
#puts any?([2, 4, 6, 8]) { |value| value.odd? } == false
#puts any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
#puts any?([1, 3, 5, 7]) { |value| true } == true
#puts any?([1, 3, 5, 7]) { |value| false } == false
#puts any?([]) { |value| true } == false
#

#def all?(array)
#  array.each do |el|
#    return false if yield(el) == false
#  end
#  true
#end
#
#puts all?([1, 3, 5, 6]) { |value| value.odd? } == false
#puts all?([1, 3, 5, 7]) { |value| value.odd? } == true
#puts all?([2, 4, 6, 8]) { |value| value.even? } == true
#puts all?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
#puts all?([1, 3, 5, 7]) { |value| true } == true
#puts all?([1, 3, 5, 7]) { |value| false } == false
#puts all?([]) { |value| false } == true
#

#def none?(array)
#  array.each { |el| return false if yield(el) == true }
#  true 
#end
#
#
#puts none?([1, 3, 5, 6]) { |value| value.even? } == false
#puts none?([1, 3, 5, 7]) { |value| value.even? } == true
#puts none?([2, 4, 6, 8]) { |value| value.odd? } == true
#puts none?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
#puts none?([1, 3, 5, 7]) { |value| true } == false
#puts none?([1, 3, 5, 7]) { |value| false } == true
#puts none?([]) { |value| true } == true
#

#def one?(array)
#  trues = 0
#  array.each do |el|
#    trues += 1 if yield(el) 
#    return false if trues > 1
#  end
#  trues == 1 ? true : false
#end
#
#puts one?([1, 3, 5, 6]) { |value| value.even? }    # -> true
#puts one?([1, 3, 5, 7]) { |value| value.odd? }     # -> false
#puts one?([2, 4, 6, 8]) { |value| value.even? }    # -> false
#puts one?([1, 3, 5, 7]) { |value| value % 5 == 0 } # -> true
#puts one?([1, 3, 5, 7]) { |value| true }           # -> false
#puts one?([1, 3, 5, 7]) { |value| false }          # -> false
#puts one?([]) { |value| true }                     # -> false
#

def count(array)
  
end
