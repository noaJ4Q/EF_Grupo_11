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
                    <h1 class=''>Registrar Corte Laser</h1>
                </div>
            </div>
            <form method="post" action="<%=request.getContextPath()%>/Inicio?action=guardarCorteLaser" enctype="multipart/form-data">
                <!-- Form Group (username)-->
                <div class="mb-3">
                    <input class="form-control " id="idUsuario" type="hidden"
                           name="id" value="id">
                </div>
                <div class="row mb-3">
                    <label class="col-sm-2 col-form-label"><h5>Grosor de Linea</h5>
                    </label>
                    <div class="col-sm-4">
                        <select class="form-select" aria-label="Default select example"
                                name="nivel">
                            <option selected>Seleccione...</option>
                            <option value="fino">fino</option>
                            <option value="grueso">grueso</option>
                        </select>
                    </div>
                </div>
                <div class="row mb-3">
                    <label class="col-sm-2 col-form-label"><h5>Color de Linea</h5>
                    </label>
                    <div class="col-sm-4">
                        <select class="form-select" aria-label="Default select example"
                                name="tipo">
                            <option selected>Seleccione...</option>
                            <option value="rojo">rojo</option>
                            <option value="negro">negro</option>
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
                            <option value="acrilico">acrilico</option>
                            <option value="mdf">mdf</option>
                            <option value="carton">carton</option>
                        </select>
                    </div>
                </div>
                <div class="mb-3">
                    <label for="alto">Dimension alto: </label>
                    <input class="form-control " id="alto" type="text"
                           name="alto">
                </div>
                <div class="mb-3">
                    <label for="ancho">Dimension ancho: </label>
                    <input class="form-control " id="ancho" type="text"
                           name="ancho">
                </div>

                <div class="form-group mb-3">
                    <label for="exampleFormControlTextarea1">Url de la imagen:</label>
                    <textarea class="form-control" id="exampleFormControlTextarea1"
                              rows="1" name="descripcion"></textarea>
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