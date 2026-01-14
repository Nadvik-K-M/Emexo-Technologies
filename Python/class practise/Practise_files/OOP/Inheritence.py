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

# 2.py# Base class

class Person():

    def __init__(self,name,age):
        self.name=name
        self.age=age
    
class Student(Person):
    def __init__(self, name, age, student_id ,address):
        super().__init__(name, age)
        self.student_id=student_id
        self.address=address
    def display_details(self):
        print(f"Student Details:")
        print(f"Name: {self.name}, Age: {self.age}, Student ID: {self.student_id}, Address: {self.address}")

class Teacher(Person):
    def __init__(self, name, age , subject ,salary):
        super().__init__(name, age)
        self.subject=subject
        self.salary=salary
    def display_details(self):
        print(f"Teacher Details:")
        print(f"Name: {self.name}, Age: {self.age}, Subject: {self.subject}, Salary: {self.salary}")

if __name__ == "__main__":
    Student1 = Student("Alice", 20, "S123", "123 Main St")
    Teacher1 = Teacher("Mr. Smith", 40, "Mathematics", 50000)

Student1.display_details()
Teacher1.display_details()