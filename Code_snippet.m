%% Import the data
[~, ~, raw] = xlsread('Data.xlsx','Thickness');
raw(cellfun(@(x) ~isempty(x) && isnumeric(x) && isnan(x),raw)) = {''};
cellVectors = raw(:,[3,6,9]);
raw = raw(:,[1,2,4,5,7,8,10,11]);

%% Replace non-numeric cells with NaN
R = cellfun(@(x) ~isnumeric(x) && ~islogical(x),raw); % Find non-numeric cells
raw(R) = {NaN}; % Replace non-numeric cells

%% Create output variable
data = reshape([raw{:}],size(raw));

%% Allocate imported array to column variable names
ITO_thicknessm = data(:,1);
Efficiency1 = data(:,2);
VarName3 = cellVectors(:,1);
Emitter_thicknessm = data(:,3);
Efficiency2 = data(:,4);
VarName6 = cellVectors(:,2);
BSF_thicknessm = data(:,5);
Efficiency3 = data(:,6);
VarName9 = cellVectors(:,3);
Buffer_thicknessm = data(:,7);
Efficiency4 = data(:,8);

%% Clear temporary variables
clearvars data raw cellVectors R;

%%
%% Import the data
[~, ~, raw] = xlsread('Data.xlsx','Doping');
raw(cellfun(@(x) ~isempty(x) && isnumeric(x) && isnan(x),raw)) = {''};
cellVectors = raw(:,3);
raw = raw(:,[1,2,4,5]);

%% Replace non-numeric cells with NaN
R = cellfun(@(x) ~isnumeric(x) && ~islogical(x),raw); % Find non-numeric cells
raw(R) = {NaN}; % Replace non-numeric cells

%% Create output variable
data = reshape([raw{:}],size(raw));

%% Allocate imported array to column variable names
Emitterlayerdopingcm3 = data(:,1);
Efficiency5 = data(:,2);
VarName3 = cellVectors(:,1);
BSFlayerdopingcm3 = data(:,3);
Efficiency6 = data(:,4);

%% Clear temporary variables
clearvars data raw cellVectors R;

%% 
%% Create figure
figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1,'YGrid','on','XGrid','on');
box(axes1,'on');
hold(axes1,'on');

% Create plot
plot(ITO_thicknessm,Efficiency1,'LineWidth',1);

% Create xlabel
xlabel('ITO Thickness','FontSize',11);

% Create ylabel
ylabel('Efficiency1','FontSize',11);

% Create title
title('ITO Thickness Vs Efficiency','FontSize',11);

%% %%%%%%%%%%%%%%%%%%%%%%%%%

% Create figure
figure2 = figure;

% Create axes
axes2 = axes('Parent',figure2,'YGrid','on','XGrid','on');
box(axes2,'on');
hold(axes2,'on');

% Create plot
plot(Emitter_thicknessm,Efficiency2,'LineWidth',1);

% Create xlabel
xlabel('Emitter Thickness','FontSize',11);

% Create ylabel
ylabel('Efficiency','FontSize',11);

% Create title
title('Emitter Thickness Vs Efficiency','FontSize',11);

%% %%%%%%%%%%%%%%%%%%%%%%%%%

% Create figure
figure3 = figure;

% Create axes
axes3 = axes('Parent',figure3,'YGrid','on','XGrid','on');
box(axes3,'on');
hold(axes3,'on');

% Create plot
plot(BSF_thicknessm,Efficiency3,'LineWidth',1);

% Create xlabel
xlabel('BSF_thickness','FontSize',11);

% Create ylabel
ylabel('Efficiency','FontSize',11);

% Create title
title('BSF_thickness Vs Efficiency','FontSize',11);

%% %%%%%%%%%%%%%%%%%%%%%%%%%

% Create figure
figure4 = figure;

% Create axes
axes4 = axes('Parent',figure4,'YGrid','on','XGrid','on');
box(axes4,'on');
hold(axes4,'on');

% Create plot
plot(Buffer_thicknessm,Efficiency4,'LineWidth',1);

% Create xlabel
xlabel('Buffer_thickness','FontSize',11);

% Create ylabel
ylabel('Efficiency','FontSize',11);

% Create title
title('Buffer_thickness Vs Efficiency','FontSize',11);

%% %%%%%%%%%%%%%%%%%%%%%%%%%

% Create figure
figure5 = figure;

% Create axes
axes5 = axes('Parent',figure5,'YGrid','on','XGrid','on');
box(axes5,'on');
hold(axes5,'on');

% Create plot
plot(Emitterlayerdopingcm3,Efficiency5,'LineWidth',1);

% Create xlabel
xlabel('Emitterlayerdoping','FontSize',11);

% Create ylabel
ylabel('Efficiency','FontSize',11);

% Create title
title('Emitterlayerdoping Vs Efficiency','FontSize',11);
%% %%%%%%%%%%%%%%%%%%%%%%%%%

% Create figure
figure6 = figure;

% Create axes
axes6 = axes('Parent',figure6,'YGrid','on','XGrid','on');
box(axes6,'on');
hold(axes6,'on');

% Create plot
plot(BSFlayerdopingcm3,Efficiency6,'LineWidth',1);

% Create xlabel
xlabel('Emitterlayerdoping','FontSize',11);

% Create ylabel
ylabel('Efficiency','FontSize',11);

% Create title
title('BSFlayerdoping Vs Efficiency','FontSize',11);
