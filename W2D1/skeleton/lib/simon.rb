#require "coloriz
require "byebug"
class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 0
    @game_over = false
    @seq = []
  end

  def play
    until game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    #debugger
    show_sequence
    system("clear")
    sleep(1)
    require_sequence
    system("clear")
    unless game_over
      round_success_message
      sleep(2)
      system("clear")
    end

  end

  def show_sequence
    add_random_color
    @sequence_length.times do |seq_idx|
      p @seq[seq_idx]
      sleep(0.75)
      system("clear")
      p '############'
      sleep(0.1)
      system("clear")
    end

  end

  def require_sequence
    idx = 0
    until idx >= @sequence_length
      #debugger
      input = get_input
      system("clear")
      if input != @seq[idx]
        @game_over = true
      end
      break if game_over
      idx += 1
    end
  end

  def get_input
    p 'your turn!'
    input = ""
    valid_input = %w(red green yellow blue)
    until valid_input.include?(input)
      input = gets.chomp
      puts 'invalid input' unless valid_input.include?(input)
    end
    input
  end

  def add_random_color
    @seq.push(COLORS.sample)
    @sequence_length += 1
  end

  def round_success_message
    p 'nice job!'
  end

  def game_over_message
    p "game over!  final score #{@sequence_length}"
  end

  def reset_game
    @seq = []
    @sequence_length = 0
    @game_over = false

  end
end

if $PROGRAM_NAME == __FILE__
  p 'playing simon...'
  s = Simon.new
  s.play
end
