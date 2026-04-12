dataPath = fullfile('Data','Athletes');

files = {
    'athlete1_beginner.csv'
    'athlete2_intermediate.csv'
    'athlete3_advanced.csv'
};

for i = 1:length(files)
    if ~isfile(fullfile(dataPath, files{i}))
        error(['Missing file: ', files{i}]);
    end
end