require "./board"
require "./style"

class EditBoard
  private

  include Display

  def initialize
    @piece_placement = (1..9).to_a

    row_wins = @piece_placement.each_slice(3).map { |e| e}
    column_wins = row_wins.transpose
    diagonal_wins = [[0, 4, 8], [2, 4, 6]]

    @win_template = row_wins + column_wins + diagonal_wins
  end

  attr_reader :win_template
  attr_accessor :piece_placement, :move, :game_piece

  public

  def valid_placement?(move)
    @move = move.to_i

    piece_placement.select { |spot| spot.is_a?Numeric}.include?(@move)
  end

  def update_board(player)
    update_display(@game_piece = player == 1 ? "X".brown : "O".magenta)
  end

  def show_board
    self.display(piece_placement)
  end

  def winner?
    switch = false
    win_template.each do |win|
      switch = true if win.all? { |spot| piece_placement[spot] == game_piece}
    end
    switch
  end

  def tie_game?
    piece_placement.all? { |piece| piece.is_a?String }
  end
end
