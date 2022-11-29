-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ef
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ef
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ef` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema movies
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema movies
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `movies` DEFAULT CHARACTER SET utf8mb3 ;
USE `ef` ;

-- -----------------------------------------------------
-- Table `ef`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ef`.`usuarios` (
  `idusuarios` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `correo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idusuarios`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ef`.`credenciales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ef`.`credenciales` (
  `idusuarios` INT NOT NULL,
  `correo` VARCHAR(45) NOT NULL,
  `hashedPassword` VARCHAR(64) NOT NULL,
  INDEX `fk_passwords_usuarios_idx` (`idusuarios` ASC) VISIBLE,
  CONSTRAINT `fk_passwords_usuarios`
    FOREIGN KEY (`idusuarios`)
    REFERENCES `ef`.`usuarios` (`idusuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ef`.`impresiones3d`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ef`.`impresiones3d` (
  `idImpresiones3d` INT NOT NULL,
  `densidad` INT NOT NULL,
  `grosor` VARCHAR(45) NOT NULL,
  `altura` FLOAT NOT NULL,
  `material` VARCHAR(45) NOT NULL,
  `imagen` VARCHAR(100) NOT NULL,
  `autoservicio` TINYINT(1) NOT NULL,
  `tipo` VARCHAR(45) NOT NULL,
  `tiempoDeRealizacion` FLOAT NOT NULL,
  `costo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idImpresiones3d`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ef`.`cortesLaser`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ef`.`cortesLaser` (
  `idCortesLaser` INT NOT NULL,
  `grosor` VARCHAR(45) NOT NULL,
  `color` VARCHAR(45) NOT NULL,
  `material` VARCHAR(45) NOT NULL,
  `dimensiones` VARCHAR(45) NOT NULL,
  `imagen` VARCHAR(100) NOT NULL,
  `tipo` VARCHAR(45) NOT NULL,
  `tiempoDeRealizacion` VARCHAR(45) NOT NULL,
  `costo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCortesLaser`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ef`.`escaneosDigitales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ef`.`escaneosDigitales` (
  `idEscaneosDigitales` INT NOT NULL,
  `largo` FLOAT NOT NULL,
  `ancho` FLOAT NOT NULL,
  `altura` FLOAT NOT NULL,
  `resolucion` VARCHAR(45) NOT NULL,
  `tipo` VARCHAR(45) NOT NULL,
  `tiempoDeRealizacion` FLOAT NOT NULL,
  `costo` FLOAT NOT NULL,
  PRIMARY KEY (`idEscaneosDigitales`))
ENGINE = InnoDB;

USE `movies` ;

-- -----------------------------------------------------
-- Table `movies`.`cadena`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movies`.`cadena` (
  `idcadena` INT NOT NULL,
  `razon_social` VARCHAR(45) NOT NULL,
  `nombre_comercial` VARCHAR(45) NULL DEFAULT NULL,
  `ruc` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idcadena`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `movies`.`cine`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movies`.`cine` (
  `idcine` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `idcadena` INT NOT NULL,
  PRIMARY KEY (`idcine`),
  INDEX `fk_cine_cadena1` (`idcadena` ASC) VISIBLE,
  CONSTRAINT `fk_cine_cadena1`
    FOREIGN KEY (`idcadena`)
    REFERENCES `movies`.`cadena` (`idcadena`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `movies`.`pelicula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movies`.`pelicula` (
  `idpelicula` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idpelicula`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `movies`.`cartelera`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movies`.`cartelera` (
  `idCartelera` INT NOT NULL AUTO_INCREMENT,
  `idpelicula` INT NOT NULL,
  `idcine` INT NOT NULL,
  `3d` INT NOT NULL,
  `doblada` INT NOT NULL,
  `subtitulada` INT NOT NULL,
  `horario` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`idCartelera`),
  INDEX `fk_table1_cine1` (`idcine` ASC) VISIBLE,
  INDEX `fk_table1_pelicula` (`idpelicula` ASC) VISIBLE,
  CONSTRAINT `fk_table1_cine1`
    FOREIGN KEY (`idcine`)
    REFERENCES `movies`.`cine` (`idcine`),
  CONSTRAINT `fk_table1_pelicula`
    FOREIGN KEY (`idpelicula`)
    REFERENCES `movies`.`pelicula` (`idpelicula`))
ENGINE = InnoDB
AUTO_INCREMENT = 189
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `movies`.`empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movies`.`empleado` (
  `idempleado` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NULL DEFAULT NULL,
  `dni` VARCHAR(8) NOT NULL,
  `salario` DECIMAL(8,2) NULL DEFAULT NULL,
  `fechaContrato` DATE NULL DEFAULT NULL,
  `nombreUsuario` VARCHAR(45) NULL DEFAULT NULL,
  `edad` INT NULL DEFAULT NULL,
  `activo` BIT(1) NOT NULL,
  `idcine` INT NOT NULL,
  `idjefe` INT NULL DEFAULT NULL,
  PRIMARY KEY (`idempleado`),
  INDEX `fk_empleado_cine1` (`idcine` ASC) VISIBLE,
  INDEX `fk_empleado_empleado1` (`idjefe` ASC) VISIBLE,
  CONSTRAINT `fk_empleado_cine1`
    FOREIGN KEY (`idcine`)
    REFERENCES `movies`.`cine` (`idcine`),
  CONSTRAINT `fk_empleado_empleado1`
    FOREIGN KEY (`idjefe`)
    REFERENCES `movies`.`empleado` (`idempleado`))
ENGINE = InnoDB
AUTO_INCREMENT = 171
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `movies`.`puntuacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movies`.`puntuacion` (
  `idpuntuacion` INT NOT NULL,
  `rating` INT NOT NULL,
  `idpelicula` INT NOT NULL,
  PRIMARY KEY (`idpuntuacion`),
  INDEX `fk_puntuacion_pelicula1` (`idpelicula` ASC) VISIBLE,
  CONSTRAINT `fk_puntuacion_pelicula1`
    FOREIGN KEY (`idpelicula`)
    REFERENCES `movies`.`pelicula` (`idpelicula`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `movies`.`rol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movies`.`rol` (
  `idrol` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idrol`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `movies`.`rolempleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movies`.`rolempleado` (
  `idrol` INT NOT NULL,
  `idempleado` INT NOT NULL,
  PRIMARY KEY (`idrol`, `idempleado`),
  INDEX `fk_rol_has_empleado_empleado1_idx` (`idempleado` ASC) VISIBLE,
  INDEX `fk_rol_has_empleado_rol1_idx` (`idrol` ASC) VISIBLE,
  CONSTRAINT `fk_rol_has_empleado_empleado1`
    FOREIGN KEY (`idempleado`)
    REFERENCES `movies`.`empleado` (`idempleado`),
  CONSTRAINT `fk_rol_has_empleado_rol1`
    FOREIGN KEY (`idrol`)
    REFERENCES `movies`.`rol` (`idrol`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
