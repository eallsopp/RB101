require 'yaml'
MESSAGE = YAML.load_file('rpsls_messages.yml')

WINNING_COMBINATIONS = {rock: %w(scissors, lizard),
scissors: %w(lizard, paper),
paper: %w(spock, rock),
spock: %w(rock, scissors),
lizard: %w(spock, paper)}

ABBREVIATED_CHOICES = {rock: "R", scissors: "S", paper: "P", lizard: "L", spock: 'SP'}
VALID_CHOICES = %w(r p s l sp)

def prompt(message)
  Kernel.puts(">> #{message}")
end

def game_choices(pick)
  pick.each{|key, value| puts "Please put '#{value}' for #{key}"}
end

def key_choices
  ABBREVIATED_CHOICES.each {|key, value| key.to_s}
end

def convert_weapon_choice(input)
  case input
    when input = 'r' then input = "rock"
      when input = 's' then input = "scissors"
        when input = 'p' then input = "paper"
          when input = 'l' then input = "lizard"
             when input = "sp" then input = "spock"
  return input
  end
end

def win?(first, second)
  (first == 'r' && second == ('s' || 'l')) ||
    (first == 's' && second == ('p' || 'l')) ||
      (first == 'p' && second == ('r' || 'sp')) ||
        (first == 'l' && second == ('sp' || 'p')) ||
          (first == 'sp' && second == ('s' || 'r'))
end

def lose?(first, second)
  (first == 'r' && second == ('sp' || 'p')) ||
    (first == 's' && second == ('r' || 'sp')) ||
      (first == 'p' && second == ('l' || 's')) ||
        (first == 'l' && second == ('r' || 's')) ||
          (first == 'sp' && second == ('p' || 'l'))
end

def display_results(player, computer)
  if win?(player, computer) || lose?(computer, player)
    prompt(MESSAGE['player'])
  elsif win?(computer, player) || lose?(player, computer)
    prompt(MESSAGE['computer'])
  else
    prompt(MESSAGE['tie'])
  end
end

player = ''
loop do
  prompt(MESSAGE['welcome'])
  loop do
    prompt("Choose your Weapon:")
    game_choices(ABBREVIATED_CHOICES)
    player = Kernel.gets.chomp.downcase
    if VALID_CHOICES.include?(player)
      break
    else
      prompt(MESSAGE['invalid'])
    end
  end

  computer = VALID_CHOICES.sample 
  prompt("You chose #{convert_weapon_choice(player)} and computer chose #{convert_weapon_choice(computer)}.")
  
  display_results(player, computer)

  prompt(MESSAGE['play_again'])
  continue = gets.chomp
  break unless continue.downcase.start_with?('y')
end

prompt(MESSAGE['goodbye'])
