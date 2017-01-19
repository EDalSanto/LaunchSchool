module Hand
  MAX_VALUE = 21

  def busted?
    total > MAX_VALUE 
  end

  def correct_for_aces(sum)
    aces = hand.select { |card| card.value == 'A' }.count
    aces.times do
      sum -= 10 if sum > MAX_VALUE
    end
    sum
  end

  def total
    sum = 0
    hand.each do |card|
      if /\d/.match(card.value)
        sum += card.value.to_i
      elsif /[JQK]/.match(card.value)
        sum += 10
      else
        sum += 11
      end
    end
    sum = correct_for_aces(sum)
  end

end
