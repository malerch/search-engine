def linear(data, value):
    """Return the index of 'value' in 'data', or -1 if it does not occur"""
    i = 0
    while i < len(data) and data[i] != value:
        if data[i] > value:
            return -1
        i += 1
    if i == len(data):
        return -1
    else:
        return i

def binary(data, value):
    low = 0
    high = len(data) - 1
    while low <= high:
        median = (low + high) // 2
        if data[median] == value:
            return median
        elif data[median] < value:
            low = median + 1
        elif data[median] > value:
            high = median - 1
    return -1

def binary_pairs(data, value):
    low = 0
    high = len(data) - 1
    while low <= high:
        median = (low + high) // 2
        if data[median][0] == value:
            return median
        elif data[median][0] < value:
            low = median + 1
        elif data[median][0] > value:
            high = median - 1
    return -1