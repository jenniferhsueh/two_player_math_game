require './players'
require './questions'

class Game

  def initialize
    @players = []
  end

  def start 
    puts "New game! What is your name?"
    name = gets.chomp
    player = Player.new(name)
    @players.push(player)
    # puts player.name
    if @players.count < 2
      start
    else 
      run
    end
  end

  def run
    # puts Questions.question
    @num1 = rand(10) + 1
    @operator = 
    @num2 = rand(10) + 1
    puts @num1
  end

  def questions
    # @num1 = rand
  end

end

new = Game.new
new.start
