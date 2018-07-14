class XmlDocument
  def initialize(indent = false)
    @indent = indent
    @indent_level = 0
  end

  def method_missing(method_name, *args, &block)
    @xmldoc = ''
    indent_xml

    @xmldoc += "<#{method_name}"
    add_attributes(args)

    if block_given?
      @xmldoc += '>'
      linebreak_xml
      @indent_level += 1
      @xmldoc += yield
      @indent_level -= 1
      indent_xml
      @xmldoc += "</#{method_name}>"
    else
      @xmldoc += '/>'
    end
    linebreak_xml
    @xmldoc
  end

  private

  def add_attributes(args)
    if args.count > 0
      @xmldoc += ' '
      args.each do |hash|
        hash.each do |key, value|
          @xmldoc += "#{key}='#{value}'"
        end
      end
    end
  end

  def indent_xml
    @xmldoc += "  " * @indent_level if @indent
  end

  def linebreak_xml
    @xmldoc += "\n" if @indent
  end
end
