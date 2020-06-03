
require 'pry'

def prompt(message)
  puts "=> #{message}"
end

def initialize_deck
  deck = []
  %w(2 3 4 5 6 7 8 9 10 J Q K A).each do |value|
    %w(S C H D).each do |suit|
      deck << [suit, value]
    end
  end
  deck
end

def deal(deck, hand)
  card = deck.sample
  deck.delete(card)
  hand << card
end

def total(cards)
  values = cards.map { |card| card[1] } # transforms the array containing cards

  sum = 0
  values.each do |value| # iterates over new transformed array to add values
    if value == 'A'
      sum += 11
    elsif value.to_i.zero?
      sum += 10
    else
      sum += value.to_i
    end
  end

  values.select { |value| value == 'A' }.count.times do
    sum -= 10 if sum > 21
  end

  sum
end

def initial_deal(deck, player_hand, dealer_hand)
  deal(deck, player_hand)
  deal(deck, dealer_hand)
  deal(deck, player_hand)
  deal(deck, dealer_hand) # extract to an alternate hands method
end

def display_hands(player_hand, dealer_hand)
  prompt("You've got a #{player_hand[0][1]} and a #{player_hand[1][1]}.")
  prompt("Dealer shows a #{dealer_hand[1][1]} and an Unknown card.")
end

def busted?(hand)
  hand > 21
end

def result_of_game(player_total, dealer_total)
  
  if player_total > 21
    :player_busts
  elsif dealer_total > 21
    :dealer_busts
  elsif dealer_total < player_total
    :player_wins
  elsif player_total < dealer_total
    :dealer_wins
  else
    :tie
  end
end

def display_result(player_total, dealer_total)
  results = result_of_game(player_total, dealer_total)
  case results
  when :player_busts
    prompt('You busted!  Dealer wins!')
  when :dealer_busts
    prompt('Dealer busts!  You win!')
  when :player_wins
    prompt('Player wins!')
  when :dealer_wins
    prompt('Dealer wins!')
  when :tie
    prompt('It is a tie!  Dealer wins on a tie.')
  end
end

def blackjack(player_hand, dealer_hand)
  if total(player_hand) == 21
    prompt 'Player has a blackjack!  Player wins!'
    true
  elsif total(dealer_hand) == 21
    prompt 'Dealer has a blackjack.  Dealer wins!'
    true
  end
end

def dealer_outcomes(dealer_total)
  if dealer_total >= 17 && dealer_total <= 21
    :dealer_stays
  elsif dealer_total <= 16
    :dealer_hits
  else
    busted?(dealer_total)
  end
end

def dealer_messages(dealer_total, deck, dealer_hand)
  messages = dealer_outcomes(dealer_total)
  case messages
  when :dealer_stays
    prompt('Dealer stays.')
    
  when :dealer_hits
    deal(deck, dealer_hand)
    prompt("Dealer cards are now #{dealer_hand}.")
  end
end

def replay?
  answer = nil
  loop do
    prompt 'Would you like to play another hand? (y)es or (n)o?'
    answer = gets.chomp
    break if %w(y n).include?(answer)
    prompt('Sorry, that is an invalid response.  Type "y" for yes, "n" for no.')
  end

  if answer == 'y'
    true
  else
    false
  end
end

loop do
  player_hand = []
  dealer_hand = []
  deck = initialize_deck
  initial_deal(deck, player_hand, dealer_hand)
  display_hands(player_hand, dealer_hand)
  player_total = total(player_hand)
  dealer_total = total(dealer_hand)

  unless blackjack(player_hand, dealer_hand)
    loop do
      answer = nil

      loop do # looping structure for the player hitting
        player_total = total(player_hand)
        prompt('Player:')
        prompt("Your total is #{player_total}.")
        prompt('Would you like to (h)it or (s)tay?')
        answer = gets.chomp
        break if %w(h s).include?(answer) || busted?(player_total)
        prompt 'Sorry, that is an invalid answer.'
      end

      if answer == 'h'
        deal(deck, player_hand)
        prompt("Your cards are now #{player_hand}.")
      end
      
      player_total = total(player_hand)
      break if answer == 's' || busted?(player_total)
    end

    unless busted?(player_total) 
      prompt("OK, you stay at #{player_total}.")
      prompt('Dealer hits on 16 and below, stays on 17 and above.')
      sleep(1)
      loop do # begins dealer loop
        dealer_total = total(dealer_hand)
        prompt("The dealer has #{dealer_total}.")
        sleep(1)
        
        dealer_messages(dealer_total, deck, dealer_hand)
        break if busted?(dealer_total) || dealer_total >= 17
      end
    
      prompt("Player has #{player_total} and Dealer has #{dealer_total}.")

      result_of_game(player_total, dealer_total)
      sleep(1)
      display_result(player_total, dealer_total)
      sleep(1)
    end
  end
  if busted?(player_total)
    prompt("Your total is #{player_total}.")
    display_result(player_total, dealer_total)
  end
  break unless replay?
end
