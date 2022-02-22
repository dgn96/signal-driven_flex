# Signal-driven Demand Side Flexibility for the Smart Electrification of Heating and Cooling
This repository was created by Daniel Gutierrez-Navarro (IRENA) under the supervision of Arina Anisie (IRENA)


## 1) Contents of this repository
- Folder: raw data
    - Folder: weather
        - weather_swiss_2019.csv
        - source.txt
    - Folder: signal
        - day_ahead_market_swiss_2019.csv
        - source.txt
    - Folder: non-flex_demand
        - commercial_hour_profile_EMPA.csv
        - residential_hour_profile_EMPA.csv
        - source.txt
- Folder: processed_data  
    - data.csv
- Folder: results
    - results_LP.csv  
- guide_LP.pdf
- data_wrangling.ipynb
- signal-driven_flex.m
- heat_flex.m

## 2) About this repository
This repository contains a Linear Program developped in MATLAB for creating signal-driven demand side flexibility for heating profiles. Please refer to the file 'guide_LP.pdf' for more specific information. In the raw data folder you will find the signal (day ahead market in this example), the unprocessed data for the non-flexible heat profiles, and the average outside temperature in Switzerland. Sources for each data set can be cound in the corresponding folder.

The file 'data_wrangling.ipynb' reads the raw data for non-flexible demand and processes it. In the notebook you will find a breif exploratory procedure for each data set (residential and commercial), as well as a processing unit in which parameter extraction and vector normalization are performed. A few figures are depicted to illustrate the quality of the data. After processing the data and appending the signal and the temperature values, the notebook stores the processed data under the directory '.\processed_data\data.csv'. 

The file 'heat_flex.m' is a function created in MATLAB which contains the Linear Program. The file 'demand-side_flex.m' is a MATLAB script that reads the processed data from the data wrangling notebook, breaks it down in 24 hour day intervals and applies the Linear Program function on 'heat_flex.m'. The results of the Linear Program are stored under the directory '.\results\results_LP.csv'.

## 3) Software needed to run the content of this repository
Python 3 and matlab need to be installed in your local disk. The MATLAB linear program uses YALMIP as a syntax toolbox and MOSEK as a solver. YALMIP is free acces and can be downloaded here https://yalmip.github.io/tutorial/installation/

MOSEK needs to be downloaded on your local disk and a valid license must be saved on the following directory: '.\user\Mosek\license'. For more information on how to install MOSEK and get a licence, please visit https://www.mosek.com/downloads/

Furthermore, YALMIP and MOSEK need to be added as a path in MATLAB. To do so, open MATLAB and follow these instructions:
1) Go to 'Home'
2) Under the tab 'Environment' click on 'Set path' icon
3) Click on 'Add with subfolders'
4) Search for the directory in which you installed YALMIP, or MOSEK, or the MOSEK licence
5) Select folder and click 'Select Folder'
6) Repeat with the next path

Note that for the LP to work all three paths need to be added
