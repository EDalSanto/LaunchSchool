def staggered_case(str, first_case:)
  need_upper = first_case == 'd' ? false : true 
  chars_adj = str.chars.each do |c|
    if need_upper 
      c.upcase! 
    else
      c.downcase! 
    end
    need_upper = !need_upper if c =~ /[a-zA-Z]/
  end
  chars_adj.join
end

puts staggered_case('I Love Launch School!', first_case:'u') == 'I lOvE lAuNcH sChOoL!' 
puts staggered_case('ALL CAPS', first_case: 'u') == 'AlL cApS'
puts staggered_case('ignore 77 the 444 numbers', first_case: 'u') == 'IgNoRe 77 ThE 444 nUmBeRs'
