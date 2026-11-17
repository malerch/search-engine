def linear(data, value) -> int | str:
    """Return the index of 'value' in 'data', or -1 if it does not occur"""
    i = len(data) - 1
    while i >= 0 and data[i] != value:
        i = i - 1
    if i == -1:
        return -1
    else:
        return i
