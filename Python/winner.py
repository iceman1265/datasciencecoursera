#Write a program to read through the mbox-short.txt and figure out the distribution 
#by hour of the day for each of the messages. You can pull the hour out from the "From" line
#by finding the time and then splitting the string a second time using a colon. 
#example: 'From stephen.marquard@uct.ac.za Sat Jan 5 09:14:16 2008'
#once you have acumlated the counts for each hour, print out the counts, sorted by hour.


name = raw_input("Enter file:")
if len(name) < 1 : name = "mbox-short.txt"
handle = open(name)
counts = dict()

for line in handle:
	wds = line.split()
	if len(wds) < 5 : continue
	if wds[0] != "From" : continue
	now = wds[5]
	awesome = now.split(":")
	if len(awesome) != 3 : continue
	hours = awesome[0]
	counts[hours]=counts.get(hours,0)+1

lst = counts.items()
lst.sort()

for key, val in lst:
	print key,val



