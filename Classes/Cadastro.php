<?php
require_once 'usuario.php';
$u = new  usuario;
?>

<html lang="pt-br">

<head>
    <meta charset="utf-8"/>
    <title>Projeto Login</title>
    <link rel="stylesheet" href="Login.css">
</head>
<body>

<div id="corpo-form-Cad">
    <h1>Cadastrar</h1>
    <form method="POST">
        <input type="text" name="nome" placeholder="Nome Completo" maxlength="30">
        <input type="text" name="telefone" placeholder="Telefone" maxlength="30">
        <input type="email" name="email" placeholder="Usuário" maxlength="40">
        <input type="password" name="senha" placeholder="Senha" maxlength="15">
        <input type="password" name="confSenha" placeholder="Confirmar Senha" maxlength="15">
        <input type="submit" value="Cadastrar">
    </form>
</div>
<?php
if(isset($_POST['nome']))
{
    $nome = addslashes($_POST['nome']);
    $telefone = addslashes($_POST['telefone']);
    $email = addslashes($_POST['email']);
    $senha = addslashes($_POST['senha']);
    $confirmarsenha = addslashes($_POST['confSenha']);
    if(!empty($nome) && !empty($telefone) && !empty($email) && !empty($senha) && !empty($confirmarsenha))
    {
        $u->conectar("login1", "localhost", "root", "1234");
        if($u->msgErro == "")
        {
            if($senha == $confirmarsenha)
            {
                if($u-> cadastrar($nome,$telefone,$email,$senha))
                {
                    ?>
                    <div id="msg-sucesso">
                        Cadastrado Com Sucesso! Acesse Para Entrar;
                    </div>

<?php
                }
                else
                {
                    ?>
                   <div class="msg-erro">
                       Email Já Cadastrado!;
                   </div>
                    <?php
                }
            }
            else
            {
                ?>
                <div class="msg-erro">
                    Senha e Confirmar Senha Não Correspondem!;
                </div>
                <?php

            }
        }
        else
        {
            ?>
            <div class="msg-erro">
               <?php echo "Erro:".$u->msgErro;?>
            </div>
            <?php

        }
    }
    else
    {
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