# Create a directory named my_folder and then navigate inside that directory. Create two files named one.rb and two.rb in the my_folder directory. Write a ruby program that outputs the line this is file one when you run the one.rb file. Then write another program that outputs this is file two when you run the two.rb file. (Hint: one.rb should have this in it puts "this is file one")

$ mkdir my_folder
$ cd my_folder
my_folder $ echo "puts 'this is file one'" > one.rb
my_folder $ echo "puts 'this is file two'" > two.rb

# When you are finished with the above and both programs are working correctly, navigate to the directory above the my_folder directory and delete all of the content you generated with one command.

my_folder $ cd ..
$ rm -r my_folder 
