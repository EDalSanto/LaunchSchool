def url?(text)
  !!text.match(/^https?:\/\/\S+$/)
end

#puts url?('http://launchschool.com')   # -> true
#puts url?('https://example.com')       # -> true
#puts url?('https://example.com hello') # -> false
#puts url?('   https://example.com')    # -> false
#

def fields(text) 
  p text.split(/[,\s]+/)
end

#fields("Pete,201,Student")
## -> ['Pete', '201', 'Student']
#
#fields("Pete \t 201    ,  TA")
## -> ['Pete', '201', 'TA']
#
#fields("Pete \t 201")
## -> ['Pete', '201']

def mystery_math(text)
  puts text.sub(/[+\-*\/]/, '?')
end

#mystery_math('4 + 3 - 5 = 2')
## -> '4 ? 3 - 5 = 2'
#
#mystery_math('(4 * 3 + 2) / 7 - 1 = 1')
## -> '(4 ? 3 + 2) / 7 - 1 = 1'

def danish(text)
  p text.sub(/\b(apple|cherry|blueberry)\b/, 'danish')
end

#danish('An apple a day keeps the doctor away')
#  # -> 'An danish a day keeps the doctor away'
#
#danish('My favorite is blueberry pie')
## -> 'My favorite is danish pie'
#
#danish('The cherry of my eye')
## -> 'The danish of my eye'
#
#danish('apple. cherry. blueberry.')
## -> 'danish. cherry. blueberry.'
#
#danish('I love pineapple')
## -> 'I love pineapple'

def format_date(date_str)
  puts date_str.sub(/(\d{4})([\-\/])(\d{2})\2(\d{2})/, '\4.\3.\1')  
end

format_date('2016-06-17') # -> '17.06.2016'
format_date('2016/06/17') # -> '2016/06/17' (no change)
format_date('2015/01-31') # -> '2015/01-31' (no change)

