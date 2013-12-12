#Cepstral Peak Promience Measurement Automation 

This is automation of running CPPS.exe to measure for all of the segmented .WAV files in a directory

For more information on CPPS: http://homepages.wmich.edu/~hillenbr/

CPPS.exe is a Windows only file, so if want to run this Rebol script, you will have to do it on Windows.  Also the file pathnames in this are for MY computer specifically, so if you did want to learn how to run them, you need to adjust the file paths accordingly.  This is easily done by modifying the files names at the top of the scripts

1.  CPPS-clear.r -- This script deletes all the .f0c .fc .wr files that CPPS.exe generates when it analyzes a .WAV file.  I am not actually sure if this step is necessary, but it makes things clean, and I like that.

2.  CPPS-all.r -- This script looks and finds all the .WAV files in the 'segmented' folder and does a system call of  "CPPS.exe file.WAV" in the command prompt.  This generates all the .f0c .fc .wr files.  

Afterwards, this script looks in the 'segmented' folder and loads each .f0c file that has the calculations from CPPS.exe.   It only pulls the data in the last column which is the CPP value.   It calculates the mean of all the CPP measurements and outputs a tab delimited text file (all-cpp-data.txt) with a structure like this:

    filename	CPP-mean
    NB1_aMha.f0c	15.7713333333333
