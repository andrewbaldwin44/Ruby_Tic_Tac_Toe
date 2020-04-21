require "./editboard"
require "./style"

tic_tac_toe = EditBoard.new

puts "\nWelcome! Let's Play a game of Tic-Tac-Toe!".bg_blue

loop do
  (1..2).each do |i|
    puts tic_tac_toe.show_board
    puts i == 1 ? "Player #{i}:".bg_brown : "Player #{i}:".bg_magenta
    puts "Please select a spot (1-9)"

    player_choice = gets.chomp

    tic_tac_toe.update_board(player_choice, i)

    if tic_tac_toe.end_game?
      puts "\nPlayer #{i} is the winner!".bg_green
      puts tic_tac_toe.show_board
      break
    end

    if tic_tac_toe.tie_game?
      puts "\nTie game!".bg_cyan
      puts tic_tac_toe.show_board
      break
    end
  end
  break if tic_tac_toe.end_game? || tic_tac_toe.tie_game?
end
