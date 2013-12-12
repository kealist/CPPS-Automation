REBOL[
	; -- Core Header attributes --
	title: "CPPS Automation"
	file: %CPPS-all.r
	version: 0.0.1
	date: 2013-12-12/12:23:52
	author: "Joshua Shireman"
	purpose: "To make the running of CPPS.exe easier"
	web: https://github.com/kealist/CPPS-Automation
	source-encoding: "Windows-1252"

	; -- Licensing details  --
	copyright: "Copyright © 2013 Joshua Shireman"
	license-type: "Apache License v2.0"
	license: {Copyright © 2013 Joshua Shireman

	Licensed under the Apache License, Version 2.0 (the "License");
	you may not use this file except in compliance with the License.
	You may obtain a copy of the License at
	
		http://www.apache.org/licenses/LICENSE-2.0
	
	Unless required by applicable law or agreed to in writing, software
	distributed under the License is distributed on an "AS IS" BASIS,
	WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
	See the License for the specific language governing permissions and
	limitations under the License.}

	;-  / history
	history: {
		2013-01-01 - v0.1.0
			-creation of history.
	}
	;-  \ history

	;-  / documentation
	documentation: {
Modify the file paths to match your directories and run the Rebol script.  You can get Rebol 2 from http://www.rebol.com}
	;-  \ documentation
]


;;Select the directory that you would like to use 
wav-dir: %/C/Users/kealist/Dropbox/kellydiss/segmented/
cpps: %/C/Users/kealist/Dropbox/kellydiss/cpps.exe
average-output: %/C/Users/kealist/Dropbox/kellydiss/segmented/all-cpp-data.txt

;;; run-cpps runs CPPS.exe on each of the files with .WAV extension in the folder given as a parameter.

run-cpps: func [dir /local h files] [
	change-dir dir
	files: read %.
	foreach file files [
		if ((pick (parse file ".") 2) = "wav") [
			h: reduce [cpps file]
			print h
			call h
			wait .1
		]
	]
]

run-cpps wav-dir

average-f0c: func [dir output] [
	files: read dir
	if (exists? output) [delete output]
	write/append output reduce ["filename" tab "CPP-mean" tab newline] 
	foreach file files [
		;; This part is only working with the .f0c files!
		if ((pick (q: parse file ".") 2) = "f0c") [

			;; loads the data and breaks it into a big block!
			txt: read file
			txt: parse txt none
			;; total - this is the total of the CPP values which will be averaged later 
			;; num - this is the number of values to calculate the mean
			total: 0
			num: 0 	
			;;each line has six items.  The last is cpp, unsure what the others are.
			foreach [a b c d e cpp] txt [
				num: num + 1
				total: total + to-decimal cpp			
			]
		
			;; Calculate mean and append the data to the file 
			either (num = 0) [
				mean: "error"
			][
				mean: total / num
			] 
			write/append output reduce [file tab mean newline]
			print reduce [(pick q 1) "    "  mean]
		]
	]
]

average-f0c wav-dir average-output

alert "done!"

halt