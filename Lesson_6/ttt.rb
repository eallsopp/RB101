require 'pry'
require 'yaml'
MESSAGE = YAML.load_file('tictactoe.yml')

INITIAL_MARKER =  ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                  [[2, 5, 8], [1, 4, 7], [3, 6, 9]] +
                  [[1, 5, 9], [3, 5, 7]]
WHO_GOES_FIRST = ['player', 'computer']

def prompt(msg)
  puts "=> #{msg}"
end

def clear
  system "clear"
end

# rubocop:disable Metrics/MethodLength, Metrics/Abcsize
def display_board(brd)
  prompt "Player is #{PLAYER_MARKER}.  Computer is #{COMPUTER_MARKER}"
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

def who_goes_first
  prompt "Who would you like to go first?"
  loop do 
    prompt "Press 1 for: player. Press 2 for: computer.  Press 3 for either."
    choice = gets.chomp.to_i
    return 'player' if choice == 1
    return 'computer' if choice == 2
    return [WHO_GOES_FIRST[0], WHO_GOES_FIRST[1]].sample if choice == 3
    prompt "That is an invalid choice. Please choose a 1, 2 or 3."
   end
end

def choose_who_goes_first
  loop do
    prompt "Would you like to choose who moves first? (Y/N?)"
    input = gets.chomp.upcase
    if input == "Y" || input == "N"
      break
    else
      prompt "Sorry, please type Y for Yes, or N for No."
    end
  end
end


def default_player(player)
=begin
P:
Create a way for WHOGOESFIRST = 'Choose' will give the optio for the user to choose = nil or choose player/computer
D
input - a local variable for the method definiiton that will yield a choice either yes or no
  output
    if the input is yes then initiate who goes first
  else
    default_playe

would you like to choose who goes first?  y/n?
input = gets.chomp
  if input == y
    who_goes_first
  else
    choice
=end
end

def alternate_player(current_player)
  if current_player == 'player'
    'computer'
  else
    'player'
  end
end

def place_piece!(board, current_player)
  if current_player == 'player'
    player_places_piece!(board)
  else
    computer_places_piece!(board)
  end
end

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
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def victory_achieved(board)
  if someone_won?(board)
    return prompt "#{detect_winner(board)} won!"
  else
    prompt 'It\'s a tie!!'
  end
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

def score_count(board, score)
  if detect_winner(board) == 'Player'
    score[:player] += 1
  elsif detect_winner(board) == 'Computer'
    score[:computer] += 1 
  else
    0
  end
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

def display_scoreboard(score)
  output = "-" * 22
  puts output
  puts 'Score of Match'.center(22)
  puts "Player: #{score[:player]} Computer: #{score[:computer]}"
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

prompt(MESSAGE['welcome'])
loop do  # do you want to play again loop
  
  score = { player: 0, computer: 0}
  current_player = nil
  
  loop do # match play loop
    board = initialize_board 
    current_player = who_goes_first
    
    # take turns loop
    loop do
      clear
      display_board(board)
      display_scoreboard(score)
      place_piece!(board, current_player)
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end

    display_board(board)
    victory_achieved(board)
    
    sleep(1.75)
    
    score_count(board, score)
    display_scoreboard(score)
    sleep(1.75)
    break if score[:player] == 5 || score[:computer] == 5
  end
  
  break unless play_again?
end

prompt 'Thanks for playing Ruby Tic Tac Toe!'
prompt 'Goodbye.'
