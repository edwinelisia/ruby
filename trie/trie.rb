# Edwin Elisia
# 2015/05/01
# Really Simple Trie with Hash and Node Class
# Given words, Each character should be parsed as a child in the tree. Trie ?
#
# Sample application:
# * Given N Characters, iterate through all the characters and check if chosen characters is in the Node

class Node
  attr_accessor :value, :childs

  # initialize members
  # childs is a Key character to Value Node
  def initialize(value=nil, childs={})
    @value = value
    @childs = childs
  end

  # insert word
  def insert(word, index=0)
    key = word[index]
    if key
      # character exist in the child
      if @childs[key]
        #puts "#{key} exists, inserting #{word[index+1]} from #{word}"
        @childs[key].value = true if index+1 == word.length
        @childs[key].insert(word, index+1)
      else
        #puts "#{key} doesnt exist, creating #{key} and inserting #{word[index+1]} from #{word}"
        @childs[key] = (index+1 == word.length) ? Node.new(true) : Node.new
        @childs[key].insert(word, index+1)
      end
    end
  end

  # look if the word exist in the node
  def find(word, index=0)
    key = word[index]
    if index < word.length
      @childs[key] ? @childs[key].find(word, index+1) : (return nil)
    elsif index == word.length && @value == true
      return self
    end
  end

  # delete the value in the node to indicate that its NOT a valid word
  def delete(word)
    found = self.find(word)
    found.value = nil
  end

  def print
    puts @childs
  end
end


# trie = Node.new
# while true
#   word = gets
#   trie.insert(word.chomp)
#   trie.print
# end


=begin
# run the program
# TODO RSPEC THIS
# test insert, Ideally the data source should be from a dictionary.
test = Node.new
test.insert("edwin")
test.insert("elisia")
test.insert("goes")
test.insert("fishing")
test.insert("in")
test.insert("the")
test.insert("lake")

test.print

# test find "in"
puts "\nSearching 'in'"
found = test.find("in")
found ? (puts "'in' is in node #{found.inspect}") : (puts "'in' is Not in node")

# test find "nothing"
puts "\nSearching 'found'"
found = test.find("found")
puts "'found' return nil"


# test delete
puts "\nDeleting 'in'"
test.delete("in")
found = test.find("in")
puts "Success, Now 'in' is NOT FOUND" if found.nil?
=end
