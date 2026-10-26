package com.workout;

public class WorkoutLog {
    private int id;
    private String userName;
    private String dayOfWeek;
    private String workoutSplit;
    private int proteinIntake;
    private String gymTime;
    private int durationMinutes;
    private String createdAt;

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    
    public String getUserName() { return userName; }
    public void setUserName(String userName) { this.userName = userName; }
    
    public String getDayOfWeek() { return dayOfWeek; }
    public void setDayOfWeek(String dayOfWeek) { this.dayOfWeek = dayOfWeek; }
    
    public String getWorkoutSplit() { return workoutSplit; }
    public void setWorkoutSplit(String workoutSplit) { this.workoutSplit = workoutSplit; }
    
    public int getProteinIntake() { return proteinIntake; }
    public void setProteinIntake(int proteinIntake) { this.proteinIntake = proteinIntake; }

    public String getGymTime() { return gymTime; }
    public void setGymTime(String gymTime) { this.gymTime = gymTime; }

    public int getDurationMinutes() { return durationMinutes; }
    public void setDurationMinutes(int durationMinutes) { this.durationMinutes = durationMinutes; }

    public String getCreatedAt() { return createdAt; }
    public void setCreatedAt(String createdAt) { this.createdAt = createdAt; }
}