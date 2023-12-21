<?php
include "header.php";
 require "vendor/function.php";

 $galeria=listarGaleria();
?>
<body>

<body>


<!-- Blog section -->
<section class="blog-section spad">
    <div class="container">
        <div class="section-title text-center">
            <h3>NOTÍCIAS RECENTES</h3>
                <p>Pegue As Notícias Recentes & As Histórias do Dia</p>
        </div>
        <div class="row">
             <?php  foreach ($galeria as $key => $value) {?>
            <div class="col-xl-6">
                <div class="blog-item">
                    <div <img src="pp/<?= $value->avatar?>" alt=""></div>
                    <div class="blog-content">
                        <h4><span>  <?php print_r($value->nome)?></span></h4>
                        <div class="blog-meta">
                            <span><i class="fa fa-calendar-o"></i> 27 May 2022</span>
                            <span><i class="fa fa-user"></i> Owen Fábio</span>
                        </div>
                        <p><?php print_r($value->conteudo)?></p>
                    </div>
                </div>
                <?php  } ?>
            </div>
</section>
<!-- Blog section -->



<?php
include "footer.php"
?>

</body>
</html>
