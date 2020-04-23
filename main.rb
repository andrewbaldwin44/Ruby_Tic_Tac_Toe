require "./libs/gameplay"
require "./libs/style"

tic_tac_toe = Gameplay.new

puts "\nWelcome! Let's Play a game of Tic-Tac-Toe!".bg_blue

play_game = true

while play_game
  (1..2).each do |player|
    puts tic_tac_toe.show_board
    puts player == 1 ? "Player #{player}:".brown : "Player #{player}:".magenta
    puts "Please select a spot (1-9)"

    player_choice = gets.chomp

    until tic_tac_toe.valid_placement?(player_choice) do
      puts "\nYou can't place here! Please enter a number 1-9".red
      player_choice = gets.chomp
    end

    tic_tac_toe.update_board(player)

    if tic_tac_toe.winner?
      puts "\nPlayer #{player} is the winner!".bg_green
      puts tic_tac_toe.show_board
      play_game = false
      break
    end

    if tic_tac_toe.tie_game?
      puts "\nTie game!".bg_cyan
      puts tic_tac_toe.show_board
      play_game = false
      break
    end
  end

  if play_game == false
    puts "Would you like to play again? (yes/no)".bg_blue
    new_game = gets.chomp.downcase

    if new_game == "yes" or new_game == "y"
      play_game = true
      tic_tac_toe = Gameplay.new
    end
  end

end
