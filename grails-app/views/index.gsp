<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>BiblioApp - Accueil</title>
    <style>
    .welcome-message {
        text-align: center;
        margin: 50px 0;
    }
    .action-buttons {
        display: flex;
        justify-content: center;
        margin: 30px 0;
    }
    .action-button {
        background-color: #4CAF50;
        border: none;
        color: white;
        padding: 15px 32px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        margin: 4px 2px;
        cursor: pointer;
        border-radius: 5px;
    }
    </style>
</head>
<body>
<div class="welcome-message">
    <h1>Bienvenue dans BiblioApp</h1>
    <p>Une application simple de gestion de bibliothèque avec Grails et Groovy</p>
</div>

<div class="action-buttons">
    <a href="${createLink(controller:'livre', action:'index')}" class="action-button">Gérer les Livres</a>
</div>
</body>
</html>s