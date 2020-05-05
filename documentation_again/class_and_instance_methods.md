File::path is a class method, which means that it is called on the class.
File#path is an instance method, which means that it is called on a given
instance of the class.

I don't understand the significance of these methods, they seem to return
the string which is given to them, but if you enter the same string and leave
out the method, the same string is returned. What do functionality do these
methods add?