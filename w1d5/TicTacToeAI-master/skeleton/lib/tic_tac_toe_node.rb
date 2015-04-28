require_relative 'tic_tac_toe'

class TicTacToeNode
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
  end

  def losing_node?(evaluator)
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    #we will go through EVERY empty? position
    #for each.empty_positions
    #        dup the board
    #        on this current position,
    #              put a next mover mark
    #              make this the pre_move_pos
    #        flip the next_mover_mark
    #        now evaluate if o won and lost
    #        now evaluate if x won and lost

    #
  end
end

we have the current board
we have next_mover_mark
and prev_mover_mark
