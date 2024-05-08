class StringCalculator
    def add(numbers)
      return 0 if numbers.empty?
  
      delimiter = ","
      if numbers.start_with?("//")
        delimiter = numbers[2]
        numbers = numbers.split("\n", 2)[1]
      end
  
      numbers = numbers.split(/#{delimiter}|\n/).map(&:to_i)
  
      negative_numbers = numbers.select { |num| num < 0 }
      raise "negative numbers not allowed #{negative_numbers.join(',')}" if negative_numbers.any?
  
      numbers.inject(0) { |sum, num| sum + num }
    end
  end