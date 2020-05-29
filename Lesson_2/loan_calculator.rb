require 'yaml'
require 'pry'
MESSAGES = YAML.load_file('loan_calculator_messages.yml')

def prompt(message)
  puts ">> #{message}"
end

def valid_whole?(loan)
  /^\d+$/.match?(loan) && loan.to_i >= 1
end

def valid_decimal?(amount)
  amount.to_f.to_s == amount  && amount.to_f > 0
end

def monthly_apr(rate)
  rate.to_f/ 100 / 12
end

def clear
  system('clear')
end

loan_amount = nil
apr = nil
months = nil

prompt(MESSAGES['welcome'])
prompt(MESSAGES["welcome2"])

loop do

  loop do
    prompt(MESSAGES['loan_amount'])
    loan_amount = gets.chomp
    break if valid_whole?(loan_amount) || valid_decimal?(loan_amount)
    prompt(MESSAGES['loan_amount_error'])
  end

  prompt"So the loan amount is $#{loan_amount}."

  loop do 
    prompt(MESSAGES['apr'])
    apr = gets.chomp
    break if valid_decimal?(apr) || valid_whole?(apr)
    prompt(MESSAGES['apr_error'])
  end
  
  prompt"Your APR is #{apr}%"
  
  loop do
    prompt(MESSAGES['duration'])
    months = gets.chomp
    break if valid_whole?(months)
    prompt(MESSAGES['duration_invalid'])
    prompt(MESSAGES['month_equation'])
  end
  
  month_interest = monthly_apr(apr)
  
  loan_amount = loan_amount.to_i

  total = loan_amount * (month_interest / 
  (1 - (1 + month_interest)**(-months.to_i))) 
  total = total.to_f.round(2)

  prompt"Your initial loan of $#{loan_amount}, at an annual rate of #{apr}% for"
  prompt"#{months} months will result in a monthly payment of $#{total}."
  
  prompt(MESSAGES['calculate_again?'])
  again = gets.chomp.upcase!
  break if again.start_with?("N")
end

prompt(MESSAGES['goodbye'])
