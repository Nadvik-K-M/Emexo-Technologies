class Aninmal:
    def make_sound(self):
        pass

class Dog(Aninmal):
    def make_soud(self):
        return "Bark!"
class Cat(Aninmal):
    def make_sound(self):
        return "Meow!"
    
class cow(Aninmal):
    def make_sound(self):
        return "Ambaa"
def main():

    Aninmal = [Dog(), Cat(), cow()]
    for animal in Aninmal:
        print(animal.make_sound())
if __name__ == "__main__":
    main()
