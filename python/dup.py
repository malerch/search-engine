from sort import merge_sort


def remove_dups(data: list) -> list:
    res = []
    if len(data) > 0:
        fresh = data[0]
        i = 1
        while i < len(data):
            if data[i] != fresh:
                res.append(fresh)
                fresh = data[i]
            i += 1
        res.append(fresh)
    return res

def diff_words(data: list) -> int:
    return len(remove_dups(merge_sort(data)))
