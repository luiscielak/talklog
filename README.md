#About
talkLog is an interface to analyze phone-call activity over a period of time.
Each call is represented by a bubble. Green bubbles represent incoming calls, while purple bubbles depict outgoing calls. The size of each bubble conveys the duration of each call ― the bigger the bubble, the longer the call.

##interaction
The user has the ability to interact with the dataset by using the keyboard's arrow keys to toggle through different sorting modes. Each key applies a different sorting function to which the bubbles react by shifting their position in the screen representing a different facet of the data.

The different filter modes can map the bubble's x-axis based on the call's month or set the bubble's y-axis location to the call's time, from 0hrs to 23hrs. Also, the positions of the bubbles can be placed in two different columns; incoming and outgoing.

##data+process
The data is first downloaded from the carrier's website as a CSV file and loaded into the system. Once loaded, the data gets parsed and each record is turned into a bubble object which is rendered to the screen.

#How-To
Toggle through the different filter presents using the keyboard arrows.
		
		UP: 			sort by time of the day (0 hrs to 23 hrs)
		
		RIGHT:			sort by month (Jan to Dec)

		LEFT:			sort by incoming (green) and outgoing (purple)

		SPACE BAR:		reset to original view

		S or s:			save frame as .png

#Output

**sort by time of the day (0 hrs to 23 hrs)**
![sort by time of the day](https://raw.github.com/luiscielak/talklog/master/121025_032658_238.png)

**sort by incoming (green) and outgoing (purple)**
![sort by incoming and outgoing](https://raw.github.com/luiscielak/talklog/master/121025_032149_358.png)

**sort by month (Jan to Dec)**
![sort by month](https://raw.github.com/luiscielak/talklog/master/121025_032156_420.png)

**reset to original view**
![reset to original view](https://raw.github.com/luiscielak/talklog/master/121025_032131_196.png)

**sort by time of the day and month**
![sort by month and time of the day](https://raw.github.com/luiscielak/talklog/master/121025_032203_481.png)




#Created by
talkLog was designed and developed by [Luis Cielak](http://twitter.com/luiscielak/).

Data was collected from 2009 to 2012.

Built with [Processing](http://www.processing.org/).
