=begin

Terms:

  * Stack
    - First in, Last out/Last in, First out.
    - Use only push or pop type operations
    - Can be implemented in ruby as an array that only uses #push or #pop

  * Register
    - Current Value
    - Is not part of the stack

  * MULT
    - multiplies the stack value with the register value
    - Removes value from stack, stores back in register.
    -

Aim:

Write a method that implements a miniature stack-and-register-based programming
language that has the following commands:

n Place a value n in the "register". Do not modify the stack.

PUSH Push the register value on to the stack. Leave the value in the register.

ADD Pops a value from the stack and adds it to the register value, storing the
result in the register.

SUB Pops a value from the stack and subtracts it from the register value,
storing the result in the register.

MULT Pops a value from the stack and multiplies it by the register value,
storing the result in the register.

DIV Pops a value from the stack and divides it into the register value,
storing the integer result in the register.

MOD Pops a value from the stack and divides it into the register value,
storing the integer remainder of the division in the register.

POP Remove the topmost item from the stack and place in register

PRINT Print the register value

Questions:
  - Should the register/stack have any starting values?
  A~ register initialized with a value of 0
  - Does the stack store all of it's values for multiple operations across
    different method calls?
  A~ No, every time you call the method, the stack and register are reset.
  - Does the user supply input?

Rules
### EXPLICIT:
    - Input: String
    * One of the following commands (as a string):
      - PUSH
      * current value pushed to stack, value stay in register
      - ADD
      - SUB
      - MULT
      - DIV
      - MOD
      - POP
      - PRINT
      - n
      * place a value n in the register
    - Output: 
    * 
    - Only integer operations
    - Programs(Commands) supplied via string argument
    - Programs won't try to do broken things.
      - Won't try to POP when the the stack is empty.

### IMPLICIT:
    - Programs always consist of all caps chars (unless the program is n)
    - Programs are listed in a single string, they are single whitespace
      delimited.
    - Trailing space shouldn't cause problems in program string
      - (At least not with the PRINT program)
    - 

Examples:

minilang('PRINT')
# 0
Register initialized as 0

minilang('5 PUSH 3 MULT PRINT')
# 15


minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8

minilang('5 PUSH POP PRINT')
# 5
Popped values are stored back into the register

minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4
# 7

minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# 6

minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# 12

minilang('-3 PUSH 5 SUB PRINT')
# 8

minilang('6 PUSH')
# (nothing printed; no PRINT commands)


Data Structure:
  - We'll have a string of whitespace delimited program-commands
  - We can separate them into an array of commmands
  - Use a conditional to determine what command to perform depending on the value
    of a given program

Algorithm
  1. Initialize the stack as an empty array
  2. Initialize the register with a value of 0
  3. split the program sequence into separate programs
  4. iterate through each program, performing operations on the stack and
     register depending on the value of the program.
     - 
  5. 

ISSUES:

How do I modify the stack, and particularly the register when I'm using my
execute_program method?
  - The register is an integer, it can't be modified, only reassigned.
    - If I use a separate method to find the new register/stack values, I'll
      at the very least need to reassign the register, perhaps the stack as well.
      - It could be called new_values
  - Maybe each program has it's own method, and the conditional is written in
    the main method.

=end

require 'pry'

def minilang(program_string)
  stack = []
  register = 0
  program_sequence = program_string.split

  program_sequence.each do |program|
    register = execute_programs(register, program, stack)
  end
end

def execute_programs(register, program, stack)
  case
  when numeric_string?(program) then program.to_i
  when program == 'PUSH'
    stack << register
    register
  when program == 'ADD'   then register + stack.pop
  when program == 'SUB'   then register - stack.pop
  when program == 'MULT'  then register * stack.pop
  when program == 'DIV'   then register / stack.pop
  when program == 'MOD'   then register % stack.pop
  when program == 'POP'   then stack.pop
  when program == 'PRINT' then p register
  end
end

def numeric_string?(string)
  string.to_i.to_s == string
end

minilang('PRINT')
# 0

minilang('5 PUSH 3 MULT PRINT')
# 15


minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8

minilang('5 PUSH POP PRINT')
# 5

minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4
# 7

minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# 6

minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# 12

minilang('-3 PUSH 5 SUB PRINT')
# 8


=begin

___Lingering Questions___
  1. 
  2. 
  3. 

# POST-SOLUTION

___First thoughts___
  - GRRRRRR I was tring to figure out for the longest time why my case statement
    wasn't evaluating the integer clause. I finally realised it's because I had
    specified a `program` case which means that essentially each when statement
    implicitly provides the conditional format of program ==
    - My work around was to use a case without any specified case.
    - LS worked around this by leaving the integer clause as an else clause.
  - 
  - 
  - 

___Mental Model Modifications___
  - If you are outlining multiple conditional outcomes and one involves a
    different styling of the condition, you can still use a case statement by
    simply leaving this thorny condition as an else clause.
  - 

# FURTHER EXPLORATION

Aim:



Questions:
  - 
  - 
  - 
  - 

  Rules
    - Input: 
    * 
    - Output: 
    * 
    - 
    - 
    - 

Examples:



Algorithm
  1. 
  2. 
  3. 
  4. 
  5. 

=end


