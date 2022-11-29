<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css'/>
        <title>Lista de Servicios</title>
    </head>
    <body>

        <div class='container'>
            <div class="row mb-5 mt-4">
                <div class="col-lg-6">
                    <h1 class=''>Registrar Impresión 3D</h1>
                </div>
            </div>
            <form method="post" action="<%=request.getContextPath()%>/Inicio?action=guardarImpresion" enctype="multipart/form-data">
                <!-- Form Group (username)-->
                <div class="mb-3">
                    <input class="form-control " id="idUsuario" type="hidden"
                           name="id" value="id">
                </div>
                <div class="row mb-3">
                    <label class="col-sm-2 col-form-label"><h5>Densidad de pieza</h5>
                    </label>
                    <div class="col-sm-4">
                        <select class="form-select" aria-label="Default select example"
                                name="tipo">
                            <option selected>Seleccione...</option>
                            <option value="10">10</option>
                            <option value="15">15</option>
                            <option value="20">20</option>
                            <option value="30">30</option>
                            <option value="50">50</option>
                            <option value="90">90</option>
                        </select>
                    </div>
                </div>
                <div class="row mb-3">
                    <label class="col-sm-2 col-form-label"><h5>Grosor </h5>
                    </label>
                    <div class="col-sm-4">
                        <select class="form-select" aria-label="Default select example"
                                name="nivel">
                            <option selected>Seleccione...</option>
                            <option value="fino">fino</option>
                            <option value="normal">normal</option>
                            <option value="grueso">grueso</option>
                        </select>
                    </div>
                </div>
                <div class="row mb-3">
                    <label class="col-sm-2 col-form-label"><h5>Altura de la capa </h5>
                    </label>
                    <div class="col-sm-4">
                        <select class="form-select" aria-label="Default select example"
                                name="nivel">
                            <option selected>Seleccione...</option>
                            <option value="0.1">0.1</option>
                            <option value="0.2">0.2</option>
                            <option value="0.3">0.3</option>
                            <option value="0.4">0.4</option>

                        </select>
                    </div>
                </div>
                <div class="row mb-3">
                    <label class="col-sm-2 col-form-label"><h5>Material </h5>
                    </label>
                    <div class="col-sm-4">
                        <select class="form-select" aria-label="Default select example"
                                name="nivel">
                            <option selected>Seleccione...</option>
                            <option value="abs">abs</option>
                            <option value="pla">pla</option>
                            <option value="flexible">flexible</option>
                        </select>
                    </div>
                </div>

                <div class="form-group mb-3">
                    <label for="exampleFormControlTextarea1">Url de la imagen:</label>
                    <textarea class="form-control" id="exampleFormControlTextarea1"
                              rows="1" name="descripcion"></textarea>
                </div>
                <div class="row mb-3">
                    <label class="col-sm-2 col-form-label"><h5>Autoservicio </h5>
                    </label>
                    <div class="col-sm-4">
                        <select class="form-select" aria-label="Default select example"
                                name="nivel">
                            <option selected>Seleccione...</option>
                            <option value="Si">Si</option>
                            <option value="No">No</option>
                        </select>
                    </div>
                </div>

                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                    <button type="submit" class="btn btn-primary">Guardar
                    </button>
                    <button class="btn btn-primary"
                            href="<%=request.getContextPath()%>/Inicio">Cancelar
                    </button>
                </div>
            </form>

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
    </body>
</html>