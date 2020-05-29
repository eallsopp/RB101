require 'pry'

INITIAL_MARKER =  ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                  [[2, 5, 8], [1, 4, 7], [3, 6, 9]] +
                  [[1, 5, 9], [3, 5, 7]]
WHO_GOES_FIRST = 'Choose'

def prompt(msg)
  puts "=> #{msg}"
end

def clear
  system "clear"
end

# rubocop:disable Metrics/MethodLength, Metrics/Abcsize
def display_board(brd)
  prompt "You are a #{PLAYER_MARKER} and computer is #{COMPUTER_MARKER}"
puts ''
puts '     |     |'
puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
puts '     |     |'
puts '-----+-----+-----'
puts '     |     |'
puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
puts '     |     |'
puts '-----+-----+-----'
puts '     |     |'
puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
puts '     |     |'
puts ''
end
# rubocop:enable MEtrics/MethodLength, Metrics/Abcsize

def initialize_board # this displays the original, empty board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  # each number reps a square onboad, begins empty, num reps a [new_key]
  new_board
end

def empty_squares(brd) # inspects but doesn't modify the board
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

=begin
PEDAC
  1. Create a choice for the player to have themselves or the computer go first
  1a. OR give it a random choice between the two
  2.  Make this a constant called WHO_GOES_FIRST
    This could be a hash value if it is 1, 2, 3 and 1 2 3 have values of player, computer, random
  3.  Make it so that choose is a constant that determines to see who goes first
  
E:xample
  "Who would you like to go first?"
  Input 1: for Player
  Input 2: for Computer
  Input 3: for either Player/Computer
  
D:ata
  WHO_GOES_FIRST is a constant Data STructure (an Array) that contains the values of Player and computer
    Inputs are taken at the beginning of the game
    v Input 1 is Player
      Input 2 is Computer
      Input 3 is either input 1 or input 2
  Output: 
    Determines player_chooses_square is first 
    OR
    Computer)chooses_square is first
  
A:lgorithim
  Initiate a CONSTANT: WHO_GOES_FIRST
    The constant is an array that contains 2 values, Player and Computer
    The constant is referred to from an INPUT from USER at the beginnin of the game
    The choice then relates to 
      the method definition who goes first 
        break if 1 is chosen the object in WHO_GOES_FIRST[0] will be chosen
        break if 2 is chosen the object in wGH[1] will be chosen
        break if 3 is chosen the obect in WHF.sample will be chosen at random
        Validation step if anything aside from 1-3 is chosen
          prompt "Invalid entry.  Who goes first?  1, 2 or 3?
          
  If 1 is chosen, the format of the game remains within the existing programming 
  If 2 is chosen, the format is opposite
  If 3 is chosen, 1 of the 2 above formats are randomly chosen
    The ebst way to contain this is a method definition for 
      Player1 goes first
      Player2 goes first
  
def who_goes_first?
  prompt "Who would you like to go first: "
  prompt "Press 1 for: #{WHO_GOES_FIRST[0]}, Press 2 for: #{WHO_GOES_FIRST[1]}, Press 3 for Random."
  choice = gets.chomp.to_i
  
  case choice
  when 1 
      player_places_piece!(board)
      break if someone_won?(board) || board_full?(board)

      computer_places_piece!(board)
      break if someone_won?(board) || board_full?(board)

  when 2
    loop do
      computer_places_piece!(board)
      break if someone_won?(board) || board_full?(board)

      player_places_piece!(board)
      break if someone_won?(board) || board_full?(board)
    end  
  else
    "Invalid number. Please try again. (1, 2, or 3)"
  end
end
    
  
 

=end

def who_goes_first?
  prompt "Who would you like to go first: "
  loop do 
    choice = gets.chomp.to_i
    prompt "Press 1 for: #{WHO_GOES_FIRST[0]}, Press 2 for: #{WHO_GOES_FIRST[1]}."
    return 'Player' if choice == 1
    return 'Computer' if choice == 2
    break if choice == 1 || choice == 2
    prompt "That is an invalid choice. Please choose a 1 or 2."
  end
  
  
  # within this method definition I need to contain the choice that defines the sequence to go first
  

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a position to place a piece: #{joinor(empty_squares(brd))}"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt 'Sorry, that is not a valid choice.'
  end

  brd[square] = PLAYER_MARKER # set the value of the square a player chooses
end

def computer_places_piece!(brd)
  square = nil
  WINNING_LINES.each do |line| 
    square = find_at_risk_square(line, brd, COMPUTER_MARKER)
    break if square
  end
  
  if !square
    WINNING_LINES.each do |line|
      square = find_at_risk_square(line, brd, PLAYER_MARKER)
      break if square
    end
  end
    
  if !square
    if empty_squares(brd).include?(5)
      square = 5
    end
  end
    
  if !square 
    square = empty_squares(brd).sample
  end
  
  brd[square] = COMPUTER_MARKER
end

def find_at_risk_square(line, board, marker)
  if board.values_at(*line).count(marker) == 2
    board.select {|k, v| line.include?(k) && v == INITIAL_MARKER}.keys.first
  else
    nil
  end
end

def board_full?(brd)
  empty_squares(brd) == []
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer' 
    end
  end
  nil # why do we write nil here, instead of end? the returns are manually input
end

def joinor(arr, delimiter=', ', word='or')
  case arr.size
    when 0 then ''
    when 1 then arr.first
    when 2 then arr.join(" #{word} ")
  else
    arr[-1] = "#{word} #{arr.last}"
    arr.join(delimiter)
  end
end

def display_scoreboard(total_player_wins, total_computer_wins)
  output = "-" * 22
  puts output
  puts 'Scores'.center(22)
  puts "Player: #{total_player_wins} Computer: #{total_computer_wins}"
  puts output
end
      
def play_again?
  loop do
    prompt 'Would you like to play again? (Y/N?)'
    answer = gets.chomp.downcase
    if answer.include?('yes') || answer.include?('y')
      return true
    elsif answer.include?('no') || answer.include?('n')
      return false
    else
        prompt 'Sorry, I did not catch that.  Please input Yes or No.'
    end
  end
end


loop do  # do you want to play again loop
  
  total_player_wins = 0
  total_computer_wins = 0
  
  loop do # match play loop
    board = initialize_board # keys represent a square on the board
    
    loop do # take turns loop
      clear
      display_board(board)
      display_scoreboard(total_player_wins, total_computer_wins)


# if the return value is 1, this is the right format
      player_places_piece!(board)
      break if someone_won?(board) || board_full?(board)

      computer_places_piece!(board)
      break if someone_won?(board) || board_full?(board)
    end

    display_board(board)

    if someone_won?(board)
      prompt "#{detect_winner(board)} won!"
    else
      prompt 'It\'s a tie!!'
    end

    sleep(1.75)
    
    if detect_winner(board) == 'Player'
      total_player_wins += 1
    elsif detect_winner(board) == 'Computer'
      total_computer_wins += 1
    end
    
    display_scoreboard(total_player_wins, total_computer_wins)
    break if total_player_wins == 5 || total_computer_wins == 5
  end
  
  break unless play_again?
end

prompt 'Thanks for playing Ruby Tic Tac Toe!'
prompt 'Goodbye.'
