class QADVItemParser
  def initialize(filename)
    @filename = filename
  end

  def each
    File.open(@filename, 'rb') do |f|
      loop do
        id, order, figure, key, kind, topic = f.readline.chomp.split(/,/).map { |x| x.to_i }
        stem = f.readline.chomp
        a, b, c, d = f.readline.chomp.split(/","/)
        
        f.readline
        f.readline
        
        yield stem
      end
    end
    rescue EOFError
  end

  Item = Struct.new(:id)
end
