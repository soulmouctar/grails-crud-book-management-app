<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
    <g:layoutTitle default="BiblioApp"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>
    <asset:stylesheet src="application.css"/>
    <g:layoutHead/>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="/">BiblioApp</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <div class="collapse navbar-collapse justify-content-between" id="navbarNav">
            <!-- Menu à gauche -->
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="/">Accueil</a>
                </li>
                <li class="nav-item">
                    <g:link class="nav-link" controller="livre" action="index">Livres</g:link>
                </li>
            </ul>

            <!-- Boutons de langue à droite -->
            <div class="d-flex">
                <a href="${request.forwardURI}?lang=fr" class="btn btn-outline-primary me-2">
                    🇫🇷 Français
                </a>
                <a href="${request.forwardURI}?lang=en" class="btn btn-outline-secondary">
                    🇬🇧 English
                </a>
            </div>
        </div>


    </div>

</nav>

<div class="container mt-4">
    <g:layoutBody/>

</div>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<asset:javascript src="application.js"/>
</body>
</html>