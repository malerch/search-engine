# TCS Module 1 Software Diamond
───────────────────────────────────────────────
Search Engine assignment
───────────────────────────────────────────────

By Maximilian Lerch and Boaz Vos

## Imperative
- Question 7.1 (Mandatory) implemented

### Tests
- Imported the following text files from resources: "bear.txt" "brian.txt"
"catstory.txt" "enlightenment.txt" "eyre.txt" "grail.txt" "hacktest.txt"
"imbecile.txt" "manager.txt" "metamorphosis.txt" "oxymoron.txt" "ramen.txt"
"roll.txt"

>>> import google.py

- Then checked a variety of words

Search term: bear
expected output: 'bear' occurs in ['brian.txt', 'eyre.txt', 'metamorphosis.txt']
output: 'bear' occurs in ['brian.txt', 'eyre.txt', 'metamorphosis.txt']

Search term: Ramen
expected output: 'Ramen' occurs in ['ramen.txt']
output: 'Ramen' occurs in ['ramen.txt']

Search term: Albanese
expected output: 'Albanese' occurs in ['bear.txt']
output: 'Albanese' occurs in ['bear.txt']

Search term: Python
expected output: 'Python' occurs in ['brian.txt', 'grail.txt']
output: 'Python' occurs in ['brian.txt']

!!We debugged and found that it's a bug in util.words which was provided for us.
It doesn't return Python as a word in grail.txt. It might have something to do
with  "Monty Python and the Holy Grail" being in quotations. So it is not a bug
in our code, but grail.txt might not be fully compatible with util.words.!!

Search term: python
expected output: 'python' does not occur
output: 'python' does not occur

Search term: Niagara
expected output: 'Niagara' occurs in ['catstory.txt']
output: 'Niagara' occurs in ['catstory.txt']

Search term: the
expected output: 'the' occurs in ['bear.txt', 'brian.txt', 'catstory.txt',
'enlightenment.txt', 'eyre.txt', 'grail.txt', 'hacktest.txt', 'imbecile.txt',
'manager.txt', 'metamorphosis.txt', 'ramen.txt', 'roll.txt']
output: 'the' occurs in ['bear.txt', 'brian.txt', 'catstory.txt',
'enlightenment.txt', 'eyre.txt', 'grail.txt', 'hacktest.txt', 'imbecile.txt',
'manager.txt', 'metamorphosis.txt', 'ramen.txt', 'roll.txt']


## Functional
- Question 7.3 (Mandatory) implemented

### Tests
- Imported the following text files from resources:

ghci> :main "bear.txt" "brian.txt" "catstory.txt" "enlightenment.txt" "eyre.txt"
"grail.txt" "hacktest.txt" "imbecile.txt" "manager.txt" "metamorphosis.txt"
"oxymoron.txt" "ramen.txt" "roll.txt"

- Then checked a variety of words

Search term: bear
expected output: ["brian.txt","eyre.txt","metamorphosis.txt"]
output: ["brian.txt","eyre.txt","metamorphosis.txt"]

Search term: Ramen
expected output: ["ramen.txt"]
output: ["ramen.txt"]

Search term: Albanese
expected output: ["bear.txt"]
output: ["bear.txt"]

Search term: Python
expected output: ["brian.txt","grail.txt"]
output: ["brian.txt","grail.txt"]

Search term: python
expected output: []
output: []

Search term: Niagara
expected output: ["catstory.txt"]
output: ["catstory.txt"]

Search term: the
expected output: ["bear.txt","brian.txt","catstory.txt","enlightenment.txt",
"eyre.txt","grail.txt","hacktest.txt","imbecile.txt","manager.txt",
"metamorphosis.txt","ramen.txt","roll.txt"]
output:["bear.txt","brian.txt","catstory.txt","enlightenment.txt","eyre.txt",
"grail.txt","hacktest.txt","imbecile.txt","manager.txt","metamorphosis.txt",
"ramen.txt","roll.txt"]
