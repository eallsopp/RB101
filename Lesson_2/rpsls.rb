require 'yaml'
MESSAGE = YAML.load_file('rpsls_messages.yml')

VALID_CHOICES = %w(rock paper scissors lizard spock)

WINNING_COMBINATIONS = {rock: %w(scissors, lizard),
scissors: %w(lizard, paper),
paper: %w(spock, rock),
spock: %w(rock, scissors),
lizard: %w(spock, paper)}

ABBREVIATED_CHOICES = {rock: "r", scissors: "s", paper: "p", lizard: "l", spock: 'sp'}

def prompt(message)
  Kernel.puts(">> #{message}")
end

def win?(first, second)
  (first == 'rock' && second == ('scissors' || 'lizard')) ||
    (first == 'scissors' && second == ('paper' || 'lizard')) ||
    (first == 'paper' && second == ('rock' || 'spock')) ||
    (first == 'lizard' && second == ('spock' || 'paper')) ||
    (first == 'spock' && second == ('scissors' || 'rock'))
end

def lose?(first, second)
  (first == 'rock' && second == ('spock' || 'paper')) ||
    (first == 'scissors' && second == ('rock' || 'spock')) ||
    (first == 'paper' && second == ('lizard' || 'scissors')) ||
    (first == 'lizard' && second == ('rock' || 'scissors')) ||
    (first == 'spock' && second == ('paper' || 'lizard'))
end

def display_results(player, computer)
  if win?(player, computer) || lose?(computer, player)
    prompt("You won!")
  elsif win?(computer, player) || lose?(player, computer)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

def game_choices(pick)
  ABBREVIATED_CHOICES.each.to_s {|key, value| puts "#{value} for #{key}"}
end

loop do
  player = ''
  loop do
    prompt(MESSAGE['welcome'])
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    player = Kernel.gets.chomp
    if VALID_CHOICES.include?(player)
      break
    else
      prompt(MESSAGE['invalid'])
    end
  end

  computer = VALID_CHOICES.sample
  prompt("You chose #{player} and computer chose #{computer}.")
  display_results(player, computer)

  prompt(MESSAGE['play_again'])
  continue = gets.chomp
  break unless continue.downcase.start_with?('y')
end

prompt(MESSAGE['goodbye'])
