require './players'
require './questions'

class Game

  def initialize
    @players = []
  end
  
  def start 
    puts "New player! What is your name?"
    name = gets.chomp
    player = Player.new(name)
    @players.push(player)
    if @players.count < 2
      start
    else 
      @curr_player = @players.first
      run
    end
  end

  def run
    while !game_over?
      turn
      @curr_player = @curr_player.name == @players.first.name ? @players.last : @players.first
    end
  end

  def game_over?
    @players.any? { |player| player.lives == 0 }
  end

  def turn
    ask_question = Questions.new(@curr_player)
    ask_question.question
    ask_question.answer
    print_lives
  end

  def print_lives
    player1 = @players.first
    player2 = @players.last
    puts "#{player1.name}: #{player1.lives}/3 vs #{player2.name}: #{player2.lives}/3"
    if game_over?
      winner = player1.lives > player2.lives ? player1 : player2
      puts ""
      puts "----- GAME OVER -----"
      puts "#{winner.name} wins with a score of #{winner.lives}/3"
    end
  end
end

new_game = Game.new
new_game.start