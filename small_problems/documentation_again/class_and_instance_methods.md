File::path is a class method, which means that it is called on the class.
File#path is an instance method, which means that it is called on a given
instance of the class.

I don't understand the significance of these methods, they seem to return
the string which is given to them, but if you enter the same string and leave
out the method, the same string is returned. What functionality do these
methods introduce?

## POST-SOLUTION
A couple pieces of additional functionality for File#path seem to be:
1. Returns an error if calling a path that doesn't exist:
Errno::ENOENT (No such file or directory @ rb_sysopen - /Userss/)

2. Can be called on an instance of the File after it has been assigned to a 
variable.
```ruby
documents = File.new("/user/documents")
documents.path #=> "/user/documents"
```