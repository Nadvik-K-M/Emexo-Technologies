class Calculator:
    def add(self, a, b):
        return a + b

    def subtract(self, a, b):
        return a - b

    def multiply(self, a, b):
        return a * b

    def divide(self, a, b):
        if b != 0:
            return a / b
        else:
            return "Error! Division by zero."
if __name__ == "__main__":

    cal = Calculator()

    print(cal.add(5,3))
    print(cal.subtract(10,4))
    print(cal.multiply(2,6))
    print(cal.divide(8,2))
    print(cal.divide(5,0))
