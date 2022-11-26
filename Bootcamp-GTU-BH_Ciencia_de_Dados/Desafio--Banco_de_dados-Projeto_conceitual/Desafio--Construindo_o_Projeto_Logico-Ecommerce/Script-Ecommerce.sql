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
-- Table `mydb`.`TipoPessoa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`TipoPessoa` ;

CREATE TABLE IF NOT EXISTS `mydb`.`TipoPessoa` (
  `idTipoPessoa` INT NOT NULL AUTO_INCREMENT,
  `Tipo` CHAR(2) NOT NULL,
  `Identificação` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTipoPessoa`),
  UNIQUE INDEX `Identificação_UNIQUE` (`Identificação` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cliente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Cliente` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Cliente` (
  `idCliente` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(45) NOT NULL,
  `Sobrenome` VARCHAR(45) NOT NULL,
  `DataNascimento` DATE NOT NULL,
  `Endereço` VARCHAR(45) NOT NULL,
  `Cidade` VARCHAR(45) NOT NULL,
  `Estado` CHAR(2) NOT NULL,
  `Cep` VARCHAR(45) NOT NULL,
  `Contato` VARCHAR(45) NOT NULL,
  `TipoPessoa_idTipoPessoa` INT NOT NULL,
  PRIMARY KEY (`idCliente`, `TipoPessoa_idTipoPessoa`),
  INDEX `fk_Cliente_TipoPessoa1_idx` (`TipoPessoa_idTipoPessoa` ASC) VISIBLE,
  CONSTRAINT `fk_Cliente_TipoPessoa1`
    FOREIGN KEY (`TipoPessoa_idTipoPessoa`)
    REFERENCES `mydb`.`TipoPessoa` (`idTipoPessoa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`StatusPedido`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`StatusPedido` ;

CREATE TABLE IF NOT EXISTS `mydb`.`StatusPedido` (
  `idStatusPedido` INT NOT NULL AUTO_INCREMENT,
  `Situação` ENUM("Em Andamento", "Processando", "Enviado", "Entregue") NOT NULL,
  PRIMARY KEY (`idStatusPedido`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`FormaPagamento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`FormaPagamento` ;

CREATE TABLE IF NOT EXISTS `mydb`.`FormaPagamento` (
  `idFormaPagamento` INT NOT NULL,
  `FormaPagamento` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idFormaPagamento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pedido`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Pedido` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Pedido` (
  `idPedido` INT NOT NULL AUTO_INCREMENT,
  `Cliente_idCliente` INT NOT NULL,
  `ValorTotalPedido` FLOAT NOT NULL,
  `StatusPedido_idStatusPedido` INT NOT NULL,
  `FormaPagamento_idFormaPagamento` INT NOT NULL,
  PRIMARY KEY (`idPedido`, `Cliente_idCliente`, `StatusPedido_idStatusPedido`, `FormaPagamento_idFormaPagamento`),
  INDEX `fk_Pedido_Cliente1_idx` (`Cliente_idCliente` ASC) VISIBLE,
  INDEX `fk_Pedido_StatusPedido1_idx` (`StatusPedido_idStatusPedido` ASC) VISIBLE,
  INDEX `fk_Pedido_FormaPagamento1_idx` (`FormaPagamento_idFormaPagamento` ASC) VISIBLE,
  CONSTRAINT `fk_Pedido_Cliente1`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `mydb`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedido_StatusPedido1`
    FOREIGN KEY (`StatusPedido_idStatusPedido`)
    REFERENCES `mydb`.`StatusPedido` (`idStatusPedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedido_FormaPagamento1`
    FOREIGN KEY (`FormaPagamento_idFormaPagamento`)
    REFERENCES `mydb`.`FormaPagamento` (`idFormaPagamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Produto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Produto` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Produto` (
  `idProduto` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(45) NOT NULL,
  `Categoria` VARCHAR(45) NOT NULL,
  `Descrição` VARCHAR(45) NULL,
  `ValorUnitário` FLOAT GENERATED ALWAYS AS () VIRTUAL,
  PRIMARY KEY (`idProduto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Fornecedor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Fornecedor` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Fornecedor` (
  `idFornecedor` INT NOT NULL AUTO_INCREMENT,
  `RazãoSocial` VARCHAR(45) NOT NULL,
  `CNPJ` VARCHAR(45) NOT NULL,
  `Endereço` VARCHAR(45) NOT NULL,
  `Cidade` VARCHAR(45) NOT NULL,
  `Estado` VARCHAR(45) NOT NULL,
  `Contato` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idFornecedor`),
  UNIQUE INDEX `CNPJ_UNIQUE` (`CNPJ` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ProdutoPorFornecedor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`ProdutoPorFornecedor` ;

CREATE TABLE IF NOT EXISTS `mydb`.`ProdutoPorFornecedor` (
  `Produto_idProduto` INT NOT NULL,
  `Fornecedor_idFornecedor` INT NOT NULL,
  `QuantidadeMáxima` INT NOT NULL,
  PRIMARY KEY (`Produto_idProduto`, `Fornecedor_idFornecedor`),
  INDEX `fk_Produto_has_Fornecedor_Fornecedor1_idx` (`Fornecedor_idFornecedor` ASC) VISIBLE,
  INDEX `fk_Produto_has_Fornecedor_Produto_idx` (`Produto_idProduto` ASC) VISIBLE,
  CONSTRAINT `fk_Produto_has_Fornecedor_Produto`
    FOREIGN KEY (`Produto_idProduto`)
    REFERENCES `mydb`.`Produto` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Produto_has_Fornecedor_Fornecedor1`
    FOREIGN KEY (`Fornecedor_idFornecedor`)
    REFERENCES `mydb`.`Fornecedor` (`idFornecedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Estoque`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Estoque` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Estoque` (
  `idEstoque` INT NOT NULL AUTO_INCREMENT,
  `Local` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEstoque`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`QuantidadeEmEstoque`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`QuantidadeEmEstoque` ;

CREATE TABLE IF NOT EXISTS `mydb`.`QuantidadeEmEstoque` (
  `Produto_idProduto` INT NOT NULL,
  `Estoque_idEstoque` INT NOT NULL,
  `Quantidade` INT NOT NULL,
  PRIMARY KEY (`Produto_idProduto`, `Estoque_idEstoque`),
  INDEX `fk_Produto_has_Estoque_Estoque1_idx` (`Estoque_idEstoque` ASC) VISIBLE,
  INDEX `fk_Produto_has_Estoque_Produto1_idx` (`Produto_idProduto` ASC) VISIBLE,
  CONSTRAINT `fk_Produto_has_Estoque_Produto1`
    FOREIGN KEY (`Produto_idProduto`)
    REFERENCES `mydb`.`Produto` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Produto_has_Estoque_Estoque1`
    FOREIGN KEY (`Estoque_idEstoque`)
    REFERENCES `mydb`.`Estoque` (`idEstoque`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ProdutoPorPedido`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`ProdutoPorPedido` ;

CREATE TABLE IF NOT EXISTS `mydb`.`ProdutoPorPedido` (
  `Produto_idProduto` INT NOT NULL,
  `Pedido_idPedido` INT NOT NULL,
  `Quantidade` FLOAT NOT NULL,
  PRIMARY KEY (`Produto_idProduto`, `Pedido_idPedido`),
  INDEX `fk_Produto_has_Pedido_Pedido1_idx` (`Pedido_idPedido` ASC) VISIBLE,
  INDEX `fk_Produto_has_Pedido_Produto1_idx` (`Produto_idProduto` ASC) VISIBLE,
  CONSTRAINT `fk_Produto_has_Pedido_Produto1`
    FOREIGN KEY (`Produto_idProduto`)
    REFERENCES `mydb`.`Produto` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Produto_has_Pedido_Pedido1`
    FOREIGN KEY (`Pedido_idPedido`)
    REFERENCES `mydb`.`Pedido` (`idPedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`VendedorTerceiro`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`VendedorTerceiro` ;

CREATE TABLE IF NOT EXISTS `mydb`.`VendedorTerceiro` (
  `idVendedorTerceiro` INT NOT NULL,
  `RazãoSocial` VARCHAR(45) NOT NULL,
  `CNPJ` VARCHAR(45) NOT NULL,
  `Endereço` VARCHAR(45) NOT NULL,
  `Cidade` VARCHAR(45) NOT NULL,
  `Estado` VARCHAR(45) NOT NULL,
  `Contato` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idVendedorTerceiro`),
  UNIQUE INDEX `CNPJ_UNIQUE` (`CNPJ` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ProdutoPorVendedorTerceiro`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`ProdutoPorVendedorTerceiro` ;

CREATE TABLE IF NOT EXISTS `mydb`.`ProdutoPorVendedorTerceiro` (
  `VendedorTerceiro_idVendedorTerceiro` INT NOT NULL,
  `Produto_idProduto` INT NOT NULL,
  `QuantidadeMáxima` INT NOT NULL,
  PRIMARY KEY (`VendedorTerceiro_idVendedorTerceiro`, `Produto_idProduto`),
  INDEX `fk_VendedorTerceiro_has_Produto_Produto1_idx` (`Produto_idProduto` ASC) VISIBLE,
  INDEX `fk_VendedorTerceiro_has_Produto_VendedorTerceiro1_idx` (`VendedorTerceiro_idVendedorTerceiro` ASC) VISIBLE,
  CONSTRAINT `fk_VendedorTerceiro_has_Produto_VendedorTerceiro1`
    FOREIGN KEY (`VendedorTerceiro_idVendedorTerceiro`)
    REFERENCES `mydb`.`VendedorTerceiro` (`idVendedorTerceiro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_VendedorTerceiro_has_Produto_Produto1`
    FOREIGN KEY (`Produto_idProduto`)
    REFERENCES `mydb`.`Produto` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`EntregaPedidosPagos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`EntregaPedidosPagos` ;

CREATE TABLE IF NOT EXISTS `mydb`.`EntregaPedidosPagos` (
  `CódigoRastreamento` CHAR(13) NOT NULL,
  `Pedido_idPedido` INT NOT NULL,
  `DataLimite` DATE NOT NULL,
  `StatusEntrega` VARCHAR(45) NOT NULL,
  `ValorFrete` FLOAT NOT NULL,
  PRIMARY KEY (`CódigoRastreamento`, `Pedido_idPedido`),
  INDEX `fk_Entrega_Pedido1_idx` (`Pedido_idPedido` ASC) VISIBLE,
  CONSTRAINT `fk_Entrega_Pedido1`
    FOREIGN KEY (`Pedido_idPedido`)
    REFERENCES `mydb`.`Pedido` (`idPedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`FormaPagamentoCliente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`FormaPagamentoCliente` ;

CREATE TABLE IF NOT EXISTS `mydb`.`FormaPagamentoCliente` (
  `Cliente_idCliente` INT NOT NULL,
  `FormaPagamento_idFormaPagamento` INT NOT NULL,
  `NomeCartão` VARCHAR(45) NULL,
  `NúmeroCartão` VARCHAR(45) NULL,
  `ValidadeCartão` VARCHAR(45) NULL,
  `CódigoSegurançaCartão` VARCHAR(45) NULL,
  PRIMARY KEY (`Cliente_idCliente`, `FormaPagamento_idFormaPagamento`),
  INDEX `fk_Cliente_has_FormaPagamento_FormaPagamento1_idx` (`FormaPagamento_idFormaPagamento` ASC) VISIBLE,
  INDEX `fk_Cliente_has_FormaPagamento_Cliente1_idx` (`Cliente_idCliente` ASC) VISIBLE,
  CONSTRAINT `fk_Cliente_has_FormaPagamento_Cliente1`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `mydb`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cliente_has_FormaPagamento_FormaPagamento1`
    FOREIGN KEY (`FormaPagamento_idFormaPagamento`)
    REFERENCES `mydb`.`FormaPagamento` (`idFormaPagamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
