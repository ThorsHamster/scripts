# random_copy

Copies mp3 files from "SOURCE" to "DESTINATION". \
All music files are randomly copied. It copies "MAXSONGS" per folder. \
A Number of "MAXFOLDERS" folders are created, each with the prefix "FOLDERNAME" and then numbered in ascending order.

Example:
```shell
FOLDERNAME="RandomMusik"
MAXSONGS=3
MAXFOLDERS=2
```

Produces:
```shell
RandomMusik0:
    -Track5
    -Track6
    -Track3
RandomMusik1:
    -Track2
    -Track1
    -Track4
```
