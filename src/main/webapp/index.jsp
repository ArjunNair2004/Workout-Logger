<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Workout & Nutrition Logger</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { 
            font-family: 'Poppins', sans-serif; 
            background: linear-gradient(135deg, #2b5876 0%, #4e4376 100%); 
            min-height: 100vh; 
            display: flex; 
            align-items: center; 
            padding-top: 20px; 
            padding-bottom: 20px;
            color: white;
        }
        .glass-card { 
            background: rgba(255, 255, 255, 0.1); 
            backdrop-filter: blur(12px); 
            -webkit-backdrop-filter: blur(12px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 15px; 
            box-shadow: 0 8px 32px 0 rgba(0, 0, 0, 0.37); 
        }
        .form-control, .form-select {
            background: rgba(0, 0, 0, 0.15);
            border: 1px solid rgba(255, 255, 255, 0.2);
            color: white;
        }
        .form-control:focus, .form-select:focus {
            background: rgba(0, 0, 0, 0.25);
            border: 1px solid rgba(255, 255, 255, 0.4);
            color: white;
            box-shadow: none;
        }
        .form-control::placeholder {
            color: rgba(255, 255, 255, 0.6);
        }
        select option {
            background: #4e4376;
            color: white;
        }
        .btn-custom { 
            background-color: #4a90e2; 
            color: white; 
            font-weight: 600; 
            border-radius: 8px; 
            padding: 10px; 
            border: none;
        }
        .btn-custom:hover { 
            background-color: #357abd; 
            color: white; 
        }
    </style>
</head>
<body>
    <div class="container d-flex justify-content-center">
        <div class="glass-card col-md-8 col-lg-6 p-4">
            <h2 class="text-center mb-4 fw-bold text-white">💪 Log Workout</h2>

            <c:if test="${not empty sessionScope.msg}">
                <div class="alert alert-${sessionScope.msgType == 'error' ? 'danger' : 'success'} alert-dismissible fade show" role="alert">
                    ${sessionScope.msg}
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
                <c:remove var="msg" scope="session" />
                <c:remove var="msgType" scope="session" />
            </c:if>
            
            <form action="WorkoutServlet" method="POST">
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label class="form-label fw-semibold text-light">Day of the Week</label>
                        <select name="day" class="form-select" required>
                            <option value="" disabled selected>Select a day...</option>
                            <option value="Monday">Monday</option>
                            <option value="Tuesday">Tuesday</option>
                            <option value="Wednesday">Wednesday</option>
                            <option value="Thursday">Thursday</option>
                            <option value="Friday">Friday</option>
                            <option value="Saturday">Saturday</option>
                            <option value="Sunday">Sunday</option>
                        </select>
                    </div>

                    <div class="col-md-6 mb-3">
                        <label class="form-label fw-semibold text-light">Workout Split</label>
                        <select name="split" class="form-select" required>
                            <option value="" disabled selected>Select split...</option>
                            <option value="Chest/Triceps">Chest / Triceps</option>
                            <option value="Back/Biceps">Back / Biceps</option>
                            <option value="Shoulders/Abs">Shoulders / Abs</option>
                            <option value="Legs">Legs</option>
                            <option value="Rest Day">Rest Day</option>
                        </select>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label class="form-label fw-semibold text-light">Time went to Gym</label>
                        <input type="time" name="gymTime" class="form-control" required>
                    </div>
                    
                    <div class="col-md-6 mb-3">
                        <label class="form-label fw-semibold text-light">Duration (Minutes)</label>
                        <input type="number" name="duration" class="form-control" placeholder="e.g., 60" required>
                    </div>
                </div>

                <div class="mb-4">
                    <label class="form-label fw-semibold text-light">Daily Protein Intake (g)</label>
                    <input type="number" name="protein" class="form-control" placeholder="e.g., 140" required>
                </div>

                <button type="submit" class="btn btn-custom w-100 shadow-sm mb-3">Save Log</button>
            </form>
            
            <div class="text-center mt-2">
                <a href="ViewServlet" class="text-decoration-none fw-semibold text-light" style="opacity: 0.8;">📄 View Workout History</a>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>