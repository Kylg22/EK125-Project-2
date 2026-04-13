# Project Title: Option 1 - Fitness Tracker Analysis
**Course:** EK125  
**Date:** April 13, 2026  

## Team Members & Roles
* **Angus:** Data Manager (Student 1) - Responsible for data construction, CSV generation, and file management.
* **Kylor:** Algorithm Developer (Student 2) - Responsible for heart rate zone categorization, recovery rate calculations, and statistical analysis.
* **David:** Visualization Specialist (Student 3) - Responsible for generating analytical figures, subplots, and the summary dashboard.

## Directory Structure
To ensure the scripts run properly, the project files are organized as follows:

```text
Project_Root/
├── Data/
│   └── Athletes/
│       ├── athlete1_beginner.csv
│       ├── athlete2_intermediate.csv
│       └── athlete3_advanced.csv
├── Results/
│   ├── analysis_results.mat
│   ├── summary_table.csv
│   └── Figures/
│       ├── zone_comparison.png
│       ├── hr_trends.png
│       ├── recovery_comparison.png
│       ├── duration_distributions.png
│       └── summary_dashboard.png
├── main.m (or integration scripts)
├── athlete_profiles.txt
└── README.md
```

## Step-by-Step Instructions for Running the Code
1. Open MATLAB and navigate to the `Project_Root` directory so it is set as your Current Folder.
2. Ensure that the `Data/Athletes/` directory contains the three required CSV files.
3. Open and run the main script (e.g., `main.m`).
4. The script will automatically create the `Results/` and `Results/Figures/` directories if they do not already exist.
5. The workspace variables will be saved to a `.mat` file, the summary table exported to a `.csv`, and all five analytical figures will be exported as `.png` files into the `Results/Figures/` folder.

## Data File Formats and Column Meanings
The input data consists of three `.csv` files, each containing 21 days of workout tracking data for a specific athlete. The columns are defined as follows:

* **Day:** Sequential day number (1-21 representing a 3-week period).
* **ExerciseType:** Text describing the workout (e.g., "Running", "Pushups", "Squats", "Rest").
* **PreWorkoutHR:** Resting heart rate before the exercise in beats per minute (bpm).
* **PostWorkoutHR:** Heart rate immediately following the exercise (bpm).
* **Duration:** Total length of the workout in minutes.
* **Intensity:** Self-rated workout intensity on a scale of 1-10.

## Summary of Key Findings
* **Cardiovascular Efficiency:** The Advanced athlete demonstrated the highest cardiovascular efficiency, characterized by the lowest resting heart rate (55-65 bpm) and the lowest average recovery rate.
* **Training Consistency:** The Beginner athlete exhibited the highest variance in training consistency (highest standard deviation of intensity), aligning with their irregular workout schedule.
* **Heart Rate Zones:** The Advanced and Intermediate athletes spent significantly more total time in the "Moderate" and "Vigorous" heart rate zones (>130 bpm) compared to the Beginner athlete.
* **Workout Volume:** Workout duration and total active days directly correlated with the athlete's assigned fitness level, with the Advanced athlete completing 5-6 structured workouts per week.

## Special Notes and Assumptions
* **Rest Days:** Rest days were explicitly defined as days where the `Duration` column equals `0` and `PreWorkoutHR` equals `PostWorkoutHR`. Rest days were logically filtered out before calculating recovery rates, average intensity, and duration distributions to prevent skewed statistics.

---

## Team Reflection Questions

**1. Data Manager (Angus): How did organizing files and managing data flow affect the project? What file format choices did you make and why?**
> *Reflection:* Organizing the files into a strict `Data/Athletes` hierarchy prevented our main directory from becoming cluttered and made file pathing predictable. I chose the `.csv` (Comma Separated Values) format for the athlete data because it is universally readable, lightweight, and interfaces perfectly with MATLAB's `readtable` function. Creating a clear data structure early on allowed the Algorithm Developer to write their import scripts without waiting for my final data.

**2. Algorithm Developer (Kylor): What tools or strategies helped you troubleshoot or extend your code? How did you ensure your script was well-documented and reusable?**
> *Reflection:* Using "logical indexing" instead of cumbersome `for` loops and `if` statements made categorizing the heart rate zones and filtering out rest days much faster and less prone to bugs. To ensure reusability, I strictly used `%%` to divide the script into major structural sections (Setup, Load, Analysis, Export) and explicitly named my variables (like `meanRecoveryRates` and `intensityStdDev`) so the Visualization Specialist could easily pull them into their dashboard.

**3. Visualization Specialist (David): What design choices did you make to effectively communicate your results? How did you decide which types of plots were most appropriate?**
> *Reflection:* I aimed for comparative clarity. For instance, using a grouped `bar` chart for Figure 1 allowed us to immediately compare all three athletes across four distinct heart rate zones side-by-side. For the timeline (Figure 2), a line plot using `hold on` with distinct marker shapes (`-o`, `-s`, `-^`) was necessary to track the 21-day progression visually without the lines blending together. Finally, using a 2x2 subplot dashboard consolidated our highest-level metrics into one clean deliverable for easy viewing.

**4. Team Question: What skills from this project might apply to other engineering contexts? How does modular design with distinct roles mirror real engineering workflows?**
> *Reflection:* The most applicable skill was establishing "Input/Output" contracts before writing the code. Modular design mirrors real-world engineering because large systems (like software applications or mechanical assemblies) are always built in parallel by specialized teams. By acting as a Data Manager, Algorithm Developer, and Visualizer, we learned that if the "interfaces" (e.g., variable names, array sizes, directory structures) don't perfectly align, the final integration will fail. Communication and clearly defined module boundaries were just as important as the code itself.
