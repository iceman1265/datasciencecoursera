#prompt user to input a file name
name = raw_input('Enter file:')
#open the user inputted file for "read"
handle = open(name, 'r')
#read the entire file at once, blanks, new lines and all. Text is a string
text = handle.read()
#words is a list that sifts through the read file and converts it to a list by splitting character values
words = text.split()

#make an empty dictionary named counts
counts = dict()
#for loop where word variable goes through all the words in the list above
for word in words:
	#create and or increment the value in the empty dictionary as needed
	counts[word] = counts.get(word,0)+1


#a loop finding the largest word, largest being the most mentioned word
#set largest count seen thus far to none
bigcount = None
#set the largeset word seen thus far to none
bigword = None
#two iteration variable going through key value pairs, word and count in counts.items
for word,count in counts.items():
	#if largest seen thus far is None or larger than the largest seen thus far, store them in variables 
	#bigword and bigcount
	if bigcount is None or count > bigcount:
		bigword = word
		bigcount = count
#return the variables bigword and bigcount
print bigword, bigcount 