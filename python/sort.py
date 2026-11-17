import time
import util

def bubble_sort(nums: list) -> list:
    swapping = True
    end = len(nums)
    while swapping:
        swapping = False
        for i in range(1, end):
            if nums[i-1] > nums[i]:
                nums[i-1], nums[i] = nums[i], nums[i-1]
                swapping = True
        end -= 1

    return nums


def merge_sort(arr: list) -> list:
    if len(arr) <= 1:
        return arr
    mid = len(arr) // 2
    sorted_first_half = merge_sort(arr[:mid])
    sorted_second_half = merge_sort(arr[mid:])

    return merge(sorted_first_half, sorted_second_half)


def merge(first: list, second: list) -> list:
    final = []
    i, j = 0, 0
    while i < len(first) and j < len(second):
        if first[i] <= second[j]:
            final.append(first[i])
            i += 1
        else:
            final.append(second[j])
            j += 1
    final.extend(first[i:])
    final.extend(second[j:])

    return final

def merge_sort_pairs(arr: list[list]) -> list[list]:
    if len(arr) <= 1:
        return arr
    mid = len(arr) // 2
    sorted_first_half = merge_sort_pairs(arr[:mid])
    sorted_second_half = merge_sort_pairs(arr[mid:])

    return merge_pairs(sorted_first_half, sorted_second_half)


def merge_pairs(first: list[list], second: list[list]) -> list[list]:
    final = []
    i, j = 0, 0
    while i < len(first) and j < len(second):
        if first[i][0] < second[j][0] or (
            first[i][0] == second[j][0]
            and first[i][1] <= second[j][1]
        ):
            final.append(first[i])
            i += 1
        else:
            final.append(second[j])
            j += 1
    final.extend(first[i:])
    final.extend(second[j:])

    return final
