require './players'
require './questions'

class Game

  def initialize
    @players = []
    @curr_player = @players[1]
  end

  def start 
    puts "New player! What is your name?"
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
    turn
    while @curr_player.lives > 0
      turn
    end
  end

  def turn
    # if @curr_player == @players[0]
    #   @curr_player = @players[1]
    # else 
    #   @curr_player = @players[0]
    # end
    @curr_player == @players[0] ? @curr_player = @players[1] : @curr_player = @players[0]
    ask_question = Questions.new(@curr_player)
    ask_question.question
    ask_question.answer
  end

end

new_game = Game.new
new_game.start