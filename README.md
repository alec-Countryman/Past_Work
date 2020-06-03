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

#### How to run program 4

#### Files used 4

#### Notes 4


### sp500 Analysis Using MSGARCH
#### Description 5

#### How to run program 5

#### Files used 5

#### Notes 5

