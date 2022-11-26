-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cliente` (
  `idCliente` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(45) NOT NULL,
  `CPF` CHAR(11) NOT NULL,
  `Endereço` VARCHAR(45) NOT NULL,
  `Cidade` VARCHAR(45) NOT NULL,
  `Estado` CHAR(2) NOT NULL,
  `Cep` VARCHAR(45) NOT NULL,
  `Contato` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCliente`),
  UNIQUE INDEX `CPF_UNIQUE` (`CPF` ASC) VISIBLE)
ENGINE = InnoDB
COMMENT = '	';


-- -----------------------------------------------------
-- Table `mydb`.`Mecânico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Mecânico` (
  `idMecânico` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `Matrícula` VARCHAR(45) NOT NULL,
  `Endereço` VARCHAR(45) NOT NULL,
  `Cidade` VARCHAR(45) NOT NULL,
  `Estado` CHAR(2) NOT NULL,
  `Cep` VARCHAR(45) NOT NULL,
  `Contato` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idMecânico`))
ENGINE = InnoDB
COMMENT = '	';


-- -----------------------------------------------------
-- Table `mydb`.`OrdemServiço`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`OrdemServiço` (
  `idOrdemServiço` INT NOT NULL AUTO_INCREMENT,
  `DataEmissão` DATE NOT NULL,
  `ValorTotal` FLOAT NOT NULL,
  `Status` VARCHAR(45) NOT NULL,
  `DataConclusão` DATE NOT NULL,
  `Cliente_idCliente` INT NOT NULL,
  `Mecânico_idMecânico` INT NOT NULL,
  PRIMARY KEY (`idOrdemServiço`, `Cliente_idCliente`, `Mecânico_idMecânico`),
  INDEX `fk_OrdemServiço_Cliente1_idx` (`Cliente_idCliente` ASC) VISIBLE,
  INDEX `fk_OrdemServiço_Mecânico1_idx` (`Mecânico_idMecânico` ASC) VISIBLE,
  CONSTRAINT `fk_OrdemServiço_Cliente1`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `mydb`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_OrdemServiço_Mecânico1`
    FOREIGN KEY (`Mecânico_idMecânico`)
    REFERENCES `mydb`.`Mecânico` (`idMecânico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Fornecedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Fornecedor` (
  `idFornecedor` INT NOT NULL AUTO_INCREMENT,
  `RazãoSocial` VARCHAR(45) NOT NULL,
  `CNPJ` CHAR(11) NOT NULL,
  `Endereço` VARCHAR(45) NOT NULL,
  `Cidade` VARCHAR(45) NOT NULL,
  `Estado` CHAR(2) NOT NULL,
  `Cep` VARCHAR(45) NOT NULL,
  `Contato` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idFornecedor`),
  UNIQUE INDEX `CPF_UNIQUE` (`CNPJ` ASC) VISIBLE)
ENGINE = InnoDB
COMMENT = '	';


-- -----------------------------------------------------
-- Table `mydb`.`Peça`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Peça` (
  `idPeça` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(45) NOT NULL,
  `ValorUnitário` FLOAT NOT NULL,
  `Categoria` VARCHAR(45) NOT NULL,
  `Descrição` TEXT NOT NULL,
  `Fornecedor_idFornecedor` INT NOT NULL,
  PRIMARY KEY (`idPeça`, `Fornecedor_idFornecedor`),
  INDEX `fk_Peça_Fornecedor1_idx` (`Fornecedor_idFornecedor` ASC) VISIBLE,
  CONSTRAINT `fk_Peça_Fornecedor1`
    FOREIGN KEY (`Fornecedor_idFornecedor`)
    REFERENCES `mydb`.`Fornecedor` (`idFornecedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`CategoriaVeículo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CategoriaVeículo` (
  `idCategoriaVeículo` INT NOT NULL AUTO_INCREMENT,
  `NomeCategoriaVeículo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCategoriaVeículo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Veículo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Veículo` (
  `idVeículo` INT NOT NULL,
  `Modelo` VARCHAR(45) NOT NULL,
  `Marca` VARCHAR(45) NOT NULL,
  `Ano` YEAR(2) NOT NULL,
  `Categoria` VARCHAR(45) NOT NULL,
  `Cor` VARCHAR(45) NOT NULL,
  `RENAVAM` VARCHAR(45) NOT NULL,
  `Cliente_idCliente` INT NOT NULL,
  `CategoriaVeículo_idCategoriaVeículo` INT NOT NULL,
  PRIMARY KEY (`idVeículo`, `Cliente_idCliente`, `CategoriaVeículo_idCategoriaVeículo`),
  INDEX `fk_Veículo_Cliente1_idx` (`Cliente_idCliente` ASC) VISIBLE,
  INDEX `fk_Veículo_CategoriaVeículo1_idx` (`CategoriaVeículo_idCategoriaVeículo` ASC) VISIBLE,
  CONSTRAINT `fk_Veículo_Cliente1`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `mydb`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Veículo_CategoriaVeículo1`
    FOREIGN KEY (`CategoriaVeículo_idCategoriaVeículo`)
    REFERENCES `mydb`.`CategoriaVeículo` (`idCategoriaVeículo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TipoServiço`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TipoServiço` (
  `idTipoServiço` INT NOT NULL,
  `DescriçãoTipoServiço` VARCHAR(45) NOT NULL,
  `ValorMãoDeObra` FLOAT NOT NULL,
  PRIMARY KEY (`idTipoServiço`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PeçaPorOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PeçaPorOS` (
  `OrdemServiço_idOrdemServiço` INT NOT NULL,
  `Peça_idPeça` INT NOT NULL,
  `Quantidade` INT NOT NULL,
  `ValorTotalPeça` FLOAT NOT NULL,
  PRIMARY KEY (`OrdemServiço_idOrdemServiço`, `Peça_idPeça`),
  INDEX `fk_OrdemServiço_has_Peça_Peça1_idx` (`Peça_idPeça` ASC) VISIBLE,
  INDEX `fk_OrdemServiço_has_Peça_OrdemServiço1_idx` (`OrdemServiço_idOrdemServiço` ASC) VISIBLE,
  CONSTRAINT `fk_OrdemServiço_has_Peça_OrdemServiço1`
    FOREIGN KEY (`OrdemServiço_idOrdemServiço`)
    REFERENCES `mydb`.`OrdemServiço` (`idOrdemServiço`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_OrdemServiço_has_Peça_Peça1`
    FOREIGN KEY (`Peça_idPeça`)
    REFERENCES `mydb`.`Peça` (`idPeça`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TipoDeServiçoPorOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TipoDeServiçoPorOS` (
  `OrdemServiço_idOrdemServiço` INT NOT NULL,
  `TipoServiço_idTipoServiço` INT NOT NULL,
  PRIMARY KEY (`OrdemServiço_idOrdemServiço`, `TipoServiço_idTipoServiço`),
  INDEX `fk_OrdemServiço_has_TipoServiço_TipoServiço1_idx` (`TipoServiço_idTipoServiço` ASC) VISIBLE,
  INDEX `fk_OrdemServiço_has_TipoServiço_OrdemServiço1_idx` (`OrdemServiço_idOrdemServiço` ASC) VISIBLE,
  CONSTRAINT `fk_OrdemServiço_has_TipoServiço_OrdemServiço1`
    FOREIGN KEY (`OrdemServiço_idOrdemServiço`)
    REFERENCES `mydb`.`OrdemServiço` (`idOrdemServiço`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_OrdemServiço_has_TipoServiço_TipoServiço1`
    FOREIGN KEY (`TipoServiço_idTipoServiço`)
    REFERENCES `mydb`.`TipoServiço` (`idTipoServiço`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`EspecialidadeMecânico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`EspecialidadeMecânico` (
  `idEspecialidadeMecânico` INT NOT NULL,
  `TipoEspecialidade` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEspecialidadeMecânico`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`EspecialidadePorMecânico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`EspecialidadePorMecânico` (
  `Mecânico_idMecânico` INT NOT NULL,
  `EspecialidadeMecânico_idEspecialidadeMecânico` INT NOT NULL,
  PRIMARY KEY (`Mecânico_idMecânico`, `EspecialidadeMecânico_idEspecialidadeMecânico`),
  INDEX `fk_Mecânico_has_EspecialidadeMecânico_EspecialidadeMecân_idx` (`EspecialidadeMecânico_idEspecialidadeMecânico` ASC) VISIBLE,
  INDEX `fk_Mecânico_has_EspecialidadeMecânico_Mecânico1_idx` (`Mecânico_idMecânico` ASC) VISIBLE,
  CONSTRAINT `fk_Mecânico_has_EspecialidadeMecânico_Mecânico1`
    FOREIGN KEY (`Mecânico_idMecânico`)
    REFERENCES `mydb`.`Mecânico` (`idMecânico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Mecânico_has_EspecialidadeMecânico_EspecialidadeMecânico1`
    FOREIGN KEY (`EspecialidadeMecânico_idEspecialidadeMecânico`)
    REFERENCES `mydb`.`EspecialidadeMecânico` (`idEspecialidadeMecânico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
