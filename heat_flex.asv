function flex = heat_flex(signal, demand, temperature)

% Parameters

t = length(demand); % Time steps

T1_nonflex = 21;


% Find k as scalar
[ind, j, values] = find(demand);
k = mean(values)/abs(T1_nonflex - mean(temperature(ind)));


% Decision variables
flex = sdpvar(t, 1);
T1 = sdpvar(t, 1);

% Objective
obj = signal'*flex; % Maximize the sum of discharge in the system

% Constraints
con = [];

% Building energetics q = k(T0 - T1) with k as scalar
 con = [con, T1 >= T1_nonflex-3, T1 <= T1_nonflex+3];
 con = [con, flex(ind) == max(k*(T1(ind) - temperature(ind)),0)];

%con = [con, flex == 1*k*(T1 - temperature)];
%con = [con, flex <= 1*k*(24 - temperature)];
%con = [con, flex >= 1*k*(18 - temperature)];

% 40% of peak demand can't be shoven
con = [con, flex - demand >= -.6*max(demand)];

% Artificial cap (change later)
%con = [con, flex - demand <= .6*max(demand)];
con = [con, diff(flex) >= -4, diff(flex) <= 4];

% Demand must be positive
con = [con, flex >= 0];

% Energy balance
con = [con, sum(flex) == sum(demand)];

% Solver options
ops = sdpsettings('solver', 'mosek', 'verbose', 0);

% Diagnosis
diag = optimize(con, obj, ops);

% Get values
flex = value(flex);
%T = value(T1);
end