def decorator_name(func):
    def wrapper():
        print("Before calling the function")
        func()
        print("After calling the function")
    return wrapper

@decorator_name  # Decorator applied here
def say_hello():
    print("Hello every one!")
say_hello()


# 2.py
import time
from functools import wraps
def time_it(func):
    @wraps(func)
    def wrapper(*args , **kwrgs):
        start_time = time.time()
        result = func(*args , **kwrgs)
        end_time = time.time()
        print(f"function {func.__name__} took {end_time - start_time} seconds to execute")
        return result
    return wrapper

@time_it
def compute_time():
    time.sleep(2)
    print("Computation complete!")


if __name__ == "__main__":
    compute_time()
   