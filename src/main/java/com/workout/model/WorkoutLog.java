package com.workout.model;

public class WorkoutLog {
    private int id;
    private int userId;
    private String dayOfWeek, workoutSplit, gymTime, createdAt;
    private int proteinIntake, durationMinutes;

    public int getId() { return id; } public void setId(int id) { this.id = id; }
    public int getUserId() { return userId; } public void setUserId(int userId) { this.userId = userId; }
    public String getDayOfWeek() { return dayOfWeek; } public void setDayOfWeek(String d) { this.dayOfWeek = d; }
    public String getWorkoutSplit() { return workoutSplit; } public void setWorkoutSplit(String s) { this.workoutSplit = s; }
    public String getGymTime() { return gymTime; } public void setGymTime(String g) { this.gymTime = g; }
    public String getCreatedAt() { return createdAt; } public void setCreatedAt(String c) { this.createdAt = c; }
    public int getProteinIntake() { return proteinIntake; } public void setProteinIntake(int p) { this.proteinIntake = p; }
    public int getDurationMinutes() { return durationMinutes; } public void setDurationMinutes(int d) { this.durationMinutes = d; }
}