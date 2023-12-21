<?php
require_once 'usuario.php';
$u = new usuario;
?>

<html lang="pt-br">
    <link href="img/Giavi.ico" rel="shortcut icon"/>


<head>
    <meta charset="utf-8"/>
    <title>Projeto Login</title>
    <link rel="stylesheet" href="Login.css">
</head>
<body>

<div id="corpo-form">
    <h1>Entrar</h1>
    <form method="POST">
        <input type="email" placeholder="Usuário" name="email">
        <input type="password" placeholder="Senha" name="senha">
        <input type="submit" value="Acessar">
    </form>
</div>
<?php
if(isset($_POST['email'])) {
    $email = addslashes($_POST['email']);
    $senha = addslashes($_POST['senha']);
    if (!empty($email) && !empty($senha)) {
        $u->conectar("login1", "localhost", "root", "");
        if ($u->msgErro == "") {

            if ($u->logar($email, $senha)) {
                header("location: HomeAdmin.php");
            } else {
                ?>
                <div class="msg-erro">
                    Email e/ou Senha Estão Incorrectos!;
                </div>

                <?php
            }
        } else {
            ?>
            <div class="msg-erro">
                <?php echo "Erro:" . $u->msgErro; ?>
            </div>
            <?php

        }
    } else {
        ?>
        <div class="msg-erro">
            Preencha todos os campos!;
        </div>
        <?php

    }
}

?>
</body>
</html>


