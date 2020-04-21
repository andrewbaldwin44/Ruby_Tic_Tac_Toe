require "./board"
require "./style"

class EditBoard
  include Display

  def initialize
    @piece_placement = (1..9).to_a
  end

  attr_accessor :piece_placement, :move

  def validate_placement
    (move.is_a?Numeric) && move > 0 && move < 9 && (piece_placement[move - 1].is_a?Numeric)
  end

  def update_board(move, player)
    @move = move.to_i

    game_piece = player == 1 ? "X".brown : "O".magenta

    self.piece_placement[@move - 1] = game_piece
  end

  def show_board
    self.display(piece_placement)
  end

  def end_game?
    switch = false

    board_rows = piece_placement.each_slice(3).map { |row|
      switch = true if row.uniq.length == 1
      row
    }
    board_rows.transpose.each { |col| switch = true if col.uniq.length == 1}
    # switch = true if ((board_rows[0][0].is_a?String) && (board_rows[1][1].is_a?String) && (board_rows[2][2].is_a?String)) ||
    #                  ((board_rows[0][2].is_a?String) && (board_rows[1][1].is_a?String) && (board_rows[2][0].is_a?String))

    switch
  end

  def tie_game?
    piece_placement.all? { |piece| piece.is_a?String }
  end
end
