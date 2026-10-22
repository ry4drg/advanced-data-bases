import re

#open a file for read-only purposes
f = open("accidentsVelo.csv", 'r')

labels = f.readline().rstrip("\n").split(",")

#loop over each line of the input file f
for line in f:
    items = line.rstrip("\n").split(",")
    
    #num_attributes = number of attributes in this line 
    num_attributes = len(items)

    #loop over each attribute in the array items
    i = 0

    while i < num_attributes:
        #replace ' with '', for strings in postgreSQL
        item = items[i].replace("'", "''")

        print("Attribute ", i, "is: ", item)
        i = i + 1
    print("-----------------------------------------------")

    #print and wait for user to press Enter to go to the next line 
    #input("Press Enter to continue...\n\n")
