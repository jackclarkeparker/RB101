require 'yaml'
MESSAGES = YAML.load_file('loan_calculator_messages.yml')

def prompt(message)
  puts "=> #{message}"
end

def float?(num)
  (num.to_f.to_s == num) && (num.to_f > 0)
end

def integer?(num)
  (num.to_i.to_s == num) && (num.to_i > 0)
end

def number?(num)
  (float?(num)) || (integer?(num))
end

def two_dp(num)
  format("%.2f", num)
end

prompt MESSAGES["welcome"]
sleep(1)

loop do
  prompt MESSAGES['loan_prompt']

  loan = ""                      # LOAN INPUT
  loop do
    loan = gets.chomp

    if number?(loan)
      loan = loan.to_f
      break
    else
      prompt MESSAGES['invalid_loan']
    end
  end

  prompt MESSAGES['apr_prompt']
  apr = ""                       # APR INPUT
  loop do
    apr = gets.chomp
    apr.delete("%")

    if integer?(apr)
      apr = apr.to_f / 100
    elsif float?(apr)
      apr = apr.to_f
    else
      prompt MESSAGES['invalid_apr_1']
      next
    end

    if apr.between?(0.01, 0.3)
      break
    else
      prompt MESSAGES['invalid_apr_2']
    end
  end

  prompt MESSAGES['duration_prompt']

  months = ""                    # DURATION INPUT
  loop do
    months = gets.chomp

    if integer?(months)
      months = months.to_i
      break
    else
      prompt MESSAGES['invalid_duration']
    end
  end
  sleep(1)

  monthly_interest = apr / 12    # CALCULATIONS

  monthly_payment = loan *
                    (monthly_interest /
                    (1 - (1 + monthly_interest)**(-months)))

  monthly_payment = two_dp(monthly_payment)
  loan = two_dp(loan)

  prompt <<-MSG
Your monthly payment will be $#{monthly_payment}.
   Loan - $#{loan}
   APR - #{apr * 100}%
   Duration - #{months} months
  MSG
  sleep(4)

  prompt MESSAGES['another_calculation?']
  loop_again = gets.chomp

  break unless loop_again.downcase.start_with?("y")
end

prompt MESSAGES['goodbye']
