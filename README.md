# skype_data_analyzer
R code to analyze Skype data from user-generated tab-delimited files.

skypemessages_byauthor 
	This programs assumes you have a tab delimited file of data variables: Time, Skype.Name
	This can be easily created using Skyperious.
	Skyperious link: https://suurjaak.github.io/Skyperious/

	1. export data from Skyperious
	2. copy and paste into excel, save as tab delimited
	3. import dataset 
	
call_history_plotter
	*need data frame with variables: Action.Time, User.Name, Duration
	copy data from using skypelogview - http://skypelogview.en.softonic.com/
	delete irrelevant data using excel (can be time consuming), save as tab-delimited
	import
