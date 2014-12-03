#Write a program to read through the mbox-short.txt and figure out who has sent the greatest number of 
#mail messages. The program looks for the 'From' lines and takes the second word of those lines as the person
#who sent the mail. The program creates a Python dictionary that maps the sender's mail address to a count
#of the number of times they appear in the file. After the dictionary is produced, the program reads through
#the dictionary using a maximum loop to find the most prolific committer. 


#user inputs the file name 
name = raw_input("Enter a file:")
#error check, if file name not entered, use default file
if len(name) < 1 : name = "mbox-short.txt"
#open the file 
text=open(name)
#fire up an empty dictionary
counts = dict()
#for loop reading through each line of the file
for line in text:
	#splitting each line of the text into characters
	email = line.split()
	#searching for specific lines within the text, in this case emails 
	if len(email) < 2 : continue
	#collecting the email lines
	if email[0] != "From" :continue
	#storing only the information that is wanted, in this case the specific user addresses
	data = email[1]
	#storing these files in the dictionary above, counting the number of times they are seen
	counts[data] = counts.get(data,0)+1
#creating variables to find the most frequented sender address
bigcount = None
bigword = None

#looping through the stored data locating the most freqneted addresses, storing them and counting them
for data,count in counts.items():
	if bigcount is None or count > bigcount:
		bigword = data
		bigcount = count
#print the results
print bigword, bigcount




