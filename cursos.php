<?php
include "header.php";
 require "vendor/function.php";

 $cursos=listarCurso();
?>
<body>
		
<!-- Courses section nome_curso -->
    <section class="courses-section spad">
        <div class="container">
            <div class="section-title text-center">
                <h3>CURSOS DISPONÍVEIS </h3>
                <p>Os Melhores Cursos para o seu filho estão aqui</p>
            </div>
            <div class="row">
                <!-- course item -->
                 <?php  foreach ($cursos as $key => $value) {?>
                     
                  <div class="col-lg-4 col-md-6 course-item">
                    <div class="course-thumb">
                        <img src="pp/<?= $value->avatar?>" alt="">
                        <div class="course-cat">
                            <span>  <?php print_r($value->nome_curso)?></span>
                        </div>
                    </div>
                    <div class="course-info">
                        
                        <h4>Prepare-se<br> Para o Mundo Novo </h4>
                        <h4 class="cource-price"><?php print_r($value->preco.' AKZ')?><span>/Mês</span></h4>
                    </div>
                </div>
                 <?php  } ?>
            </div>
        </div>
    </div>
    </section>


<?php 
 include "footer.php"
?>
</body>
</html>