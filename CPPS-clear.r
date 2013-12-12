REBOL[
	; -- Core Header attributes --
	title: "CPPS File Cleanup"
	file: %CPPS-clear.r
	version: 0.0.1
	date: 2013-12-12/12:27:01
	author: "Joshua Shireman"
	purpose: {Cleans the CPPS.exe generated files in a particular directory}
	web: http://www.github.com/kealist
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
		User documentation goes here
	}
	;-  \ documentation
]


;;Select the directory that you would like to use 
wav-dir: %/C/Users/kealist/Dropbox/kellydiss/segmented/

change-dir wav-dir
files: read %. 

foreach file files [
	ext: pick (parse file ".") 2
	if any [
		ext = "f0c"
		ext = "wr"
		ext = "fc"	  
	][
		print reduce ["Deleted:  " file]
		delete file
	]	
]

print "Done!"

halt