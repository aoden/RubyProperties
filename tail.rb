
class Tail
  def tail(filename, num)
    File.open(filename) do |log|
      log.extend(File::Tail)
      log.interval = num
      log.backward(num)
      log.tail { |line| puts line }
    end
  end
end