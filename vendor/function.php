<?php 

   session_start();

   function listarCurso()
   {    require 'conexao.php';
       
        $sql="SELECT * FROM `curso`";
  
        $stmt=$conexao->prepare($sql);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_OBJ);
   }
   
   function listarEventos()
   {    require 'conexao.php';
       
        $sql="SELECT * FROM `admin`";
  
        $stmt=$conexao->prepare($sql);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_OBJ);
   }

   function CadastrarCursos(){
     require 'conexao.php';
          
     //Recebendo Valores do Front-End
     $curso  = $_POST['curso'];
     $imagem = $_POST['imagem'];
     $preco = $_POST['preco'];

           $sql="INSERT INTO `curso`(`nome_curso`, `avatar`, `preco`) VALUES (:nome_curso,:avatar,:preco)";
           $stmt=$conexao->prepare($sql);
           $stmt->bindValue(':nome_curso',$curso);
           $stmt->bindValue(':avatar',$imagem);
           $stmt->bindValue(':preco',$preco);
           $stmt->execute();
           header('Location:../CadastrarCurso.php');
           echo '<script>alert("Funcionário cadastrado com sucesso!");</script>';
   }

    function listarCursos()
     {    require 'conexao.php';
          
          $sql="SELECT * FROM `curso`";
     
          $stmt=$conexao->prepare($sql);
          $stmt->execute();
          return $stmt->fetchAll(PDO::FETCH_OBJ);
     }

      function CadastrarGaleria(){
     require 'conexao.php';
          
     //Recebendo Valores do Front-End
     $galeria  = $_POST['galeria'];
     $imagem = $_POST['imagem'];
     $conteudo = $_POST['conteudo'];

           $sql="INSERT INTO `galeria`(`nome_galeria`, `avatar`, `conteudo`) VALUES (:nome,:avatar,:conteudo)";
           $stmt=$conexao->prepare($sql);
           $stmt->bindValue(':nome_galeria',$galeria);
           $stmt->bindValue(':avatar',$imagem);
           $stmt->bindValue(':conteudo',$conteudo);
           $stmt->execute();
           header('Location:../CadastrarGaleria.php');
           echo '<script>alert("Funcionário cadastrado com sucesso!");</script>';
   }

    function listarGaleria()
     {    require 'conexao.php';
          
          $sql="SELECT * FROM `galeria`";
     
          $stmt=$conexao->prepare($sql);
          $stmt->execute();
          return $stmt->fetchAll(PDO::FETCH_OBJ);
     }
   
     
   

   
   
//    if (isset($_POST['cadastrarFuncionario'])) {
//      cadastrarAdmin();
//    }
//    elseif(isset($_POST['login']))
//    {
//       login(); 
//    }
//    elseif (isset($_GET['id'])) 
//    {
//      $_SESSION['curso'] = getCurso($_GET['id']);
//      print_r($_SESSION['curso']);
//      header('Location:../previews.php');
//    }
   if(isset($_POST['cadastrarCurso'])){
     CadastrarCursos();         
   }
//    else if(isset($_POST['btnEntrar'])){
//      loginAdmin();       
//    }
   if(isset($_POST['cadastrarGaleria'])){
     CadastrarGaleria();         
   }
//    else if(isset($_POST['cadastrarAula'])){
//      CadastrarAula();
//    }
  
?>