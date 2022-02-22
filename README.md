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
This repository contains a Linear Program developped in MATLAB for creating signal-driven demand side flexibility for heating profiles. Please refer to the file 'guide_LP.pdf' for more specific information. In the raw data folder you will find the signal (day ahead market in this example), 

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

Note that for the LP to work all thre paths need to be added
