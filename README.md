# Unique_Person_Identification

Steps to start with the script:
1) You need RStudio in order to run the script
2) Select the directory where the data sheet is located
3) If name of the data sheet is different then change it's name by writing in read.csv command
4) You may need to install package 'dplyr'(if not already installed)
5) Now run the complete script to get the desired answer

What do the specific part do?
1) 'distinct' command from 'dplyr' package removes all the duplicates rows, it is done to shorten the data for further steps
2) A new matrix is defined which we will use for below steps. It stores the information corresponding to similar rows, which we need to remove
3) Now by running if statement in for loop, we measure whether a selected row is similar to any of the rest rows and if they are found similar then corresponding cell in new matrix gets it value changed from '1' to '0'
4) Running this for all rows, we finally know which pair of rows are similar by looking into '0' value in new matrix
5) Extract the column indes corresponding to '0' in new matrix and remove duplicated values from it as some columns are similar to more than one row
6) Remove these rows from the table to get unique person table

You can run any dataset on this script, all you have to do is just change the name of the file in 'read.csv' command

Author: Parv Maloo
