clear all; close all; clc;

%% Read data
data = readmatrix('.\processed_data\data.csv');

%% Define profiles (this will change depending on the dataset)

% signal
signal = data(:,10);

% demand profiles
demand = data(:,2:8);

% Outside temperature
T0 = data(:,9);

%% For loop

% Define time lapse
days = 365; % Can change in leap years

% Empty results matrix
results = [];

% Loop for building type
for j = 1:7 

    % Empty flexibility vector (final result per type of building)
    flex = [];

    % Loop for day of the year
    for i = 1:days
    
        % Define LP parameters (see guide document)
        q = demand((i - 1)*24 + 1:(i - 1)*24 + 24, j); % Non-flex demand
        xi = signal((i - 1)*24 + 1:(i - 1)*24 + 24); % Signal
        T = T0((i - 1)*24 + 1:(i - 1)*24 + 24); % Outside temperature
    
        % Apply LP, store on flex vector
        flex = [flex; heat_flex(xi, q, T)];
        [i, j]
    end
    
    % Store results
    results = [results, flex];
end

%% Save results
csvwrite('.\\results\\results_LP.csv', results)