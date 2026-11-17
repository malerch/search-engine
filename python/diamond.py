from dup import remove_dups
from ordsearch import binary_pairs
from sort import merge_sort_pairs


def make_table(pairs: list[list[str]]) -> list[list[str | list[str]]]:
    # initialise an empty table to be returned
    plain_table = []
    # sort (so binary search can be done) and remove duplicates
    sorted_pairs = remove_dups(merge_sort_pairs(pairs))

    # loop over words and filenames in the pairs
    for word, filename in sorted_pairs:
        # use binary search to get index of word in existing table
        i = binary_pairs(plain_table, word)
        # if not in table, create a new entry for the word and filename
        if i == -1:
            new_entry = [word, [filename]]
            plain_table.append(new_entry)
        # if found and filename isn't in the filename list, add it to the list
        # for that word
        elif filename not in plain_table[i][1]:
            plain_table[i][1].append(filename)

    return plain_table
