import math

# Define the output file
output_file = "integration_results.txt"

# Define the function f(e, x)
def f(e, x):
    t = 1.0
    argument = (4.0 * (t**2) * (math.sin(x))**2 - (e**2) - (4 * t * e * math.cos(x)))
    if argument <= 0:  # Handle invalid arguments for sqrt
        return 0.0  # Return 0 or handle appropriately
    denominator = math.sqrt(argument)
    return 1 / denominator

# Trapezoidal rule for numerical integration
def trapezoidal_rule(e, lower, upper, n=100000):
    h = (upper - lower) / n
    total = 0.5 * (f(e, lower) + f(e, upper))  # Add the endpoints

    for i in range(1, n):
        total += f(e, lower + i * h)  # Add the intermediate points

    return total * h

# Data: e, lower, upper, upper_2, lower_2
data = [
    (-3.99000001, 0.100041494, 0.00000000, 6.28318548, 6.18314409),
    (-3.97000003, 0.173421800, 0.00000000, 6.28318548, 6.10976362),
    (-3.95000005, 0.224075109, 0.00000000, 6.28318548, 6.05911016),
    (-3.93000007, 0.265352517, 0.00000000, 6.28318548, 6.01783276),
    (-3.86000013, 0.376383096, 0.00000000, 6.28318548, 5.90680218),
    (-3.76000023, 0.494933873, 0.00000000, 6.28318548, 5.78825140),
    (-3.73000026, 0.525645494, 0.00000000, 6.28318548, 5.75753975),
    (-3.34000063, 0.836587191, 0.00000000, 6.28318548, 5.44659805),
    (-3.18000078, 0.939737082, 0.00000000, 6.28318548, 5.34344864),
    (-2.95000100, 1.07583165, 0.00000000, 6.28318548, 5.20735359),
    (-1.42000246, 1.86502194, 0.00000000, 6.28318548, 4.41816330),
    (-0.800003052, 2.21429563, 0.00000000, 6.28318548, 4.06888962),
    (-0.170003533, 2.72630000, 0.00000000, 6.28318548, 3.55688548),
    (-3.53157520E-06, 3.13974071, 0.00000000, 6.28318548, 3.14344478)
]

# Perform integration for each (e, lower, upper, upper_2, lower_2)
results = []
for e, lower, _, upper_2, lower_2 in data:
    # Integrate over the first segment (lower to upper)
    integral_1 = trapezoidal_rule(e, lower, upper_2)
    
    # Integrate over the second segment (lower_2 to upper_2)
    integral_2 = trapezoidal_rule(e, lower_2, upper_2)
    
    # Total integral
    total_integral = integral_1 + integral_2
    
    # Append the result
    results.append((e, total_integral))

# Open the file in write mode and write the results
with open(output_file, "w") as file:
    # Write the header
    file.write("e,total_integral\n")
    
    # Write each result
    for e, total_integral in results:
        file.write(f"{e:.8f},{total_integral:.8f}\n")

print(f"Integration results have been written to {output_file}")