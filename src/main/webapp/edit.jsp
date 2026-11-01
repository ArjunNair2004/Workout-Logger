<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Workout</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <style>
        body { font-family: 'Poppins', sans-serif; background: linear-gradient(-45deg, #1e1e2f, #2a2a4a, #f72585, #7209b7); background-size: 400% 400%; animation: gradientBG 12s ease infinite; min-height: 100vh; display: flex; align-items: center; color: #ffffff; padding: 2rem 0; }
        @keyframes gradientBG { 0% { background-position: 0% 50%; } 50% { background-position: 100% 50%; } 100% { background-position: 0% 50%; } }
        .glass-card { background: rgba(255, 255, 255, 0.05); backdrop-filter: blur(20px); border: 1px solid rgba(255, 255, 255, 0.15); border-radius: 24px; box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2); padding: 3rem; }
        .custom-input { background: rgba(255, 255, 255, 0.08) !important; border: 1px solid rgba(255, 255, 255, 0.2) !important; color: white !important; border-radius: 12px; padding: 0.75rem 1rem; transition: all 0.3s ease; }
        .custom-input:focus { background: rgba(255, 255, 255, 0.12) !important; border-color: #f72585 !important; box-shadow: 0 0 15px rgba(247, 37, 133, 0.4) !important; outline: none; }
        .btn-pop { background: linear-gradient(45deg, #f72585, #7209b7); border: none; border-radius: 12px; font-weight: 600; padding: 0.75rem; color: white; transition: transform 0.2s, box-shadow 0.2s; }
        .btn-pop:hover { transform: translateY(-3px); box-shadow: 0 8px 20px rgba(247, 37, 133, 0.5); color: white; }
    </style>
</head>
<body>
    <div class="container col-md-6 col-sm-10">
        <div class="glass-card">
            <h3 class="mb-4 text-center fw-bold">✏️ Edit Workout</h3>
            <form action="UpdateServlet" method="POST">
                <input type="hidden" name="id" value="\${log.id}">
                <div class="row mb-3">
                    <div class="col"><label class="opacity-75 small mb-1">Day of Week</label><input type="text" name="day" class="form-control custom-input" value="\${log.dayOfWeek}" required></div>
                    <div class="col"><label class="opacity-75 small mb-1">Workout Split</label><input type="text" name="split" class="form-control custom-input" value="\${log.workoutSplit}" required></div>
                </div>
                <div class="row mb-3">
                    <div class="col"><label class="opacity-75 small mb-1">Gym Time</label><input type="time" name="gymTime" class="form-control custom-input" value="\${log.gymTime}" required></div>
                    <div class="col"><label class="opacity-75 small mb-1">Duration (Mins)</label><input type="number" name="duration" class="form-control custom-input" value="\${log.durationMinutes}" required></div>
                </div>
                <div class="mb-4"><label class="opacity-75 small mb-1">Protein Intake (g)</label><input type="number" name="protein" class="form-control custom-input" value="\${log.proteinIntake}" required></div>
                <button type="submit" class="btn btn-pop w-100 mb-3">Update Log</button>
                <a href="DashboardServlet" class="btn btn-outline-light w-100 rounded-3">Cancel</a>
            </form>
        </div>
    </div>
</body>
</html>