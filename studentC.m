% Setup: Create directory for saving figures if it doesn't exist
if ~exist('Results/Figures', 'dir')
    mkdir('Results/Figures');
end

% Define athlete labels for reuse across plots
athleteNames = {'Beginner', 'Intermediate', 'Advanced'};

%% Figure 1: Heart Rate Zone Comparison
figure;
% Create grouped bar chart
bar(timeInZones, 'grouped'); 
title('Time Spent in Heart Rate Zones by Athlete');
xlabel('Athletes'); % X-axis
ylabel('Time (minutes)'); % Y-axis
set(gca, 'XTickLabel', athleteNames);
% Add legend for the 4 HR zones
legend('Resting', 'Light', 'Moderate', 'Vigorous', 'Location', 'best');
% Save the figure
saveas(gcf, fullfile('Results', 'Figures', 'zone_comparison.png'));

%% Figure 2: Heart Rate Trends Over Time
figure;
hold on; % Allow multiple lines on the same axes
% Plot the three lines with different colors and markers
plot(days, postHR_beg, '-o', 'DisplayName', 'Beginner');
plot(days, postHR_int, '-s', 'DisplayName', 'Intermediate');
plot(days, postHR_adv, '-^', 'DisplayName', 'Advanced');
hold off;
title('Post-Workout Heart Rate Trends (21 Days)');
xlabel('Day (1-21)');
ylabel('Post-Workout Heart Rate (bpm)');
legend('show', 'Location', 'best');
grid on;
saveas(gcf, fullfile('Results', 'Figures', 'hr_trends.png'));

%% Figure 3: Recovery Rate Comparison
figure;
% Create bar chart for the 3 athletes
bar(meanRecoveryRates);
title('Average Recovery Rate (Post - Pre Workout HR)');
xlabel('Athletes');
ylabel('Average Heart Rate Increase (bpm)');
set(gca, 'XTickLabel', athleteNames);
saveas(gcf, fullfile('Results', 'Figures', 'recovery_comparison.png'));

%% Figure 4: Workout Duration Distribution
figure;
% Filter out rest days (Duration > 0)
active_dur_beg = dur_beg(dur_beg > 0);
active_dur_int = dur_int(dur_int > 0);
active_dur_adv = dur_adv(dur_adv > 0);

% Subplot 1: Beginner
subplot(3, 1, 1);
histogram(active_dur_beg, 10); % ~10 bins
title('Workout Duration Distribution: Beginner');
ylabel('Frequency');

% Subplot 2: Intermediate
subplot(3, 1, 2);
histogram(active_dur_int, 10);
title('Workout Duration Distribution: Intermediate');
ylabel('Frequency');

% Subplot 3: Advanced
subplot(3, 1, 3);
histogram(active_dur_adv, 10);
title('Workout Duration Distribution: Advanced');
xlabel('Duration (minutes)');
ylabel('Frequency');

saveas(gcf, fullfile('Results', 'Figures', 'duration_distributions.png'));

%% Figure 5: Summary Dashboard
% Create large figure window
figure('Position', [100, 100, 1200, 800]); 

% Panel 1: Total workout time
subplot(2, 2, 1);
bar(totalTime);
title('Total Workout Time');
ylabel('Minutes');
set(gca, 'XTickLabel', athleteNames);

% Panel 2: Average workout intensity
subplot(2, 2, 2);
bar(avgIntensity);
title('Average Workout Intensity');
ylabel('Intensity Level (1-10)');
set(gca, 'XTickLabel', athleteNames);

% Panel 3: Number of workouts completed
subplot(2, 2, 3);
bar(numWorkouts);
title('Total Workouts Completed');
ylabel('Count');
set(gca, 'XTickLabel', athleteNames);

% Panel 4: Training consistency (Std Dev of Intensity)
subplot(2, 2, 4);
bar(intensityStdDev);
title('Training Consistency (Lower = More Consistent)');
ylabel('Std Dev of Intensity');
set(gca, 'XTickLabel', athleteNames);

saveas(gcf, fullfile('Results', 'Figures', 'summary_dashboard.png'));