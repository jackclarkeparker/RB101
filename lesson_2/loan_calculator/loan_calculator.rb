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

prompt "Hi there, welcome to Loan Calculator!"
sleep(1)

loop do
  prompt "Please enter your initial loan deposit:"

  loan = ""                      # LOAN INPUT
  loop do
    loan = gets.chomp

    if number?(loan)
      loan = loan.to_f
      break
    else
      prompt "Invalid input - Please re-enter with a positive number using "\
      "digits/decimal points only."
    end
  end

  prompt "Please enter your APR (Annual Percentage Rate):"

  apr = ""                       # APR INPUT
  loop do
    apr = gets.chomp
    apr.delete("%")

    if integer?(apr)
      apr = apr.to_f / 100
    elsif float?(apr)
      apr = apr.to_f
    else
      prompt "Invalid input - Please re-enter APR as a positive number "\
      "between 1 and 30 using digits only."
      next
    end

    if apr.between?(0.01, 0.3)
      break
    else
      prompt "Invalid input - Please re-enter with a number between 1 and 30."
    end
  end

  prompt "Please enter the duration of your loan in months:"

  months = ""                    # DURATION INPUT
  loop do
    months = gets.chomp

    if integer?(months)
      months = months.to_i
      break
    else
      prompt "Invalid input - Please re-enter loan duration as a positive "\
      "number using digits only."
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

  prompt "Would you like to make another calculation?"
  loop_again = gets.chomp

  break unless loop_again.downcase.start_with?("y")
end

prompt "Thanks for using Loan Calculator!"
