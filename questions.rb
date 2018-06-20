# require './players'

class Questions

  def initialize(curr_player)
    @curr_player = curr_player
    @question = self.question
  end

  
  def question
    puts "----- new turn -----"
    @num1 = rand(10) + 1
    @operator = "+" #, "-", "*", "/"].sample
    @num2 = rand(10) + 1
    puts "#{@curr_player.name}: What is #{@num1} #{@operator} #{@num2}?"
    answer = gets.chomp
    if answer.to_i == @num1.send(@operator, @num2)
      puts "YES! You're correct!"
      @curr_player.score += 1
      puts result
    else 
      puts "Seriously? No!"
      @curr_player.lives -= 1
    end
    # result
  end
end