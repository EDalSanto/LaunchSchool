def blastoff(n)
	if (n == 0)
		puts 0
		puts "Blastoff!"
	else
		puts n
		blastoff(n - 1)
	end
end

if __FILE__ == $PROGRAM_NAME
	blastoff(5)
end
