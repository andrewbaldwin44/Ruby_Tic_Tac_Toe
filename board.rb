module Display
  def display(piece_placement)
    display =
      "\n-----------------------------------------\n\n" \
      "#{piece_placement[0]} | #{piece_placement[1]} | #{piece_placement[2]}\n" \
      "#{piece_placement[3]} | #{piece_placement[4]} | #{piece_placement[5]}\n" \
      "#{piece_placement[6]} | #{piece_placement[7]} | #{piece_placement[8]}\n" \
      "\n-----------------------------------------\n\n"
  end
end
