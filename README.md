# Table of Contents
- [VBA](#VBA)
  - [PROJECT 1 - Restaurant Rater](#Restaurant-Rater)
     - [DESCRIPTION](#Description-1)
     - [HOW TO RUN PROGRAM](#How-to-run-program-1)
     - [FILES USED](#Files-used-1)
     - [NOTES](#Notes-1)
     
  - [PROJECT 2 - Braclet Maker](#Braclet-Maker)
     - [DESCRIPTION](#Description-2)
     - [HOW TO RUN PROGRAM](#How-to-run-program-2)
     - [FILES USED](#Files-used-2)
     - [NOTES](#Notes-2)

  - [PROJECT 3 - Customer Analysis](#Customer-Analysis)
     - [DESCRIPTION](#Description-3)
     - [HOW TO RUN PROGRAM](#How-to-run-program-3)
     - [FILES USED](#Files-used-3)
     - [NOTES](#Notes-3)
    
- [R](#R)
  - [PROJECT 1 - Videogame Sales](#Videogame-Sales)
     - [DESCRIPTION](#Description-4)
     - [HOW TO RUN PROGRAM](#How-to-run-program-4)
     - [FILES USED](#Files-used-4)
     - [NOTES](#Notes-4)

  - [PROJECT 2 - sp500 Analysis Using MSGARCH](#sp500-Analysis-Using-MSGARCH)
     - [DESCRIPTION](#Description-5)
     - [HOW TO RUN PROGRAM](#How-to-run-program-5)
     - [FILES USED](#Files-used-5)
     - [NOTES](#Notes-5)
   


## VBA
### Restaurant Rater
![](https://github.com/alec-Countryman/Past_Work/blob/master/GitHub%20Projects/Images/RestaurantAPItool.png)

#### Description 1
This macro-enabled Excel workbook used a public google API to find the first 20 restaurants within a 1500 meter radius. If there are not 20 results to populate, it will only do the maximum number of results returned by the places API. 
Credits also belong to Colby McGrath for assisting with debugging.

#### How to run program 1
Use of this workbook is farily simple. The "Dashboard" worksheet contains a dropdown list of select cities. Once a city is selected, the "Results" worksheet will show the restaurants sorted decsending order of rating. 

#### Files used 1
[Restaurant Rater](GitHub%20Projects/VBA/API%20Restaurant%20Rater.xlsm)
#### Notes 1
If you would like to use your own API, you may. On the "Sheet1 (Dashboard)" object in the macro editor, you will find the primary macro for the Workbook. Starting at line 58 and column 33, enter your API key. 


### Bracelet Maker
![](https://github.com/alec-Countryman/Past_Work/blob/master/GitHub%20Projects/Images/BraceletCombos.png)
#### Description 2
The macros contained in this Excel workbook gather combinations of different bracelet material. The main band, secondary band, buckle type and color are whats used to create each bracelet. This also prints out the total number of combinations for two different bracelet types via a message box to the user. The runtime is also printed as a final message box letting the user know the code has been executed. 
Credit goes to Colby McGrath for assistance in debugging. 

#### How to run program 2
First, download the noted file below and save it as "Bracelet Maker.xlsm." Once this is complete everything is done through a single button on the "Materials" workbook. This button will clear any redundant books or sheets that may inhibit the execution of the macros. 

#### Files used 2
[Bracelet Maker](GitHub%20Projects/VBA/Bracelet%20Maker.xlsm)
#### Notes 2
The prices and colors can be modified to whatever desired. To do this, just change them directly on the "Materials" workbook. 


### Customer Analysis
![](GitHub%20Projects/Images/CustomerAnalysis.png)
#### Description 3
From three different dataset sizes, the worksheets in the workbook will be updated with customers, orders, and payments. Once the database has been updated multiple queries can be run on them. The first, all customers who have yet to make a payment. Second, orders with an outstanding balance that is entered by the user via an input box. Lastly, all customers orders that are greater than a value entered into an input box. Once on of these three otpions is chosen the "Results" sheet will be populated with the pertinent information.
I (Alec) performed the coding necessary in populating the "results" sheet. All other coding was done by Colby McGrath. 

#### How to run program 3
Download the file listed below and save it. Navigate to the "Instructions" sheet and first update database with the user choice of dataset size. After that select the desired results to be populated via one of the three buttons. 

#### Files used 3
[Customer Analysis](GitHub%20Projects/VBA/SQL%20Customer%20Analyzer.xlsm)
#### Notes 3



## R
### Videogame Sales
#### Description 4
This project analyzes sales of video games from the 1970s to the end of 2019. This project includes data cleaning, summary tables, various plots, and correlations between features. The analysis was discussed in a report which was a deliverable at the time and can be used for more information on the methods used in code. This is the file named "final_1.docx" listed in the files uesd section. 
Additional credits belong to Jacob Swinton, Aaron Dzaboff, Colby McGrath for their combined collaboration on this project.

#### How to run program 4
After downloading the R file and the csv file listed in the files used portion set the working directory to contain the csv file. Once this is done load the required libraries in lines 1 - 7. The code can be executed now in a chunk or line-by-line. 

#### Files used 4
-[Report](GitHub%20Projects/R/final_1.docx)
-[Video Game Code](GitHub%20Projects/R/Video%20Game%20Sales.R)
-[Video Game Data](GitHub%20Projects/R/vgsales-12-4-2019.csv)
#### Notes 4


### sp500 Analysis Using MSGARCH
![](GitHub%20Projects/Images/SP500Backtest.png)
#### Description 5
The SP500 index was analyzed using a variety of models and distributions to aid in determining the best fitting model. Additional metrics were used to gauge the performance of each model. Value at risk for backtesting was used at both 1% and 5% risk levels. All these were used to select the best model and a plot was included to show the backtesting results visually.
Credits to Kelsey Petrich for lines 11 to 112 and Elliott Newman for lines 95 to 112. Credit to both for their assistance in the reporting as well.  

#### How to run program 5
The only required file for code execution is the R file. Data is pulled within the code from an external source. Once the R file is downloaded, load the required packages from lines 1 to 5 and the code may now be ran in chunks or line-by-line.

#### Files used 5
-[Report](GitHub%20Projects/R/Project%20Report.pdf)
-[SP500 Analysis Code](GitHub%20Projects/R/SP500%20Analysis%20Using%20MSGARCH%20Models.R)
#### Notes 5

