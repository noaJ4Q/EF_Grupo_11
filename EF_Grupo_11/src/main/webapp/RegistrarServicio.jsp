<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css'/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

        <title>Número de Contratos</title>
    </head>
    <body>

        <div class='container'>
            <div class="row mb-5 mt-4">
                <div class="col-lg-6">
                    <h1 class=''>Registrar Servicio</h1>
                </div>
            </div>
            <div class="d-grid gap-2 col-6 mx-auto">


                <div class="row ">
                    <div class="col-12">
                        <br>
                        <div>
                            <a href="<%=request.getContextPath()%>/Inicio?action=registrarImpresion3D"><button class="btn btn-primary" type="button" >Registrar Impresión 3D</button>
                            </a>
                        </div>

                    </div>
                    <div class="col-12">

                        <br>
                        <div>
                            <a href="<%=request.getContextPath()%>/Inicio?action=registrarCorteLaser"><button class="btn btn-primary" type="button" >Registrar Corte Laser</button>
                            </a>
                        </div>

                    </div>
                    <div class="col-12">

                        <br>
                        <div>
                            <a href="<%=request.getContextPath()%>/Inicio?action=registrarEscaneo3D"><button class="btn btn-primary" type="button" >Registrar Escaneo Digital 3D</button>
                            </a>
                        </div>

                    </div>
                </div>


        </div>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
                integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
                crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
                integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
                crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
                integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
                crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

    </body>
</html>