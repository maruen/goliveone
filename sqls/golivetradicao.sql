SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `golivetradicao` ;
CREATE SCHEMA IF NOT EXISTS `golivetradicao` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;

USE `golivetradicao` ;

-- -----------------------------------------------------
-- Table `golivetradicao`.`tbTipoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbTipoProduto` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbTipoProduto` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `TipoProduto` VARCHAR(45) NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;


CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetradicao`.`tbTipoProduto` (`Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbAuditoria`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbAuditoria` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbAuditoria` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `FormularioNome` VARCHAR(120) NOT NULL,
  `AcaoUsuario` VARCHAR(2500) NOT NULL,
  `Observacao` VARCHAR(2500) NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;


CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetradicao`.`tbAuditoria` (`Id` ASC);


-- -----------------------------------------------------
-- Table `golivetradicao`.`tbAuditoriaItem`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbAuditoriaItem` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbAuditoriaItem` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `Campo` VARCHAR(2500) NOT NULL,
  `InformacaoAnterior` VARCHAR(2500) NOT NULL,
  `InformacaoAtual` VARCHAR(2500) NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;


CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetradicao`.`tbAuditoriaItem` (`Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbAuditoria_tbTipoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbAuditoria_tbTipoProduto` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbAuditoria_tbTipoProduto` (
  `tbAuditoria_Id` INT ZEROFILL UNSIGNED NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT ZEROFILL UNSIGNED NOT NULL,
  `tbTipoProduto_Id` INT ZEROFILL UNSIGNED NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbTipoProduto_Id`),
  CONSTRAINT `FK_tbAuditoria0010`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golivetradicao`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbTipoProduto0002`
    FOREIGN KEY (`tbTipoProduto_Id`)
    REFERENCES `golivetradicao`.`tbTipoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0024`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0020`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golivetradicao`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golivetradicao`.`tbAuditoria_tbTipoProduto` (`tbAuditoriaItem_Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbFinalidadeCodigoBarrasProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbFinalidadeCodigoBarrasProduto` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbFinalidadeCodigoBarrasProduto` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `FinalidadeCodigoBarrasProduto` VARCHAR(45) NOT NULL,
  `ApresentacaoSistemaLookupPesquisas` BIT NOT NULL,
  `ApresentacaoSistemaGridPesquisas` BIT NOT NULL,
  `ApresentacaoSistemaRelatoriosCadastrais` BIT NOT NULL,
  `ApresentacaoSistemaGraficosCadastrais` BIT NOT NULL,
  `ApresentacaoVendasGraficos` BIT NOT NULL,
  `ApresentacaoVendasPesquisas` BIT NOT NULL,
  `ApresentacaoVendasRelatorios` BIT NOT NULL,
  `ApresentacaoVendasOrcamentos` BIT NOT NULL,
  `ApresentacaoVendasPedidosVenda` BIT NOT NULL,
  `ApresentacaoVendasDAV` BIT NOT NULL,
  `ApresentacaoComprasGraficos` BIT NOT NULL,
  `ApresentacaoComprasPesquisas` BIT NOT NULL,
  `ApresentacaoComprasRelatorios` BIT NOT NULL,
  `ApresentacaoComprasCotacoes` BIT NOT NULL,
  `ApresentacaoComprasPedidosCompra` BIT NOT NULL,
  `ApresentacaoComprasEntradasNFeCompra` BIT NOT NULL,
  `ApresentacaoFaturamentoVendaCumpomFiscal` BIT NOT NULL,
  `ApresentacaoFaturamentoVendaNFCe` BIT NOT NULL,
  `ApresentacaoFaturamentoVendaNFe` BIT NOT NULL,
  `ApresentacaoFaturamentoVendaNFSe` BIT NOT NULL,
  `ApresentacaoFaturamentoCompraNFeCompra` BIT NOT NULL,
  `ApresentacaoFaturamentoCompraNFeDevolucao` BIT NOT NULL,
  `ApresentacaoFaturamentoCompraNFeBeneficiamento` BIT NOT NULL,
  `AplicacaoSistemaLookupPesquisas` BIT NOT NULL,
  `AplicacaoSistemaGirdPesquisas` BIT NOT NULL,
  `AplicacaoSistemaRelatoriosCadastrais` BIT NOT NULL,
  `AplicacaoSistemaGraficosCadastrais` BIT NOT NULL,
  `AplicacaoVendasGraficos` BIT NOT NULL,
  `AplicacaoVendasPesquisas` BIT NOT NULL,
  `AplicacaoVendasRelatorios` BIT NOT NULL,
  `AplicacaoVendasOrcamentos` BIT NOT NULL,
  `AplicacaoVendasPedidosDeVenda` BIT NOT NULL,
  `AplicacaoVendasDAV` BIT NOT NULL,
  `AplicacaoComprasGraficos` BIT NOT NULL,
  `AplicacaoComprasPesquisas` BIT NOT NULL,
  `AplicacaoComprasRelatorios` BIT NOT NULL,
  `AplicacaoComprasCotacoes` BIT NOT NULL,
  `AplicacaoComprasPedidosCompra` BIT NOT NULL,
  `AplicacaoComprasEntradasNFeCompra` BIT NOT NULL,
  `AplicacaoFaturamentoVendaCupomFiscal` BIT NOT NULL,
  `AplicacaoFaturamentoVendaNFCe` BIT NOT NULL,
  `AplicacaoFaturamentoVendaNFe` BIT NOT NULL,
  `AplicacaoFaturamentoVendaNFSe` BIT NOT NULL,
  `AplicacaoFaturamentoCompraNFeCompra` BIT NOT NULL,
  `AplicacaoFaturamentoCompraNFeDevolucao` BIT NOT NULL,
  `AplicacaoFaturamentoCompraNFeBeneficiamento` BIT NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;


CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetradicao`.`tbFinalidadeCodigoBarrasProduto` (`Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbAuditoria_tbFinalidadeCodigoBarrasProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbAuditoria_tbFinalidadeCodigoBarrasProduto` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbAuditoria_tbFinalidadeCodigoBarrasProduto` (
  `tbAuditoria_Id` INT ZEROFILL UNSIGNED NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT ZEROFILL UNSIGNED NOT NULL,
  `tbFinalidadeCodigoBarrasProduto_Id` INT ZEROFILL UNSIGNED NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbFinalidadeCodigoBarrasProduto_Id`),
  CONSTRAINT `FK_tbAuditoria0020`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golivetradicao`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbFinalidadeCodigoBarrasProduto0003`
    FOREIGN KEY (`tbFinalidadeCodigoBarrasProduto_Id`)
    REFERENCES `golivetradicao`.`tbFinalidadeCodigoBarrasProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0034`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0030`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golivetradicao`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golivetradicao`.`tbAuditoria_tbFinalidadeCodigoBarrasProduto` (`tbAuditoriaItem_Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbAuditoria_tbUnidade`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbAuditoria_tbUnidade` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbAuditoria_tbUnidade` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUnidade_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbUnidade_Id`),
  CONSTRAINT `FK_tbAuditoria0009`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golivetradicao`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUnidade0006`
    FOREIGN KEY (`tbUnidade_Id`)
    REFERENCES `golivetradicao`.`tbUnidade` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0023`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0019`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golivetradicao`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golivetradicao`.`tbAuditoria_tbUnidade` (`tbAuditoriaItem_Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbFinalidadePadraoEspessuraProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbFinalidadePadraoEspessuraProduto` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbFinalidadePadraoEspessuraProduto` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `FinalidadePadraoEspessuraProduto` VARCHAR(45) NOT NULL,
  `ApresentacaoSistemaLookupPesquisas` BIT NOT NULL,
  `ApresentacaoSistemaGridPesquisas` BIT NOT NULL,
  `ApresentacaoSistemaRelatoriosCadastrais` BIT NOT NULL,
  `ApresentacaoSistemaGraficosCadastrais` BIT NOT NULL,
  `ApresentacaoVendasGraficos` BIT NOT NULL,
  `ApresentacaoVendasPesquisas` BIT NOT NULL,
  `ApresentacaoVendasRelatorios` BIT NOT NULL,
  `ApresentacaoVendasOrcamentos` BIT NOT NULL,
  `ApresentacaoVendasPedidosVenda` BIT NOT NULL,
  `ApresentacaoVendasDAV` BIT NOT NULL,
  `ApresentacaoComprasGraficos` BIT NOT NULL,
  `ApresentacaoComprasPesquisas` BIT NOT NULL,
  `ApresentacaoComprasRelatorios` BIT NOT NULL,
  `ApresentacaoComprasCotacoes` BIT NOT NULL,
  `ApresentacaoComprasPedidosCompra` BIT NOT NULL,
  `ApresentacaoComprasEntradasNFeCompra` BIT NOT NULL,
  `ApresentacaoFaturamentoVendaCumpomFiscal` BIT NOT NULL,
  `ApresentacaoFaturamentoVendaNFCe` BIT NOT NULL,
  `ApresentacaoFaturamentoVendaNFe` BIT NOT NULL,
  `ApresentacaoFaturamentoVendaNFSe` BIT NOT NULL,
  `ApresentacaoFaturamentoCompraNFeCompra` BIT NOT NULL,
  `ApresentacaoFaturamentoCompraNFeDevolucao` BIT NOT NULL,
  `ApresentacaoFaturamentoCompraNFeBeneficiamento` BIT NOT NULL,
  `AplicacaoSistemaLookupPesquisas` BIT NOT NULL,
  `AplicacaoSistemaGirdPesquisas` BIT NOT NULL,
  `AplicacaoSistemaRelatoriosCadastrais` BIT NOT NULL,
  `AplicacaoSistemaGraficosCadastrais` BIT NOT NULL,
  `AplicacaoVendasGraficos` BIT NOT NULL,
  `AplicacaoVendasPesquisas` BIT NOT NULL,
  `AplicacaoVendasRelatorios` BIT NOT NULL,
  `AplicacaoVendasOrcamentos` BIT NOT NULL,
  `AplicacaoVendasPedidosDeVenda` BIT NOT NULL,
  `AplicacaoVendasDAV` BIT NOT NULL,
  `AplicacaoComprasGraficos` BIT NOT NULL,
  `AplicacaoComprasPesquisas` BIT NOT NULL,
  `AplicacaoComprasRelatorios` BIT NOT NULL,
  `AplicacaoComprasCotacoes` BIT NOT NULL,
  `AplicacaoComprasPedidosCompra` BIT NOT NULL,
  `AplicacaoComprasEntradasNFeCompra` BIT NOT NULL,
  `AplicacaoFaturamentoVendaCupomFiscal` BIT NOT NULL,
  `AplicacaoFaturamentoVendaNFCe` BIT NOT NULL,
  `AplicacaoFaturamentoVendaNFe` BIT NOT NULL,
  `AplicacaoFaturamentoVendaNFSe` BIT NOT NULL,
  `AplicacaoFaturamentoCompraNFeCompra` BIT NOT NULL,
  `AplicacaoFaturamentoCompraNFeDevolucao` BIT NOT NULL,
  `AplicacaoFaturamentoCompraNFeBeneficiamento` BIT NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;


CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetradicao`.`tbFinalidadePadraoEspessuraProduto` (`Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbFinalidadePadraoEspessuraProduto_tbUnidade`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbFinalidadePadraoEspessuraProduto_tbUnidade` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbFinalidadePadraoEspessuraProduto_tbUnidade` (
  `tbFinalidadePadraoEspessuraProduto_Id` INT UNSIGNED NOT NULL,
  `tbUnidade_Id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`tbFinalidadePadraoEspessuraProduto_Id`, `tbUnidade_Id`),
  CONSTRAINT `FK_tbFinalidadePadraoEspessuraProduto0001`
    FOREIGN KEY (`tbFinalidadePadraoEspessuraProduto_Id`)
    REFERENCES `golivetradicao`.`tbFinalidadePadraoEspessuraProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUnidade0002`
    FOREIGN KEY (`tbUnidade_Id`)
    REFERENCES `golivetradicao`.`tbUnidade` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE UNIQUE INDEX `tbFinalidadePadraoEspessuraProduto_Id_UNIQUE` ON `golivetradicao`.`tbFinalidadePadraoEspessuraProduto_tbUnidade` (`tbFinalidadePadraoEspessuraProduto_Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbFinalidadePadraoLarguraProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbFinalidadePadraoLarguraProduto` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbFinalidadePadraoLarguraProduto` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `FinalidadePadraoLarguraProduto` VARCHAR(45) NOT NULL,
  `ApresentacaoSistemaLookupPesquisas` BIT NOT NULL,
  `ApresentacaoSistemaGridPesquisas` BIT NOT NULL,
  `ApresentacaoSistemaRelatoriosCadastrais` BIT NOT NULL,
  `ApresentacaoSistemaGraficosCadastrais` BIT NOT NULL,
  `ApresentacaoVendasGraficos` BIT NOT NULL,
  `ApresentacaoVendasPesquisas` BIT NOT NULL,
  `ApresentacaoVendasRelatorios` BIT NOT NULL,
  `ApresentacaoVendasOrcamentos` BIT NOT NULL,
  `ApresentacaoVendasPedidosVenda` BIT NOT NULL,
  `ApresentacaoVendasDAV` BIT NOT NULL,
  `ApresentacaoComprasGraficos` BIT NOT NULL,
  `ApresentacaoComprasPesquisas` BIT NOT NULL,
  `ApresentacaoComprasRelatorios` BIT NOT NULL,
  `ApresentacaoComprasCotacoes` BIT NOT NULL,
  `ApresentacaoComprasPedidosCompra` BIT NOT NULL,
  `ApresentacaoComprasEntradasNFeCompra` BIT NOT NULL,
  `ApresentacaoFaturamentoVendaCumpomFiscal` BIT NOT NULL,
  `ApresentacaoFaturamentoVendaNFCe` BIT NOT NULL,
  `ApresentacaoFaturamentoVendaNFe` BIT NOT NULL,
  `ApresentacaoFaturamentoVendaNFSe` BIT NOT NULL,
  `ApresentacaoFaturamentoCompraNFeCompra` BIT NOT NULL,
  `ApresentacaoFaturamentoCompraNFeDevolucao` BIT NOT NULL,
  `ApresentacaoFaturamentoCompraNFeBeneficiamento` BIT NOT NULL,
  `AplicacaoSistemaLookupPesquisas` BIT NOT NULL,
  `AplicacaoSistemaGirdPesquisas` BIT NOT NULL,
  `AplicacaoSistemaRelatoriosCadastrais` BIT NOT NULL,
  `AplicacaoSistemaGraficosCadastrais` BIT NOT NULL,
  `AplicacaoVendasGraficos` BIT NOT NULL,
  `AplicacaoVendasPesquisas` BIT NOT NULL,
  `AplicacaoVendasRelatorios` BIT NOT NULL,
  `AplicacaoVendasOrcamentos` BIT NOT NULL,
  `AplicacaoVendasPedidosDeVenda` BIT NOT NULL,
  `AplicacaoVendasDAV` BIT NOT NULL,
  `AplicacaoComprasGraficos` BIT NOT NULL,
  `AplicacaoComprasPesquisas` BIT NOT NULL,
  `AplicacaoComprasRelatorios` BIT NOT NULL,
  `AplicacaoComprasCotacoes` BIT NOT NULL,
  `AplicacaoComprasPedidosCompra` BIT NOT NULL,
  `AplicacaoComprasEntradasNFeCompra` BIT NOT NULL,
  `AplicacaoFaturamentoVendaCupomFiscal` BIT NOT NULL,
  `AplicacaoFaturamentoVendaNFCe` BIT NOT NULL,
  `AplicacaoFaturamentoVendaNFe` BIT NOT NULL,
  `AplicacaoFaturamentoVendaNFSe` BIT NOT NULL,
  `AplicacaoFaturamentoCompraNFeCompra` BIT NOT NULL,
  `AplicacaoFaturamentoCompraNFeDevolucao` BIT NOT NULL,
  `AplicacaoFaturamentoCompraNFeBeneficiamento` BIT NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;


CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetradicao`.`tbFinalidadePadraoLarguraProduto` (`Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbFinalidadePadraoLarguraProduto_tbUnidade`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbFinalidadePadraoLarguraProduto_tbUnidade` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbFinalidadePadraoLarguraProduto_tbUnidade` (
  `tbFinalidadePadraoLarguraProduto_Id` INT UNSIGNED NOT NULL,
  `tbUnidade_Id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`tbFinalidadePadraoLarguraProduto_Id`, `tbUnidade_Id`),
  CONSTRAINT `FK_tbFinalidadePadraoLarguraProduto0001`
    FOREIGN KEY (`tbFinalidadePadraoLarguraProduto_Id`)
    REFERENCES `golivetradicao`.`tbFinalidadePadraoLarguraProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUnidade0003`
    FOREIGN KEY (`tbUnidade_Id`)
    REFERENCES `golivetradicao`.`tbUnidade` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE UNIQUE INDEX `tbFinalidadeCodigoBarrasProduto_Id_UNIQUE` ON `golivetradicao`.`tbFinalidadePadraoLarguraProduto_tbUnidade` (`tbFinalidadePadraoLarguraProduto_Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbUnidade`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbUnidade` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbUnidade` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `Abreviacao` VARCHAR(3) NOT NULL,
  `Unidade` VARCHAR(45) NOT NULL,
  `UtilizacaoProdutoProdutos` BIT NOT NULL,
  `UtilizacaoProdutoCodigoBarrasProdutos` BIT NOT NULL,
  `UtilizacaoProdutoPadraoLargura` BIT NOT NULL,
  `UtilizacaoProdutoPadraoEspessura` BIT NOT NULL,
  `UtilizacaoProdutoPesoLiquido` BIT NOT NULL,
  `UtilizacaoProdutoPesoBruto` BIT NOT NULL,
  `UtilizacaoVendasQuantMinPedidoVenda` BIT NOT NULL,
  `UtilizacaoVendasQuantMaxPedidoVenda` BIT NOT NULL,
  `UtilizacaoVendasTabelaPrecos` BIT NOT NULL,
  `UtilizacaoComprasQuantMinPedidoCompra` BIT NOT NULL,
  `UtilizacaoComprasQuantMaxPedidoCompra` BIT NOT NULL,
  `UtilizacaoComprasAnaliseComparativaPedidoCompra` BIT NOT NULL,
  `UtilizacaoComprasAnaliseComparativaEstoque` BIT NOT NULL,
  `UtilizacaoFaturamentoCupomFiscal` BIT NOT NULL,
  `UtilizacaoFaturamentoNFCe` BIT NOT NULL,
  `UtilizacaoFaturamentoNFeVenda` BIT NOT NULL,
  `UtilizacaoFaturamentoNFeDevolucao` BIT NOT NULL,
  `UtilizacaoFaturamentoNFeBeneficiamento` BIT NOT NULL,
  `UtilizacaoFaturamentoNFSe` BIT NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NOT NULL,
  PRIMARY KEY (`Id`),
  CONSTRAINT `FK_tbUnidade_tbFinalidadeCodigoBarrasProduto_tbUnidade`
    FOREIGN KEY (`Id`)
    REFERENCES `golivetradicao`.`tbFinalidadeCodigoBarrasProduto_tbUnidade` (`tbUnidade_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUnidade_tbAuditoria_tbUnidade`
    FOREIGN KEY (`Id`)
    REFERENCES `golivetradicao`.`tbAuditoria_tbUnidade` (`tbUnidade_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUnidade_tbFinalidadePadraoEspessuraProduto_tbUnidade`
    FOREIGN KEY (`Id`)
    REFERENCES `golivetradicao`.`tbFinalidadePadraoEspessuraProduto_tbUnidade` (`tbUnidade_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUnidade_tbFinalidadePadraoLarguraProduto_tbUnidade`
    FOREIGN KEY (`Id`)
    REFERENCES `golivetradicao`.`tbFinalidadePadraoLarguraProduto_tbUnidade` (`tbUnidade_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetradicao`.`tbUnidade` (`Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbFinalidadeCodigoBarrasProduto_tbUnidade`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbFinalidadeCodigoBarrasProduto_tbUnidade` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbFinalidadeCodigoBarrasProduto_tbUnidade` (
  `tbFinalidadeCodigoBarrasProduto_Id` INT UNSIGNED NOT NULL,
  `tbUnidade_Id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`tbFinalidadeCodigoBarrasProduto_Id`, `tbUnidade_Id`),
  CONSTRAINT `FK_tbFinalidadeCodigoBarrasProduto0001`
    FOREIGN KEY (`tbFinalidadeCodigoBarrasProduto_Id`)
    REFERENCES `golivetradicao`.`tbFinalidadeCodigoBarrasProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUnidade0001`
    FOREIGN KEY (`tbUnidade_Id`)
    REFERENCES `golivetradicao`.`tbUnidade` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE UNIQUE INDEX `tbFinalidadeCodigoBarrasProduto_Id_UNIQUE` ON `golivetradicao`.`tbFinalidadeCodigoBarrasProduto_tbUnidade` (`tbFinalidadeCodigoBarrasProduto_Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbFinalidadeCodigoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbFinalidadeCodigoProduto` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbFinalidadeCodigoProduto` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `FinalidadeCodigoProduto` VARCHAR(45) NOT NULL,
  `NumeroMinimoCaracteres` DECIMAL(5) NOT NULL,
  `NumeroMaximoCaracteres` DECIMAL(5) NOT NULL,
  `ApresentacaoSistemaLookupPesquisas` BIT NOT NULL,
  `ApresentacaoSistemaGridPesquisas` BIT NOT NULL,
  `ApresentacaoSistemaRelatoriosCadastrais` BIT NOT NULL,
  `ApresentacaoSistemaGraficosCadastrais` BIT NOT NULL,
  `ApresentacaoVendasGraficos` BIT NOT NULL,
  `ApresentacaoVendasPesquisas` BIT NOT NULL,
  `ApresentacaoVendasRelatorios` BIT NOT NULL,
  `ApresentacaoVendasOrcamentos` BIT NOT NULL,
  `ApresentacaoVendasPedidosVenda` BIT NOT NULL,
  `ApresentacaoVendasDAV` BIT NOT NULL,
  `ApresentacaoComprasGraficos` BIT NOT NULL,
  `ApresentacaoComprasPesquisas` BIT NOT NULL,
  `ApresentacaoComprasRelatorios` BIT NOT NULL,
  `ApresentacaoComprasCotacoes` BIT NOT NULL,
  `ApresentacaoComprasPedidosCompra` BIT NOT NULL,
  `ApresentacaoComprasEntradasNFeCompra` BIT NOT NULL,
  `ApresentacaoFaturamentoVendaCumpomFiscal` BIT NOT NULL,
  `ApresentacaoFaturamentoVendaNFCe` BIT NOT NULL,
  `ApresentacaoFaturamentoVendaNFe` BIT NOT NULL,
  `ApresentacaoFaturamentoVendaNFSe` BIT NOT NULL,
  `ApresentacaoFaturamentoCompraNFeCompra` BIT NOT NULL,
  `ApresentacaoFaturamentoCompraNFeDevolucao` BIT NOT NULL,
  `ApresentacaoFaturamentoCompraNFeBeneficiamento` BIT NOT NULL,
  `AplicacaoSistemaLookupPesquisas` BIT NOT NULL,
  `AplicacaoSistemaGirdPesquisas` BIT NOT NULL,
  `AplicacaoSistemaRelatoriosCadastrais` BIT NOT NULL,
  `AplicacaoSistemaGraficosCadastrais` BIT NOT NULL,
  `AplicacaoVendasGraficos` BIT NOT NULL,
  `AplicacaoVendasPesquisas` BIT NOT NULL,
  `AplicacaoVendasRelatorios` BIT NOT NULL,
  `AplicacaoVendasOrcamentos` BIT NOT NULL,
  `AplicacaoVendasPedidosDeVenda` BIT NOT NULL,
  `AplicacaoVendasDAV` BIT NOT NULL,
  `AplicacaoComprasGraficos` BIT NOT NULL,
  `AplicacaoComprasPesquisas` BIT NOT NULL,
  `AplicacaoComprasRelatorios` BIT NOT NULL,
  `AplicacaoComprasCotacoes` BIT NOT NULL,
  `AplicacaoComprasPedidosCompra` BIT NOT NULL,
  `AplicacaoComprasEntradasNFeCompra` BIT NOT NULL,
  `AplicacaoFaturamentoVendaCupomFiscal` BIT NOT NULL,
  `AplicacaoFaturamentoVendaNFCe` BIT NOT NULL,
  `AplicacaoFaturamentoVendaNFe` BIT NOT NULL,
  `AplicacaoFaturamentoVendaNFSe` BIT NOT NULL,
  `AplicacaoFaturamentoCompraNFeCompra` BIT NOT NULL,
  `AplicacaoFaturamentoCompraNFeDevolucao` BIT NOT NULL,
  `AplicacaoFaturamentoCompraNFeBeneficiamento` BIT NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;


CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetradicao`.`tbFinalidadeCodigoProduto` (`Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbAuditoria_tbFinalidadeCodigoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbAuditoria_tbFinalidadeCodigoProduto` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbAuditoria_tbFinalidadeCodigoProduto` (
  `tbAuditoria_Id` INT ZEROFILL UNSIGNED NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT ZEROFILL UNSIGNED NOT NULL,
  `tbFinalidadeCodigoProduto_Id` INT ZEROFILL UNSIGNED NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbFinalidadeCodigoProduto_Id`),
  CONSTRAINT `FK_tbAuditoria0018`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golivetradicao`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbFinalidadeCodigoProduto0002`
    FOREIGN KEY (`tbFinalidadeCodigoProduto_Id`)
    REFERENCES `golivetradicao`.`tbFinalidadeCodigoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0032`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0028`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golivetradicao`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golivetradicao`.`tbAuditoria_tbFinalidadeCodigoProduto` (`tbAuditoriaItem_Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbFinalidadeColecaoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbFinalidadeColecaoProduto` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbFinalidadeColecaoProduto` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `FinalidadeColecaoProduto` VARCHAR(45) NOT NULL,
  `NumeroMinimoCaracteres` DECIMAL(5) NOT NULL,
  `NumeroMaximoCaracteres` DECIMAL(5) NOT NULL,
  `ApresentacaoSistemaLookupPesquisas` BIT NOT NULL,
  `ApresentacaoSistemaGridPesquisas` BIT NOT NULL,
  `ApresentacaoSistemaRelatoriosCadastrais` BIT NOT NULL,
  `ApresentacaoSistemaGraficosCadastrais` BIT NOT NULL,
  `ApresentacaoVendasGraficos` BIT NOT NULL,
  `ApresentacaoVendasPesquisas` BIT NOT NULL,
  `ApresentacaoVendasRelatorios` BIT NOT NULL,
  `ApresentacaoVendasOrcamentos` BIT NOT NULL,
  `ApresentacaoVendasPedidosVenda` BIT NOT NULL,
  `ApresentacaoVendasDAV` BIT NOT NULL,
  `ApresentacaoComprasGraficos` BIT NOT NULL,
  `ApresentacaoComprasPesquisas` BIT NOT NULL,
  `ApresentacaoComprasRelatorios` BIT NOT NULL,
  `ApresentacaoComprasCotacoes` BIT NOT NULL,
  `ApresentacaoComprasPedidosCompra` BIT NOT NULL,
  `ApresentacaoComprasEntradasNFeCompra` BIT NOT NULL,
  `ApresentacaoFaturamentoVendaCumpomFiscal` BIT NOT NULL,
  `ApresentacaoFaturamentoVendaNFCe` BIT NOT NULL,
  `ApresentacaoFaturamentoVendaNFe` BIT NOT NULL,
  `ApresentacaoFaturamentoVendaNFSe` BIT NOT NULL,
  `ApresentacaoFaturamentoCompraNFeCompra` BIT NOT NULL,
  `ApresentacaoFaturamentoCompraNFeDevolucao` BIT NOT NULL,
  `ApresentacaoFaturamentoCompraNFeBeneficiamento` BIT NOT NULL,
  `AplicacaoSistemaLookupPesquisas` BIT NOT NULL,
  `AplicacaoSistemaGirdPesquisas` BIT NOT NULL,
  `AplicacaoSistemaRelatoriosCadastrais` BIT NOT NULL,
  `AplicacaoSistemaGraficosCadastrais` BIT NOT NULL,
  `AplicacaoVendasGraficos` BIT NOT NULL,
  `AplicacaoVendasPesquisas` BIT NOT NULL,
  `AplicacaoVendasRelatorios` BIT NOT NULL,
  `AplicacaoVendasOrcamentos` BIT NOT NULL,
  `AplicacaoVendasPedidosDeVenda` BIT NOT NULL,
  `AplicacaoVendasDAV` BIT NOT NULL,
  `AplicacaoComprasGraficos` BIT NOT NULL,
  `AplicacaoComprasPesquisas` BIT NOT NULL,
  `AplicacaoComprasRelatorios` BIT NOT NULL,
  `AplicacaoComprasCotacoes` BIT NOT NULL,
  `AplicacaoComprasPedidosCompra` BIT NOT NULL,
  `AplicacaoComprasEntradasNFeCompra` BIT NOT NULL,
  `AplicacaoFaturamentoVendaCupomFiscal` BIT NOT NULL,
  `AplicacaoFaturamentoVendaNFCe` BIT NOT NULL,
  `AplicacaoFaturamentoVendaNFe` BIT NOT NULL,
  `AplicacaoFaturamentoVendaNFSe` BIT NOT NULL,
  `AplicacaoFaturamentoCompraNFeCompra` BIT NOT NULL,
  `AplicacaoFaturamentoCompraNFeDevolucao` BIT NOT NULL,
  `AplicacaoFaturamentoCompraNFeBeneficiamento` BIT NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;


CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetradicao`.`tbFinalidadeColecaoProduto` (`Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbAuditoria_tbFinalidadeColecaoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbAuditoria_tbFinalidadeColecaoProduto` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbAuditoria_tbFinalidadeColecaoProduto` (
  `tbAuditoria_Id` INT ZEROFILL UNSIGNED NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT ZEROFILL UNSIGNED NOT NULL,
  `tbFinalidadeColecaoProduto_Id` INT ZEROFILL UNSIGNED NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbFinalidadeColecaoProduto_Id`),
  CONSTRAINT `FK_tbAuditoria0019`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golivetradicao`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbFinalidadeColecaoProduto0002`
    FOREIGN KEY (`tbFinalidadeColecaoProduto_Id`)
    REFERENCES `golivetradicao`.`tbFinalidadeColecaoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0033`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0029`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golivetradicao`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golivetradicao`.`tbAuditoria_tbFinalidadeColecaoProduto` (`tbAuditoriaItem_Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbFinalidadeCorProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbFinalidadeCorProduto` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbFinalidadeCorProduto` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `FinalidadeCorProduto` VARCHAR(45) NOT NULL,
  `NumeroMinimoCaracteres` DECIMAL(5) NOT NULL,
  `NumeroMaximoCaracteres` DECIMAL(5) NOT NULL,
  `ApresentacaoSistemaLookupPesquisas` BIT NOT NULL,
  `ApresentacaoSistemaGridPesquisas` BIT NOT NULL,
  `ApresentacaoSistemaRelatoriosCadastrais` BIT NOT NULL,
  `ApresentacaoSistemaGraficosCadastrais` BIT NOT NULL,
  `ApresentacaoVendasGraficos` BIT NOT NULL,
  `ApresentacaoVendasPesquisas` BIT NOT NULL,
  `ApresentacaoVendasRelatorios` BIT NOT NULL,
  `ApresentacaoVendasOrcamentos` BIT NOT NULL,
  `ApresentacaoVendasPedidosVenda` BIT NOT NULL,
  `ApresentacaoVendasDAV` BIT NOT NULL,
  `ApresentacaoComprasGraficos` BIT NOT NULL,
  `ApresentacaoComprasPesquisas` BIT NOT NULL,
  `ApresentacaoComprasRelatorios` BIT NOT NULL,
  `ApresentacaoComprasCotacoes` BIT NOT NULL,
  `ApresentacaoComprasPedidosCompra` BIT NOT NULL,
  `ApresentacaoComprasEntradasNFeCompra` BIT NOT NULL,
  `ApresentacaoFaturamentoVendaCumpomFiscal` BIT NOT NULL,
  `ApresentacaoFaturamentoVendaNFCe` BIT NOT NULL,
  `ApresentacaoFaturamentoVendaNFe` BIT NOT NULL,
  `ApresentacaoFaturamentoVendaNFSe` BIT NOT NULL,
  `ApresentacaoFaturamentoCompraNFeCompra` BIT NOT NULL,
  `ApresentacaoFaturamentoCompraNFeDevolucao` BIT NOT NULL,
  `ApresentacaoFaturamentoCompraNFeBeneficiamento` BIT NOT NULL,
  `AplicacaoSistemaLookupPesquisas` BIT NOT NULL,
  `AplicacaoSistemaGirdPesquisas` BIT NOT NULL,
  `AplicacaoSistemaRelatoriosCadastrais` BIT NOT NULL,
  `AplicacaoSistemaGraficosCadastrais` BIT NOT NULL,
  `AplicacaoVendasGraficos` BIT NOT NULL,
  `AplicacaoVendasPesquisas` BIT NOT NULL,
  `AplicacaoVendasRelatorios` BIT NOT NULL,
  `AplicacaoVendasOrcamentos` BIT NOT NULL,
  `AplicacaoVendasPedidosDeVenda` BIT NOT NULL,
  `AplicacaoVendasDAV` BIT NOT NULL,
  `AplicacaoComprasGraficos` BIT NOT NULL,
  `AplicacaoComprasPesquisas` BIT NOT NULL,
  `AplicacaoComprasRelatorios` BIT NOT NULL,
  `AplicacaoComprasCotacoes` BIT NOT NULL,
  `AplicacaoComprasPedidosCompra` BIT NOT NULL,
  `AplicacaoComprasEntradasNFeCompra` BIT NOT NULL,
  `AplicacaoFaturamentoVendaCupomFiscal` BIT NOT NULL,
  `AplicacaoFaturamentoVendaNFCe` BIT NOT NULL,
  `AplicacaoFaturamentoVendaNFe` BIT NOT NULL,
  `AplicacaoFaturamentoVendaNFSe` BIT NOT NULL,
  `AplicacaoFaturamentoCompraNFeCompra` BIT NOT NULL,
  `AplicacaoFaturamentoCompraNFeDevolucao` BIT NOT NULL,
  `AplicacaoFaturamentoCompraNFeBeneficiamento` BIT NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;


CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetradicao`.`tbFinalidadeCorProduto` (`Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbAuditoria_tbFinalidadeCorProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbAuditoria_tbFinalidadeCorProduto` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbAuditoria_tbFinalidadeCorProduto` (
  `tbAuditoria_Id` INT ZEROFILL UNSIGNED NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT ZEROFILL UNSIGNED NOT NULL,
  `tbFinalidadeCorProduto_Id` INT ZEROFILL UNSIGNED NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbFinalidadeCorProduto_Id`),
  CONSTRAINT `FK_tbAuditoria0021`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golivetradicao`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbFinalidadeCorProduto0002`
    FOREIGN KEY (`tbFinalidadeCorProduto_Id`)
    REFERENCES `golivetradicao`.`tbFinalidadeCorProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0035`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0031`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golivetradicao`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golivetradicao`.`tbAuditoria_tbFinalidadeCorProduto` (`tbAuditoriaItem_Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbFinalidadeDescricaoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbFinalidadeDescricaoProduto` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbFinalidadeDescricaoProduto` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `FinalidadeDescricaoProduto` VARCHAR(45) NOT NULL,
  `NumeroMinimoCaracteres` DECIMAL(5) NOT NULL,
  `NumeroMaximoCaracteres` DECIMAL(5) NOT NULL,
  `ApresentacaoSistemaLookupPesquisas` BIT NOT NULL,
  `ApresentacaoSistemaGridPesquisas` BIT NOT NULL,
  `ApresentacaoSistemaRelatoriosCadastrais` BIT NOT NULL,
  `ApresentacaoSistemaGraficosCadastrais` BIT NOT NULL,
  `ApresentacaoVendasGraficos` BIT NOT NULL,
  `ApresentacaoVendasPesquisas` BIT NOT NULL,
  `ApresentacaoVendasRelatorios` BIT NOT NULL,
  `ApresentacaoVendasOrcamentos` BIT NOT NULL,
  `ApresentacaoVendasPedidosVenda` BIT NOT NULL,
  `ApresentacaoVendasDAV` BIT NOT NULL,
  `ApresentacaoComprasGraficos` BIT NOT NULL,
  `ApresentacaoComprasPesquisas` BIT NOT NULL,
  `ApresentacaoComprasRelatorios` BIT NOT NULL,
  `ApresentacaoComprasCotacoes` BIT NOT NULL,
  `ApresentacaoComprasPedidosCompra` BIT NOT NULL,
  `ApresentacaoComprasEntradasNFeCompra` BIT NOT NULL,
  `ApresentacaoFaturamentoVendaCumpomFiscal` BIT NOT NULL,
  `ApresentacaoFaturamentoVendaNFCe` BIT NOT NULL,
  `ApresentacaoFaturamentoVendaNFe` BIT NOT NULL,
  `ApresentacaoFaturamentoVendaNFSe` BIT NOT NULL,
  `ApresentacaoFaturamentoCompraNFeCompra` BIT NOT NULL,
  `ApresentacaoFaturamentoCompraNFeDevolucao` BIT NOT NULL,
  `ApresentacaoFaturamentoCompraNFeBeneficiamento` BIT NOT NULL,
  `AplicacaoSistemaLookupPesquisas` BIT NOT NULL,
  `AplicacaoSistemaGirdPesquisas` BIT NOT NULL,
  `AplicacaoSistemaRelatoriosCadastrais` BIT NOT NULL,
  `AplicacaoSistemaGraficosCadastrais` BIT NOT NULL,
  `AplicacaoVendasGraficos` BIT NOT NULL,
  `AplicacaoVendasPesquisas` BIT NOT NULL,
  `AplicacaoVendasRelatorios` BIT NOT NULL,
  `AplicacaoVendasOrcamentos` BIT NOT NULL,
  `AplicacaoVendasPedidosDeVenda` BIT NOT NULL,
  `AplicacaoVendasDAV` BIT NOT NULL,
  `AplicacaoComprasGraficos` BIT NOT NULL,
  `AplicacaoComprasPesquisas` BIT NOT NULL,
  `AplicacaoComprasRelatorios` BIT NOT NULL,
  `AplicacaoComprasCotacoes` BIT NOT NULL,
  `AplicacaoComprasPedidosCompra` BIT NOT NULL,
  `AplicacaoComprasEntradasNFeCompra` BIT NOT NULL,
  `AplicacaoFaturamentoVendaCupomFiscal` BIT NOT NULL,
  `AplicacaoFaturamentoVendaNFCe` BIT NOT NULL,
  `AplicacaoFaturamentoVendaNFe` BIT NOT NULL,
  `AplicacaoFaturamentoVendaNFSe` BIT NOT NULL,
  `AplicacaoFaturamentoCompraNFeCompra` BIT NOT NULL,
  `AplicacaoFaturamentoCompraNFeDevolucao` BIT NOT NULL,
  `AplicacaoFaturamentoCompraNFeBeneficiamento` BIT NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;


CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetradicao`.`tbFinalidadeDescricaoProduto` (`Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbAuditoria_tbFinalidadeDescricaoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbAuditoria_tbFinalidadeDescricaoProduto` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbAuditoria_tbFinalidadeDescricaoProduto` (
  `tbAuditoria_Id` INT ZEROFILL UNSIGNED NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT ZEROFILL UNSIGNED NOT NULL,
  `tbFinalidadeDescricaoProduto_Id` INT ZEROFILL UNSIGNED NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbFinalidadeDescricaoProduto_Id`),
  CONSTRAINT `FK_tbAuditoria0022`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golivetradicao`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbFinalidadeDescricaoProduto0002`
    FOREIGN KEY (`tbFinalidadeDescricaoProduto_Id`)
    REFERENCES `golivetradicao`.`tbFinalidadeDescricaoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0036`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0032`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golivetradicao`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golivetradicao`.`tbAuditoria_tbFinalidadeDescricaoProduto` (`tbAuditoriaItem_Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbAuditoria_tbFinalidadePadraoEspessuraProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbAuditoria_tbFinalidadePadraoEspessuraProduto` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbAuditoria_tbFinalidadePadraoEspessuraProduto` (
  `tbAuditoria_Id` INT ZEROFILL UNSIGNED NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT ZEROFILL UNSIGNED NOT NULL,
  `tbFinalidadePadraoEspessuraProduto_Id` INT ZEROFILL UNSIGNED NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbFinalidadePadraoEspessuraProduto_Id`),
  CONSTRAINT `FK_tbAuditoria0023`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golivetradicao`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbFinalidadePadraoEspessuraProduto0003`
    FOREIGN KEY (`tbFinalidadePadraoEspessuraProduto_Id`)
    REFERENCES `golivetradicao`.`tbFinalidadePadraoEspessuraProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0037`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0033`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golivetradicao`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golivetradicao`.`tbAuditoria_tbFinalidadePadraoEspessuraProduto` (`tbAuditoriaItem_Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbAuditoria_tbFinalidadePadraoLarguraProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbAuditoria_tbFinalidadePadraoLarguraProduto` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbAuditoria_tbFinalidadePadraoLarguraProduto` (
  `tbAuditoria_Id` INT ZEROFILL UNSIGNED NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT ZEROFILL UNSIGNED NOT NULL,
  `tbFinalidadePadraoLarguraProduto_Id` INT ZEROFILL UNSIGNED NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbFinalidadePadraoLarguraProduto_Id`),
  CONSTRAINT `FK_tbAuditoria0024`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golivetradicao`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbFinalidadePadraoLarguraProduto0003`
    FOREIGN KEY (`tbFinalidadePadraoLarguraProduto_Id`)
    REFERENCES `golivetradicao`.`tbFinalidadePadraoLarguraProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0038`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0034`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golivetradicao`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golivetradicao`.`tbAuditoria_tbFinalidadePadraoLarguraProduto` (`tbAuditoriaItem_Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbFinalidadeTipoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbFinalidadeTipoProduto` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbFinalidadeTipoProduto` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `FinalidadeTipoProduto` VARCHAR(45) NOT NULL,
  `NumeroMinimoCaracteres` DECIMAL(5) NOT NULL,
  `NumeroMaximoCaracteres` DECIMAL(5) NOT NULL,
  `ApresentacaoSistemaLookupPesquisas` BIT NOT NULL,
  `ApresentacaoSistemaGridPesquisas` BIT NOT NULL,
  `ApresentacaoSistemaRelatoriosCadastrais` BIT NOT NULL,
  `ApresentacaoSistemaGraficosCadastrais` BIT NOT NULL,
  `ApresentacaoVendasGraficos` BIT NOT NULL,
  `ApresentacaoVendasPesquisas` BIT NOT NULL,
  `ApresentacaoVendasRelatorios` BIT NOT NULL,
  `ApresentacaoVendasOrcamentos` BIT NOT NULL,
  `ApresentacaoVendasPedidosVenda` BIT NOT NULL,
  `ApresentacaoVendasDAV` BIT NOT NULL,
  `ApresentacaoComprasGraficos` BIT NOT NULL,
  `ApresentacaoComprasPesquisas` BIT NOT NULL,
  `ApresentacaoComprasRelatorios` BIT NOT NULL,
  `ApresentacaoComprasCotacoes` BIT NOT NULL,
  `ApresentacaoComprasPedidosCompra` BIT NOT NULL,
  `ApresentacaoComprasEntradasNFeCompra` BIT NOT NULL,
  `ApresentacaoFaturamentoVendaCumpomFiscal` BIT NOT NULL,
  `ApresentacaoFaturamentoVendaNFCe` BIT NOT NULL,
  `ApresentacaoFaturamentoVendaNFe` BIT NOT NULL,
  `ApresentacaoFaturamentoVendaNFSe` BIT NOT NULL,
  `ApresentacaoFaturamentoCompraNFeCompra` BIT NOT NULL,
  `ApresentacaoFaturamentoCompraNFeDevolucao` BIT NOT NULL,
  `ApresentacaoFaturamentoCompraNFeBeneficiamento` BIT NOT NULL,
  `AplicacaoSistemaLookupPesquisas` BIT NOT NULL,
  `AplicacaoSistemaGirdPesquisas` BIT NOT NULL,
  `AplicacaoSistemaRelatoriosCadastrais` BIT NOT NULL,
  `AplicacaoSistemaGraficosCadastrais` BIT NOT NULL,
  `AplicacaoVendasGraficos` BIT NOT NULL,
  `AplicacaoVendasPesquisas` BIT NOT NULL,
  `AplicacaoVendasRelatorios` BIT NOT NULL,
  `AplicacaoVendasOrcamentos` BIT NOT NULL,
  `AplicacaoVendasPedidosDeVenda` BIT NOT NULL,
  `AplicacaoVendasDAV` BIT NOT NULL,
  `AplicacaoComprasGraficos` BIT NOT NULL,
  `AplicacaoComprasPesquisas` BIT NOT NULL,
  `AplicacaoComprasRelatorios` BIT NOT NULL,
  `AplicacaoComprasCotacoes` BIT NOT NULL,
  `AplicacaoComprasPedidosCompra` BIT NOT NULL,
  `AplicacaoComprasEntradasNFeCompra` BIT NOT NULL,
  `AplicacaoFaturamentoVendaCupomFiscal` BIT NOT NULL,
  `AplicacaoFaturamentoVendaNFCe` BIT NOT NULL,
  `AplicacaoFaturamentoVendaNFe` BIT NOT NULL,
  `AplicacaoFaturamentoVendaNFSe` BIT NOT NULL,
  `AplicacaoFaturamentoCompraNFeCompra` BIT NOT NULL,
  `AplicacaoFaturamentoCompraNFeDevolucao` BIT NOT NULL,
  `AplicacaoFaturamentoCompraNFeBeneficiamento` BIT NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;


CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetradicao`.`tbFinalidadeTipoProduto` (`Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbAuditoria_tbFinalidadeTipoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbAuditoria_tbFinalidadeTipoProduto` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbAuditoria_tbFinalidadeTipoProduto` (
  `tbAuditoria_Id` INT ZEROFILL UNSIGNED NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT ZEROFILL UNSIGNED NOT NULL,
  `tbFinalidadeTipoProduto_Id` INT ZEROFILL UNSIGNED NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbFinalidadeTipoProduto_Id`),
  CONSTRAINT `FK_tbAuditoria0025`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golivetradicao`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbFinalidadeTipoProduto0002`
    FOREIGN KEY (`tbFinalidadeTipoProduto_Id`)
    REFERENCES `golivetradicao`.`tbFinalidadeTipoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0039`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0035`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golivetradicao`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golivetradicao`.`tbAuditoria_tbFinalidadeTipoProduto` (`tbAuditoriaItem_Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbFinalidadeUnidadeProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbFinalidadeUnidadeProduto` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbFinalidadeUnidadeProduto` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `FinalidadeUnidadeProduto` VARCHAR(45) NOT NULL,
  `NumeroMinimoCaracteres` DECIMAL(5) NOT NULL,
  `NumeroMaximoCaracteres` DECIMAL(5) NOT NULL,
  `ApresentacaoSistemaLookupPesquisas` BIT NOT NULL,
  `ApresentacaoSistemaGridPesquisas` BIT NOT NULL,
  `ApresentacaoSistemaRelatoriosCadastrais` BIT NOT NULL,
  `ApresentacaoSistemaGraficosCadastrais` BIT NOT NULL,
  `ApresentacaoVendasGraficos` BIT NOT NULL,
  `ApresentacaoVendasPesquisas` BIT NOT NULL,
  `ApresentacaoVendasRelatorios` BIT NOT NULL,
  `ApresentacaoVendasOrcamentos` BIT NOT NULL,
  `ApresentacaoVendasPedidosVenda` BIT NOT NULL,
  `ApresentacaoVendasDAV` BIT NOT NULL,
  `ApresentacaoComprasGraficos` BIT NOT NULL,
  `ApresentacaoComprasPesquisas` BIT NOT NULL,
  `ApresentacaoComprasRelatorios` BIT NOT NULL,
  `ApresentacaoComprasCotacoes` BIT NOT NULL,
  `ApresentacaoComprasPedidosCompra` BIT NOT NULL,
  `ApresentacaoComprasEntradasNFeCompra` BIT NOT NULL,
  `ApresentacaoFaturamentoVendaCumpomFiscal` BIT NOT NULL,
  `ApresentacaoFaturamentoVendaNFCe` BIT NOT NULL,
  `ApresentacaoFaturamentoVendaNFe` BIT NOT NULL,
  `ApresentacaoFaturamentoVendaNFSe` BIT NOT NULL,
  `ApresentacaoFaturamentoCompraNFeCompra` BIT NOT NULL,
  `ApresentacaoFaturamentoCompraNFeDevolucao` BIT NOT NULL,
  `ApresentacaoFaturamentoCompraNFeBeneficiamento` BIT NOT NULL,
  `AplicacaoSistemaLookupPesquisas` BIT NOT NULL,
  `AplicacaoSistemaGirdPesquisas` BIT NOT NULL,
  `AplicacaoSistemaRelatoriosCadastrais` BIT NOT NULL,
  `AplicacaoSistemaGraficosCadastrais` BIT NOT NULL,
  `AplicacaoVendasGraficos` BIT NOT NULL,
  `AplicacaoVendasPesquisas` BIT NOT NULL,
  `AplicacaoVendasRelatorios` BIT NOT NULL,
  `AplicacaoVendasOrcamentos` BIT NOT NULL,
  `AplicacaoVendasPedidosDeVenda` BIT NOT NULL,
  `AplicacaoVendasDAV` BIT NOT NULL,
  `AplicacaoComprasGraficos` BIT NOT NULL,
  `AplicacaoComprasPesquisas` BIT NOT NULL,
  `AplicacaoComprasRelatorios` BIT NOT NULL,
  `AplicacaoComprasCotacoes` BIT NOT NULL,
  `AplicacaoComprasPedidosCompra` BIT NOT NULL,
  `AplicacaoComprasEntradasNFeCompra` BIT NOT NULL,
  `AplicacaoFaturamentoVendaCupomFiscal` BIT NOT NULL,
  `AplicacaoFaturamentoVendaNFCe` BIT NOT NULL,
  `AplicacaoFaturamentoVendaNFe` BIT NOT NULL,
  `AplicacaoFaturamentoVendaNFSe` BIT NOT NULL,
  `AplicacaoFaturamentoCompraNFeCompra` BIT NOT NULL,
  `AplicacaoFaturamentoCompraNFeDevolucao` BIT NOT NULL,
  `AplicacaoFaturamentoCompraNFeBeneficiamento` BIT NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;


CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetradicao`.`tbFinalidadeUnidadeProduto` (`Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbAuditoria_tbFinalidadeUnidadeProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbAuditoria_tbFinalidadeUnidadeProduto` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbAuditoria_tbFinalidadeUnidadeProduto` (
  `tbAuditoria_Id` INT ZEROFILL UNSIGNED NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT ZEROFILL UNSIGNED NOT NULL,
  `tbFinalidadeUnidadeProduto_Id` INT ZEROFILL UNSIGNED NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbFinalidadeUnidadeProduto_Id`),
  CONSTRAINT `FK_tbAuditoria0026`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golivetradicao`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbFinalidadeUnidadeProduto0003`
    FOREIGN KEY (`tbFinalidadeUnidadeProduto_Id`)
    REFERENCES `golivetradicao`.`tbFinalidadeUnidadeProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0040`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0036`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golivetradicao`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golivetradicao`.`tbAuditoria_tbFinalidadeUnidadeProduto` (`tbAuditoriaItem_Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbDepartamentoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbDepartamentoProduto` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbDepartamentoProduto` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `DepartamentoProduto` VARCHAR(120) NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;


CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetradicao`.`tbDepartamentoProduto` (`Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbAuditoria_tbDepartamentoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbAuditoria_tbDepartamentoProduto` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbAuditoria_tbDepartamentoProduto` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbDepartamentoProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbDepartamentoProduto_Id`),
  CONSTRAINT `FK_tbAuditoria0011`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golivetradicao`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbDepartamentoProduto0008`
    FOREIGN KEY (`tbDepartamentoProduto_Id`)
    REFERENCES `golivetradicao`.`tbDepartamentoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0025`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0021`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golivetradicao`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golivetradicao`.`tbAuditoria_tbDepartamentoProduto` (`tbAuditoriaItem_Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbGrupoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbGrupoProduto` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbGrupoProduto` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `GrupoProduto` VARCHAR(120) NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;


CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetradicao`.`tbGrupoProduto` (`Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbGrupoProduto_tbDepartamentoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbGrupoProduto_tbDepartamentoProduto` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbGrupoProduto_tbDepartamentoProduto` (
  `tbGrupoProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbDepartamentoProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbGrupoProduto_Id`, `tbDepartamentoProduto_Id`),
  CONSTRAINT `FK_tbGrupoProduto0002`
    FOREIGN KEY (`tbGrupoProduto_Id`)
    REFERENCES `golivetradicao`.`tbGrupoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbDepartamentoProduto0002`
    FOREIGN KEY (`tbDepartamentoProduto_Id`)
    REFERENCES `golivetradicao`.`tbDepartamentoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbAuditoria_tbGrupoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbAuditoria_tbGrupoProduto` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbAuditoria_tbGrupoProduto` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbGrupoProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbGrupoProduto_Id`),
  CONSTRAINT `FK_tbAuditoria0012`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golivetradicao`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbGrupoProduto0008`
    FOREIGN KEY (`tbGrupoProduto_Id`)
    REFERENCES `golivetradicao`.`tbGrupoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0026`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0022`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golivetradicao`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golivetradicao`.`tbAuditoria_tbGrupoProduto` (`tbAuditoriaItem_Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbSubGrupoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbSubGrupoProduto` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbSubGrupoProduto` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `SubGrupoProduto` VARCHAR(120) NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;


CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetradicao`.`tbSubGrupoProduto` (`Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbSubGrupoProduto_tbGrupoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbSubGrupoProduto_tbGrupoProduto` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbSubGrupoProduto_tbGrupoProduto` (
  `tbSubGrupoProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbGrupoProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbSubGrupoProduto_Id`, `tbGrupoProduto_Id`),
  CONSTRAINT `FK_tbSubGrupoProduto0002`
    FOREIGN KEY (`tbSubGrupoProduto_Id`)
    REFERENCES `golivetradicao`.`tbSubGrupoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbGrupoProduto0003`
    FOREIGN KEY (`tbGrupoProduto_Id`)
    REFERENCES `golivetradicao`.`tbGrupoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbSubGrupoProduto_tbDepartamentoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbSubGrupoProduto_tbDepartamentoProduto` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbSubGrupoProduto_tbDepartamentoProduto` (
  `tbSubGrupoProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbDepartamentoProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbSubGrupoProduto_Id`, `tbDepartamentoProduto_Id`),
  CONSTRAINT `FK_tbSubGrupoProduto0003`
    FOREIGN KEY (`tbSubGrupoProduto_Id`)
    REFERENCES `golivetradicao`.`tbSubGrupoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbDepartamentoProduto0003`
    FOREIGN KEY (`tbDepartamentoProduto_Id`)
    REFERENCES `golivetradicao`.`tbDepartamentoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbAuditoria_tbSubGrupoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbAuditoria_tbSubGrupoProduto` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbAuditoria_tbSubGrupoProduto` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbSubGrupoProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbSubGrupoProduto_Id`),
  CONSTRAINT `FK_tbAuditoria0013`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golivetradicao`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbSubGrupoProduto0009`
    FOREIGN KEY (`tbSubGrupoProduto_Id`)
    REFERENCES `golivetradicao`.`tbSubGrupoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0027`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0023`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golivetradicao`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golivetradicao`.`tbAuditoria_tbSubGrupoProduto` (`tbAuditoriaItem_Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbPadroesEspessuraProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbPadroesEspessuraProduto` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbPadroesEspessuraProduto` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `Espessura` DECIMAL(6,3) NOT NULL,
  `EspessuraDescricao` VARCHAR(120) NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;


CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetradicao`.`tbPadroesEspessuraProduto` (`Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbPadroesEspessuraProduto_tbDepartamento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbPadroesEspessuraProduto_tbDepartamento` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbPadroesEspessuraProduto_tbDepartamento` (
  `tbPadroesEspessurasProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbDepartamentoProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbPadroesEspessurasProduto_Id`, `tbDepartamentoProduto_Id`),
  CONSTRAINT `FK_tbPadroesEspessurasProduto0002`
    FOREIGN KEY (`tbPadroesEspessurasProduto_Id`)
    REFERENCES `golivetradicao`.`tbPadroesEspessuraProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbDepartamentoProduto0004`
    FOREIGN KEY (`tbDepartamentoProduto_Id`)
    REFERENCES `golivetradicao`.`tbDepartamentoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbPadroesEspessuraProduto_tbGrupoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbPadroesEspessuraProduto_tbGrupoProduto` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbPadroesEspessuraProduto_tbGrupoProduto` (
  `tbPadroesEspessuraProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbGrupoProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbPadroesEspessuraProduto_Id`, `tbGrupoProduto_Id`),
  CONSTRAINT `FK_tbPradroesEspessuraProduto0003`
    FOREIGN KEY (`tbPadroesEspessuraProduto_Id`)
    REFERENCES `golivetradicao`.`tbPadroesEspessuraProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbGrupoProduto0004`
    FOREIGN KEY (`tbGrupoProduto_Id`)
    REFERENCES `golivetradicao`.`tbGrupoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbPadroesEspessuraProduto_tbSubGrupoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbPadroesEspessuraProduto_tbSubGrupoProduto` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbPadroesEspessuraProduto_tbSubGrupoProduto` (
  `tbPadroesEspessuraProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbSubGrupoProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbPadroesEspessuraProduto_Id`, `tbSubGrupoProduto_Id`),
  CONSTRAINT `FK_tbPadroesEspessuraProduto0004`
    FOREIGN KEY (`tbPadroesEspessuraProduto_Id`)
    REFERENCES `golivetradicao`.`tbPadroesEspessuraProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbSubGrupoProduto0004`
    FOREIGN KEY (`tbSubGrupoProduto_Id`)
    REFERENCES `golivetradicao`.`tbSubGrupoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbColecoesProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbColecoesProduto` ;

CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbColecoesProduto` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `Colecao` VARCHAR(120) NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;


CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetradicao`.`tbColecoesProduto` (`Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbPadroesEspessuraProduto_tbColecoesProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbPadroesEspessuraProduto_tbColecoesProduto` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbPadroesEspessuraProduto_tbColecoesProduto` (
  `tbPadroesEspessuraProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbColecoesProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbPadroesEspessuraProduto_Id`, `tbColecoesProduto_Id`),
  CONSTRAINT `FK_tbPadroesEspessuraProduto0005`
    FOREIGN KEY (`tbPadroesEspessuraProduto_Id`)
    REFERENCES `golivetradicao`.`tbPadroesEspessuraProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbColecoesProduto0002`
    FOREIGN KEY (`tbColecoesProduto_Id`)
    REFERENCES `golivetradicao`.`tbColecoesProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbCorProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbCorProduto` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbCorProduto` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `CorCodigo` VARCHAR(15) NULL,
  `CorDescricao` VARCHAR(45) NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;


CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetradicao`.`tbCorProduto` (`Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbPadroesEspessuraProduto_tbCorProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbPadroesEspessuraProduto_tbCorProduto` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbPadroesEspessuraProduto_tbCorProduto` (
  `tbPadoresEspessuraProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCorProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbPadoresEspessuraProduto_Id`, `tbCorProduto_Id`),
  CONSTRAINT `FK_tbPadroesEspessuraProduto0006`
    FOREIGN KEY (`tbPadoresEspessuraProduto_Id`)
    REFERENCES `golivetradicao`.`tbPadroesEspessuraProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCorProduto0002`
    FOREIGN KEY (`tbCorProduto_Id`)
    REFERENCES `golivetradicao`.`tbCorProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE UNIQUE INDEX `tbCorProduto_Id_UNIQUE` ON `golivetradicao`.`tbPadroesEspessuraProduto_tbCorProduto` (`tbCorProduto_Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbAuditoria_tbPadroesEspessuraProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbAuditoria_tbPadroesEspessuraProduto` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbAuditoria_tbPadroesEspessuraProduto` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbPadroesEspessuraProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbPadroesEspessuraProduto_Id`),
  CONSTRAINT `FK_tbAuditoria0014`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golivetradicao`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbPadroesEspessuraProduto0007`
    FOREIGN KEY (`tbPadroesEspessuraProduto_Id`)
    REFERENCES `golivetradicao`.`tbPadroesEspessuraProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0028`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0024`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golivetradicao`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golivetradicao`.`tbAuditoria_tbPadroesEspessuraProduto` (`tbAuditoriaItem_Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbPadroesLarguraProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbPadroesLarguraProduto` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbPadroesLarguraProduto` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `Largura` DECIMAL(6,3) NOT NULL,
  `LarguraDescricao` VARCHAR(120) NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;


CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetradicao`.`tbPadroesLarguraProduto` (`Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbPadroesLarguraProduto_tbDepartamentoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbPadroesLarguraProduto_tbDepartamentoProduto` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbPadroesLarguraProduto_tbDepartamentoProduto` (
  `tbPadroesLarguraProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbDepartamentoProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbPadroesLarguraProduto_Id`, `tbDepartamentoProduto_Id`),
  CONSTRAINT `FK_tbPadroesLarguraProduto0002`
    FOREIGN KEY (`tbPadroesLarguraProduto_Id`)
    REFERENCES `golivetradicao`.`tbPadroesLarguraProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbDepartamentoProduto0005`
    FOREIGN KEY (`tbDepartamentoProduto_Id`)
    REFERENCES `golivetradicao`.`tbDepartamentoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbPadroesLarguraProduto_tbGrupoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbPadroesLarguraProduto_tbGrupoProduto` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbPadroesLarguraProduto_tbGrupoProduto` (
  `tbPadroesLarguraProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbGrupoProduto` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbPadroesLarguraProduto_Id`, `tbGrupoProduto`),
  CONSTRAINT `FK_tbPadroesLarguraProduto0003`
    FOREIGN KEY (`tbPadroesLarguraProduto_Id`)
    REFERENCES `golivetradicao`.`tbPadroesLarguraProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbGrupoProduto0005`
    FOREIGN KEY (`tbGrupoProduto`)
    REFERENCES `golivetradicao`.`tbGrupoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbPadroesLarguraProduto_tbSubGrupoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbPadroesLarguraProduto_tbSubGrupoProduto` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbPadroesLarguraProduto_tbSubGrupoProduto` (
  `tbPadroesLarguraProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbSubGrupoProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbPadroesLarguraProduto_Id`, `tbSubGrupoProduto_Id`),
  CONSTRAINT `FK_tbPadroesLarguraProduto0004`
    FOREIGN KEY (`tbPadroesLarguraProduto_Id`)
    REFERENCES `golivetradicao`.`tbPadroesLarguraProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbSubGrupoProduto0005`
    FOREIGN KEY (`tbSubGrupoProduto_Id`)
    REFERENCES `golivetradicao`.`tbSubGrupoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbPadroesLarguraProduto_tbColecoesProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbPadroesLarguraProduto_tbColecoesProduto` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbPadroesLarguraProduto_tbColecoesProduto` (
  `tbPadroesLarguraProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbColecoesProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbPadroesLarguraProduto_Id`, `tbColecoesProduto_Id`),
  CONSTRAINT `FK_tbPadroesLarguraProduto0005`
    FOREIGN KEY (`tbPadroesLarguraProduto_Id`)
    REFERENCES `golivetradicao`.`tbPadroesLarguraProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbColecoesProduto0003`
    FOREIGN KEY (`tbColecoesProduto_Id`)
    REFERENCES `golivetradicao`.`tbColecoesProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbPadroesLarguraProduto_tbCorProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbPadroesLarguraProduto_tbCorProduto` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbPadroesLarguraProduto_tbCorProduto` (
  `tbPadroesLarguraProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCorProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbPadroesLarguraProduto_Id`, `tbCorProduto_Id`),
  CONSTRAINT `FK_tbPadroesLarguraProduto0006`
    FOREIGN KEY (`tbPadroesLarguraProduto_Id`)
    REFERENCES `golivetradicao`.`tbPadroesLarguraProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCorProduto0003`
    FOREIGN KEY (`tbCorProduto_Id`)
    REFERENCES `golivetradicao`.`tbCorProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE UNIQUE INDEX `tbCorProduto_Id_UNIQUE` ON `golivetradicao`.`tbPadroesLarguraProduto_tbCorProduto` (`tbCorProduto_Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbAuditoria_tbPadroesLarguraProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbAuditoria_tbPadroesLarguraProduto` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbAuditoria_tbPadroesLarguraProduto` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbPadroesLarguraProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbPadroesLarguraProduto_Id`),
  CONSTRAINT `FK_tbAuditoria0015`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golivetradicao`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbPadroesLarguraProduto0007`
    FOREIGN KEY (`tbPadroesLarguraProduto_Id`)
    REFERENCES `golivetradicao`.`tbPadroesLarguraProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0029`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0025`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golivetradicao`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golivetradicao`.`tbAuditoria_tbPadroesLarguraProduto` (`tbAuditoriaItem_Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbColecoesProduto_tbDepartamentoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbColecoesProduto_tbDepartamentoProduto` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbColecoesProduto_tbDepartamentoProduto` (
  `tbColecoesProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbDepartamentoProduto_Id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`tbColecoesProduto_Id`, `tbDepartamentoProduto_Id`),
  CONSTRAINT `FK_tbColecoesProduto0004`
    FOREIGN KEY (`tbColecoesProduto_Id`)
    REFERENCES `golivetradicao`.`tbColecoesProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbDepartamentoProduto0006`
    FOREIGN KEY (`tbDepartamentoProduto_Id`)
    REFERENCES `golivetradicao`.`tbDepartamentoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbColecoesProduto_tbGrupoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbColecoesProduto_tbGrupoProduto` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbColecoesProduto_tbGrupoProduto` (
  `tbColecoesProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbGrupoProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbColecoesProduto_Id`, `tbGrupoProduto_Id`),
  CONSTRAINT `FK_tbColecoesProduto0005`
    FOREIGN KEY (`tbColecoesProduto_Id`)
    REFERENCES `golivetradicao`.`tbColecoesProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbGrupoProduto0006`
    FOREIGN KEY (`tbGrupoProduto_Id`)
    REFERENCES `golivetradicao`.`tbGrupoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbColecoesProduto_tbSubGrupoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbColecoesProduto_tbSubGrupoProduto` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbColecoesProduto_tbSubGrupoProduto` (
  `tbColecoesProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbSubGrupoProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbColecoesProduto_Id`, `tbSubGrupoProduto_Id`),
  CONSTRAINT `FK_tbColecoesProduto0006`
    FOREIGN KEY (`tbColecoesProduto_Id`)
    REFERENCES `golivetradicao`.`tbColecoesProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbSubGrupoProduto0006`
    FOREIGN KEY (`tbSubGrupoProduto_Id`)
    REFERENCES `golivetradicao`.`tbSubGrupoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbAuditoria_tbColecoesProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbAuditoria_tbColecoesProduto` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbAuditoria_tbColecoesProduto` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbColecoesProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbColecoesProduto_Id`),
  CONSTRAINT `FK_tbAuditoria0016`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golivetradicao`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbColecoesProduto0008`
    FOREIGN KEY (`tbColecoesProduto_Id`)
    REFERENCES `golivetradicao`.`tbColecoesProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0030`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0026`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golivetradicao`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golivetradicao`.`tbAuditoria_tbColecoesProduto` (`tbAuditoriaItem_Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbCorProduto_tbDepartamentoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbCorProduto_tbDepartamentoProduto` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbCorProduto_tbDepartamentoProduto` (
  `tbCorProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbDepartamentoProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbCorProduto_Id`, `tbDepartamentoProduto_Id`),
  CONSTRAINT `FK_tbCorProduto0004`
    FOREIGN KEY (`tbCorProduto_Id`)
    REFERENCES `golivetradicao`.`tbCorProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbDepartamentoProduto0007`
    FOREIGN KEY (`tbDepartamentoProduto_Id`)
    REFERENCES `golivetradicao`.`tbDepartamentoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbCorProduto_tbGrupoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbCorProduto_tbGrupoProduto` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbCorProduto_tbGrupoProduto` (
  `tbCorProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbGrupoProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbCorProduto_Id`, `tbGrupoProduto_Id`),
  CONSTRAINT `FK_tbCorProduto0005`
    FOREIGN KEY (`tbCorProduto_Id`)
    REFERENCES `golivetradicao`.`tbCorProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbGrupoProduto0007`
    FOREIGN KEY (`tbGrupoProduto_Id`)
    REFERENCES `golivetradicao`.`tbGrupoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbCorProduto_tbSubGrupoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbCorProduto_tbSubGrupoProduto` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbCorProduto_tbSubGrupoProduto` (
  `tbCorProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbSubGrupoProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbCorProduto_Id`, `tbSubGrupoProduto_Id`),
  CONSTRAINT `FK_tbCorProduto0006`
    FOREIGN KEY (`tbCorProduto_Id`)
    REFERENCES `golivetradicao`.`tbCorProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbSubGrupoProduto0007`
    FOREIGN KEY (`tbSubGrupoProduto_Id`)
    REFERENCES `golivetradicao`.`tbSubGrupoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbCorProduto_tbColecoesProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbCorProduto_tbColecoesProduto` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbCorProduto_tbColecoesProduto` (
  `tbCorProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbColecoesProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbCorProduto_Id`, `tbColecoesProduto_Id`),
  CONSTRAINT `FK_tbCorProduto0007`
    FOREIGN KEY (`tbCorProduto_Id`)
    REFERENCES `golivetradicao`.`tbCorProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbColecoesProduto0007`
    FOREIGN KEY (`tbColecoesProduto_Id`)
    REFERENCES `golivetradicao`.`tbColecoesProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE UNIQUE INDEX `tbCorProduto_Id_UNIQUE` ON `golivetradicao`.`tbCorProduto_tbColecoesProduto` (`tbCorProduto_Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbAuditoria_tbCorProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbAuditoria_tbCorProduto` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbAuditoria_tbCorProduto` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCorProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbCorProduto_Id`),
  CONSTRAINT `FK_tbAuditoria0017`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golivetradicao`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCorProduto0008`
    FOREIGN KEY (`tbCorProduto_Id`)
    REFERENCES `golivetradicao`.`tbCorProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0031`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0027`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golivetradicao`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golivetradicao`.`tbAuditoria_tbCorProduto` (`tbAuditoriaItem_Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbProduto` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbProduto` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `Observacao` VARCHAR(8000) NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;


CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetradicao`.`tbProduto` (`Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbProdutoCodigo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbProdutoCodigo` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbProdutoCodigo` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL,
  `Codigo` VARCHAR(8000) NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL)
ENGINE = InnoDB;


CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetradicao`.`tbProdutoCodigo` (`Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbProduto_tbProdutoCodigo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbProduto_tbProdutoCodigo` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbProduto_tbProdutoCodigo` (
  `tbProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbProdutoCodigo_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbFinalidadeCodigoProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbProduto_Id`, `tbProdutoCodigo_Id`, `tbFinalidadeCodigoProduto_Id`),
  CONSTRAINT `FK_tbProduto0001`
    FOREIGN KEY (`tbProduto_Id`)
    REFERENCES `golivetradicao`.`tbProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbProdutoCodigo0001`
    FOREIGN KEY (`tbProdutoCodigo_Id`)
    REFERENCES `golivetradicao`.`tbProdutoCodigo` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbFinalidadeCodigoProduto0001`
    FOREIGN KEY (`tbFinalidadeCodigoProduto_Id`)
    REFERENCES `golivetradicao`.`tbFinalidadeCodigoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE UNIQUE INDEX `tbProdutoCodigo_Id_UNIQUE` ON `golivetradicao`.`tbProduto_tbProdutoCodigo` (`tbProdutoCodigo_Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbAuditoria_tbProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbAuditoria_tbProduto` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbAuditoria_tbProduto` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbProduto_Id`),
  CONSTRAINT `FK_tbAuditoria0001`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golivetradicao`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbProduto0015`
    FOREIGN KEY (`tbProduto_Id`)
    REFERENCES `golivetradicao`.`tbProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0009`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0008`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golivetradicao`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golivetradicao`.`tbAuditoria_tbProduto` (`tbAuditoriaItem_Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbAuditoria_tbProdutoCodigo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbAuditoria_tbProdutoCodigo` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbAuditoria_tbProdutoCodigo` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbProdutoCodigo_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbProdutoCodigo_Id`),
  CONSTRAINT `FK_tbAuditoria0002`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golivetradicao`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbProdutoCodigo0002`
    FOREIGN KEY (`tbProdutoCodigo_Id`)
    REFERENCES `golivetradicao`.`tbProdutoCodigo` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0010`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0009`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golivetradicao`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golivetradicao`.`tbAuditoria_tbProdutoCodigo` (`tbAuditoriaItem_Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbProdutoDescricao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbProdutoDescricao` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbProdutoDescricao` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `Descricao` VARCHAR(8000) NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;


CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetradicao`.`tbProdutoDescricao` (`Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbProduto_tbProdutoDescricao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbProduto_tbProdutoDescricao` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbProduto_tbProdutoDescricao` (
  `tbProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbProdutoDescricao_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbFinalidadeDescricaoProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbProduto_Id`, `tbProdutoDescricao_Id`, `tbFinalidadeDescricaoProduto_Id`),
  CONSTRAINT `FK_tbProduto0002`
    FOREIGN KEY (`tbProduto_Id`)
    REFERENCES `golivetradicao`.`tbProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbProdutoDescricao0001`
    FOREIGN KEY (`tbProdutoDescricao_Id`)
    REFERENCES `golivetradicao`.`tbProdutoDescricao` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbFinalidadeDescricaoProduto0001`
    FOREIGN KEY (`tbFinalidadeDescricaoProduto_Id`)
    REFERENCES `golivetradicao`.`tbFinalidadeDescricaoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE UNIQUE INDEX `tbProdutoDescricao_Id_UNIQUE` ON `golivetradicao`.`tbProduto_tbProdutoDescricao` (`tbProdutoDescricao_Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbAuditoria_tbProdutoDescricao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbAuditoria_tbProdutoDescricao` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbAuditoria_tbProdutoDescricao` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbProdutoDescricao_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbProdutoDescricao_Id`),
  CONSTRAINT `FK_tbAuditoria0003`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golivetradicao`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbProdutoDescricao0002`
    FOREIGN KEY (`tbProdutoDescricao_Id`)
    REFERENCES `golivetradicao`.`tbProdutoDescricao` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0011`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0010`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golivetradicao`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golivetradicao`.`tbAuditoria_tbProdutoDescricao` (`tbAuditoriaItem_Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbProduto_tbDepartamentoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbProduto_tbDepartamentoProduto` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbProduto_tbDepartamentoProduto` (
  `tbProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbDepartamentoProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbProduto_Id`, `tbDepartamentoProduto_Id`),
  CONSTRAINT `FK_tbProduto0003`
    FOREIGN KEY (`tbProduto_Id`)
    REFERENCES `golivetradicao`.`tbProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbDepartamentoProduto0001`
    FOREIGN KEY (`tbDepartamentoProduto_Id`)
    REFERENCES `golivetradicao`.`tbDepartamentoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE UNIQUE INDEX `tbProduto_Id_UNIQUE` ON `golivetradicao`.`tbProduto_tbDepartamentoProduto` (`tbProduto_Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbProduto_tbGrupoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbProduto_tbGrupoProduto` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbProduto_tbGrupoProduto` (
  `tbProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbGrupoProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbProduto_Id`, `tbGrupoProduto_Id`),
  CONSTRAINT `FK_tbProduto0004`
    FOREIGN KEY (`tbProduto_Id`)
    REFERENCES `golivetradicao`.`tbProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbGrupoProduto0001`
    FOREIGN KEY (`tbGrupoProduto_Id`)
    REFERENCES `golivetradicao`.`tbGrupoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE UNIQUE INDEX `tbProduto_Id_UNIQUE` ON `golivetradicao`.`tbProduto_tbGrupoProduto` (`tbProduto_Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbProduto_tbSubGrupoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbProduto_tbSubGrupoProduto` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbProduto_tbSubGrupoProduto` (
  `tbProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbSubGrupoProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbProduto_Id`, `tbSubGrupoProduto_Id`),
  CONSTRAINT `FK_tbProduto00005`
    FOREIGN KEY (`tbProduto_Id`)
    REFERENCES `golivetradicao`.`tbProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbSubGrupoProduto0001`
    FOREIGN KEY (`tbSubGrupoProduto_Id`)
    REFERENCES `golivetradicao`.`tbSubGrupoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE UNIQUE INDEX `tbProduto_Id_UNIQUE` ON `golivetradicao`.`tbProduto_tbSubGrupoProduto` (`tbProduto_Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbProduto_tbColecoesProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbProduto_tbColecoesProduto` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbProduto_tbColecoesProduto` (
  `tbProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbColecoesProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbFinalidadeColecaoProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbProduto_Id`, `tbColecoesProduto_Id`, `tbFinalidadeColecaoProduto_Id`),
  CONSTRAINT `FK_tbProduto000006`
    FOREIGN KEY (`tbProduto_Id`)
    REFERENCES `golivetradicao`.`tbProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbColecoesProduto0001`
    FOREIGN KEY (`tbColecoesProduto_Id`)
    REFERENCES `golivetradicao`.`tbColecoesProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbFinalidadeColecaoProduto0001`
    FOREIGN KEY (`tbFinalidadeColecaoProduto_Id`)
    REFERENCES `golivetradicao`.`tbFinalidadeColecaoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbProduto_tbCorProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbProduto_tbCorProduto` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbProduto_tbCorProduto` (
  `tbProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCorProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbFinalidadeCorProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbProduto_Id`, `tbCorProduto_Id`, `tbFinalidadeCorProduto_Id`),
  CONSTRAINT `FK_tbProduto0007`
    FOREIGN KEY (`tbProduto_Id`)
    REFERENCES `golivetradicao`.`tbProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCorProduto0001`
    FOREIGN KEY (`tbCorProduto_Id`)
    REFERENCES `golivetradicao`.`tbCorProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbFinalidadeCorProduto0001`
    FOREIGN KEY (`tbFinalidadeCorProduto_Id`)
    REFERENCES `golivetradicao`.`tbFinalidadeCorProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbProduto_tbPadroesLarguraProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbProduto_tbPadroesLarguraProduto` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbProduto_tbPadroesLarguraProduto` (
  `tbProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbPadroesLarguraProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbFinalidadePadraoLarguraProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbProduto_Id`, `tbPadroesLarguraProduto_Id`, `tbFinalidadePadraoLarguraProduto_Id`),
  CONSTRAINT `FK_tbProduto0008`
    FOREIGN KEY (`tbProduto_Id`)
    REFERENCES `golivetradicao`.`tbProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbPadroesLarguraProduto0001`
    FOREIGN KEY (`tbPadroesLarguraProduto_Id`)
    REFERENCES `golivetradicao`.`tbPadroesLarguraProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbFinalidadePadraoLarguraProduto0002`
    FOREIGN KEY (`tbFinalidadePadraoLarguraProduto_Id`)
    REFERENCES `golivetradicao`.`tbFinalidadePadraoLarguraProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbProduto_tbPadroesEspessuraProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbProduto_tbPadroesEspessuraProduto` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbProduto_tbPadroesEspessuraProduto` (
  `tbProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbPadroesEspessuraProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbFinalidadePadraoEspessuraProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbProduto_Id`, `tbPadroesEspessuraProduto_Id`, `tbFinalidadePadraoEspessuraProduto_Id`),
  CONSTRAINT `FK_tbProduto0009`
    FOREIGN KEY (`tbProduto_Id`)
    REFERENCES `golivetradicao`.`tbProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbPadroesEspessuraProduto0001`
    FOREIGN KEY (`tbPadroesEspessuraProduto_Id`)
    REFERENCES `golivetradicao`.`tbPadroesEspessuraProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbFinalidadePadraoEspessuraProduto0002`
    FOREIGN KEY (`tbFinalidadePadraoEspessuraProduto_Id`)
    REFERENCES `golivetradicao`.`tbFinalidadePadraoEspessuraProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbProduto_tbTipoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbProduto_tbTipoProduto` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbProduto_tbTipoProduto` (
  `tbProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbTipoProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbFinalidadeTipoProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbProduto_Id`, `tbTipoProduto_Id`, `tbFinalidadeTipoProduto_Id`),
  CONSTRAINT `FK_tbProduto0010`
    FOREIGN KEY (`tbProduto_Id`)
    REFERENCES `golivetradicao`.`tbProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbTipoProduto0001`
    FOREIGN KEY (`tbTipoProduto_Id`)
    REFERENCES `golivetradicao`.`tbTipoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_FinalidadeTipoProduto0001`
    FOREIGN KEY (`tbFinalidadeTipoProduto_Id`)
    REFERENCES `golivetradicao`.`tbFinalidadeTipoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbProdutoUnidade`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbProdutoUnidade` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbProdutoUnidade` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `UnidadePrincipal` BIT NOT NULL,
  `UnidadeSecundaria` BIT NOT NULL,
  `FatorMultiplicacao` DECIMAL(18,3) NULL,
  `PesoLiquido` DECIMAL(18,3) NULL,
  `PesoBruto` DECIMAL(18,3) NULL,
  `PermiteCompra` BIT NOT NULL,
  `LimitaQuantidadeMinimaPedidoCompra` BIT NOT NULL,
  `QuantidadeMinimaPedidoCompra` DECIMAL(18,3) NULL,
  `LimitaQuantidadeMaximaPedidoCompra` BIT NOT NULL,
  `QuantidadeMaximaPedidoCompra` DECIMAL(18,3) NULL,
  `LimitaPesoMaximoPedidoCompra` BIT NOT NULL,
  `PesoMaximoPedidoCompra` DECIMAL(18,3) NULL,
  `UtilizadaAnaliseComparativaPedidoCompra` BIT NOT NULL,
  `UtilizadaAnaliseComparativaEstoque` BIT NOT NULL,
  `PermiteVenda` BIT NOT NULL,
  `LimitaQuantidadeMinimaPedidoVenda` BIT NOT NULL,
  `QuantidadeMinimaPedidoVenda` DECIMAL(18,3) NULL,
  `LimitaQuantidadeMaximaPedidoVenda` BIT NOT NULL,
  `QuantidadeMaximaPedidoVenda` DECIMAL(18,3) NULL,
  `LimitaPesoMaximoPedidoVenda` BIT NOT NULL,
  `PesoMaximoPedidoVenda` DECIMAL(18,3) NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;


CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetradicao`.`tbProdutoUnidade` (`Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbProduto_tbProdutoUnidade`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbProduto_tbProdutoUnidade` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbProduto_tbProdutoUnidade` (
  `tbProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUnidade_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbProdutoUnidade_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbFinalidadeUnidadeProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbProduto_Id`, `tbUnidade_Id`, `tbProdutoUnidade_Id`, `tbFinalidadeUnidadeProduto_Id`),
  CONSTRAINT `FK_tbProduto0011`
    FOREIGN KEY (`tbProduto_Id`)
    REFERENCES `golivetradicao`.`tbProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbProdutoUnidade0001`
    FOREIGN KEY (`tbProdutoUnidade_Id`)
    REFERENCES `golivetradicao`.`tbProdutoUnidade` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbFinalidadeUnidadeProduto0001`
    FOREIGN KEY (`tbFinalidadeUnidadeProduto_Id`)
    REFERENCES `golivetradicao`.`tbFinalidadeUnidadeProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUnidade0004`
    FOREIGN KEY (`tbUnidade_Id`)
    REFERENCES `golivetradicao`.`tbUnidade` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE UNIQUE INDEX `tbProduto_Id_UNIQUE` ON `golivetradicao`.`tbProduto_tbProdutoUnidade` (`tbProduto_Id` ASC);


CREATE UNIQUE INDEX `tbProdutoUnidade_Id_UNIQUE` ON `golivetradicao`.`tbProduto_tbProdutoUnidade` (`tbProdutoUnidade_Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbAuditoria_tbProdutoUnidade`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbAuditoria_tbProdutoUnidade` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbAuditoria_tbProdutoUnidade` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbProdutoUnidade_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbProdutoUnidade_Id`),
  CONSTRAINT `FK_tbAuditoria0004`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golivetradicao`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbProdutoUnidade0002`
    FOREIGN KEY (`tbProdutoUnidade_Id`)
    REFERENCES `golivetradicao`.`tbProdutoUnidade` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0012`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0011`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golivetradicao`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golivetradicao`.`tbAuditoria_tbProdutoUnidade` (`tbAuditoriaItem_Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbProdutoCodigoBarras`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbProdutoCodigoBarras` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbProdutoCodigoBarras` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `CodigoBarras` BIGINT(14) ZEROFILL NOT NULL,
  `FatorMultiplicacao` DECIMAL(18,3) NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;


CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetradicao`.`tbProdutoCodigoBarras` (`Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbProduto_tbProdutoCodigoBarras`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbProduto_tbProdutoCodigoBarras` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbProduto_tbProdutoCodigoBarras` (
  `tbProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbProdutoCodigoBarras_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbFinalidadeCodigoBarras_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbProduto_Id`, `tbProdutoCodigoBarras_Id`, `tbFinalidadeCodigoBarras_Id`),
  CONSTRAINT `FK_tbProduto0012`
    FOREIGN KEY (`tbProduto_Id`)
    REFERENCES `golivetradicao`.`tbProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbProdutoCodigoBarras0001`
    FOREIGN KEY (`tbProdutoCodigoBarras_Id`)
    REFERENCES `golivetradicao`.`tbProdutoCodigoBarras` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbFinalidadeCodigoBarrasProduto0002`
    FOREIGN KEY (`tbFinalidadeCodigoBarras_Id`)
    REFERENCES `golivetradicao`.`tbFinalidadeCodigoBarrasProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbProdutoCodigoBarras_tbUnidade`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbProdutoCodigoBarras_tbUnidade` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbProdutoCodigoBarras_tbUnidade` (
  `tbProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbProdutoCodigoBarras_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUnidade_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbFinalidadeUnidadeProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbProduto_Id`, `tbProdutoCodigoBarras_Id`, `tbUnidade_Id`, `tbFinalidadeUnidadeProduto_Id`),
  CONSTRAINT `FK_tbProduto0013`
    FOREIGN KEY (`tbProduto_Id`)
    REFERENCES `golivetradicao`.`tbProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbProdutoCodigoBarras0002`
    FOREIGN KEY (`tbProdutoCodigoBarras_Id`)
    REFERENCES `golivetradicao`.`tbProdutoCodigoBarras` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUnidade0005`
    FOREIGN KEY (`tbUnidade_Id`)
    REFERENCES `golivetradicao`.`tbUnidade` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbFinalidadeUnidadeProduto0002`
    FOREIGN KEY (`tbFinalidadeUnidadeProduto_Id`)
    REFERENCES `golivetradicao`.`tbFinalidadeUnidadeProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE UNIQUE INDEX `tbProdutoCodigoBarras_Id_UNIQUE` ON `golivetradicao`.`tbProdutoCodigoBarras_tbUnidade` (`tbProdutoCodigoBarras_Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbAuditoria_tbProdutoCodigoBarras`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbAuditoria_tbProdutoCodigoBarras` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbAuditoria_tbProdutoCodigoBarras` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbProdutoCodigoBarras_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbProdutoCodigoBarras_Id`),
  CONSTRAINT `FK_tbAuditoria0005`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golivetradicao`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbProdutoCodigoBarras0003`
    FOREIGN KEY (`tbProdutoCodigoBarras_Id`)
    REFERENCES `golivetradicao`.`tbProdutoCodigoBarras` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0013`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0012`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golivetradicao`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golivetradicao`.`tbAuditoria_tbProdutoCodigoBarras` (`tbAuditoriaItem_Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbProduto_tbFornecedor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbProduto_tbFornecedor` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbProduto_tbFornecedor` (
  `tbProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbFornecedor_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbProduto_Id`, `tbFornecedor_Id`),
  CONSTRAINT `FK_tbProduto0014`
    FOREIGN KEY (`tbProduto_Id`)
    REFERENCES `golivetradicao`.`tbProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbCategoriaNaturezaJuridica`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbCategoriaNaturezaJuridica` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbCategoriaNaturezaJuridica` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `CategoriaNaturezaJuridica` VARCHAR(120) NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;


CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetradicao`.`tbCategoriaNaturezaJuridica` (`Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbAuditoria_tbCategoriaNaturezaJuridica`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbAuditoria_tbCategoriaNaturezaJuridica` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbAuditoria_tbCategoriaNaturezaJuridica` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCategoriaNaturezaJuridica_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbCategoriaNaturezaJuridica_Id`),
  CONSTRAINT `FK_tbAuditoria0006`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golivetradicao`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCategoriaNaturezaJuridica0001`
    FOREIGN KEY (`tbCategoriaNaturezaJuridica_Id`)
    REFERENCES `golivetradicao`.`tbCategoriaNaturezaJuridica` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0014`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0037`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golivetradicao`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golivetradicao`.`tbAuditoria_tbCategoriaNaturezaJuridica` (`tbAuditoriaItem_Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbNaturezaJuridica`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbNaturezaJuridica` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbNaturezaJuridica` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `CodigoNaturezaJuridica` INT UNSIGNED ZEROFILL NOT NULL,
  `NaturezaJuridica` VARCHAR(120) NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;


CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetradicao`.`tbNaturezaJuridica` (`Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbNaturezaJuridica_tbCategoriaNaturezaJuridica`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbNaturezaJuridica_tbCategoriaNaturezaJuridica` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbNaturezaJuridica_tbCategoriaNaturezaJuridica` (
  `tbNaturezaJuridica_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCategoriaNaturezaJuridica_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbNaturezaJuridica_Id`, `tbCategoriaNaturezaJuridica_Id`),
  CONSTRAINT `FK_tbNaturezaJuridica`
    FOREIGN KEY (`tbNaturezaJuridica_Id`)
    REFERENCES `golivetradicao`.`tbNaturezaJuridica` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCategoriaNaturezaJuridica`
    FOREIGN KEY (`tbCategoriaNaturezaJuridica_Id`)
    REFERENCES `golivetradicao`.`tbCategoriaNaturezaJuridica` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE UNIQUE INDEX `tbNaturezaJuridica_Id_UNIQUE` ON `golivetradicao`.`tbNaturezaJuridica_tbCategoriaNaturezaJuridica` (`tbNaturezaJuridica_Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbAuditoria_tbNaturezaJuridica`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbAuditoria_tbNaturezaJuridica` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbAuditoria_tbNaturezaJuridica` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbNaturezaJuridica_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbNaturezaJuridica_Id`),
  CONSTRAINT `FK_tbAuditoria0007`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golivetradicao`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbNaturezaJuridica0001`
    FOREIGN KEY (`tbNaturezaJuridica_Id`)
    REFERENCES `golivetradicao`.`tbNaturezaJuridica` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0015`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0038`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golivetradicao`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golivetradicao`.`tbAuditoria_tbNaturezaJuridica` (`tbAuditoriaItem_Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbRegimeApuracao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbRegimeApuracao` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbRegimeApuracao` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `RegimeApuracao` VARCHAR(120) NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;


CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetradicao`.`tbRegimeApuracao` (`Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbAuditoria_tbRegimeApuracao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbAuditoria_tbRegimeApuracao` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbAuditoria_tbRegimeApuracao` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbRegimeApuracao_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbRegimeApuracao_Id`),
  CONSTRAINT `FK_tbAuditoria0008`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golivetradicao`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbRegimeApuracao0001`
    FOREIGN KEY (`tbRegimeApuracao_Id`)
    REFERENCES `golivetradicao`.`tbRegimeApuracao` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0016`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0039`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golivetradicao`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golivetradicao`.`tbAuditoria_tbRegimeApuracao` (`tbAuditoriaItem_Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbCnaeSecao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbCnaeSecao` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbCnaeSecao` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `CodigoSecao` CHAR(1) NOT NULL,
  `DenominacaoSecao` VARCHAR(250) NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;


CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetradicao`.`tbCnaeSecao` (`Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbAuditoria_tbCnaeSecao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbAuditoria_tbCnaeSecao` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbAuditoria_tbCnaeSecao` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCnaeSecao_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbCnaeSecao_Id`),
  CONSTRAINT `FK_tbAuditoria0027`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golivetradicao`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCnaeSecao0001`
    FOREIGN KEY (`tbCnaeSecao_Id`)
    REFERENCES `golivetradicao`.`tbCnaeSecao` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0017`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0013`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golivetradicao`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golivetradicao`.`tbAuditoria_tbCnaeSecao` (`tbAuditoriaItem_Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbCnaeDivisao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbCnaeDivisao` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbCnaeDivisao` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `CodigoDivisao` INT(2) UNSIGNED ZEROFILL NOT NULL,
  `DenominacaoDivisao` VARCHAR(250) NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;


CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetradicao`.`tbCnaeDivisao` (`Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbCnaeDivisao_tbCnaeSecao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbCnaeDivisao_tbCnaeSecao` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbCnaeDivisao_tbCnaeSecao` (
  `tbCnaeDivisao_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCnaeSecao_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbCnaeDivisao_Id`, `tbCnaeSecao_Id`),
  CONSTRAINT `FK_tbCnaeDivisao0001`
    FOREIGN KEY (`tbCnaeDivisao_Id`)
    REFERENCES `golivetradicao`.`tbCnaeDivisao` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCnaeSecao0002`
    FOREIGN KEY (`tbCnaeSecao_Id`)
    REFERENCES `golivetradicao`.`tbCnaeSecao` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE UNIQUE INDEX `tbCnaeDivisao_Id_UNIQUE` ON `golivetradicao`.`tbCnaeDivisao_tbCnaeSecao` (`tbCnaeDivisao_Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbAuditoria_tbCnaeDivisao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbAuditoria_tbCnaeDivisao` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbAuditoria_tbCnaeDivisao` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCnaeDivisao_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbCnaeDivisao_Id`),
  CONSTRAINT `FK_tbAuditoria00028`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golivetradicao`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCnaeDivisao0002`
    FOREIGN KEY (`tbCnaeDivisao_Id`)
    REFERENCES `golivetradicao`.`tbCnaeDivisao` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0018`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0014`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golivetradicao`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golivetradicao`.`tbAuditoria_tbCnaeDivisao` (`tbAuditoriaItem_Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbCnaeGrupo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbCnaeGrupo` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbCnaeGrupo` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `CodigoGrupo` INT(1) UNSIGNED ZEROFILL NOT NULL,
  `DenominacaoGrupo` VARCHAR(250) NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`, `CodigoGrupo`))
ENGINE = InnoDB;


CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetradicao`.`tbCnaeGrupo` (`Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbCnaeGrupo_Dependencies`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbCnaeGrupo_Dependencies` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbCnaeGrupo_Dependencies` (
  `tbCnaeGrupo_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCnaeSecao_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCnaeDivisao_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbCnaeGrupo_Id`, `tbCnaeSecao_Id`, `tbCnaeDivisao_Id`),
  CONSTRAINT `FK_tbCnaeGrupo0001`
    FOREIGN KEY (`tbCnaeGrupo_Id`)
    REFERENCES `golivetradicao`.`tbCnaeGrupo` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCnaeSecao0003`
    FOREIGN KEY (`tbCnaeSecao_Id`)
    REFERENCES `golivetradicao`.`tbCnaeSecao` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCnaeDivisao0003`
    FOREIGN KEY (`tbCnaeDivisao_Id`)
    REFERENCES `golivetradicao`.`tbCnaeDivisao` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE UNIQUE INDEX `tbCnaeGrupo_Id_UNIQUE` ON `golivetradicao`.`tbCnaeGrupo_Dependencies` (`tbCnaeGrupo_Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbAuditoria_tbCnaeGrupo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbAuditoria_tbCnaeGrupo` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbAuditoria_tbCnaeGrupo` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCnaeGrupo_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbCnaeGrupo_Id`),
  CONSTRAINT `FK_tbAuditoria0029`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golivetradicao`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCnaeGrupo0003`
    FOREIGN KEY (`tbCnaeGrupo_Id`)
    REFERENCES `golivetradicao`.`tbCnaeGrupo` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0019`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0015`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golivetradicao`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golivetradicao`.`tbAuditoria_tbCnaeGrupo` (`tbAuditoriaItem_Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbCnaeClasse`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbCnaeClasse` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbCnaeClasse` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `CodigoClasse` INT(2) ZEROFILL UNSIGNED NOT NULL,
  `DenominacaoClasse` VARCHAR(250) NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;


CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetradicao`.`tbCnaeClasse` (`Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbCnaeClasse_Dependencies`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbCnaeClasse_Dependencies` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbCnaeClasse_Dependencies` (
  `tbCnaeClasse_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCnaeSecao_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCnaeDivisao_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCnaeGrupo_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbCnaeClasse_Id`, `tbCnaeSecao_Id`, `tbCnaeDivisao_Id`, `tbCnaeGrupo_Id`),
  CONSTRAINT `FK_tbCnaeClasse0001`
    FOREIGN KEY (`tbCnaeClasse_Id`)
    REFERENCES `golivetradicao`.`tbCnaeClasse` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCnaeSecao0004`
    FOREIGN KEY (`tbCnaeSecao_Id`)
    REFERENCES `golivetradicao`.`tbCnaeSecao` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCnaeDivisao0004`
    FOREIGN KEY (`tbCnaeDivisao_Id`)
    REFERENCES `golivetradicao`.`tbCnaeDivisao` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCnaeGrupo0002`
    FOREIGN KEY (`tbCnaeGrupo_Id`)
    REFERENCES `golivetradicao`.`tbCnaeGrupo` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE UNIQUE INDEX `tbCnaeClasse_Id_UNIQUE` ON `golivetradicao`.`tbCnaeClasse_Dependencies` (`tbCnaeClasse_Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbAuditoria_tbCnaeClasse`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbAuditoria_tbCnaeClasse` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbAuditoria_tbCnaeClasse` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCnaeClasse_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbCnaeClasse_Id`),
  CONSTRAINT `FK_tbAuditoria0030`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golivetradicao`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCnaeClasse0002`
    FOREIGN KEY (`tbCnaeClasse_Id`)
    REFERENCES `golivetradicao`.`tbCnaeClasse` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0020`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0016`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golivetradicao`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golivetradicao`.`tbAuditoria_tbCnaeClasse` (`tbAuditoriaItem_Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbCnaeSubClasse`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbCnaeSubClasse` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbCnaeSubClasse` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `CodigoSubClasse` INT(2) UNSIGNED ZEROFILL NOT NULL,
  `DenominacaoSubClasse` VARCHAR(250) NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;


CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetradicao`.`tbCnaeSubClasse` (`Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbCnaeSubClasse_Dependencies`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbCnaeSubClasse_Dependencies` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbCnaeSubClasse_Dependencies` (
  `tbCnaeSubClasse_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCnaeSecao_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCnaeDivisao_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCnaeGrupo_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCnaeClasse_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbCnaeSubClasse_Id`, `tbCnaeSecao_Id`, `tbCnaeDivisao_Id`, `tbCnaeGrupo_Id`, `tbCnaeClasse_Id`),
  CONSTRAINT `FK_tbCnaeSubClasse0001`
    FOREIGN KEY (`tbCnaeSubClasse_Id`)
    REFERENCES `golivetradicao`.`tbCnaeSubClasse` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCnaeSecao0005`
    FOREIGN KEY (`tbCnaeSecao_Id`)
    REFERENCES `golivetradicao`.`tbCnaeSecao` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCnaeDivisao0005`
    FOREIGN KEY (`tbCnaeDivisao_Id`)
    REFERENCES `golivetradicao`.`tbCnaeDivisao` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tb_CnaeGrupo0003`
    FOREIGN KEY (`tbCnaeGrupo_Id`)
    REFERENCES `golivetradicao`.`tbCnaeGrupo` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tb_CnaeClasse0003`
    FOREIGN KEY (`tbCnaeClasse_Id`)
    REFERENCES `golivetradicao`.`tbCnaeClasse` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE UNIQUE INDEX `tbCnaeSubClasse_Id_UNIQUE` ON `golivetradicao`.`tbCnaeSubClasse_Dependencies` (`tbCnaeSubClasse_Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbAuditoria_tbCnaeSubClasse`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbAuditoria_tbCnaeSubClasse` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbAuditoria_tbCnaeSubClasse` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCnaeSubClasse_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbCnaeSubClasse_Id`),
  CONSTRAINT `FK_tbAuditoria0031`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golivetradicao`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCnaeSubClasse0002`
    FOREIGN KEY (`tbCnaeSubClasse_Id`)
    REFERENCES `golivetradicao`.`tbCnaeSubClasse` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0021`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0017`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golivetradicao`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golivetradicao`.`tbAuditoria_tbCnaeSubClasse` (`tbAuditoriaItem_Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbCnaeImpeditivoSimplesNacional`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbCnaeImpeditivoSimplesNacional` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbCnaeImpeditivoSimplesNacional` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;


CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetradicao`.`tbCnaeImpeditivoSimplesNacional` (`Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbCnaeImpeditivoSimplesNacional_tbCnaeSubClasse`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbCnaeImpeditivoSimplesNacional_tbCnaeSubClasse` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbCnaeImpeditivoSimplesNacional_tbCnaeSubClasse` (
  `tbCnaeImpeditivoSimplesNacional_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCnaeSubClasse_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbCnaeImpeditivoSimplesNacional_Id`, `tbCnaeSubClasse_Id`),
  CONSTRAINT `FK_tbCnaeImpeditivoSimplesNacional0001`
    FOREIGN KEY (`tbCnaeImpeditivoSimplesNacional_Id`)
    REFERENCES `golivetradicao`.`tbCnaeImpeditivoSimplesNacional` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCnaeSubClasse0003`
    FOREIGN KEY (`tbCnaeSubClasse_Id`)
    REFERENCES `golivetradicao`.`tbCnaeSubClasse` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE UNIQUE INDEX `tbCnaeImpeditivoSimplesNacional_Id_UNIQUE` ON `golivetradicao`.`tbCnaeImpeditivoSimplesNacional_tbCnaeSubClasse` (`tbCnaeImpeditivoSimplesNacional_Id` ASC);


CREATE UNIQUE INDEX `tbCnaeSubClasse_Id_UNIQUE` ON `golivetradicao`.`tbCnaeImpeditivoSimplesNacional_tbCnaeSubClasse` (`tbCnaeSubClasse_Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbAuditoria_tbCnaeImpeditivoSimplesNacional`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbAuditoria_tbCnaeImpeditivoSimplesNacional` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbAuditoria_tbCnaeImpeditivoSimplesNacional` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCnaeImpeditivoSimplesNacional_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbCnaeImpeditivoSimplesNacional_Id`),
  CONSTRAINT `FK_tbAuditoria0032`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golivetradicao`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCnaeImpeditivoSimplesNacional0002`
    FOREIGN KEY (`tbCnaeImpeditivoSimplesNacional_Id`)
    REFERENCES `golivetradicao`.`tbCnaeImpeditivoSimplesNacional` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0022`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0018`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golivetradicao`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golivetradicao`.`tbAuditoria_tbCnaeImpeditivoSimplesNacional` (`tbAuditoriaItem_Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbCodigoInternet`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbCodigoInternet` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbCodigoInternet` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `CodigoTld` CHAR(2) NOT NULL,
  `PaisEmPortugues` VARCHAR(120) NOT NULL,
  `PaisEmIngles` VARCHAR(120) NOT NULL,
  `PaisEmNativo` VARCHAR(120) NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;


CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetradicao`.`tbCodigoInternet` (`Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbAuditoria_tbCodigoInternet`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbAuditoria_tbCodigoInternet` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbAuditoria_tbCodigoInternet` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCodigoInternet_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbCodigoInternet_Id`),
  CONSTRAINT `FK_tbAuditoria0033`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golivetradicao`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCodigoInternet0001`
    FOREIGN KEY (`tbCodigoInternet_Id`)
    REFERENCES `golivetradicao`.`tbCodigoInternet` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0004`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0003`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golivetradicao`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golivetradicao`.`tbAuditoria_tbCodigoInternet` (`tbAuditoriaItem_Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbLinguas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbLinguas` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbLinguas` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `CodigoISO639-1` CHAR(2) NOT NULL,
  `LinguaEmPortugues` VARCHAR(120) NOT NULL,
  `LinguaEmIngles` VARCHAR(120) NOT NULL,
  `LinguaEmNativo` VARCHAR(120) NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;


CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetradicao`.`tbLinguas` (`Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbAuditoria_tbLinguas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbAuditoria_tbLinguas` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbAuditoria_tbLinguas` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbLinguas_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbLinguas_Id`),
  CONSTRAINT `FK_tbAuditoria0034`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golivetradicao`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbLinguas0001`
    FOREIGN KEY (`tbLinguas_Id`)
    REFERENCES `golivetradicao`.`tbLinguas` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0005`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0004`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golivetradicao`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golivetradicao`.`tbAuditoria_tbLinguas` (`tbAuditoriaItem_Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbMoeda`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbMoeda` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbMoeda` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL,
  `CodigoIso4217` CHAR(3) NOT NULL,
  `SimboloMonetario` VARCHAR(4) NOT NULL,
  `MoedaEmPortugues` VARCHAR(120) NOT NULL,
  `MoedaEmIngles` VARCHAR(120) NOT NULL,
  `MoedaEmNativo` VARCHAR(120) NOT NULL,
  `UnidadeFracionadaPortugues` VARCHAR(60) NOT NULL,
  `UnidadeFracionadaIngles` VARCHAR(60) NOT NULL,
  `UnidadeFracionadaNativo` VARCHAR(60) NOT NULL,
  `Divisao` INT(4) NOT NULL,
  `CasasDecimais` DECIMAL(3,2) NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbMoeda_tbPais`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbMoeda_tbPais` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbMoeda_tbPais` (
  `tbMoeda_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbPais_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbMoeda_Id`, `tbPais_Id`),
  CONSTRAINT `FK_tbMoeda0001`
    FOREIGN KEY (`tbMoeda_Id`)
    REFERENCES `golivetradicao`.`tbMoeda` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbAuditoria_tbMoeda`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbAuditoria_tbMoeda` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbAuditoria_tbMoeda` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbMoeda_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbMoeda_Id`),
  CONSTRAINT `FK_tbAuditoria0035`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golivetradicao`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbMoeda0002`
    FOREIGN KEY (`tbMoeda_Id`)
    REFERENCES `golivetradicao`.`tbMoeda` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0006`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0005`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golivetradicao`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golivetradicao`.`tbAuditoria_tbMoeda` (`tbAuditoriaItem_Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbCodigoPaisesFips`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbCodigoPaisesFips` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbCodigoPaisesFips` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `CodigoFips` CHAR(2) NOT NULL,
  `PaisEmPortugues` VARCHAR(120) NOT NULL,
  `PaisEmIngles` VARCHAR(120) NOT NULL,
  `PaisEmNativo` VARCHAR(120) NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;


CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetradicao`.`tbCodigoPaisesFips` (`Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbAuditoria_tbCodigoPaisesFips`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbAuditoria_tbCodigoPaisesFips` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbAuditoria_tbCodigoPaisesFips` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCodigoPaisesFips_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbCodigoPaisesFips_Id`),
  CONSTRAINT `FK_tbAuditoria0036`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golivetradicao`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCodigoPaisesFips0001`
    FOREIGN KEY (`tbCodigoPaisesFips_Id`)
    REFERENCES `golivetradicao`.`tbCodigoPaisesFips` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0007`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0006`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golivetradicao`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golivetradicao`.`tbAuditoria_tbCodigoPaisesFips` (`tbAuditoriaItem_Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbCodigoPaisesIso3161_1_Alfa_3`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbCodigoPaisesIso3161_1_Alfa_3` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbCodigoPaisesIso3161_1_Alfa_3` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `CodigoISO3161_1_Alfa_3` CHAR(3) NOT NULL,
  `PaisEmPortugues` VARCHAR(120) NOT NULL,
  `PaisEmIngles` VARCHAR(120) NOT NULL,
  `PaisEmNativo` VARCHAR(120) NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;


CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetradicao`.`tbCodigoPaisesIso3161_1_Alfa_3` (`Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbAuditoria_tbCodigoPaisesIso3161_1_Alfa_3`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbAuditoria_tbCodigoPaisesIso3161_1_Alfa_3` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbAuditoria_tbCodigoPaisesIso3161_1_Alfa_3` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCodigoPaisesIso3161_1_Alfa_3_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbCodigoPaisesIso3161_1_Alfa_3_Id`),
  CONSTRAINT `FK_tbAuditoria0037`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golivetradicao`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCodigoPaisesIso3161_1_Alfa_3_0001`
    FOREIGN KEY (`tbCodigoPaisesIso3161_1_Alfa_3_Id`)
    REFERENCES `golivetradicao`.`tbCodigoPaisesIso3161_1_Alfa_3` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0008`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0007`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golivetradicao`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golivetradicao`.`tbAuditoria_tbCodigoPaisesIso3161_1_Alfa_3` (`tbAuditoriaItem_Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbAuditoriaItem_tbAuditoria`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbAuditoriaItem_tbAuditoria` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbAuditoriaItem_tbAuditoria` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`),
  CONSTRAINT `FK_tbAuditoria0038`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golivetradicao`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0001`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golivetradicao`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0003`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golivetradicao`.`tbAuditoriaItem_tbAuditoria` (`tbAuditoriaItem_Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbAuditoria_tbUsuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbAuditoria_tbUsuario` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbAuditoria_tbUsuario` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`),
  CONSTRAINT `FK_tbAuditoria0039`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golivetradicao`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0002`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golivetradicao`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0001`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0002`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golivetradicao`.`tbAuditoria_tbUsuario` (`tbAuditoriaItem_Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbUsuario_tbFuncionario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbUsuario_tbFuncionario` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbUsuario_tbFuncionario` (
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbFuncionario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbUsuario_Id`, `tbFuncionario_Id`),
  CONSTRAINT `FK_tbUsuario0041`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE UNIQUE INDEX `tbUsuario_Id_UNIQUE` ON `golivetradicao`.`tbUsuario_tbFuncionario` (`tbUsuario_Id` ASC);


CREATE UNIQUE INDEX `tbFuncionario_Id_UNIQUE` ON `golivetradicao`.`tbUsuario_tbFuncionario` (`tbFuncionario_Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbUsuario_tbCliente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbUsuario_tbCliente` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbUsuario_tbCliente` (
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCliente_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbClienteContato_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbUsuario_Id`, `tbCliente_Id`, `tbClienteContato_Id`),
  CONSTRAINT `FK_tbUsuario0042`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE UNIQUE INDEX `tbUsuario_Id_UNIQUE` ON `golivetradicao`.`tbUsuario_tbCliente` (`tbUsuario_Id` ASC);


CREATE UNIQUE INDEX `tbClienteContato_Id_UNIQUE` ON `golivetradicao`.`tbUsuario_tbCliente` (`tbClienteContato_Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbUsuario_tbFornecedor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbUsuario_tbFornecedor` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbUsuario_tbFornecedor` (
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbFornecedor_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbFornecedorContato_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbUsuario_Id`, `tbFornecedor_Id`, `tbFornecedorContato_Id`),
  CONSTRAINT `FK_tbUsuario0043`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE UNIQUE INDEX `tbUsuario_Id_UNIQUE` ON `golivetradicao`.`tbUsuario_tbFornecedor` (`tbUsuario_Id` ASC);


CREATE UNIQUE INDEX `tbFornecedorContato_Id_UNIQUE` ON `golivetradicao`.`tbUsuario_tbFornecedor` (`tbFornecedorContato_Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbCodigoPaisesBacen`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbCodigoPaisesBacen` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbCodigoPaisesBacen` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `CodigoBacen` INT(5) UNSIGNED ZEROFILL NOT NULL,
  `PaisEmPortugues` VARCHAR(120) NOT NULL,
  `PaisEmIngles` VARCHAR(120) NOT NULL,
  `PaisEmNativo` VARCHAR(120) NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;


CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetradicao`.`tbCodigoPaisesBacen` (`Id` ASC);


CREATE UNIQUE INDEX `CodigoBacen_UNIQUE` ON `golivetradicao`.`tbCodigoPaisesBacen` (`CodigoBacen` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbAuditoria_tbCodigoPaisesBacen`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbAuditoria_tbCodigoPaisesBacen` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbAuditoria_tbCodigoPaisesBacen` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCodigoPaisesBacen_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbCodigoPaisesBacen_Id`),
  CONSTRAINT `FK_tbAuditoria0040`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golivetradicao`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0044`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCodigoPaisesBacen0001`
    FOREIGN KEY (`tbCodigoPaisesBacen_Id`)
    REFERENCES `golivetradicao`.`tbCodigoPaisesBacen` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0040`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golivetradicao`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golivetradicao`.`tbAuditoria_tbCodigoPaisesBacen` (`tbAuditoriaItem_Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbCodigoTelefonicoPaises`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbCodigoTelefonicoPaises` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbCodigoTelefonicoPaises` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `CodigoTelefonicoPais` INT(3) UNSIGNED NOT NULL,
  `PaisEmPortugues` VARCHAR(120) NOT NULL,
  `PaisEmIngles` VARCHAR(120) NOT NULL,
  `PaisEmNativo` VARCHAR(120) NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;


CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetradicao`.`tbCodigoTelefonicoPaises` (`Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbAuditoria_tbCodigoTelefonicoPaises`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbAuditoria_tbCodigoTelefonicoPaises` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbAuditoria_tbCodigoTelefonicoPaises` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCodigoTelefonicoPaises_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbCodigoTelefonicoPaises_Id`),
  CONSTRAINT `FK_tbAuditoria0041`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golivetradicao`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0041`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golivetradicao`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0045`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCodigoTelefonicoPaises0001`
    FOREIGN KEY (`tbCodigoTelefonicoPaises_Id`)
    REFERENCES `golivetradicao`.`tbCodigoTelefonicoPaises` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golivetradicao`.`tbAuditoria_tbCodigoTelefonicoPaises` (`tbAuditoriaItem_Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbCodigoTelefonicoMunicipios`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbCodigoTelefonicoMunicipios` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbCodigoTelefonicoMunicipios` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `CodigoTelefonicoMunicipio` INT(3) UNSIGNED NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;


CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetradicao`.`tbCodigoTelefonicoMunicipios` (`Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbRegiao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbRegiao` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbRegiao` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `Regiao` VARCHAR(120) NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;


CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetradicao`.`tbRegiao` (`Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbEstado`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbEstado` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbEstado` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `CodigoIbge` INT(2) UNSIGNED NOT NULL,
  `Abreviacao` CHAR(2) NOT NULL,
  `Estado` VARCHAR(120) NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;


CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetradicao`.`tbEstado` (`Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbCodigoTelefonicoMunicipios_tbMunicipio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbCodigoTelefonicoMunicipios_tbMunicipio` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbCodigoTelefonicoMunicipios_tbMunicipio` (
  `tbCodigoTelefonicoMunicipios_Id` INT ZEROFILL UNSIGNED NOT NULL,
  `tbMunicipio_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbEstado_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbRegiao_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbPais_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbCodigoTelefonicoMunicipios_Id`, `tbMunicipio_Id`, `tbEstado_Id`, `tbRegiao_Id`, `tbPais_Id`),
  CONSTRAINT `FK_tbCodigoTelefonicoMunicipios0001`
    FOREIGN KEY (`tbCodigoTelefonicoMunicipios_Id`)
    REFERENCES `golivetradicao`.`tbCodigoTelefonicoMunicipios` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbRegiao0002`
    FOREIGN KEY (`tbRegiao_Id`)
    REFERENCES `golivetradicao`.`tbRegiao` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbEstado0003`
    FOREIGN KEY (`tbEstado_Id`)
    REFERENCES `golivetradicao`.`tbEstado` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE UNIQUE INDEX `tbCodigoTelefonicoMunicipios_Id_UNIQUE` ON `golivetradicao`.`tbCodigoTelefonicoMunicipios_tbMunicipio` (`tbCodigoTelefonicoMunicipios_Id` ASC);


CREATE UNIQUE INDEX `tbMunicipio_Id_UNIQUE` ON `golivetradicao`.`tbCodigoTelefonicoMunicipios_tbMunicipio` (`tbMunicipio_Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbAuditoria_tbCodigoTelefonicoMunicipios`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbAuditoria_tbCodigoTelefonicoMunicipios` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbAuditoria_tbCodigoTelefonicoMunicipios` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCodigoTelefonicoMunicipios_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbCodigoTelefonicoMunicipios_Id`),
  CONSTRAINT `FK_tbAuditoria0042`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golivetradicao`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0042`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golivetradicao`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0046`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCodigoTelefonicoMunicipios0002`
    FOREIGN KEY (`tbCodigoTelefonicoMunicipios_Id`)
    REFERENCES `golivetradicao`.`tbCodigoTelefonicoMunicipios` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golivetradicao`.`tbAuditoria_tbCodigoTelefonicoMunicipios` (`tbAuditoriaItem_Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbAuditoria_tbRegiao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbAuditoria_tbRegiao` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbAuditoria_tbRegiao` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbRegiao_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbRegiao_Id`),
  CONSTRAINT `FK_tbAuditoria0043`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golivetradicao`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0043`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golivetradicao`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0047`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbRegiao0001`
    FOREIGN KEY (`tbRegiao_Id`)
    REFERENCES `golivetradicao`.`tbRegiao` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golivetradicao`.`tbAuditoria_tbRegiao` (`tbAuditoriaItem_Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbAuditoria_tbEstado`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbAuditoria_tbEstado` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbAuditoria_tbEstado` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbEstado_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbEstado_Id`),
  CONSTRAINT `FK_tbAuditoria0044`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golivetradicao`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0044`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golivetradicao`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0048`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbEstado0001`
    FOREIGN KEY (`tbEstado_Id`)
    REFERENCES `golivetradicao`.`tbEstado` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golivetradicao`.`tbAuditoria_tbEstado` (`tbAuditoriaItem_Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbEstado_tbPais`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbEstado_tbPais` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbEstado_tbPais` (
  `tbEstado_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbPais_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbRegiao_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbEstado_Id`, `tbPais_Id`, `tbRegiao_Id`),
  CONSTRAINT `FK_tbEstado0002`
    FOREIGN KEY (`tbEstado_Id`)
    REFERENCES `golivetradicao`.`tbEstado` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbRegiao0003`
    FOREIGN KEY (`tbRegiao_Id`)
    REFERENCES `golivetradicao`.`tbRegiao` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE UNIQUE INDEX `tbEstado_Id_UNIQUE` ON `golivetradicao`.`tbEstado_tbPais` (`tbEstado_Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbMunicipio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbMunicipio` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbMunicipio` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `CodigoIbge` INT(7) UNSIGNED NOT NULL,
  `Municipio` VARCHAR(120) NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;


CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetradicao`.`tbMunicipio` (`Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbAuditoria_tbMunicipio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbAuditoria_tbMunicipio` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbAuditoria_tbMunicipio` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbMunicipio_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbMunicipio_Id`),
  CONSTRAINT `FK_tbAuditoria0045`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golivetradicao`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0045`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golivetradicao`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0049`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_FK_tbMunicipio0001`
    FOREIGN KEY (`tbMunicipio_Id`)
    REFERENCES `golivetradicao`.`tbMunicipio` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golivetradicao`.`tbAuditoria_tbMunicipio` (`tbAuditoriaItem_Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbMunicipio_tbPais`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbMunicipio_tbPais` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbMunicipio_tbPais` (
  `tbMunicipio_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbPais_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbEstado_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbRegiao_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbMunicipio_Id`, `tbPais_Id`, `tbEstado_Id`, `tbRegiao_Id`),
  CONSTRAINT `FK_tbMunicipio0002`
    FOREIGN KEY (`tbMunicipio_Id`)
    REFERENCES `golivetradicao`.`tbMunicipio` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbEstado0004`
    FOREIGN KEY (`tbEstado_Id`)
    REFERENCES `golivetradicao`.`tbEstado` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbRegiao0004`
    FOREIGN KEY (`tbRegiao_Id`)
    REFERENCES `golivetradicao`.`tbRegiao` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE UNIQUE INDEX `tbMunicipio_Id_UNIQUE` ON `golivetradicao`.`tbMunicipio_tbPais` (`tbMunicipio_Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbTipoLogradouro`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbTipoLogradouro` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbTipoLogradouro` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `Abreviacao` VARCHAR(4) NOT NULL,
  `TipoLogradouro` VARCHAR(120) NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;


CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetradicao`.`tbTipoLogradouro` (`Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbAuditoria_tbTipoLogradouro`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbAuditoria_tbTipoLogradouro` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbAuditoria_tbTipoLogradouro` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbTipoLogradouro_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbTipoLogradouro_Id`),
  CONSTRAINT `FK_tbAuditoria0046`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golivetradicao`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0046`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golivetradicao`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0050`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbTipoLogradouro0001`
    FOREIGN KEY (`tbTipoLogradouro_Id`)
    REFERENCES `golivetradicao`.`tbTipoLogradouro` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golivetradicao`.`tbAuditoria_tbTipoLogradouro` (`tbAuditoriaItem_Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbPais`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbPais` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbPais` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `Bandeira` BLOB NULL,
  `PaisEmPortugues` VARCHAR(120) NOT NULL,
  `PaisEmIngles` VARCHAR(120) NOT NULL,
  `PaisEmNativo` VARCHAR(120) NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `Utc+` BIT NOT NULL,
  `Utc-` BIT NOT NULL,
  `Utc` TIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;


CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetradicao`.`tbPais` (`Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbAuditoria_tbPais`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbAuditoria_tbPais` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbAuditoria_tbPais` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbPais_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbPais_Id`),
  CONSTRAINT `FK_tbAuditoria0047`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golivetradicao`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0047`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golivetradicao`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0051`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbPais0001`
    FOREIGN KEY (`tbPais_Id`)
    REFERENCES `golivetradicao`.`tbPais` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbConfiguracaoColunaPagina` (
  `tbUsuario_Id` INT UNSIGNED NOT NULL,
  `Ordernation` INT UNSIGNED NOT NULL,
  `PageBeanName` VARCHAR(45),
  `TableName` VARCHAR(45),
  `ColumnName` VARCHAR(45),
  `PatternFilter` VARCHAR(45),
  `WidthColumn` INT UNSIGNED,
  `Visible` BIT(1))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golivetradicao`.`tbAuditoria_tbPais` (`tbAuditoriaItem_Id` ASC);



-- -----------------------------------------------------
-- Table `golivetradicao`.`tbPais_Dependecies`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetradicao`.`tbPais_Dependecies` ;


CREATE TABLE IF NOT EXISTS `golivetradicao`.`tbPais_Dependecies` (
  `tbPais_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCodigoPaisesBacen_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCodigoPaisesIso3161_1_Alfa_3_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCodigoPaisesFips_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbMoeda_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbLinguas_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbPais_Id`, `tbCodigoPaisesBacen_Id`, `tbCodigoPaisesIso3161_1_Alfa_3_Id`, `tbCodigoPaisesFips_Id`, `tbMoeda_Id`, `tbLinguas_Id`))
ENGINE = InnoDB;


CREATE UNIQUE INDEX `tbPais_Id_UNIQUE` ON `golivetradicao`.`tbPais_Dependecies` (`tbPais_Id` ASC);


CREATE UNIQUE INDEX `tbCodigoPaisesBacen_Id_UNIQUE` ON `golivetradicao`.`tbPais_Dependecies` (`tbCodigoPaisesBacen_Id` ASC);


CREATE UNIQUE INDEX `tbCodigoPaisesIso3161_1_Alfa_3_Id_UNIQUE` ON `golivetradicao`.`tbPais_Dependecies` (`tbCodigoPaisesIso3161_1_Alfa_3_Id` ASC);


CREATE UNIQUE INDEX `tbCodigoPaisesFips_Id_UNIQUE` ON `golivetradicao`.`tbPais_Dependecies` (`tbCodigoPaisesFips_Id` ASC);



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

