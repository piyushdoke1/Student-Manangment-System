<!DOCTYPE html>
<html>
<head>
    <title>Student Records</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: #1f1f1f;
            color: #f0f0f0;
            margin: 0;
            padding: 0;
        }

        h2 {
            text-align: center;
            padding: 20px 0;
            color: #00bcd4;
        }

        .actions {
            text-align: center;
            margin-bottom: 20px;
        }

        .actions a {
            background-color: #00bcd4;
            color: #fff;
            padding: 10px 18px;
            border-radius: 8px;
            text-decoration: none;
            transition: background 0.3s ease;
        }

        .actions a:hover {
            background-color: #0097a7;
        }

        table {
            width: 80%;
            margin: 0 auto 40px auto;
            border-collapse: collapse;
            box-shadow: 0 0 20px rgba(0, 188, 212, 0.2);
        }

        th, td {
            padding: 12px 20px;
            text-align: center;
            border-bottom: 1px solid #444;
        }

        th {
            background-color: #263238;
            color: #00e5ff;
        }

        tr:hover {
            background-color: #333;
        }

        a.action-link {
            color: #00bcd4;
            margin: 0 6px;
            text-decoration: none;
        }

        a.action-link:hover {
            color: #00e5ff;
        }
    </style>
</head>
<body>
    <h2> Student Records</h2>

    <div class="actions">
        <a href="/create">Add New Student</a>
    </div>

    % if data:
        <table>
            <tr>
                <th>Roll No</th>
                <th>Name</th>
                <th>Marks</th>
                <th>Actions</th>
            </tr>
            % for row in data:
                <tr>
                    <td>{{row[0]}}</td>
                    <td>{{row[1]}}</td>
                    <td>{{row[2]}}</td>
                    <td>
                        <a class="action-link" href="/update?rno={{row[0]}}"> Update</a>
                        <a class="action-link" href="/delete?rno={{row[0]}}">Delete</a>
                    </td>
                </tr>
            % end
        </table>
    % else:
        <p style="text-align:center;">No student records found.</p>
    % end
</body>
</html>
