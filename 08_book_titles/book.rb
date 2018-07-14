# Class
class Book
  attr_reader :title

  def title=(name)
    word_exceptions = %w[and over the a an in of]
    name.capitalize!
    @title = name.gsub(/\w+/) { |match| word_exceptions.include?(match) ? match : match.capitalize }
  end
end
