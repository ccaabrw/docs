function remove_test ($path) {
  if ($path -match "AH Research Ethics Committee|SLASH RC") {
    write-verbose "Excluding path '${Path}'" -verbose
  } else {
    foreach ($childDirectory in Get-ChildItem -Force -LiteralPath $Path -Directory) {
        & remove_test $childDirectory.FullName
    }
    $currentChildren = Get-ChildItem -Force -LiteralPath $Path
    $isEmpty = $currentChildren -eq $null
    if ($isEmpty) {
        Write-Verbose "Found empty folder at path '${Path}'." -Verbose
        ##Remove-Item -Force -LiteralPath $Path
    }
  }
}

function remove_empty ($path) {
  if ($path -match "AH Research Ethics Committee|SLASH RC") {
    write-verbose "Excluding path '${Path}'" -verbose
  } else {
    foreach ($childDirectory in Get-ChildItem -Force -LiteralPath $Path -Directory) {
        & remove_empty $childDirectory.FullName
    }
    $currentChildren = Get-ChildItem -Force -LiteralPath $Path
    $isEmpty = $currentChildren -eq $null
    if ($isEmpty) {
        Write-Verbose "Removing empty folder at path '${Path}'." -Verbose
        Remove-Item -Force -LiteralPath $Path
    }
  }
}

# Notes:
#
# Make this an easily resuable documented function
# Add whatif functionality
# Improve logging output
# Confirm that "remove-item -force" cannot actually remove folder if it is not empty
# It requires the -recurse switch to do that

# How should we deal with hidden files?
# Common categories:
#   ~$xyz.doc
#   thumbs.db

# ls -hidden -recurse -force | ri -force

