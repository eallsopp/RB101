VALID_CHOICES = %w(rock paper scissors)

def prompt(message)
  Kernel.puts(">> #{message}")
end

def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
  (first == 'scissors' && second == 'paper') ||
  (first == 'paper' && second == 'rock')
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

loop do
  player = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    player = Kernel.gets.chomp
    if VALID_CHOICES.include?(player)
      break
    else
      prompt("That is not a valid choice.")
    end
  end

  computer = VALID_CHOICES.sample
  prompt("You chose #{player} and computer chose #{computer}.")
  display_results(player, computer)

  prompt("Would you like to play again? (y/n)")
  continue = gets.chomp
  break unless continue.downcase.start_with?('y')
end

prompt("Thanks for playing.  Goodbye!")