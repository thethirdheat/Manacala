class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1=name1
    @name2=name2
    @cups=Array.new(14){Array.new}
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    n=[:stone,:stone,:stone,:stone]
    (0...6).each do |i|

      @cups[i]+=n.dup
    end
    (7...13).each do |i|
      @cups[i]+=n.dup
    end 
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos < 0 || start_pos > 12
    raise "Starting cup is empty" if @cups[start_pos].empty?
    # raise "Invalid starting cup" if start_pos <0 || start_pos>12
#    raise "That isn't a valid cup" if start_pos <0 || start_pos>12
    # raise "Starting cup is empty" if start_pos.empty?
#    raise "Thats your scoring cup" if start_pos.empty?
  end


  def make_move(start_pos, current_player_name)

    curCup=start_pos
    hand=@cups[start_pos].dup
    @cups[curCup]=[]

    while !hand.empty? 
      curCup+=1
      if current_player_name==@name1&&curCup==13
        curCup=0
      end
      if current_player_name==@name2 && curCup==6
        curCup=7
      end
      @cups[curCup]<<hand.shift
    end
    render
    next_turn(curCup)

  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
  end

  def winner
  end
end
