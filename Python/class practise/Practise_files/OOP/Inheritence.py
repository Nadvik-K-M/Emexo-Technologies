# Base class
class Vehicle:
    def __init__(self, brand, model):
        self.brand = brand
        self.model = model

    def display_info(self):
        print(f"Brand: {self.brand}, Model: {self.model}")

# Subclass Car
class Car(Vehicle):
    def __init__(self, brand, model, doors):
        super().__init__(brand, model)  # Call parent constructor
        self.doors = doors

    def display_info(self):
        print(f"Car -> Brand: {self.brand}, Model: {self.model}, Doors: {self.doors}")

# Subclass Bike
class Bike(Vehicle):
    def __init__(self, brand, model, bike_type):
        super().__init__(brand, model)  # Call parent constructor
        self.bike_type = bike_type

    def display_info(self):
        print(f"Bike -> Brand: {self.brand}, Model: {self.model}, Type: {self.bike_type}")

# Demonstration
def main():
    car1 = Car("Toyota", "Corolla", 4)
    bike1 = Bike("Yamaha", "R15", "Sports")

    car1.display_info()
    bike1.display_info()

if __name__ == "__main__":
    main()
