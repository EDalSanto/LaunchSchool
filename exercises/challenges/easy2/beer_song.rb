# seems like every verse has same lyrics with different number of bottles of
# beer, the last of which is minus 1 the original
# verse method returns a given verse with input n for n bottles
# verses method returns range
## last verse if different ##
#
class BeerSong
  def verse(num_bottles)
    if num_bottles == 1
      "#{num_bottles} bottle of beer on the wall, #{num_bottles} bottle of beer.\n" \
      "Take it down and pass it around, no more bottles of beer on the wall.\n" 
    elsif num_bottles.zero?
      "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    elsif num_bottles == 2
      "#{num_bottles} bottles of beer on the wall, #{num_bottles} bottles of beer.\n" \
      "Take one down and pass it around, #{num_bottles - 1} bottle of beer on the wall.\n" 
    else
      "#{num_bottles} bottles of beer on the wall, #{num_bottles} bottles of beer.\n" \
      "Take one down and pass it around, #{num_bottles - 1} bottles of beer on the wall.\n" 
    end
  end

  def verses(start_bottles, final_bottles)
    res = ''
    start_bottles.downto(final_bottles) { |num_bottles| res << verse(num_bottles) }
    res
  end

  def lyrics
    verses(99, 0)
  end
end

puts BeerSong.new.verses(3, 0)

