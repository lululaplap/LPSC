%% Import data from text file.
% Script for importing data from the following text file:
%
%    C:\Users\Lewis\Documents\MATLAB\LPSC\_Higher Education Student Statistics - Sheet1.csv
%
% To extend the code to different selected data or a different text file,
% generate a function instead of a script.

% Auto-generated by MATLAB on 2018/12/22 16:24:20

%% Initialize variables.
filename = 'C:\Users\Lewis\Documents\MATLAB\LPSC\_Higher Education Student Statistics - Sheet1.csv';
delimiter = ',';
startRow = 3;

%% Read columns of data as text:
% For more information, see the TEXTSCAN documentation.
formatSpec = '%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%[^\n\r]';

%% Open the text file.
fileID = fopen(filename,'r');

%% Read columns of data according to the format.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'TextType', 'string', 'HeaderLines' ,startRow-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');

%% Close the text file.
fclose(fileID);

%% Convert the contents of columns containing numeric text to numbers.
% Replace non-numeric text with NaN.
raw = repmat({''},length(dataArray{1}),length(dataArray)-1);
for col=1:length(dataArray)-1
    raw(1:length(dataArray{col}),col) = mat2cell(dataArray{col}, ones(length(dataArray{col}), 1));
end
numericData = NaN(size(dataArray{1},1),size(dataArray,2));

for col=[2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26]
    % Converts text in the input cell array to numbers. Replaced non-numeric
    % text with NaN.
    rawData = dataArray{col};
    for row=1:size(rawData, 1)
        % Create a regular expression to detect and remove non-numeric prefixes and
        % suffixes.
        regexstr = '(?<prefix>.*?)(?<numbers>([-]*(\d+[\,]*)+[\.]{0,1}\d*[eEdD]{0,1}[-+]*\d*[i]{0,1})|([-]*(\d+[\,]*)*[\.]{1,1}\d+[eEdD]{0,1}[-+]*\d*[i]{0,1}))(?<suffix>.*)';
        try
            result = regexp(rawData(row), regexstr, 'names');
            numbers = result.numbers;
            
            % Detected commas in non-thousand locations.
            invalidThousandsSeparator = false;
            if numbers.contains(',')
                thousandsRegExp = '^\d+?(\,\d{3})*\.{0,1}\d*$';
                if isempty(regexp(numbers, thousandsRegExp, 'once'))
                    numbers = NaN;
                    invalidThousandsSeparator = true;
                end
            end
            % Convert numeric text to numbers.
            if ~invalidThousandsSeparator
                numbers = textscan(char(strrep(numbers, ',', '')), '%f');
                numericData(row, col) = numbers{1};
                raw{row, col} = numbers{1};
            end
        catch
            raw{row, col} = rawData{row};
        end
    end
end


%% Split data into numeric and string columns.
rawNumericColumns = raw(:, [2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26]);
rawStringColumns = string(raw(:, 1));


%% Create output variable
HESS = table;
HESS.Subject = rawStringColumns(:, 1);
HESS.Female = cell2mat(rawNumericColumns(:, 1));
HESS.Male = cell2mat(rawNumericColumns(:, 2));
HESS.Other = cell2mat(rawNumericColumns(:, 3));
HESS.Total = cell2mat(rawNumericColumns(:, 4));
HESS.FemalePer12 = cell2mat(rawNumericColumns(:, 5));
HESS.VarName7 = cell2mat(rawNumericColumns(:, 6));
HESS.VarName8 = cell2mat(rawNumericColumns(:, 7));
HESS.VarName9 = cell2mat(rawNumericColumns(:, 8));
HESS.VarName10 = cell2mat(rawNumericColumns(:, 9));
HESS.FemalePer13 = cell2mat(rawNumericColumns(:, 10));
HESS.VarName12 = cell2mat(rawNumericColumns(:, 11));
HESS.VarName13 = cell2mat(rawNumericColumns(:, 12));
HESS.VarName14 = cell2mat(rawNumericColumns(:, 13));
HESS.VarName15 = cell2mat(rawNumericColumns(:, 14));
HESS.FemalePer14 = cell2mat(rawNumericColumns(:, 15));
HESS.VarName17 = cell2mat(rawNumericColumns(:, 16));
HESS.VarName18 = cell2mat(rawNumericColumns(:, 17));
HESS.VarName19 = cell2mat(rawNumericColumns(:, 18));
HESS.VarName20 = cell2mat(rawNumericColumns(:, 19));
HESS.FemalePer15 = cell2mat(rawNumericColumns(:, 20));
HESS.VarName22 = cell2mat(rawNumericColumns(:, 21));
HESS.VarName23 = cell2mat(rawNumericColumns(:, 22));
HESS.VarName24 = cell2mat(rawNumericColumns(:, 23));
HESS.VarName25 = cell2mat(rawNumericColumns(:, 24));
HESS.FemalePer16 = cell2mat(rawNumericColumns(:, 25));
HESS.noFemales = [HESS.FemalePer12,HESS.FemalePer13,HESS.FemalePer14,HESS.FemalePer15,HESS.FemalePer16];

%% Clear temporary variables
clearvars filename delimiter startRow formatSpec fileID dataArray ans raw col numericData rawData row regexstr result numbers invalidThousandsSeparator thousandsRegExp rawNumericColumns rawStringColumns;