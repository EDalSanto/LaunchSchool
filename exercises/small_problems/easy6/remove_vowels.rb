def remove_vowels(str_arr)
  str_arr.map { |str| str.delete('aeiouAEIOU') }
end
