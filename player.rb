class Player
  private
  attr_accessor :name, :mark
  public
  def initialize(name,mark)
    @name = name
    @mark = mark
  end
  def playerMove(move,board)
    board.update(move,mark)
  end
  def getName
    @name
  end
  def getMark
    @mark
  end
end
