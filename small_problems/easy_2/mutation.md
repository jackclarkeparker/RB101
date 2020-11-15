array1 consists of a set of string objects as denoted in the first line of code.

In line 3, the iteration over array1 populates array2 with each object using the shovel operator. The use of the shovel is destructive, and won't lead to array2 being reassigned with a different address space in memory. array2 consists of a new set of references, but the objects in both arrays are the same, as can be seen if we call Object#object_id on corresponding elements in each array.

In line 4, the destructive call on the elements in array1 leads to mutation in both the array1 elements and the array2 elements.