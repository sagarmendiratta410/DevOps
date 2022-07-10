key1 = "a/b/c"
key2 = "x/y/z"
# value = a

object1 = {

           "a": {
                  "b": {
                        "c": "d" 
                       }

               } 
}
object2 = {"x":{"y":{"z":"a"}}}

# Reading a dictionary

print("Value of Key a is ", object1.get('a'))
print("Key in dictionary ", object1.keys())
print("Value of Key a is ", object1.get('a'))
print("Value of Key a is ", object1['a'])
print("Value of Key b is ", object1['a']['b'])
print("Value of Key c is ", object1['a']['b']['c'])

print("Value of Key x is ", object2.get('x'))
print("Value of Key x is ", object2['x'])
print("Value of Key y is ", object2['x']['y'])
print("Value of Key z is ", object2['x']['y']['z'])

# Solution 1 - Approach 1

def myfunction():
  for i in object1:
     print(i)

myfunction()

# Solution 1 - Approach 2

def myfunction(object1):
  for i in object1:
     print(i)

myfunction({"a":{"b":{"c":"d"}}})

# Solution 2 - Approach 1 

print(object2[key2[0]][key2[2]][key2[4]])


