<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login - Workout Logger</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <style>
        body { font-family: 'Poppins', sans-serif; background: linear-gradient(-45deg, #1e1e2f, #2a2a4a, #f72585, #7209b7); background-size: 400% 400%; animation: gradientBG 12s ease infinite; height: 100vh; display: flex; align-items: center; color: #ffffff; }
        @keyframes gradientBG { 0% { background-position: 0% 50%; } 50% { background-position: 100% 50%; } 100% { background-position: 0% 50%; } }
        .glass-card { background: rgba(255, 255, 255, 0.05); backdrop-filter: blur(20px); -webkit-backdrop-filter: blur(20px); border: 1px solid rgba(255, 255, 255, 0.15); border-radius: 24px; box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2); padding: 3rem 2.5rem; }
        .custom-input { background: rgba(255, 255, 255, 0.08) !important; border: 1px solid rgba(255, 255, 255, 0.2) !important; color: white !important; border-radius: 12px; padding: 0.75rem 1rem; transition: all 0.3s ease; }
        .custom-input::placeholder { color: rgba(255, 255, 255, 0.5) !important; }
        .custom-input:focus { background: rgba(255, 255, 255, 0.12) !important; border-color: #f72585 !important; box-shadow: 0 0 15px rgba(247, 37, 133, 0.4) !important; outline: none; }
        .btn-pop { background: linear-gradient(45deg, #f72585, #7209b7); border: none; border-radius: 12px; font-weight: 600; padding: 0.75rem; color: white; transition: transform 0.2s, box-shadow 0.2s; }
        .btn-pop:hover { transform: translateY(-3px); box-shadow: 0 8px 20px rgba(247, 37, 133, 0.5); color: white; }
        .auth-link { color: #f72585; font-weight: 400; transition: color 0.3s; }
        .auth-link:hover { color: #ff5c9f; }
    </style>
</head>
<body>
    <div class="container col-md-4 col-sm-8 col-11">
        <div class="glass-card">
            <h3 class="text-center mb-4 fw-bold">💪 Welcome Back</h3>
            
            <% if ("invalid".equals(request.getParameter("error"))) { %>
                <div class="alert alert-danger p-2 text-center rounded-3 border-0 bg-danger text-white bg-opacity-75">
                    Invalid email or password!
                </div>
            <% } else if ("registered".equals(request.getParameter("success"))) { %>
                <div class="alert alert-success p-2 text-center rounded-3 border-0 bg-success text-white bg-opacity-75">
                    Account created! Please login.
                </div>
            <% } %>

            <form action="LoginServlet" method="POST">
                <div class="mb-3">
                    <input type="email" name="email" class="form-control custom-input" placeholder="Email Address" required>
                </div>
                <div class="mb-4">
                    <input type="password" name="password" class="form-control custom-input" placeholder="Password" required>
                </div>
                <button type="submit" class="btn btn-pop w-100 mb-4">Login to Logger</button>
            </form>
            
            <div class="text-center mt-2">
                <span class="opacity-75">Need an account?</span> 
                <a href="register.jsp" class="text-decoration-none auth-link">Sign up here</a>
            </div>
        </div>
    </div>
</body>
</html>