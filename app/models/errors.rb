class InvalidMoveError < StandardError
  def message
    "     That move is not valid. Please try again."
  end
end
