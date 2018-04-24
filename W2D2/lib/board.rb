require "byebug"

class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14){[]}
    @cups.each_with_index do |cup, idx|
        cup.concat([:stone, :stone, :stone, :stone]) unless idx == 13 or idx == 6
    end
    @players = [name1,name2]
  end

  attr_reader :players
  attr_accessor :cups

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
  end

  def opponents_cup(idx, player)
    (player == players[0] && idx == 13) ||
    (player == players[1] && idx == 6)
  end

  def points_cup(player)
    cups = [6,13]
    cups[players.index(player)]
  end


  def valid_move?(start_pos)
    #start_pos -= 1
    err = ArgumentError.new("Invalid starting cup")
    if start_pos <0 || start_pos > 13 || @cups[start_pos].empty?
      raise err
    end
  end

  def make_move(start_pos, current_player_name)
    valid_move?(start_pos)
    stone_count = @cups[start_pos].length
    @cups[start_pos] = []
    idx = start_pos
    until stone_count == 0
      idx = (idx + 1) % 14
      unless opponents_cup(idx, current_player_name)
        @cups[idx] << :stone
        stone_count -= 1
      end
    end
    render

    next_turn(idx)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    cup = @cups[ending_cup_idx]
    return :prompt if ending_cup_idx == 6 || ending_cup_idx == 13
    return :switch if cup.length == 1
    return ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups[0..5].all?(&:empty?) || @cups[7..12].all?(&:empty?)
  end

  def winner
    if @cups[6].length>@cups[13].length
      return players.first
    elsif @cups[6].length<@cups[13].length
      return players.last
    end
    :draw
  end
end
