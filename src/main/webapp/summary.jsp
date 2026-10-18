<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Workout History</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { 
            font-family: 'Poppins', sans-serif; 
            background: linear-gradient(135deg, #2b5876 0%, #4e4376 100%); 
            min-height: 100vh; 
            padding-top: 40px; 
            padding-bottom: 40px; 
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
        .log-item { 
            background: rgba(0, 0, 0, 0.15); 
            border: 1px solid rgba(255, 255, 255, 0.1);
            transition: transform 0.2s, background 0.2s; 
            border-left: 5px solid #4a90e2 !important; 
        }
        .log-item:hover { 
            transform: translateX(5px); 
            background: rgba(0, 0, 0, 0.3); 
        }
        .btn-custom-outline {
            border: 1px solid rgba(255,255,255,0.5);
            color: white;
            background: transparent;
        }
        .btn-custom-outline:hover {
            background: rgba(255,255,255,0.2);
            color: white;
        }
    </style>
</head>
<body>
    <div class="container d-flex justify-content-center">
        <div class="glass-card col-md-8 col-lg-7 p-4">
            <h2 class="text-center mb-4 fw-bold text-white">📅 Your History</h2>

            <c:if test="${not empty sessionScope.msg}">
                <div class="alert alert-${sessionScope.msgType == 'error' ? 'danger' : 'success'} alert-dismissible fade show" role="alert">
                    ${sessionScope.msg}
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
                <c:remove var="msg" scope="session" />
                <c:remove var="msgType" scope="session" />
            </c:if>
            
            <c:choose>
                <c:when test="${empty logsList}">
                    <div class="text-center py-5">
                        <h5 class="text-light">No workouts logged yet.</h5>
                        <p class="text-white-50">Start tracking your progress today!</p>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="list-group shadow-sm">
                        <c:forEach var="log" items="${logsList}">
                            <div class="list-group-item log-item p-3 mb-3 rounded">
                                <div class="d-flex justify-content-between align-items-start">
                                    <div>
                                        <h5 class="mb-1 fw-bold text-white">
                                            ${log.dayOfWeek} 
                                            <span class="fs-6 fw-normal text-light" style="opacity: 0.8;">(${log.workoutSplit})</span>
                                        </h5>
                                        <p class="mb-2 text-white-50 small">
                                            🕒 <strong>Gym Time:</strong> ${log.gymTime} &nbsp;|&nbsp; 
                                            ⏱️ <strong>Duration:</strong> ${log.durationMinutes} mins
                                        </p>
                                        <p class="mb-0 text-white-50" style="font-size: 0.75rem;">
                                            <em>Record entered: ${log.createdAt}</em>
                                        </p>
                                    </div>
                                    <div class="text-end">
                                        <span class="badge bg-success rounded-pill mb-3 fs-6 px-3 py-2 shadow-sm">${log.proteinIntake}g Protein</span>
                                        <br>
                                        <a href="DeleteServlet?id=${log.id}" class="btn btn-outline-danger btn-sm rounded-pill px-3" onclick="return confirm('Are you sure you want to delete this log?');">Delete</a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </c:otherwise>
            </c:choose>
            
            <div class="text-center mt-4">
                <a href="index.jsp" class="btn btn-custom-outline rounded-pill px-4 shadow-sm">← Log Another Day</a>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>