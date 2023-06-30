param (
	$drive  = "S:",
	$top1 = "SHSFACOFF_Share",
	$top2 = "SHSFACOFF_Share_Confidential",
	$folder = "Faculty Office Administration",
	$exclude = "AH Research Ethics Committee|SLASH RC",
	[switch]$remove = $false

)

ls "$($drive)\$($top1)\$($folder)" -file -recurse |% {
	$status = ""

	$f1 = $_
	
	$dir1 = $f1.directoryname
	$file1 = $f1.name
	$size1 = $f1.length
	$date1 = $f1.lastwritetime

Write-Host "File:   $($file1)"

	if ($dir1 -match $exclude) {
		$status = "Exclude"
Write-Host "Exclude"

		$dir2 = ""
		$file2 = ""
		$size2 = ""
		$date2 = ""
	} else {
		$s2 = "$($dir1 -replace $top1,$top2)\$($file1)"

		if (test-path $s2) {
			$f2 = ls $s2

			$dir2 = $f2.directoryname
			$file2 = $f2.name
			$size2 = $f2.length
			$date2 = $f2.lastwritetime

Write-Host "Found:  $($file2)"

			if ($size1 -eq $size2 -and $date1 -eq $date2) {
				$status = "Match"
			} else {
				$status = "Change"
			}

		} else {
			# blanks
			$dir2 = ""
			$file2 = ""
			$size2 = ""
			$date2 = ""

			$status = "Keep"
		}
	}

	if ($status -eq "Match" -and $remove) {
		Write-Host "Remove: $($f1)"
		rm $f1
		$status = "Remove"
	}

	# output result object
	[pscustomobject]@{
		Status	= $status
		Dir1	= $dir1
		File1	= $file1
		Size1	= $size1
		Date1	= $date1
		Dir2	= $dir2
		File2	= $file2
		Size2	= $size2
		Date2	= $date2
	}

}
