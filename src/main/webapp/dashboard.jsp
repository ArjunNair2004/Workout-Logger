<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <style>
        body { font-family: 'Poppins', sans-serif; background: linear-gradient(-45deg, #1e1e2f, #2a2a4a, #f72585, #7209b7); background-size: 400% 400%; animation: gradientBG 12s ease infinite; min-height: 100vh; color: #ffffff; padding-top: 3rem; }
        @keyframes gradientBG { 0% { background-position: 0% 50%; } 50% { background-position: 100% 50%; } 100% { background-position: 0% 50%; } }
        .glass-item { background: rgba(255, 255, 255, 0.05); backdrop-filter: blur(15px); border: 1px solid rgba(255, 255, 255, 0.1); border-radius: 16px; transition: transform 0.2s, background 0.3s; }
        .glass-item:hover { background: rgba(255, 255, 255, 0.1); transform: translateY(-3px); }
        .btn-pop { background: linear-gradient(45deg, #f72585, #7209b7); border: none; font-weight: 600; color: white; transition: transform 0.2s, box-shadow 0.2s; }
        .btn-pop:hover { transform: translateY(-2px); box-shadow: 0 5px 15px rgba(247, 37, 133, 0.5); color: white; }
        .badge-glass { background: rgba(247, 37, 133, 0.2); border: 1px solid rgba(247, 37, 133, 0.5); color: #ff99c8; }
    </style>
</head>
<body>
    <div class="container col-md-8 col-sm-12 pb-5">
        <div class="d-flex justify-content-between mb-5 align-items-center flex-wrap gap-3">
            <h2 class="fw-bold m-0">Welcome, ${sessionScope.userName}</h2>
            <div>
                <a href="index.jsp" class="btn btn-pop rounded-pill px-4 py-2 me-2">+ Log Workout</a>
                <a href="login.jsp" class="btn btn-outline-light rounded-pill px-4 py-2">Logout</a>
            </div>
        </div>
        
        <div class="d-flex flex-column gap-3">
            <c:forEach var="log" items="${logsList}">
                <div class="glass-item p-4 d-flex justify-content-between align-items-center flex-wrap gap-3">
                    <div>
                        <h4 class="fw-bold mb-1">${log.dayOfWeek} <span class="fw-normal opacity-75 fs-5">| ${log.workoutSplit}</span></h4>
                        <p class="mb-0 opacity-75">
                            <small>🕒 ${log.gymTime} &nbsp;&bull;&nbsp; ⏳ ${log.durationMinutes} mins</small>
                        </p>
                    </div>
                    <div class="text-end">
                        <span class="badge badge-glass rounded-pill px-3 py-2 mb-2 fs-6 border">${log.proteinIntake}g Protein</span><br>
                        <a href="EditServlet?id=${log.id}" class="btn btn-sm btn-outline-light rounded-3 px-3">Edit</a>
                        <a href="DeleteServlet?id=${log.id}" class="btn btn-sm btn-outline-danger rounded-3 px-3 ms-1 border-0 bg-danger bg-opacity-10 text-danger">Delete</a>
                    </div>
                </div>
            </c:forEach>
            
            <c:if test="${empty logsList}">
                <div class="text-center p-5 glass-item">
                    <h5 class="opacity-75">No workouts logged yet. Time to hit the gym!</h5>
                </div>
            </c:if>
        </div>
    </div>
</body>
</html>