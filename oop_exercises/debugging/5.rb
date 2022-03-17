# My Solution

class File
  attr_accessor :name, :byte_content

  def initialize(name)
    @name = name
  end

  alias_method :read,  :byte_content
  alias_method :write, :byte_content=

  def copy(target_file_name)
    target_file = self.class.new(target_file_name)
    target_file.write(read)

    target_file
  end

  def format
    :file
  end

  def to_s
    "#{name}.#{format}"
  end
end

class MarkdownFile < File
  # FORMAT = :md
  def format
    :md
  end
end

class VectorGraphicsFile < File
  # FORMAT = :svg
  def format
    :svg
  end
end

class MP3File < File
  # FORMAT = :mp3
  def format
    :mp3
  end
end

# Test

blog_post = MarkdownFile.new('Adventures_in_OOP_Land')
blog_post.write('Content will be added soon!'.bytes)

copy_of_blog_post = blog_post.copy('Same_Adventures_in_OOP_Land')

puts copy_of_blog_post.is_a? MarkdownFile     # true
puts copy_of_blog_post.read == blog_post.read # true

puts blog_post


# You started writing a very basic class for handling files. 
# However, when you begin to write some simple test code, you get a NameError. 
# The error message complains of an uninitialized constant File::FORMAT.
# What is the problem and what are possible ways to fix it?

# The problem is that it is a constant that changes in the File subclass hierarchy 
# It would make more senes to have a a default file format in the superclass
# and a unique format in each subclass as demonstrated above




# LS Solution 2

class File
  attr_accessor :name, :byte_content

  def initialize(name)
    @name = name
  end

  alias_method :read,  :byte_content
  alias_method :write, :byte_content=

  def copy(target_file_name)
    target_file = self.class.new(target_file_name)
    target_file.write(read)

    target_file
  end

  def to_s
    "#{name}.#{self.class::FORMAT}" # Explicit namespacing
  end
end

class MarkdownFile < File
  FORMAT = :md
end

class VectorGraphicsFile < File
  FORMAT = :svg
end

class MP3File < File
  FORMAT = :mp3
end

# Test

blog_post = MarkdownFile.new('Adventures_in_OOP_Land')
blog_post.write('Content will be added soon!'.bytes)

puts blog_post