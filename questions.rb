require './players'

class Questions

  def initialize(curr_player)
    @curr_player = curr_player
  end

  
  def question
    puts "----- new turn -----"
    @num1 = rand(10) + 1
    @operator = ["+", "-", "*"].sample
    @num2 = rand(10) + 1
    puts "#{@curr_player.name}: What is #{@num1} #{@operator} #{@num2}?"
  end

  def answer
    answer = gets.chomp
    if answer.to_i == @num1.send(@operator, @num2)
      puts "YES! You're correct!"
      print_lives
    else 
      puts "Seriously? No!"
      @curr_player.lives -= 1
      print_lives
    end
  end

  def print_lives
    puts "#{@curr_player.name}: #{@curr_player.lives}/3 vs "
  end
end