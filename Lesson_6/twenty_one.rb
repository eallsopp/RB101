
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
  total(hand) > 21
end

def result_of_game(player_cards, dealer_cards)
  player_total = total(player_cards)
  dealer_total = total(dealer_cards)

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

def display_result(player_cards, dealer_cards)
  results = result_of_game(player_cards, dealer_cards)
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

    unless blackjack(player_hand, dealer_hand)
      loop do
        loop do
          answer = nil

          loop do # looping structure for the player hitting
            prompt('Player:')
            prompt("Your total is #{total(player_hand)}.")
            prompt('Would you like to (h)it or (s)tay?')
            answer = gets.chomp
            break if %w(h s).include?(answer) || busted?(player_hand)
            prompt 'Sorry, that is an invalid answer.'
          end

          if answer == 'h'
            deal(deck, player_hand)
            prompt("Your cards are now #{player_hand}.")
          end

          break if answer == 's' || busted?(player_hand)
        end

        unless busted?(player_hand)
          prompt("OK, you stay at #{total(player_hand)}.")
          prompt('Dealer hits on 16 and below, stays on 17 and above.')
          loop do
            prompt("The dealer has #{total(dealer_hand)}.")
            sleep(1)

            if total(dealer_hand) >= 17 && total(dealer_hand) <= 21
              prompt('Dealer stays.')
              sleep(1)
              break
            elsif total(dealer_hand) <= 16
              deal(deck, dealer_hand)
              prompt "Dealer's cards are now #{dealer_hand}."
              sleep(1)
            else
              busted?(dealer_hand)
              break
            end
          end

        prompt("Player has #{total(player_hand)} and Dealer has #{total(dealer_hand)}.")
        end

        result_of_game(player_hand, dealer_hand)
        display_result(player_hand, dealer_hand)
        break
      end
    end
  break unless replay?
end
