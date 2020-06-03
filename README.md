# Table of Contents
- [VBA](#VBA)
  - [PROJECT 1 - Restaurant Rater](#Restaurant-Rater)
     - [DESCRIPTION](#Description)
     - [HOW TO RUN PROGRAM](#How-to-run-program)
     - [FILES USED](#Files-used)
     - [NOTES](#Notes)
     - [VERSIONING](#versioning)
  - [PROJECT 2 - Braclet Maker](#Braclet-Maker)
     - [DESCRIPTION](#Description)
     - [HOW TO RUN PROGRAM](#How-to-run-program)
     - [FILES USED](#Files-used)
     - [NOTES](#Notes)
     - [VERSIONING](#versioning)
  - [PROJECT 3 - Customer Analysis](#Customer-Analysis)
     - [DESCRIPTION](#Description)
     - [HOW TO RUN PROGRAM](#How-to-run-program)
     - [FILES USED](#Files-used)
     - [NOTES](#Notes)
     - [VERSIONING](#versioning)     
- [R](#R)
  - [PROJECT 1 - Videogame Sales](#Videogame-Sales)
     - [DESCRIPTION](#Description)
     - [HOW TO RUN PROGRAM](#How-to-run-program)
     - [FILES USED](#Files-used)
     - [NOTES](#Notes)
     - [VERSIONING](#versioning)
  - [PROJECT 2 - sp500 Analysis Using MSGARCH](#sp500-Analysis-Using-MSGARCH)
     - [DESCRIPTION](#Description)
     - [HOW TO RUN PROGRAM](#How-to-run-program)
     - [FILES USED](#Files-used)
     - [NOTES](#Notes)
     - [VERSIONING](#versioning)     


## VBA
### Restaurant Rater
![](https://github.com/alec-Countryman/Past_Work/blob/master/GitHub%20Projects/Images/RestaurantAPItool.png)

#### Description
This macro-enabled Excel workbook used a public google API to find the first 20 restaurants within a 1500 meter radius. If there are not 20 results to populate, it will only do the maximum number of results returned by the places API. 
Credits also belong to Colby McGrath for assisting with debugging.

#### How to run program
Use of this workbook is farily simple. The "Dashboard" worksheet contains a dropdown list of select cities. Once a city is selected, the "Results" worksheet will show the restaurants sorted decsending order of rating. 

#### Files used
[Restaurant Rater](GitHub%20Projects/VBA/API%20Restaurant%20Rater.xlsm)
#### Notes
If you would like to use your own API, you may. On the "Sheet1 (Dashboard)" object in the macro editor, you will find the primary macro for the Workbook. Starting at line 58 and column 33, enter your API key. 


### Bracelet Maker
![](https://github.com/alec-Countryman/Past_Work/blob/master/GitHub%20Projects/Images/BraceletCombos.png)
#### Description
The macros contained in this Excel workbook gather combinations of different bracelet material. The main band, secondary band, buckle type and color are whats used to create each bracelet. This also prints out the total number of combinations for two different bracelet types via a message box to the user. The runtime is also printed as a final message box letting the user know the code has been executed. 
Credit goes to Colby McGrath for assistance in debugging. 

#### How to run program
First, download the noted file below and save it as "Bracelet Maker.xlsm." Once this is complete everything is done through a single button on the "Materials" workbook. This button will clear any redundant books or sheets that may inhibit the execution of the macros. 

#### Files used
[Bracelet Maker](GitHub%20Projects/VBA/Bracelet%20Maker.xlsm)
#### Notes
The prices and colors can be modified to whatever desired. To do this, just change them directly on the "Materials" workbook. 


### Customer Analysis

#### Description

#### How to run program

#### Files used

#### Notes

#### Versioning



## R
### Videogame Sales
#### Description

#### How to run program

#### Files used

#### Notes

#### Versioning


### sp500 Analysis Using MSGARCH
#### Description

#### How to run program

#### Files used

#### Notes

#### Versioning
