require './players'

class Questions

  def initialize(curr_player)
    @curr_player = curr_player
  end

  
  def question
    puts ""
    puts "----- NEW TURN -----"
    @num1 = rand(10) + 1
    @operator = ["+", "-", "*"].sample
    @num2 = rand(10) + 1
    puts "#{@curr_player.name}: What is #{@num1} #{@operator} #{@num2}?"
  end

  def answer
    answer = gets.chomp
    if answer.to_i == @num1.send(@operator, @num2)
      puts "YES! You're correct!"
    else 
      puts "Seriously? No!"
      @curr_player.lives -= 1
    end
  end
end