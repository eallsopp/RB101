LANGUAGE = 'en'
require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def messages(message, lang='en')
  MESSAGES[lang][message]
end

def prompt(message)
  Kernel.puts("=> #{message}")
end
def number?(number)
  integer?(number) || float?(number)
end

def integer?(num)
  num.to_i.to_s == num # this would show 0 as 0, ut edge is 00 != 0 output in end
end

def float?(input)
  input.to_f.to_s == input
end

def operation_to_message(op)
  word = case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
  x = 'random line of code'
  
  word # this allows for the case statement result to be the last line of code and return the correct value if 'x' has to be added
end

prompt(messages('welcome', LANGUAGE))

name = ''
loop do
  name = Kernel.gets.chomp
  if name.empty?
    prompt(messages('valid_name', LANGUAGE))
  else break
  end
end

prompt("Hi #{name}!") # is this an edge case?

loop do # main loop

number1 = nil
  loop do
    prompt(messages('first_number', LANGUAGE))
    number1 = Kernel.gets.chomp
    break if number?(number1)
    prompt(messages('invalid_number', LANGUAGE))
  end

number2 = nil
  loop do
    prompt(messages('second_number', LANGUAGE))
    number2 = Kernel.gets().chomp()
    break if number?(number2)
    prompt(messages('invalid_number', LANGUAGE))
  end

operator_prompt = <<-MSG
What operation would you like to perform? 
  1) add 
  2) subtract 
  3) multiply
  4) divide
  MSG
  
prompt(operator_prompt)
  
operator = nil
  loop do
    operator = Kernel.gets.chomp
    break if %w(1 2 3 4).include?(operator)
    prompt(messages('choice', LANGUAGE))
  end  
  prompt("#{operation_to_message(operator)} the two numbers...")
  result = case operator # since I validated the numbers, (test) eliminate the .to_i
           when '1'
             number1.to_i + number2.to_i
           when '2'
             number1.to_i - number2.to_i
           when '3'
             number1.to_i * number2.to_i
           when '4'
             number1.to_f / number2.to_f
           end
  prompt("The result of your operation is #{result}!")
  prompt(messages('calculate_again', LANGUAGE))
  answer = Kernel.gets.chomp
  break unless answer.downcase.start_with?('y')
  end
prompt(messages('goodbye', LANGUAGE))
