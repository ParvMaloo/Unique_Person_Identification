#Reading and viewing the CSV file into RStudio
dedupli <- read.csv("Deduplication Problem - Sample Dataset.csv", stringsAsFactors = FALSE)
View(dedupli)

#A look into the data
str(dedupli)

#Deleting duplicate rows
library(dplyr)
unq <- distinct(dedupli)

#A look into new table after removing duplicated rows
View(unq)
str(unq)

#Define a new matrix whose all values are 1
new_matrix <- matrix(c(1), nrow = nrow(unq), ncol = nrow(unq))

#Now we will start the process of removing similar rows
#We will use for loop with if statement
#Duplicated rows were removed earlier so as to increase the speed of for loop
for(j in 1:nrow(unq)){
  for(i in j+1:nrow(unq)){
    if(((unq$dob[j] == unq$dob[i]) == TRUE) && (amatch(unq$fn[j], unq$fn[i], maxDist = 3, nomatch = 0) > 0) && (amatch(unq$ln[j], unq$ln[i], maxDist = 3, nomatch =0) > 0) && (unq$gn[j] == unq$gn[i]) == TRUE) new_matrix[j,i] = 0 else new_matrix = new_matrix }}

#amatch measures if the characters are close to each other, within specified distance

#Extracting the indices of '0' elements in new_matrix
x <- which(new_matrix == 0, arr.ind = TRUE)
#We need only the column values

y <- x[,2]
#There are duplicate values in it as some rows have more than 2 similar other rows
#Extracting only distinct rows
z <- y[!duplicated(y)]

#Now we know the indices of rows with similar data, we will remove them
unq <- unq[-c(z),]
#This is the table with data of unique persons

#Looking into final table
View(unq)
str(unq)
