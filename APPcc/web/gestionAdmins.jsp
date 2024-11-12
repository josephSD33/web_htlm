
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de Eventos</title>
    <style>
        /* General Styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            flex-direction: column;
            box-sizing: border-box;
        }
        header {
            background-color: #4CAF50;
            color: white;
            padding: 15px 0;
            text-align: center;
            width: 100%;
        }
        h2 {
            color: #333;
            font-size: 22px;
            margin-bottom: 20px;
            text-align: center;
        }
        .content-container {
            width: 90%;
            max-width: 900px;
            padding: 20px;
            background-color: white;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 40px;
            background-color: white;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        th, td {
            padding: 8px 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
            font-size: 14px;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        td {
            font-size: 14px;
        }
        .no-reservas {
            text-align: center;
            font-style: italic;
            color: #888;
        }

        /* Navigation Bar Styles */
        nav {
            background-color: #333;
            width: 100%;
        }
        nav ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
            display: flex;
            justify-content: center;
        }
        nav ul li {
            margin: 0 15px;
        }
        nav ul li a {
            color: white;
            text-decoration: none;
            padding: 10px 20px;
            display: block;
        }
        nav ul li a:hover {
            background-color: #4CAF50;
        }

        /* Media Queries for responsive design */
        @media (max-width: 768px) {
            h2 {
                font-size: 18px;
            }
            table {
                font-size: 12px;
            }
            th, td {
                padding: 6px 10px;
            }
            .content-container {
                width: 95%;
                padding: 15px;
            }
            nav ul {
                flex-direction: column;
                align-items: center;
            }
            nav ul li {
                margin: 5px 0;
            }
        }

        @media (max-width: 480px) {
            h2 {
                font-size: 16px;
            }
            table {
                font-size: 10px;
            }
            th, td {
                padding: 5px 8px;
            }
            .content-container {
                width: 100%;
                padding: 10px;
            }
        }
    </style>
</head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
