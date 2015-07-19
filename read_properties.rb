class ReadProperties
  def load_properties(filename)
    hash = Hash.new 0
    properties = {}
    File.open(filename, 'r') do |p|
      p.read.each_line do |line|
        line.strip!
        if (line[0] != ?# and line[0] != ?=)
          i = line.index('=')
          if (i)
            k = line[0..i-1].strip!
            value = line[i+1..(line.length() -1)].strip!
            hash.merge!(k.to_s => value.to_s)
          else
            p[line] = ''
          end
        end
      end
      properties = hash
    end
    properties
  end
end

props = ReadProperties.new.load_properties "a.properties"
puts props.to_s