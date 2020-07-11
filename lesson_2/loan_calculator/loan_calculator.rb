# TODO:
# *** Assign summary report of loan to a key in a hash, make it available to
# compare various loans on screen at the same time.
# *** Exit loop with just yes, no, y, or n. give prompt indicating this & error
# message in case of invalid input.
# *** Make APR input only available to receive Integer? Maybe naht.

require 'yaml'
MESSAGES = YAML.load_file('loan_calculator_messages.yml')

def newline
  puts "\n"
end

def pause
  sleep(2.5)
  newline
end

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

def get_loan_amount
  loop do
    loan = gets.chomp

    if number?(loan)
      loan = loan.to_f
      break loan
    else
      prompt MESSAGES['invalid_loan']
      pause
    end
  end
end

def apr_number_check
  loop do
    apr = gets.chomp
    apr.delete("%")

    if integer?(apr)
      break apr.to_f / 100
    elsif float?(apr)
      break apr.to_f
    else
      prompt MESSAGES['invalid_apr_1']
      pause
    end
  end
end

def get_apr
  loop do
    apr = apr_number_check

    if apr.between?(0.01, 0.3)
      break apr
    else
      prompt MESSAGES['invalid_apr_2']
      pause
    end
  end
end

def get_month_duration
  loop do
    months = gets.chomp

    if integer?(months)
      months = months.to_i
      break months
    else
      prompt MESSAGES['invalid_duration']
      pause
    end
  end
end

def calculations(loan, apr, months)
  monthly_interest = apr / 12
  monthly_payment = loan *
                    (monthly_interest /
                    (1 - (1 + monthly_interest)**(-months)))
  monthly_payment = two_dp(monthly_payment)
  loan = two_dp(loan)

  _to_be_assigned = [monthly_payment, loan]
end

def display_result(monthly_payment, loan, apr, months)
  prompt <<-MSG
Your monthly payment will be $#{monthly_payment}.
   Loan - $#{loan}
   APR - #{two_dp(apr * 100)}%
   Duration - #{months} months
  MSG
  sleep(3)
end

newline
prompt MESSAGES["welcome"]                                  # BEGINNING
sleep(1)

loop do
  newline

  prompt MESSAGES['loan_prompt']
  loan = get_loan_amount                                    # LOAN INPUT
  newline

  prompt MESSAGES['apr_prompt']
  apr = get_apr                                             # APR INPUT
  newline

  prompt MESSAGES['duration_prompt']
  months = get_month_duration                               # DURATION INPUT
  newline
  sleep(1)

  monthly_payment, loan = calculations(loan, apr, months)   # CALCULATIONS
  display_result(monthly_payment, loan, apr, months)        # DISPLAY RESULT

  newline
  prompt MESSAGES['another_calculation?']                   # CALCULATE AGAIN?
  loop_again = gets.chomp
  break unless loop_again.downcase.start_with?("y")
end

prompt MESSAGES['goodbye']
newline
