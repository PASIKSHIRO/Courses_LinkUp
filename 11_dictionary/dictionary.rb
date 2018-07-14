class Dictionary
  attr_accessor :entries, :keywords

  def initialize
    @entries = {}
    @keywords = []
  end

  def add(entry)
    case entry
    when String
      @entries[entry] = nil
      @keywords << entry
    when Hash
      entry.each do |key, value|
        @entries[key] = value
        @keywords << key
      end
    end
  end

  def keywords
    @keywords.sort
  end

  def include?(keyword)
    @entries.has_key?(keyword)
  end

  def find(keyword)
    @entries.select { |k, _| k =~ /#{keyword}[a-zA-Z]*/ }
  end

  def printable
    output = ''
    @keywords.sort.each_with_index do |key, index|
      output << "[#{key}] \"#{@entries[key]}\""
      output << "\n" if index < @keywords.size - 1
    end
    output
  end
end
