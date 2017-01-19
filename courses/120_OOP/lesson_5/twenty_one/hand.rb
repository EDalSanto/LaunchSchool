module Hand
  MAX_VALUE = 21

  def busted?
    total > MAX_VALUE 
  end

  def correct_for_aces(sum)
    aces = hand.select { |card| card.face == 'A' }.count
    aces.times do
      sum -= 10 if sum > MAX_VALUE
    end
    sum
  end

 # def find_card_value(card)
 #   if /\d/.match(card.value)
 #     card.value.to_i
 #   elsif /[JQK]/.match(card.value)
 #     10
 #   else
 #     11
 #   end
 # end

  def total
    sum = 0
    hand.each do |card|
      sum += card.find_face_value
    end
    sum = correct_for_aces(sum)
  end

end
