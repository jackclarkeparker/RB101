In the final example given in this problem description, the program prints
"BOB" twice. 

On the second line of the program, `save_name` is assigned to `name` meaning
that they both are pointing at the same address space.

The method call on `name` on the third line of the program is destructive - the
method doesn't return a new value (in a new address space) but directly
modifies the value in the existing address space that `name` points to, which
is the same address space `save_name` points to.

On the fourth line, when the two variables `name` and `save_name` are printed,
it's the same value being printed twice.