require 'yaml'
MESSAGES = YAML.load_file('loan_calculator_messages.yml')

def prompt(message)
  puts ">> #{message}"
end

def retrieve_input(input_type, valid_input)
  input = nil
  loop do
    prompt(MESSAGES[input_type])
    input = gets.chomp
    break if valid_input?(input)
    prompt(MESSAGES["#{input_type}_invalid"])
  end
  input
end

def valid_input?(input)
  /^\d+$/.match?(input)
end

def valid_decimal?(amount)
  amount.to_f.to_s == amount  && amount >= 0
end

def monthly_apr(rate)
  rate.to_f/ 100 / 12
end

loan_amount = nil
apr = nil
months = nil

prompt(MESSAGES['welcome'])
prompt(MESSAGES["welcome2"])


retrieve_input(loan_amount, valid_input?(loan_amount))

prompt(MESSAGES['total_loan_amount']

retrieve_input(apr, valid_apr?(amount))

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