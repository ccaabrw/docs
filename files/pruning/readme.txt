The group folder:
SHSFACOFF_Share
Was copied to a new share.

We needed to compare the files between the two shares so that duplicates could be removed.
It wasn't clear whether robocopy would be able to handle this fully, so used PowerShell instead.

========

compare_files.ps1
-----------------
Enumerates file objects in source share and looks for the smae file in target share.
If the name, date and size match then it can be removed from the source.
Two branches in the tree are to be excluded.
Default parameters are in the script.

Usage:

cd s:\shsfacoff_share
# Dry run on a subtree:
.\compyare_files.ps1 -folder "Faculty Office Administration\Archive"

# Full run
$out = .\compare_files.ps1 -remove
$out | export-csv output.csv -notypeinformation

========

Locate hidden files:

ls -hidden -recurse -file thumbs.db
ls -hidden -recurse -file ~`$*

Then remove them with:
... | ri -force

========

remove_empty_folders.ps1
------------------------
Contains recursive functions to locate and prune completely empty folders.

# Load functions to session
. .\remove_empty_folders.ps1

# Testing
remove_test "Faculty Office Administration"

# Full run
remove_empty "S:\SHSFACOFF_Share"

--------

Todo:
Generalise the remove_empty function and put in a more reusable script with better logging etc.
