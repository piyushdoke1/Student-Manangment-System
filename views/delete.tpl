<!DOCTYPE html>
<html>
<head>
    <title>SMS APP</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #1f1f1f;
            color: #f0f0f0;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding-top: 100px;
        }

        h2 {
            color: #f44336;
        }

        .message {
            color: #ff5722;
            margin-top: 20px;
        }

        a {
            margin-top: 30px;
            display: inline-block;
            color: #00bcd4;
            text-decoration: none;
        }

        a:hover {
            color: #00e5ff;
        }
    </style>
</head>
<body>
    <h2> Delete Student</h2>

    % if msg:
        <div class="message">{{msg}}</div>
    % else:
        <div class="message">Invalid request or student already deleted.</div>
    % end

    <a href="/">Back to Home</a>
</body>
</html>
