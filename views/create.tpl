<!DOCTYPE html>
<html>
<head>
    <title>Add Student</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #1f1f1f;
            color: #f0f0f0;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding-top: 50px;
        }

        h2 {
            color: #00bcd4;
        }

        form {
            background: #2c2c2c;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 0 15px rgba(0, 188, 212, 0.15);
            width: 300px;
        }

        label {
            display: block;
            margin-top: 15px;
        }

        input[type="text"],
        input[type="number"] {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            border: none;
            border-radius: 6px;
            background-color: #444;
            color: #fff;
        }

        input[type="submit"] {
            margin-top: 20px;
            padding: 10px;
            width: 100%;
            background-color: #00bcd4;
            color: white;
            border: none;
            border-radius: 8px;
            font-weight: bold;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #0097a7;
        }

        .message {
            margin-top: 20px;
            color: #00e5ff;
            text-align: center;
        }

        a {
            margin-top: 20px;
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
    <h2>Add New Student</h2>
    <form method="post">
        <label>Roll No:</label>
        <input type="number" name="rno" required>

        <label>Name:</label>
        <input type="text" name="name" required>

        <label>Marks:</label>
        <input type="number" name="marks" required>

        <input type="submit" value="Submit">
    </form>

    % if msg:
        <div class="message">{{msg}}</div>
    % end

    <a href="/">Back to Home</a>
</body>
</html>
