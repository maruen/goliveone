SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema golivetest
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `golivetest` ;
CREATE SCHEMA IF NOT EXISTS `golivetest` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `golivetest` ;

-- -----------------------------------------------------
-- Table `golivetest`.`tbTipoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbTipoProduto` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbTipoProduto` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `TipoProduto` VARCHAR(45) NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetest`.`tbTipoProduto` (`Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbAuditoria`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbAuditoria` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbAuditoria` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `LabelPropertyFormulario` VARCHAR(120) NOT NULL,
  `AcaoUsuario` VARCHAR(2500) NOT NULL,
  `Observacao` VARCHAR(2500) NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetest`.`tbAuditoria` (`Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbUsuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbUsuario` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbUsuario` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `Login` VARCHAR(120) NOT NULL,
  `Password` VARCHAR(60) NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetest`.`tbUsuario` (`Id` ASC);

CREATE UNIQUE INDEX `Login_UNIQUE` ON `golivetest`.`tbUsuario` (`Login` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbAuditoriaItem`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbAuditoriaItem` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbAuditoriaItem` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `LabelPropertyCampo` VARCHAR(2500) NOT NULL,
  `InformacaoAnterior` VARCHAR(2500) NOT NULL,
  `InformacaoAtual` VARCHAR(2500) NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetest`.`tbAuditoriaItem` (`Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbAuditoria_tbTipoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbAuditoria_tbTipoProduto` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbAuditoria_tbTipoProduto` (
  `tbAuditoria_Id` INT ZEROFILL UNSIGNED NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT ZEROFILL UNSIGNED NOT NULL,
  `tbTipoProduto_Id` INT ZEROFILL UNSIGNED NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbTipoProduto_Id`),
  CONSTRAINT `FK_tbAuditoria0010`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golivetest`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbTipoProduto0002`
    FOREIGN KEY (`tbTipoProduto_Id`)
    REFERENCES `golivetest`.`tbTipoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0024`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0020`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golivetest`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golivetest`.`tbAuditoria_tbTipoProduto` (`tbAuditoriaItem_Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbFinalidadeCodigoBarrasProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbFinalidadeCodigoBarrasProduto` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbFinalidadeCodigoBarrasProduto` (
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

CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetest`.`tbFinalidadeCodigoBarrasProduto` (`Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbAuditoria_tbFinalidadeCodigoBarrasProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbAuditoria_tbFinalidadeCodigoBarrasProduto` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbAuditoria_tbFinalidadeCodigoBarrasProduto` (
  `tbAuditoria_Id` INT ZEROFILL UNSIGNED NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT ZEROFILL UNSIGNED NOT NULL,
  `tbFinalidadeCodigoBarrasProduto_Id` INT ZEROFILL UNSIGNED NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbFinalidadeCodigoBarrasProduto_Id`),
  CONSTRAINT `FK_tbAuditoria0020`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golivetest`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbFinalidadeCodigoBarrasProduto0003`
    FOREIGN KEY (`tbFinalidadeCodigoBarrasProduto_Id`)
    REFERENCES `golivetest`.`tbFinalidadeCodigoBarrasProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0034`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0030`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golivetest`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golivetest`.`tbAuditoria_tbFinalidadeCodigoBarrasProduto` (`tbAuditoriaItem_Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbAuditoria_tbUnidade`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbAuditoria_tbUnidade` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbAuditoria_tbUnidade` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUnidade_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbUnidade_Id`),
  CONSTRAINT `FK_tbAuditoria0009`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golivetest`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUnidade0006`
    FOREIGN KEY (`tbUnidade_Id`)
    REFERENCES `golivetest`.`tbUnidade` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0023`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0019`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golivetest`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golivetest`.`tbAuditoria_tbUnidade` (`tbAuditoriaItem_Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbFinalidadePadraoEspessuraProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbFinalidadePadraoEspessuraProduto` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbFinalidadePadraoEspessuraProduto` (
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

CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetest`.`tbFinalidadePadraoEspessuraProduto` (`Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbFinalidadePadraoEspessuraProduto_tbUnidade`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbFinalidadePadraoEspessuraProduto_tbUnidade` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbFinalidadePadraoEspessuraProduto_tbUnidade` (
  `tbFinalidadePadraoEspessuraProduto_Id` INT UNSIGNED NOT NULL,
  `tbUnidade_Id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`tbFinalidadePadraoEspessuraProduto_Id`, `tbUnidade_Id`),
  CONSTRAINT `FK_tbFinalidadePadraoEspessuraProduto0001`
    FOREIGN KEY (`tbFinalidadePadraoEspessuraProduto_Id`)
    REFERENCES `golivetest`.`tbFinalidadePadraoEspessuraProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUnidade0002`
    FOREIGN KEY (`tbUnidade_Id`)
    REFERENCES `golivetest`.`tbUnidade` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `tbFinalidadePadraoEspessuraProduto_Id_UNIQUE` ON `golivetest`.`tbFinalidadePadraoEspessuraProduto_tbUnidade` (`tbFinalidadePadraoEspessuraProduto_Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbFinalidadePadraoLarguraProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbFinalidadePadraoLarguraProduto` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbFinalidadePadraoLarguraProduto` (
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

CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetest`.`tbFinalidadePadraoLarguraProduto` (`Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbFinalidadePadraoLarguraProduto_tbUnidade`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbFinalidadePadraoLarguraProduto_tbUnidade` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbFinalidadePadraoLarguraProduto_tbUnidade` (
  `tbFinalidadePadraoLarguraProduto_Id` INT UNSIGNED NOT NULL,
  `tbUnidade_Id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`tbFinalidadePadraoLarguraProduto_Id`, `tbUnidade_Id`),
  CONSTRAINT `FK_tbFinalidadePadraoLarguraProduto0001`
    FOREIGN KEY (`tbFinalidadePadraoLarguraProduto_Id`)
    REFERENCES `golivetest`.`tbFinalidadePadraoLarguraProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUnidade0003`
    FOREIGN KEY (`tbUnidade_Id`)
    REFERENCES `golivetest`.`tbUnidade` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `tbFinalidadeCodigoBarrasProduto_Id_UNIQUE` ON `golivetest`.`tbFinalidadePadraoLarguraProduto_tbUnidade` (`tbFinalidadePadraoLarguraProduto_Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbUnidade`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbUnidade` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbUnidade` (
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
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetest`.`tbUnidade` (`Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbFinalidadeCodigoBarrasProduto_tbUnidade`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbFinalidadeCodigoBarrasProduto_tbUnidade` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbFinalidadeCodigoBarrasProduto_tbUnidade` (
  `tbFinalidadeCodigoBarrasProduto_Id` INT UNSIGNED NOT NULL,
  `tbUnidade_Id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`tbFinalidadeCodigoBarrasProduto_Id`, `tbUnidade_Id`),
  CONSTRAINT `FK_tbFinalidadeCodigoBarrasProduto0001`
    FOREIGN KEY (`tbFinalidadeCodigoBarrasProduto_Id`)
    REFERENCES `golivetest`.`tbFinalidadeCodigoBarrasProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUnidade0001`
    FOREIGN KEY (`tbUnidade_Id`)
    REFERENCES `golivetest`.`tbUnidade` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `tbFinalidadeCodigoBarrasProduto_Id_UNIQUE` ON `golivetest`.`tbFinalidadeCodigoBarrasProduto_tbUnidade` (`tbFinalidadeCodigoBarrasProduto_Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbFinalidadeCodigoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbFinalidadeCodigoProduto` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbFinalidadeCodigoProduto` (
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

CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetest`.`tbFinalidadeCodigoProduto` (`Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbAuditoria_tbFinalidadeCodigoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbAuditoria_tbFinalidadeCodigoProduto` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbAuditoria_tbFinalidadeCodigoProduto` (
  `tbAuditoria_Id` INT ZEROFILL UNSIGNED NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT ZEROFILL UNSIGNED NOT NULL,
  `tbFinalidadeCodigoProduto_Id` INT ZEROFILL UNSIGNED NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbFinalidadeCodigoProduto_Id`),
  CONSTRAINT `FK_tbAuditoria0018`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golivetest`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbFinalidadeCodigoProduto0002`
    FOREIGN KEY (`tbFinalidadeCodigoProduto_Id`)
    REFERENCES `golivetest`.`tbFinalidadeCodigoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0032`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0028`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golivetest`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golivetest`.`tbAuditoria_tbFinalidadeCodigoProduto` (`tbAuditoriaItem_Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbFinalidadeColecaoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbFinalidadeColecaoProduto` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbFinalidadeColecaoProduto` (
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

CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetest`.`tbFinalidadeColecaoProduto` (`Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbAuditoria_tbFinalidadeColecaoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbAuditoria_tbFinalidadeColecaoProduto` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbAuditoria_tbFinalidadeColecaoProduto` (
  `tbAuditoria_Id` INT ZEROFILL UNSIGNED NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT ZEROFILL UNSIGNED NOT NULL,
  `tbFinalidadeColecaoProduto_Id` INT ZEROFILL UNSIGNED NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbFinalidadeColecaoProduto_Id`),
  CONSTRAINT `FK_tbAuditoria0019`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golivetest`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbFinalidadeColecaoProduto0002`
    FOREIGN KEY (`tbFinalidadeColecaoProduto_Id`)
    REFERENCES `golivetest`.`tbFinalidadeColecaoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0033`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0029`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golivetest`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golivetest`.`tbAuditoria_tbFinalidadeColecaoProduto` (`tbAuditoriaItem_Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbFinalidadeCorProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbFinalidadeCorProduto` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbFinalidadeCorProduto` (
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

CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetest`.`tbFinalidadeCorProduto` (`Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbAuditoria_tbFinalidadeCorProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbAuditoria_tbFinalidadeCorProduto` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbAuditoria_tbFinalidadeCorProduto` (
  `tbAuditoria_Id` INT ZEROFILL UNSIGNED NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT ZEROFILL UNSIGNED NOT NULL,
  `tbFinalidadeCorProduto_Id` INT ZEROFILL UNSIGNED NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbFinalidadeCorProduto_Id`),
  CONSTRAINT `FK_tbAuditoria0021`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golivetest`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbFinalidadeCorProduto0002`
    FOREIGN KEY (`tbFinalidadeCorProduto_Id`)
    REFERENCES `golivetest`.`tbFinalidadeCorProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0035`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0031`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golivetest`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golivetest`.`tbAuditoria_tbFinalidadeCorProduto` (`tbAuditoriaItem_Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbFinalidadeDescricaoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbFinalidadeDescricaoProduto` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbFinalidadeDescricaoProduto` (
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

CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetest`.`tbFinalidadeDescricaoProduto` (`Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbAuditoria_tbFinalidadeDescricaoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbAuditoria_tbFinalidadeDescricaoProduto` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbAuditoria_tbFinalidadeDescricaoProduto` (
  `tbAuditoria_Id` INT ZEROFILL UNSIGNED NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT ZEROFILL UNSIGNED NOT NULL,
  `tbFinalidadeDescricaoProduto_Id` INT ZEROFILL UNSIGNED NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbFinalidadeDescricaoProduto_Id`),
  CONSTRAINT `FK_tbAuditoria0022`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golivetest`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbFinalidadeDescricaoProduto0002`
    FOREIGN KEY (`tbFinalidadeDescricaoProduto_Id`)
    REFERENCES `golivetest`.`tbFinalidadeDescricaoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0036`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0032`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golivetest`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golivetest`.`tbAuditoria_tbFinalidadeDescricaoProduto` (`tbAuditoriaItem_Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbAuditoria_tbFinalidadePadraoEspessuraProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbAuditoria_tbFinalidadePadraoEspessuraProduto` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbAuditoria_tbFinalidadePadraoEspessuraProduto` (
  `tbAuditoria_Id` INT ZEROFILL UNSIGNED NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT ZEROFILL UNSIGNED NOT NULL,
  `tbFinalidadePadraoEspessuraProduto_Id` INT ZEROFILL UNSIGNED NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbFinalidadePadraoEspessuraProduto_Id`),
  CONSTRAINT `FK_tbAuditoria0023`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golivetest`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbFinalidadePadraoEspessuraProduto0003`
    FOREIGN KEY (`tbFinalidadePadraoEspessuraProduto_Id`)
    REFERENCES `golivetest`.`tbFinalidadePadraoEspessuraProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0037`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0033`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golivetest`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golivetest`.`tbAuditoria_tbFinalidadePadraoEspessuraProduto` (`tbAuditoriaItem_Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbAuditoria_tbFinalidadePadraoLarguraProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbAuditoria_tbFinalidadePadraoLarguraProduto` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbAuditoria_tbFinalidadePadraoLarguraProduto` (
  `tbAuditoria_Id` INT ZEROFILL UNSIGNED NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT ZEROFILL UNSIGNED NOT NULL,
  `tbFinalidadePadraoLarguraProduto_Id` INT ZEROFILL UNSIGNED NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbFinalidadePadraoLarguraProduto_Id`),
  CONSTRAINT `FK_tbAuditoria0024`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golivetest`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbFinalidadePadraoLarguraProduto0003`
    FOREIGN KEY (`tbFinalidadePadraoLarguraProduto_Id`)
    REFERENCES `golivetest`.`tbFinalidadePadraoLarguraProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0038`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0034`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golivetest`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golivetest`.`tbAuditoria_tbFinalidadePadraoLarguraProduto` (`tbAuditoriaItem_Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbFinalidadeTipoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbFinalidadeTipoProduto` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbFinalidadeTipoProduto` (
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

CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetest`.`tbFinalidadeTipoProduto` (`Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbAuditoria_tbFinalidadeTipoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbAuditoria_tbFinalidadeTipoProduto` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbAuditoria_tbFinalidadeTipoProduto` (
  `tbAuditoria_Id` INT ZEROFILL UNSIGNED NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT ZEROFILL UNSIGNED NOT NULL,
  `tbFinalidadeTipoProduto_Id` INT ZEROFILL UNSIGNED NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbFinalidadeTipoProduto_Id`),
  CONSTRAINT `FK_tbAuditoria0025`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golivetest`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbFinalidadeTipoProduto0002`
    FOREIGN KEY (`tbFinalidadeTipoProduto_Id`)
    REFERENCES `golivetest`.`tbFinalidadeTipoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0039`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0035`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golivetest`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golivetest`.`tbAuditoria_tbFinalidadeTipoProduto` (`tbAuditoriaItem_Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbFinalidadeUnidadeProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbFinalidadeUnidadeProduto` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbFinalidadeUnidadeProduto` (
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

CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetest`.`tbFinalidadeUnidadeProduto` (`Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbAuditoria_tbFinalidadeUnidadeProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbAuditoria_tbFinalidadeUnidadeProduto` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbAuditoria_tbFinalidadeUnidadeProduto` (
  `tbAuditoria_Id` INT ZEROFILL UNSIGNED NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT ZEROFILL UNSIGNED NOT NULL,
  `tbFinalidadeUnidadeProduto_Id` INT ZEROFILL UNSIGNED NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbFinalidadeUnidadeProduto_Id`),
  CONSTRAINT `FK_tbAuditoria0026`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golivetest`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbFinalidadeUnidadeProduto0003`
    FOREIGN KEY (`tbFinalidadeUnidadeProduto_Id`)
    REFERENCES `golivetest`.`tbFinalidadeUnidadeProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0040`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0036`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golivetest`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golivetest`.`tbAuditoria_tbFinalidadeUnidadeProduto` (`tbAuditoriaItem_Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbDepartamentoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbDepartamentoProduto` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbDepartamentoProduto` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `DepartamentoProduto` VARCHAR(120) NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetest`.`tbDepartamentoProduto` (`Id` ASC);



 -- -----------------------------------------------------
-- Table `golivetest`.`tbAuditoria_tbDepartamentoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbAuditoria_tbDepartamentoProduto` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbAuditoria_tbDepartamentoProduto` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbDepartamentoProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbDepartamentoProduto_Id`),
  CONSTRAINT `FK_tbAuditoria0011`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golivetest`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbDepartamentoProduto0008`
    FOREIGN KEY (`tbDepartamentoProduto_Id`)
    REFERENCES `golivetest`.`tbDepartamentoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0025`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0021`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golivetest`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golivetest`.`tbAuditoria_tbDepartamentoProduto` (`tbAuditoriaItem_Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbGrupoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbGrupoProduto` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbGrupoProduto` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `GrupoProduto` VARCHAR(120) NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetest`.`tbGrupoProduto` (`Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbGrupoProduto_tbDepartamentoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbGrupoProduto_tbDepartamentoProduto` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbGrupoProduto_tbDepartamentoProduto` (
  `tbGrupoProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbDepartamentoProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbGrupoProduto_Id`, `tbDepartamentoProduto_Id`),
  CONSTRAINT `FK_tbGrupoProduto0002`
    FOREIGN KEY (`tbGrupoProduto_Id`)
    REFERENCES `golivetest`.`tbGrupoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbDepartamentoProduto0002`
    FOREIGN KEY (`tbDepartamentoProduto_Id`)
    REFERENCES `golivetest`.`tbDepartamentoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `golivetest`.`tbAuditoria_tbGrupoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbAuditoria_tbGrupoProduto` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbAuditoria_tbGrupoProduto` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbGrupoProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbGrupoProduto_Id`),
  CONSTRAINT `FK_tbAuditoria0012`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golivetest`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbGrupoProduto0008`
    FOREIGN KEY (`tbGrupoProduto_Id`)
    REFERENCES `golivetest`.`tbGrupoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0026`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0022`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golivetest`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golivetest`.`tbAuditoria_tbGrupoProduto` (`tbAuditoriaItem_Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbSubGrupoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbSubGrupoProduto` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbSubGrupoProduto` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `SubGrupoProduto` VARCHAR(120) NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetest`.`tbSubGrupoProduto` (`Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbSubGrupoProduto_tbGrupoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbSubGrupoProduto_tbGrupoProduto` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbSubGrupoProduto_tbGrupoProduto` (
  `tbSubGrupoProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbGrupoProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbSubGrupoProduto_Id`, `tbGrupoProduto_Id`),
  CONSTRAINT `FK_tbSubGrupoProduto0002`
    FOREIGN KEY (`tbSubGrupoProduto_Id`)
    REFERENCES `golivetest`.`tbSubGrupoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbGrupoProduto0003`
    FOREIGN KEY (`tbGrupoProduto_Id`)
    REFERENCES `golivetest`.`tbGrupoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `golivetest`.`tbSubGrupoProduto_tbDepartamentoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbSubGrupoProduto_tbDepartamentoProduto` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbSubGrupoProduto_tbDepartamentoProduto` (
  `tbSubGrupoProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbDepartamentoProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbSubGrupoProduto_Id`, `tbDepartamentoProduto_Id`),
  CONSTRAINT `FK_tbSubGrupoProduto0003`
    FOREIGN KEY (`tbSubGrupoProduto_Id`)
    REFERENCES `golivetest`.`tbSubGrupoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbDepartamentoProduto0003`
    FOREIGN KEY (`tbDepartamentoProduto_Id`)
    REFERENCES `golivetest`.`tbDepartamentoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `golivetest`.`tbAuditoria_tbSubGrupoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbAuditoria_tbSubGrupoProduto` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbAuditoria_tbSubGrupoProduto` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbSubGrupoProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbSubGrupoProduto_Id`),
  CONSTRAINT `FK_tbAuditoria0013`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golivetest`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbSubGrupoProduto0009`
    FOREIGN KEY (`tbSubGrupoProduto_Id`)
    REFERENCES `golivetest`.`tbSubGrupoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0027`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0023`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golivetest`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golivetest`.`tbAuditoria_tbSubGrupoProduto` (`tbAuditoriaItem_Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbPadroesEspessuraProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbPadroesEspessuraProduto` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbPadroesEspessuraProduto` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `Espessura` DECIMAL(6,3) NOT NULL,
  `EspessuraDescricao` VARCHAR(120) NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetest`.`tbPadroesEspessuraProduto` (`Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbPadroesEspessuraProduto_tbDepartamento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbPadroesEspessuraProduto_tbDepartamento` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbPadroesEspessuraProduto_tbDepartamento` (
  `tbPadroesEspessurasProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbDepartamentoProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbPadroesEspessurasProduto_Id`, `tbDepartamentoProduto_Id`),
  CONSTRAINT `FK_tbPadroesEspessurasProduto0002`
    FOREIGN KEY (`tbPadroesEspessurasProduto_Id`)
    REFERENCES `golivetest`.`tbPadroesEspessuraProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbDepartamentoProduto0004`
    FOREIGN KEY (`tbDepartamentoProduto_Id`)
    REFERENCES `golivetest`.`tbDepartamentoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `tbPadroesEspessurasProduto_Id_UNIQUE` ON `golivetest`.`tbPadroesEspessuraProduto_tbDepartamento` (`tbPadroesEspessurasProduto_Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbPadroesEspessuraProduto_tbGrupoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbPadroesEspessuraProduto_tbGrupoProduto` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbPadroesEspessuraProduto_tbGrupoProduto` (
  `tbPadroesEspessuraProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbGrupoProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbPadroesEspessuraProduto_Id`, `tbGrupoProduto_Id`),
  CONSTRAINT `FK_tbPradroesEspessuraProduto0003`
    FOREIGN KEY (`tbPadroesEspessuraProduto_Id`)
    REFERENCES `golivetest`.`tbPadroesEspessuraProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbGrupoProduto0004`
    FOREIGN KEY (`tbGrupoProduto_Id`)
    REFERENCES `golivetest`.`tbGrupoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `tbPadroesEspessuraProduto_Id_UNIQUE` ON `golivetest`.`tbPadroesEspessuraProduto_tbGrupoProduto` (`tbPadroesEspessuraProduto_Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbPadroesEspessuraProduto_tbSubGrupoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbPadroesEspessuraProduto_tbSubGrupoProduto` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbPadroesEspessuraProduto_tbSubGrupoProduto` (
  `tbPadroesEspessuraProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbSubGrupoProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbPadroesEspessuraProduto_Id`, `tbSubGrupoProduto_Id`),
  CONSTRAINT `FK_tbPadroesEspessuraProduto0004`
    FOREIGN KEY (`tbPadroesEspessuraProduto_Id`)
    REFERENCES `golivetest`.`tbPadroesEspessuraProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbSubGrupoProduto0004`
    FOREIGN KEY (`tbSubGrupoProduto_Id`)
    REFERENCES `golivetest`.`tbSubGrupoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `tbPadroesEspessuraProduto_Id_UNIQUE` ON `golivetest`.`tbPadroesEspessuraProduto_tbSubGrupoProduto` (`tbPadroesEspessuraProduto_Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbColecoesProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbColecoesProduto` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbColecoesProduto` (

  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `Colecao` VARCHAR(120) NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetest`.`tbColecoesProduto` (`Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbPadroesEspessuraProduto_tbColecoesProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbPadroesEspessuraProduto_tbColecoesProduto` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbPadroesEspessuraProduto_tbColecoesProduto` (
  `tbPadroesEspessuraProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbColecoesProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbPadroesEspessuraProduto_Id`, `tbColecoesProduto_Id`),
  CONSTRAINT `FK_tbPadroesEspessuraProduto0005`
    FOREIGN KEY (`tbPadroesEspessuraProduto_Id`)
    REFERENCES `golivetest`.`tbPadroesEspessuraProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbColecoesProduto0002`
    FOREIGN KEY (`tbColecoesProduto_Id`)
    REFERENCES `golivetest`.`tbColecoesProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `tbPadroesEspessuraProduto_Id_UNIQUE` ON `golivetest`.`tbPadroesEspessuraProduto_tbColecoesProduto` (`tbPadroesEspessuraProduto_Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbCorProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbCorProduto` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbCorProduto` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `CorCodigo` VARCHAR(15) NULL,
  `CorDescricao` VARCHAR(45) NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetest`.`tbCorProduto` (`Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbPadroesEspessuraProduto_tbCorProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbPadroesEspessuraProduto_tbCorProduto` ;

CREATE TABLE `tbPadroesEspessuraProduto_tbCorProduto` (
  `tbPadoresEspessuraProduto_Id` int(10) unsigned zerofill NOT NULL,
  `tbCorProduto_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbPadoresEspessuraProduto_Id`,`tbCorProduto_Id`),
  UNIQUE KEY `tbPadoresEspessuraProduto_Id_UNIQUE` (`tbPadoresEspessuraProduto_Id`),
  CONSTRAINT `FK_tbCorProduto0002` FOREIGN KEY (`tbCorProduto_Id`) REFERENCES `tbCorProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbPadroesEspessuraProduto0006` FOREIGN KEY (`tbPadoresEspessuraProduto_Id`) REFERENCES `tbPadroesEspessuraProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8


-- -----------------------------------------------------
-- Table `golivetest`.`tbAuditoria_tbPadroesEspessuraProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbAuditoria_tbPadroesEspessuraProduto` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbAuditoria_tbPadroesEspessuraProduto` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbPadroesEspessuraProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbPadroesEspessuraProduto_Id`),
  CONSTRAINT `FK_tbAuditoria0014`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golivetest`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbPadroesEspessuraProduto0007`
    FOREIGN KEY (`tbPadroesEspessuraProduto_Id`)
    REFERENCES `golivetest`.`tbPadroesEspessuraProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0028`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0024`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golivetest`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golivetest`.`tbAuditoria_tbPadroesEspessuraProduto` (`tbAuditoriaItem_Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbPadroesLarguraProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbPadroesLarguraProduto` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbPadroesLarguraProduto` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `Largura` DECIMAL(6,3) NOT NULL,
  `LarguraDescricao` VARCHAR(120) NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetest`.`tbPadroesLarguraProduto` (`Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbPadroesLarguraProduto_tbDepartamentoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbPadroesLarguraProduto_tbDepartamentoProduto` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbPadroesLarguraProduto_tbDepartamentoProduto` (
  `tbPadroesLarguraProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbDepartamentoProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbPadroesLarguraProduto_Id`, `tbDepartamentoProduto_Id`),
  CONSTRAINT `FK_tbPadroesLarguraProduto0002`
    FOREIGN KEY (`tbPadroesLarguraProduto_Id`)
    REFERENCES `golivetest`.`tbPadroesLarguraProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbDepartamentoProduto0005`
    FOREIGN KEY (`tbDepartamentoProduto_Id`)
    REFERENCES `golivetest`.`tbDepartamentoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `tbPadroesLarguraProduto_Id_UNIQUE` ON `golivetest`.`tbPadroesLarguraProduto_tbDepartamentoProduto` (`tbPadroesLarguraProduto_Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbPadroesLarguraProduto_tbGrupoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbPadroesLarguraProduto_tbGrupoProduto` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbPadroesLarguraProduto_tbGrupoProduto` (
  `tbPadroesLarguraProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbGrupoProduto` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbPadroesLarguraProduto_Id`, `tbGrupoProduto`),
  CONSTRAINT `FK_tbPadroesLarguraProduto0003`
    FOREIGN KEY (`tbPadroesLarguraProduto_Id`)
    REFERENCES `golivetest`.`tbPadroesLarguraProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbGrupoProduto0005`
    FOREIGN KEY (`tbGrupoProduto`)
    REFERENCES `golivetest`.`tbGrupoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `tbPadroesLarguraProduto_Id_UNIQUE` ON `golivetest`.`tbPadroesLarguraProduto_tbGrupoProduto` (`tbPadroesLarguraProduto_Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbPadroesLarguraProduto_tbSubGrupoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbPadroesLarguraProduto_tbSubGrupoProduto` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbPadroesLarguraProduto_tbSubGrupoProduto` (
  `tbPadroesLarguraProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbSubGrupoProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbPadroesLarguraProduto_Id`, `tbSubGrupoProduto_Id`),
  CONSTRAINT `FK_tbPadroesLarguraProduto0004`
    FOREIGN KEY (`tbPadroesLarguraProduto_Id`)
    REFERENCES `golivetest`.`tbPadroesLarguraProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbSubGrupoProduto0005`
    FOREIGN KEY (`tbSubGrupoProduto_Id`)
    REFERENCES `golivetest`.`tbSubGrupoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `tbPadroesLarguraProduto_Id_UNIQUE` ON `golivetest`.`tbPadroesLarguraProduto_tbSubGrupoProduto` (`tbPadroesLarguraProduto_Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbPadroesLarguraProduto_tbColecoesProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbPadroesLarguraProduto_tbColecoesProduto` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbPadroesLarguraProduto_tbColecoesProduto` (
  `tbPadroesLarguraProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbColecoesProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbPadroesLarguraProduto_Id`, `tbColecoesProduto_Id`),
  CONSTRAINT `FK_tbPadroesLarguraProduto0005`
    FOREIGN KEY (`tbPadroesLarguraProduto_Id`)
    REFERENCES `golivetest`.`tbPadroesLarguraProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbColecoesProduto0003`
    FOREIGN KEY (`tbColecoesProduto_Id`)
    REFERENCES `golivetest`.`tbColecoesProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `tbPadroesLarguraProduto_Id_UNIQUE` ON `golivetest`.`tbPadroesLarguraProduto_tbColecoesProduto` (`tbPadroesLarguraProduto_Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbPadroesLarguraProduto_tbCorProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbPadroesLarguraProduto_tbCorProduto` ;

CREATE TABLE `golivetest`.`tbPadroesLarguraProduto_tbCorProduto` (
  `tbPadroesLarguraProduto_Id` int(10) unsigned zerofill NOT NULL,
  `tbCorProduto_Id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`tbPadroesLarguraProduto_Id`,`tbCorProduto_Id`),
  UNIQUE KEY `tbPadroesLarguraProduto_Id_UNIQUE` (`tbPadroesLarguraProduto_Id`),
  CONSTRAINT `FK_tbCorProduto0003` FOREIGN KEY (`tbCorProduto_Id`) REFERENCES `tbCorProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbPadroesLarguraProduto0006` FOREIGN KEY (`tbPadroesLarguraProduto_Id`) REFERENCES `tbPadroesLarguraProduto` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8


-- -----------------------------------------------------
-- Table `golivetest`.`tbAuditoria_tbPadroesLarguraProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbAuditoria_tbPadroesLarguraProduto` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbAuditoria_tbPadroesLarguraProduto` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbPadroesLarguraProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbPadroesLarguraProduto_Id`),
  CONSTRAINT `FK_tbAuditoria0015`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golivetest`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbPadroesLarguraProduto0007`
    FOREIGN KEY (`tbPadroesLarguraProduto_Id`)
    REFERENCES `golivetest`.`tbPadroesLarguraProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0029`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0025`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golivetest`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golivetest`.`tbAuditoria_tbPadroesLarguraProduto` (`tbAuditoriaItem_Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbColecoesProduto_tbDepartamentoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbColecoesProduto_tbDepartamentoProduto` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbColecoesProduto_tbDepartamentoProduto` (
  `tbColecoesProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbDepartamentoProduto_Id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`tbColecoesProduto_Id`, `tbDepartamentoProduto_Id`),
  CONSTRAINT `FK_tbColecoesProduto0004`
    FOREIGN KEY (`tbColecoesProduto_Id`)
    REFERENCES `golivetest`.`tbColecoesProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbDepartamentoProduto0006`
    FOREIGN KEY (`tbDepartamentoProduto_Id`)
    REFERENCES `golivetest`.`tbDepartamentoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `golivetest`.`tbColecoesProduto_tbGrupoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbColecoesProduto_tbGrupoProduto` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbColecoesProduto_tbGrupoProduto` (
  `tbColecoesProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbGrupoProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbColecoesProduto_Id`, `tbGrupoProduto_Id`),
  CONSTRAINT `FK_tbColecoesProduto0005`
    FOREIGN KEY (`tbColecoesProduto_Id`)
    REFERENCES `golivetest`.`tbColecoesProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbGrupoProduto0006`
    FOREIGN KEY (`tbGrupoProduto_Id`)
    REFERENCES `golivetest`.`tbGrupoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `golivetest`.`tbColecoesProduto_tbSubGrupoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbColecoesProduto_tbSubGrupoProduto` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbColecoesProduto_tbSubGrupoProduto` (
  `tbColecoesProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbSubGrupoProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbColecoesProduto_Id`, `tbSubGrupoProduto_Id`),
  CONSTRAINT `FK_tbColecoesProduto0006`
    FOREIGN KEY (`tbColecoesProduto_Id`)
    REFERENCES `golivetest`.`tbColecoesProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbSubGrupoProduto0006`
    FOREIGN KEY (`tbSubGrupoProduto_Id`)
    REFERENCES `golivetest`.`tbSubGrupoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `golivetest`.`tbAuditoria_tbColecoesProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbAuditoria_tbColecoesProduto` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbAuditoria_tbColecoesProduto` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbColecoesProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbColecoesProduto_Id`),
  CONSTRAINT `FK_tbAuditoria0016`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golivetest`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbColecoesProduto0008`
    FOREIGN KEY (`tbColecoesProduto_Id`)
    REFERENCES `golivetest`.`tbColecoesProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0030`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0026`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golivetest`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golivetest`.`tbAuditoria_tbColecoesProduto` (`tbAuditoriaItem_Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbCorProduto_tbDepartamentoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbCorProduto_tbDepartamentoProduto` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbCorProduto_tbDepartamentoProduto` (
  `tbCorProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbDepartamentoProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbCorProduto_Id`, `tbDepartamentoProduto_Id`),
  CONSTRAINT `FK_tbCorProduto0004`
    FOREIGN KEY (`tbCorProduto_Id`)
    REFERENCES `golivetest`.`tbCorProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbDepartamentoProduto0007`
    FOREIGN KEY (`tbDepartamentoProduto_Id`)
    REFERENCES `golivetest`.`tbDepartamentoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `tbCorProduto_Id_UNIQUE` ON `golivetest`.`tbCorProduto_tbDepartamentoProduto` (`tbCorProduto_Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbCorProduto_tbGrupoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbCorProduto_tbGrupoProduto` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbCorProduto_tbGrupoProduto` (
  `tbCorProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbGrupoProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbCorProduto_Id`, `tbGrupoProduto_Id`),
  CONSTRAINT `FK_tbCorProduto0005`
    FOREIGN KEY (`tbCorProduto_Id`)
    REFERENCES `golivetest`.`tbCorProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbGrupoProduto0007`
    FOREIGN KEY (`tbGrupoProduto_Id`)
    REFERENCES `golivetest`.`tbGrupoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `tbCorProduto_Id_UNIQUE` ON `golivetest`.`tbCorProduto_tbGrupoProduto` (`tbCorProduto_Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbCorProduto_tbSubGrupoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbCorProduto_tbSubGrupoProduto` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbCorProduto_tbSubGrupoProduto` (
  `tbCorProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbSubGrupoProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbCorProduto_Id`, `tbSubGrupoProduto_Id`),
  CONSTRAINT `FK_tbCorProduto0006`
    FOREIGN KEY (`tbCorProduto_Id`)
    REFERENCES `golivetest`.`tbCorProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbSubGrupoProduto0007`
    FOREIGN KEY (`tbSubGrupoProduto_Id`)
    REFERENCES `golivetest`.`tbSubGrupoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `tbCorProduto_Id_UNIQUE` ON `golivetest`.`tbCorProduto_tbSubGrupoProduto` (`tbCorProduto_Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbCorProduto_tbColecoesProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbCorProduto_tbColecoesProduto` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbCorProduto_tbColecoesProduto` (
  `tbCorProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbColecoesProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbCorProduto_Id`, `tbColecoesProduto_Id`),
  CONSTRAINT `FK_tbCorProduto0007`
    FOREIGN KEY (`tbCorProduto_Id`)
    REFERENCES `golivetest`.`tbCorProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbColecoesProduto0007`
    FOREIGN KEY (`tbColecoesProduto_Id`)
    REFERENCES `golivetest`.`tbColecoesProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `tbCorProduto_Id_UNIQUE` ON `golivetest`.`tbCorProduto_tbColecoesProduto` (`tbCorProduto_Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbAuditoria_tbCorProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbAuditoria_tbCorProduto` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbAuditoria_tbCorProduto` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCorProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbCorProduto_Id`),
  CONSTRAINT `FK_tbAuditoria0017`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golivetest`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCorProduto0008`
    FOREIGN KEY (`tbCorProduto_Id`)
    REFERENCES `golivetest`.`tbCorProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0031`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0027`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golivetest`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golivetest`.`tbAuditoria_tbCorProduto` (`tbAuditoriaItem_Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbProduto` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbProduto` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `Observacao` VARCHAR(8000) NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetest`.`tbProduto` (`Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbProdutoCodigo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbProdutoCodigo` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbProdutoCodigo` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL,
  `Codigo` VARCHAR(8000) NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetest`.`tbProdutoCodigo` (`Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbProduto_tbProdutoCodigo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbProduto_tbProdutoCodigo` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbProduto_tbProdutoCodigo` (
  `tbProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbProdutoCodigo_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbFinalidadeCodigoProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbProduto_Id`, `tbProdutoCodigo_Id`, `tbFinalidadeCodigoProduto_Id`),
  CONSTRAINT `FK_tbProduto0001`
    FOREIGN KEY (`tbProduto_Id`)
    REFERENCES `golivetest`.`tbProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbProdutoCodigo0001`
    FOREIGN KEY (`tbProdutoCodigo_Id`)
    REFERENCES `golivetest`.`tbProdutoCodigo` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbFinalidadeCodigoProduto0001`
    FOREIGN KEY (`tbFinalidadeCodigoProduto_Id`)
    REFERENCES `golivetest`.`tbFinalidadeCodigoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `tbProdutoCodigo_Id_UNIQUE` ON `golivetest`.`tbProduto_tbProdutoCodigo` (`tbProdutoCodigo_Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbAuditoria_tbProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbAuditoria_tbProduto` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbAuditoria_tbProduto` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbProduto_Id`),
  CONSTRAINT `FK_tbAuditoria0001`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golivetest`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbProduto0015`
    FOREIGN KEY (`tbProduto_Id`)
    REFERENCES `golivetest`.`tbProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0009`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0008`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golivetest`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golivetest`.`tbAuditoria_tbProduto` (`tbAuditoriaItem_Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbAuditoria_tbProdutoCodigo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbAuditoria_tbProdutoCodigo` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbAuditoria_tbProdutoCodigo` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbProdutoCodigo_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbProdutoCodigo_Id`),
  CONSTRAINT `FK_tbAuditoria0002`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golivetest`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbProdutoCodigo0002`
    FOREIGN KEY (`tbProdutoCodigo_Id`)
    REFERENCES `golivetest`.`tbProdutoCodigo` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0010`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0009`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golivetest`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golivetest`.`tbAuditoria_tbProdutoCodigo` (`tbAuditoriaItem_Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbProdutoDescricao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbProdutoDescricao` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbProdutoDescricao` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `Descricao` VARCHAR(8000) NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetest`.`tbProdutoDescricao` (`Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbProduto_tbProdutoDescricao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbProduto_tbProdutoDescricao` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbProduto_tbProdutoDescricao` (
  `tbProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbProdutoDescricao_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbFinalidadeDescricaoProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbProduto_Id`, `tbProdutoDescricao_Id`, `tbFinalidadeDescricaoProduto_Id`),
  CONSTRAINT `FK_tbProduto0002`
    FOREIGN KEY (`tbProduto_Id`)
    REFERENCES `golivetest`.`tbProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbProdutoDescricao0001`
    FOREIGN KEY (`tbProdutoDescricao_Id`)
    REFERENCES `golivetest`.`tbProdutoDescricao` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbFinalidadeDescricaoProduto0001`
    FOREIGN KEY (`tbFinalidadeDescricaoProduto_Id`)
    REFERENCES `golivetest`.`tbFinalidadeDescricaoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `tbProdutoDescricao_Id_UNIQUE` ON `golivetest`.`tbProduto_tbProdutoDescricao` (`tbProdutoDescricao_Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbAuditoria_tbProdutoDescricao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbAuditoria_tbProdutoDescricao` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbAuditoria_tbProdutoDescricao` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbProdutoDescricao_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbProdutoDescricao_Id`),
  CONSTRAINT `FK_tbAuditoria0003`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golivetest`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbProdutoDescricao0002`
    FOREIGN KEY (`tbProdutoDescricao_Id`)
    REFERENCES `golivetest`.`tbProdutoDescricao` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0011`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0010`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golivetest`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golivetest`.`tbAuditoria_tbProdutoDescricao` (`tbAuditoriaItem_Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbProduto_tbDepartamentoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbProduto_tbDepartamentoProduto` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbProduto_tbDepartamentoProduto` (
  `tbProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbDepartamentoProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbProduto_Id`, `tbDepartamentoProduto_Id`),
  CONSTRAINT `FK_tbProduto0003`
    FOREIGN KEY (`tbProduto_Id`)
    REFERENCES `golivetest`.`tbProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbDepartamentoProduto0001`
    FOREIGN KEY (`tbDepartamentoProduto_Id`)
    REFERENCES `golivetest`.`tbDepartamentoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `tbProduto_Id_UNIQUE` ON `golivetest`.`tbProduto_tbDepartamentoProduto` (`tbProduto_Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbProduto_tbGrupoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbProduto_tbGrupoProduto` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbProduto_tbGrupoProduto` (
  `tbProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbGrupoProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbProduto_Id`, `tbGrupoProduto_Id`),
  CONSTRAINT `FK_tbProduto0004`
    FOREIGN KEY (`tbProduto_Id`)
    REFERENCES `golivetest`.`tbProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbGrupoProduto0001`
    FOREIGN KEY (`tbGrupoProduto_Id`)
    REFERENCES `golivetest`.`tbGrupoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `tbProduto_Id_UNIQUE` ON `golivetest`.`tbProduto_tbGrupoProduto` (`tbProduto_Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbProduto_tbSubGrupoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbProduto_tbSubGrupoProduto` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbProduto_tbSubGrupoProduto` (
  `tbProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbSubGrupoProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbProduto_Id`, `tbSubGrupoProduto_Id`),
  CONSTRAINT `FK_tbProduto00005`
    FOREIGN KEY (`tbProduto_Id`)
    REFERENCES `golivetest`.`tbProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbSubGrupoProduto0001`
    FOREIGN KEY (`tbSubGrupoProduto_Id`)
    REFERENCES `golivetest`.`tbSubGrupoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `tbProduto_Id_UNIQUE` ON `golivetest`.`tbProduto_tbSubGrupoProduto` (`tbProduto_Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbProduto_tbColecoesProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbProduto_tbColecoesProduto` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbProduto_tbColecoesProduto` (
  `tbProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbColecoesProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbFinalidadeColecaoProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbProduto_Id`, `tbColecoesProduto_Id`, `tbFinalidadeColecaoProduto_Id`),
  CONSTRAINT `FK_tbProduto000006`
    FOREIGN KEY (`tbProduto_Id`)
    REFERENCES `golivetest`.`tbProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbColecoesProduto0001`
    FOREIGN KEY (`tbColecoesProduto_Id`)
    REFERENCES `golivetest`.`tbColecoesProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbFinalidadeColecaoProduto0001`
    FOREIGN KEY (`tbFinalidadeColecaoProduto_Id`)
    REFERENCES `golivetest`.`tbFinalidadeColecaoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `golivetest`.`tbProduto_tbCorProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbProduto_tbCorProduto` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbProduto_tbCorProduto` (
  `tbProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCorProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbFinalidadeCorProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbProduto_Id`, `tbCorProduto_Id`, `tbFinalidadeCorProduto_Id`),
  CONSTRAINT `FK_tbProduto0007`
    FOREIGN KEY (`tbProduto_Id`)
    REFERENCES `golivetest`.`tbProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCorProduto0001`
    FOREIGN KEY (`tbCorProduto_Id`)
    REFERENCES `golivetest`.`tbCorProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbFinalidadeCorProduto0001`
    FOREIGN KEY (`tbFinalidadeCorProduto_Id`)
    REFERENCES `golivetest`.`tbFinalidadeCorProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `golivetest`.`tbProduto_tbPadroesLarguraProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbProduto_tbPadroesLarguraProduto` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbProduto_tbPadroesLarguraProduto` (
  `tbProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbPadroesLarguraProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbFinalidadePadraoLarguraProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbProduto_Id`, `tbPadroesLarguraProduto_Id`, `tbFinalidadePadraoLarguraProduto_Id`),
  CONSTRAINT `FK_tbProduto0008`
    FOREIGN KEY (`tbProduto_Id`)
    REFERENCES `golivetest`.`tbProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbPadroesLarguraProduto0001`
    FOREIGN KEY (`tbPadroesLarguraProduto_Id`)
    REFERENCES `golivetest`.`tbPadroesLarguraProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbFinalidadePadraoLarguraProduto0002`
    FOREIGN KEY (`tbFinalidadePadraoLarguraProduto_Id`)
    REFERENCES `golivetest`.`tbFinalidadePadraoLarguraProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `golivetest`.`tbProduto_tbPadroesEspessuraProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbProduto_tbPadroesEspessuraProduto` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbProduto_tbPadroesEspessuraProduto` (
  `tbProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbPadroesEspessuraProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbFinalidadePadraoEspessuraProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbProduto_Id`, `tbPadroesEspessuraProduto_Id`, `tbFinalidadePadraoEspessuraProduto_Id`),
  CONSTRAINT `FK_tbProduto0009`
    FOREIGN KEY (`tbProduto_Id`)
    REFERENCES `golivetest`.`tbProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbPadroesEspessuraProduto0001`
    FOREIGN KEY (`tbPadroesEspessuraProduto_Id`)
    REFERENCES `golivetest`.`tbPadroesEspessuraProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbFinalidadePadraoEspessuraProduto0002`
    FOREIGN KEY (`tbFinalidadePadraoEspessuraProduto_Id`)
    REFERENCES `golivetest`.`tbFinalidadePadraoEspessuraProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `golivetest`.`tbProduto_tbTipoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbProduto_tbTipoProduto` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbProduto_tbTipoProduto` (
  `tbProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbTipoProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbFinalidadeTipoProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbProduto_Id`, `tbTipoProduto_Id`, `tbFinalidadeTipoProduto_Id`),
  CONSTRAINT `FK_tbProduto0010`
    FOREIGN KEY (`tbProduto_Id`)
    REFERENCES `golivetest`.`tbProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbTipoProduto0001`
    FOREIGN KEY (`tbTipoProduto_Id`)
    REFERENCES `golivetest`.`tbTipoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_FinalidadeTipoProduto0001`
    FOREIGN KEY (`tbFinalidadeTipoProduto_Id`)
    REFERENCES `golivetest`.`tbFinalidadeTipoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `golivetest`.`tbProdutoUnidade`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbProdutoUnidade` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbProdutoUnidade` (
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

CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetest`.`tbProdutoUnidade` (`Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbProduto_tbProdutoUnidade`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbProduto_tbProdutoUnidade` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbProduto_tbProdutoUnidade` (
  `tbProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUnidade_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbProdutoUnidade_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbFinalidadeUnidadeProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbProduto_Id`, `tbUnidade_Id`, `tbProdutoUnidade_Id`, `tbFinalidadeUnidadeProduto_Id`),
  CONSTRAINT `FK_tbProduto0011`
    FOREIGN KEY (`tbProduto_Id`)
    REFERENCES `golivetest`.`tbProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbProdutoUnidade0001`
    FOREIGN KEY (`tbProdutoUnidade_Id`)
    REFERENCES `golivetest`.`tbProdutoUnidade` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbFinalidadeUnidadeProduto0001`
    FOREIGN KEY (`tbFinalidadeUnidadeProduto_Id`)
    REFERENCES `golivetest`.`tbFinalidadeUnidadeProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUnidade0004`
    FOREIGN KEY (`tbUnidade_Id`)
    REFERENCES `golivetest`.`tbUnidade` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `tbProduto_Id_UNIQUE` ON `golivetest`.`tbProduto_tbProdutoUnidade` (`tbProduto_Id` ASC);

CREATE UNIQUE INDEX `tbProdutoUnidade_Id_UNIQUE` ON `golivetest`.`tbProduto_tbProdutoUnidade` (`tbProdutoUnidade_Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbAuditoria_tbProdutoUnidade`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbAuditoria_tbProdutoUnidade` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbAuditoria_tbProdutoUnidade` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbProdutoUnidade_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbProdutoUnidade_Id`),
  CONSTRAINT `FK_tbAuditoria0004`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golivetest`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbProdutoUnidade0002`
    FOREIGN KEY (`tbProdutoUnidade_Id`)
    REFERENCES `golivetest`.`tbProdutoUnidade` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0012`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0011`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golivetest`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golivetest`.`tbAuditoria_tbProdutoUnidade` (`tbAuditoriaItem_Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbProdutoCodigoBarras`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbProdutoCodigoBarras` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbProdutoCodigoBarras` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `CodigoBarras` BIGINT(14) ZEROFILL NOT NULL,
  `FatorMultiplicacao` DECIMAL(18,3) NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetest`.`tbProdutoCodigoBarras` (`Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbProduto_tbProdutoCodigoBarras`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbProduto_tbProdutoCodigoBarras` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbProduto_tbProdutoCodigoBarras` (
  `tbProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbProdutoCodigoBarras_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbFinalidadeCodigoBarras_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbProduto_Id`, `tbProdutoCodigoBarras_Id`, `tbFinalidadeCodigoBarras_Id`),
  CONSTRAINT `FK_tbProduto0012`
    FOREIGN KEY (`tbProduto_Id`)
    REFERENCES `golivetest`.`tbProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbProdutoCodigoBarras0001`
    FOREIGN KEY (`tbProdutoCodigoBarras_Id`)
    REFERENCES `golivetest`.`tbProdutoCodigoBarras` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbFinalidadeCodigoBarrasProduto0002`
    FOREIGN KEY (`tbFinalidadeCodigoBarras_Id`)
    REFERENCES `golivetest`.`tbFinalidadeCodigoBarrasProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `golivetest`.`tbProdutoCodigoBarras_tbUnidade`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbProdutoCodigoBarras_tbUnidade` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbProdutoCodigoBarras_tbUnidade` (
  `tbProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbProdutoCodigoBarras_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUnidade_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbFinalidadeUnidadeProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbProduto_Id`, `tbProdutoCodigoBarras_Id`, `tbUnidade_Id`, `tbFinalidadeUnidadeProduto_Id`),
  CONSTRAINT `FK_tbProduto0013`
    FOREIGN KEY (`tbProduto_Id`)
    REFERENCES `golivetest`.`tbProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbProdutoCodigoBarras0002`
    FOREIGN KEY (`tbProdutoCodigoBarras_Id`)
    REFERENCES `golivetest`.`tbProdutoCodigoBarras` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUnidade0005`
    FOREIGN KEY (`tbUnidade_Id`)
    REFERENCES `golivetest`.`tbUnidade` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbFinalidadeUnidadeProduto0002`
    FOREIGN KEY (`tbFinalidadeUnidadeProduto_Id`)
    REFERENCES `golivetest`.`tbFinalidadeUnidadeProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `tbProdutoCodigoBarras_Id_UNIQUE` ON `golivetest`.`tbProdutoCodigoBarras_tbUnidade` (`tbProdutoCodigoBarras_Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbAuditoria_tbProdutoCodigoBarras`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbAuditoria_tbProdutoCodigoBarras` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbAuditoria_tbProdutoCodigoBarras` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbProdutoCodigoBarras_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbProdutoCodigoBarras_Id`),
  CONSTRAINT `FK_tbAuditoria0005`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golivetest`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbProdutoCodigoBarras0003`
    FOREIGN KEY (`tbProdutoCodigoBarras_Id`)
    REFERENCES `golivetest`.`tbProdutoCodigoBarras` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0013`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0012`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golivetest`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golivetest`.`tbAuditoria_tbProdutoCodigoBarras` (`tbAuditoriaItem_Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbProduto_tbFornecedor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbProduto_tbFornecedor` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbProduto_tbFornecedor` (
  `tbProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbFornecedor_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbProduto_Id`, `tbFornecedor_Id`),
  CONSTRAINT `FK_tbProduto0014`
    FOREIGN KEY (`tbProduto_Id`)
    REFERENCES `golivetest`.`tbProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `golivetest`.`tbCategoriaNaturezaJuridica`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbCategoriaNaturezaJuridica` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbCategoriaNaturezaJuridica` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `CategoriaNaturezaJuridica` VARCHAR(120) NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetest`.`tbCategoriaNaturezaJuridica` (`Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbAuditoria_tbCategoriaNaturezaJuridica`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbAuditoria_tbCategoriaNaturezaJuridica` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbAuditoria_tbCategoriaNaturezaJuridica` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCategoriaNaturezaJuridica_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbCategoriaNaturezaJuridica_Id`),
  CONSTRAINT `FK_tbAuditoria0006`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golivetest`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCategoriaNaturezaJuridica0001`
    FOREIGN KEY (`tbCategoriaNaturezaJuridica_Id`)
    REFERENCES `golivetest`.`tbCategoriaNaturezaJuridica` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0014`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0037`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golivetest`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golivetest`.`tbAuditoria_tbCategoriaNaturezaJuridica` (`tbAuditoriaItem_Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbNaturezaJuridica`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbNaturezaJuridica` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbNaturezaJuridica` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `CodigoNaturezaJuridica` INT UNSIGNED ZEROFILL NOT NULL,
  `NaturezaJuridica` VARCHAR(120) NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetest`.`tbNaturezaJuridica` (`Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbNaturezaJuridica_tbCategoriaNaturezaJuridica`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbNaturezaJuridica_tbCategoriaNaturezaJuridica` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbNaturezaJuridica_tbCategoriaNaturezaJuridica` (
  `tbNaturezaJuridica_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCategoriaNaturezaJuridica_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbNaturezaJuridica_Id`, `tbCategoriaNaturezaJuridica_Id`),
  CONSTRAINT `FK_tbNaturezaJuridica`
    FOREIGN KEY (`tbNaturezaJuridica_Id`)
    REFERENCES `golivetest`.`tbNaturezaJuridica` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCategoriaNaturezaJuridica`
    FOREIGN KEY (`tbCategoriaNaturezaJuridica_Id`)
    REFERENCES `golivetest`.`tbCategoriaNaturezaJuridica` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `tbNaturezaJuridica_Id_UNIQUE` ON `golivetest`.`tbNaturezaJuridica_tbCategoriaNaturezaJuridica` (`tbNaturezaJuridica_Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbAuditoria_tbNaturezaJuridica`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbAuditoria_tbNaturezaJuridica` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbAuditoria_tbNaturezaJuridica` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbNaturezaJuridica_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbNaturezaJuridica_Id`),
  CONSTRAINT `FK_tbAuditoria0007`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golivetest`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbNaturezaJuridica0001`
    FOREIGN KEY (`tbNaturezaJuridica_Id`)
    REFERENCES `golivetest`.`tbNaturezaJuridica` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0015`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0038`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golivetest`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golivetest`.`tbAuditoria_tbNaturezaJuridica` (`tbAuditoriaItem_Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbRegimeApuracao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbRegimeApuracao` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbRegimeApuracao` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `RegimeApuracao` VARCHAR(120) NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetest`.`tbRegimeApuracao` (`Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbAuditoria_tbRegimeApuracao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbAuditoria_tbRegimeApuracao` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbAuditoria_tbRegimeApuracao` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbRegimeApuracao_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbRegimeApuracao_Id`),
  CONSTRAINT `FK_tbAuditoria0008`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golivetest`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbRegimeApuracao0001`
    FOREIGN KEY (`tbRegimeApuracao_Id`)
    REFERENCES `golivetest`.`tbRegimeApuracao` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0016`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0039`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golivetest`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golivetest`.`tbAuditoria_tbRegimeApuracao` (`tbAuditoriaItem_Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbCnaeSecao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbCnaeSecao` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbCnaeSecao` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `CodigoSecao` CHAR(1) NOT NULL,
  `DenominacaoSecao` VARCHAR(250) NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetest`.`tbCnaeSecao` (`Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbAuditoria_tbCnaeSecao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbAuditoria_tbCnaeSecao` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbAuditoria_tbCnaeSecao` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCnaeSecao_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbCnaeSecao_Id`),
  CONSTRAINT `FK_tbAuditoria0027`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golivetest`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCnaeSecao0001`
    FOREIGN KEY (`tbCnaeSecao_Id`)
    REFERENCES `golivetest`.`tbCnaeSecao` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0017`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0013`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golivetest`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golivetest`.`tbAuditoria_tbCnaeSecao` (`tbAuditoriaItem_Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbCnaeDivisao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbCnaeDivisao` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbCnaeDivisao` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `CodigoDivisao` INT(2) UNSIGNED ZEROFILL NOT NULL,
  `DenominacaoDivisao` VARCHAR(250) NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetest`.`tbCnaeDivisao` (`Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbCnaeDivisao_tbCnaeSecao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbCnaeDivisao_tbCnaeSecao` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbCnaeDivisao_tbCnaeSecao` (
  `tbCnaeDivisao_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCnaeSecao_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbCnaeDivisao_Id`, `tbCnaeSecao_Id`),
  CONSTRAINT `FK_tbCnaeDivisao0001`
    FOREIGN KEY (`tbCnaeDivisao_Id`)
    REFERENCES `golivetest`.`tbCnaeDivisao` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCnaeSecao0002`
    FOREIGN KEY (`tbCnaeSecao_Id`)
    REFERENCES `golivetest`.`tbCnaeSecao` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `tbCnaeDivisao_Id_UNIQUE` ON `golivetest`.`tbCnaeDivisao_tbCnaeSecao` (`tbCnaeDivisao_Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbAuditoria_tbCnaeDivisao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbAuditoria_tbCnaeDivisao` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbAuditoria_tbCnaeDivisao` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCnaeDivisao_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbCnaeDivisao_Id`),
  CONSTRAINT `FK_tbAuditoria00028`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golivetest`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCnaeDivisao0002`
    FOREIGN KEY (`tbCnaeDivisao_Id`)
    REFERENCES `golivetest`.`tbCnaeDivisao` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0018`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0014`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golivetest`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golivetest`.`tbAuditoria_tbCnaeDivisao` (`tbAuditoriaItem_Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbCnaeGrupo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbCnaeGrupo` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbCnaeGrupo` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `CodigoGrupo` INT(1) UNSIGNED ZEROFILL NOT NULL,
  `DenominacaoGrupo` VARCHAR(250) NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`, `CodigoGrupo`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetest`.`tbCnaeGrupo` (`Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbCnaeGrupo_Dependencies`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbCnaeGrupo_Dependencies` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbCnaeGrupo_Dependencies` (
  `tbCnaeGrupo_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCnaeSecao_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCnaeDivisao_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbCnaeGrupo_Id`, `tbCnaeSecao_Id`, `tbCnaeDivisao_Id`),
  CONSTRAINT `FK_tbCnaeGrupo0001`
    FOREIGN KEY (`tbCnaeGrupo_Id`)
    REFERENCES `golivetest`.`tbCnaeGrupo` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCnaeSecao0003`
    FOREIGN KEY (`tbCnaeSecao_Id`)
    REFERENCES `golivetest`.`tbCnaeSecao` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCnaeDivisao0003`
    FOREIGN KEY (`tbCnaeDivisao_Id`)
    REFERENCES `golivetest`.`tbCnaeDivisao` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `tbCnaeGrupo_Id_UNIQUE` ON `golivetest`.`tbCnaeGrupo_Dependencies` (`tbCnaeGrupo_Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbAuditoria_tbCnaeGrupo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbAuditoria_tbCnaeGrupo` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbAuditoria_tbCnaeGrupo` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCnaeGrupo_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbCnaeGrupo_Id`),
  CONSTRAINT `FK_tbAuditoria0029`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golivetest`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCnaeGrupo0003`
    FOREIGN KEY (`tbCnaeGrupo_Id`)
    REFERENCES `golivetest`.`tbCnaeGrupo` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0019`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0015`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golivetest`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golivetest`.`tbAuditoria_tbCnaeGrupo` (`tbAuditoriaItem_Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbCnaeClasse`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbCnaeClasse` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbCnaeClasse` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `CodigoClasse` INT(2) ZEROFILL UNSIGNED NOT NULL,
  `DenominacaoClasse` VARCHAR(250) NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetest`.`tbCnaeClasse` (`Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbCnaeClasse_Dependencies`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbCnaeClasse_Dependencies` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbCnaeClasse_Dependencies` (
  `tbCnaeClasse_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCnaeSecao_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCnaeDivisao_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCnaeGrupo_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbCnaeClasse_Id`, `tbCnaeSecao_Id`, `tbCnaeDivisao_Id`, `tbCnaeGrupo_Id`),
  CONSTRAINT `FK_tbCnaeClasse0001`
    FOREIGN KEY (`tbCnaeClasse_Id`)
    REFERENCES `golivetest`.`tbCnaeClasse` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCnaeSecao0004`
    FOREIGN KEY (`tbCnaeSecao_Id`)
    REFERENCES `golivetest`.`tbCnaeSecao` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCnaeDivisao0004`
    FOREIGN KEY (`tbCnaeDivisao_Id`)
    REFERENCES `golivetest`.`tbCnaeDivisao` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCnaeGrupo0002`
    FOREIGN KEY (`tbCnaeGrupo_Id`)
    REFERENCES `golivetest`.`tbCnaeGrupo` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `tbCnaeClasse_Id_UNIQUE` ON `golivetest`.`tbCnaeClasse_Dependencies` (`tbCnaeClasse_Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbAuditoria_tbCnaeClasse`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbAuditoria_tbCnaeClasse` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbAuditoria_tbCnaeClasse` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCnaeClasse_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbCnaeClasse_Id`),
  CONSTRAINT `FK_tbAuditoria0030`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golivetest`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCnaeClasse0002`
    FOREIGN KEY (`tbCnaeClasse_Id`)
    REFERENCES `golivetest`.`tbCnaeClasse` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0020`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0016`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golivetest`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golivetest`.`tbAuditoria_tbCnaeClasse` (`tbAuditoriaItem_Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbCnaeSubClasse`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbCnaeSubClasse` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbCnaeSubClasse` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `Cnae` INT(7) NOT NULL,
  `CodigoSubClasse` INT(2) UNSIGNED ZEROFILL NOT NULL,
  `DenominacaoSubClasse` VARCHAR(250) NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetest`.`tbCnaeSubClasse` (`Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbCnaeSubClasse_Dependencies`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbCnaeSubClasse_Dependencies` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbCnaeSubClasse_Dependencies` (
  `tbCnaeSubClasse_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCnaeSecao_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCnaeDivisao_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCnaeGrupo_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCnaeClasse_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbCnaeSubClasse_Id`, `tbCnaeSecao_Id`, `tbCnaeDivisao_Id`, `tbCnaeGrupo_Id`, `tbCnaeClasse_Id`),
  CONSTRAINT `FK_tbCnaeSubClasse0001`
    FOREIGN KEY (`tbCnaeSubClasse_Id`)
    REFERENCES `golivetest`.`tbCnaeSubClasse` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCnaeSecao0005`
    FOREIGN KEY (`tbCnaeSecao_Id`)
    REFERENCES `golivetest`.`tbCnaeSecao` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCnaeDivisao0005`
    FOREIGN KEY (`tbCnaeDivisao_Id`)
    REFERENCES `golivetest`.`tbCnaeDivisao` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tb_CnaeGrupo0003`
    FOREIGN KEY (`tbCnaeGrupo_Id`)
    REFERENCES `golivetest`.`tbCnaeGrupo` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tb_CnaeClasse0003`
    FOREIGN KEY (`tbCnaeClasse_Id`)
    REFERENCES `golivetest`.`tbCnaeClasse` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `tbCnaeSubClasse_Id_UNIQUE` ON `golivetest`.`tbCnaeSubClasse_Dependencies` (`tbCnaeSubClasse_Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbAuditoria_tbCnaeSubClasse`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbAuditoria_tbCnaeSubClasse` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbAuditoria_tbCnaeSubClasse` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCnaeSubClasse_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbCnaeSubClasse_Id`),
  CONSTRAINT `FK_tbAuditoria0031`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golivetest`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCnaeSubClasse0002`
    FOREIGN KEY (`tbCnaeSubClasse_Id`)
    REFERENCES `golivetest`.`tbCnaeSubClasse` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0021`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0017`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golivetest`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golivetest`.`tbAuditoria_tbCnaeSubClasse` (`tbAuditoriaItem_Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbCnaeImpeditivoSimplesNacional`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbCnaeImpeditivoSimplesNacional` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbCnaeImpeditivoSimplesNacional` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetest`.`tbCnaeImpeditivoSimplesNacional` (`Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbCnaeImpeditivoSimplesNacional_tbCnaeSubClasse`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbCnaeImpeditivoSimplesNacional_tbCnaeSubClasse` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbCnaeImpeditivoSimplesNacional_tbCnaeSubClasse` (
  `tbCnaeImpeditivoSimplesNacional_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCnaeSubClasse_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbCnaeImpeditivoSimplesNacional_Id`, `tbCnaeSubClasse_Id`),
  CONSTRAINT `FK_tbCnaeImpeditivoSimplesNacional0001`
    FOREIGN KEY (`tbCnaeImpeditivoSimplesNacional_Id`)
    REFERENCES `golivetest`.`tbCnaeImpeditivoSimplesNacional` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCnaeSubClasse0003`
    FOREIGN KEY (`tbCnaeSubClasse_Id`)
    REFERENCES `golivetest`.`tbCnaeSubClasse` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `tbCnaeImpeditivoSimplesNacional_Id_UNIQUE` ON `golivetest`.`tbCnaeImpeditivoSimplesNacional_tbCnaeSubClasse` (`tbCnaeImpeditivoSimplesNacional_Id` ASC);

CREATE UNIQUE INDEX `tbCnaeSubClasse_Id_UNIQUE` ON `golivetest`.`tbCnaeImpeditivoSimplesNacional_tbCnaeSubClasse` (`tbCnaeSubClasse_Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbAuditoria_tbCnaeImpeditivoSimplesNacional`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbAuditoria_tbCnaeImpeditivoSimplesNacional` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbAuditoria_tbCnaeImpeditivoSimplesNacional` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCnaeImpeditivoSimplesNacional_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbCnaeImpeditivoSimplesNacional_Id`),
  CONSTRAINT `FK_tbAuditoria0032`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golivetest`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCnaeImpeditivoSimplesNacional0002`
    FOREIGN KEY (`tbCnaeImpeditivoSimplesNacional_Id`)
    REFERENCES `golivetest`.`tbCnaeImpeditivoSimplesNacional` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0022`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0018`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golivetest`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golivetest`.`tbAuditoria_tbCnaeImpeditivoSimplesNacional` (`tbAuditoriaItem_Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbCodigoInternet`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbCodigoInternet` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbCodigoInternet` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `CodigoTld` CHAR(2) NOT NULL,
  `PaisEmPortugues` VARCHAR(120) NOT NULL,
  `PaisEmIngles` VARCHAR(120) NOT NULL,
  `PaisEmNativo` VARCHAR(120) NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetest`.`tbCodigoInternet` (`Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbAuditoria_tbCodigoInternet`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbAuditoria_tbCodigoInternet` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbAuditoria_tbCodigoInternet` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCodigoInternet_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbCodigoInternet_Id`),
  CONSTRAINT `FK_tbAuditoria0033`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golivetest`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCodigoInternet0001`
    FOREIGN KEY (`tbCodigoInternet_Id`)
    REFERENCES `golivetest`.`tbCodigoInternet` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0004`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0003`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golivetest`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golivetest`.`tbAuditoria_tbCodigoInternet` (`tbAuditoriaItem_Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbLinguas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbLinguas` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbLinguas` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `CodigoISO639-1` CHAR(2) NOT NULL,
  `LinguaEmPortugues` VARCHAR(120) NOT NULL,
  `LinguaEmIngles` VARCHAR(120) NOT NULL,
  `LinguaEmNativo` VARCHAR(120) NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetest`.`tbLinguas` (`Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbAuditoria_tbLinguas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbAuditoria_tbLinguas` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbAuditoria_tbLinguas` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbLinguas_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbLinguas_Id`),
  CONSTRAINT `FK_tbAuditoria0034`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golivetest`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbLinguas0001`
    FOREIGN KEY (`tbLinguas_Id`)
    REFERENCES `golivetest`.`tbLinguas` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0005`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0004`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golivetest`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golivetest`.`tbAuditoria_tbLinguas` (`tbAuditoriaItem_Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbMoeda`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbMoeda` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbMoeda` (
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
-- Table `golivetest`.`tbPais`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbPais` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbPais` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `Bandeira` BLOB NULL,
  `PaisEmPortugues` VARCHAR(120) NOT NULL,
  `PaisEmIngles` VARCHAR(120) NOT NULL,
  `PaisEmNativo` VARCHAR(120) NOT NULL,
  `Utc+` BIT NOT NULL,
  `Utc-` BIT NOT NULL,
  `Utc` TIME NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetest`.`tbPais` (`Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbMoeda_tbPais`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbMoeda_tbPais` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbMoeda_tbPais` (
  `tbMoeda_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbPais_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbMoeda_Id`, `tbPais_Id`),
  CONSTRAINT `FK_tbMoeda0001`
    FOREIGN KEY (`tbMoeda_Id`)
    REFERENCES `golivetest`.`tbMoeda` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `golivetest`.`tbAuditoria_tbMoeda`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbAuditoria_tbMoeda` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbAuditoria_tbMoeda` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbMoeda_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbMoeda_Id`),
  CONSTRAINT `FK_tbAuditoria0035`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golivetest`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbMoeda0002`
    FOREIGN KEY (`tbMoeda_Id`)
    REFERENCES `golivetest`.`tbMoeda` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0006`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0005`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golivetest`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golivetest`.`tbAuditoria_tbMoeda` (`tbAuditoriaItem_Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbCodigoPaisesFips`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbCodigoPaisesFips` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbCodigoPaisesFips` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `CodigoFips` CHAR(2) NOT NULL,
  `PaisEmPortugues` VARCHAR(120) NOT NULL,
  `PaisEmIngles` VARCHAR(120) NOT NULL,
  `PaisEmNativo` VARCHAR(120) NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetest`.`tbCodigoPaisesFips` (`Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbAuditoria_tbCodigoPaisesFips`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbAuditoria_tbCodigoPaisesFips` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbAuditoria_tbCodigoPaisesFips` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCodigoPaisesFips_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbCodigoPaisesFips_Id`),
  CONSTRAINT `FK_tbAuditoria0036`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golivetest`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCodigoPaisesFips0001`
    FOREIGN KEY (`tbCodigoPaisesFips_Id`)
    REFERENCES `golivetest`.`tbCodigoPaisesFips` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0007`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0006`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golivetest`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golivetest`.`tbAuditoria_tbCodigoPaisesFips` (`tbAuditoriaItem_Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbCodigoPaisesIso3161_1_Alfa_3`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbCodigoPaisesIso3161_1_Alfa_3` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbCodigoPaisesIso3161_1_Alfa_3` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `CodigoISO3161_1_Alfa_3` CHAR(3) NOT NULL,
  `PaisEmPortugues` VARCHAR(120) NOT NULL,
  `PaisEmIngles` VARCHAR(120) NOT NULL,
  `PaisEmNativo` VARCHAR(120) NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetest`.`tbCodigoPaisesIso3161_1_Alfa_3` (`Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbAuditoria_tbCodigoPaisesIso3161_1_Alfa_3`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbAuditoria_tbCodigoPaisesIso3161_1_Alfa_3` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbAuditoria_tbCodigoPaisesIso3161_1_Alfa_3` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCodigoPaisesIso3161_1_Alfa_3_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbCodigoPaisesIso3161_1_Alfa_3_Id`),
  CONSTRAINT `FK_tbAuditoria0037`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golivetest`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCodigoPaisesIso3161_1_Alfa_3_0001`
    FOREIGN KEY (`tbCodigoPaisesIso3161_1_Alfa_3_Id`)
    REFERENCES `golivetest`.`tbCodigoPaisesIso3161_1_Alfa_3` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0008`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0007`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golivetest`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golivetest`.`tbAuditoria_tbCodigoPaisesIso3161_1_Alfa_3` (`tbAuditoriaItem_Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbAuditoriaItem_tbAuditoria`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbAuditoriaItem_tbAuditoria` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbAuditoriaItem_tbAuditoria` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`),
  CONSTRAINT `FK_tbAuditoria0038`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golivetest`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0001`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golivetest`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0003`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golivetest`.`tbAuditoriaItem_tbAuditoria` (`tbAuditoriaItem_Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbAuditoria_tbUsuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbAuditoria_tbUsuario` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbAuditoria_tbUsuario` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id1` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbUsuario_Id1`),
  CONSTRAINT `FK_tbAuditoria0039`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golivetest`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0002`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golivetest`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0001`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0002`
    FOREIGN KEY (`tbUsuario_Id1`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golivetest`.`tbAuditoria_tbUsuario` (`tbAuditoriaItem_Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbUsuario_tbFuncionario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbUsuario_tbFuncionario` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbUsuario_tbFuncionario` (
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbFuncionario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbUsuario_Id`, `tbFuncionario_Id`),
  CONSTRAINT `FK_tbUsuario0041`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `tbUsuario_Id_UNIQUE` ON `golivetest`.`tbUsuario_tbFuncionario` (`tbUsuario_Id` ASC);

CREATE UNIQUE INDEX `tbFuncionario_Id_UNIQUE` ON `golivetest`.`tbUsuario_tbFuncionario` (`tbFuncionario_Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbUsuario_tbCliente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbUsuario_tbCliente` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbUsuario_tbCliente` (
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

CREATE UNIQUE INDEX `tbUsuario_Id_UNIQUE` ON `golivetest`.`tbUsuario_tbCliente` (`tbUsuario_Id` ASC);

CREATE UNIQUE INDEX `tbClienteContato_Id_UNIQUE` ON `golivetest`.`tbUsuario_tbCliente` (`tbClienteContato_Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbUsuario_tbFornecedor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbUsuario_tbFornecedor` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbUsuario_tbFornecedor` (
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

CREATE UNIQUE INDEX `tbUsuario_Id_UNIQUE` ON `golivetest`.`tbUsuario_tbFornecedor` (`tbUsuario_Id` ASC);

CREATE UNIQUE INDEX `tbFornecedorContato_Id_UNIQUE` ON `golivetest`.`tbUsuario_tbFornecedor` (`tbFornecedorContato_Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbCodigoPaisesBacen`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbCodigoPaisesBacen` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbCodigoPaisesBacen` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `CodigoBacen` INT(5) UNSIGNED ZEROFILL NOT NULL,
  `PaisEmPortugues` VARCHAR(120) NOT NULL,
  `PaisEmIngles` VARCHAR(120) NOT NULL,
  `PaisEmNativo` VARCHAR(120) NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetest`.`tbCodigoPaisesBacen` (`Id` ASC);

CREATE UNIQUE INDEX `CodigoBacen_UNIQUE` ON `golivetest`.`tbCodigoPaisesBacen` (`CodigoBacen` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbAuditoria_tbCodigoPaisesBacen`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbAuditoria_tbCodigoPaisesBacen` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbAuditoria_tbCodigoPaisesBacen` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCodigoPaisesBacen_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbCodigoPaisesBacen_Id`),
  CONSTRAINT `FK_tbAuditoria0040`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golivetest`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0044`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCodigoPaisesBacen0001`
    FOREIGN KEY (`tbCodigoPaisesBacen_Id`)
    REFERENCES `golivetest`.`tbCodigoPaisesBacen` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0040`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golivetest`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golivetest`.`tbAuditoria_tbCodigoPaisesBacen` (`tbAuditoriaItem_Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbCodigoTelefonicoPaises`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbCodigoTelefonicoPaises` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbCodigoTelefonicoPaises` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `CodigoTelefonicoPais` INT(3) UNSIGNED NOT NULL,
  `PaisEmPortugues` VARCHAR(120) NOT NULL,
  `PaisEmIngles` VARCHAR(120) NOT NULL,
  `PaisEmNativo` VARCHAR(120) NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetest`.`tbCodigoTelefonicoPaises` (`Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbAuditoria_tbCodigoTelefonicoPaises`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbAuditoria_tbCodigoTelefonicoPaises` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbAuditoria_tbCodigoTelefonicoPaises` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCodigoTelefonicoPaises_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbCodigoTelefonicoPaises_Id`),
  CONSTRAINT `FK_tbAuditoria0041`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golivetest`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0041`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golivetest`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0045`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCodigoTelefonicoPaises0001`
    FOREIGN KEY (`tbCodigoTelefonicoPaises_Id`)
    REFERENCES `golivetest`.`tbCodigoTelefonicoPaises` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golivetest`.`tbAuditoria_tbCodigoTelefonicoPaises` (`tbAuditoriaItem_Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbCodigoTelefonicoMunicipios`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbCodigoTelefonicoMunicipios` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbCodigoTelefonicoMunicipios` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `CodigoTelefonicoMunicipio` INT(3) UNSIGNED NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetest`.`tbCodigoTelefonicoMunicipios` (`Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbRegiao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbRegiao` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbRegiao` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `Regiao` VARCHAR(120) NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetest`.`tbRegiao` (`Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbEstado`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbEstado` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbEstado` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `CodigoIbge` INT(2) UNSIGNED NOT NULL,
  `Abreviacao` CHAR(2) NOT NULL,
  `Estado` VARCHAR(120) NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetest`.`tbEstado` (`Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbMunicipio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbMunicipio` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbMunicipio` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `CodigoIbge` INT(7) UNSIGNED NOT NULL,
  `Municipio` VARCHAR(120) NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetest`.`tbMunicipio` (`Id` ASC);




-- -----------------------------------------------------
-- Table `golivetest`.`tbCodigoTelefonicoMunicipios_tbMunicipio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbCodigoTelefonicoMunicipios_tbMunicipio` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbCodigoTelefonicoMunicipios_tbMunicipio` (
  `tbCodigoTelefonicoMunicipios_Id` INT ZEROFILL UNSIGNED NOT NULL,
  `tbMunicipio_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbEstado_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbRegiao_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbPais_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbCodigoTelefonicoMunicipios_Id`, `tbMunicipio_Id`, `tbEstado_Id`, `tbRegiao_Id`, `tbPais_Id`),
  CONSTRAINT `FK_tbCodigoTelefonicoMunicipios0001`
    FOREIGN KEY (`tbCodigoTelefonicoMunicipios_Id`)
    REFERENCES `golivetest`.`tbCodigoTelefonicoMunicipios` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbRegiao0002`
    FOREIGN KEY (`tbRegiao_Id`)
    REFERENCES `golivetest`.`tbRegiao` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbEstado0003`
    FOREIGN KEY (`tbEstado_Id`)
    REFERENCES `golivetest`.`tbEstado` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbMunicipio0003`
    FOREIGN KEY (`tbMunicipio_Id`)
    REFERENCES `golivetest`.`tbMunicipio` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbPais0003`
    FOREIGN KEY (`tbPais_Id`)
    REFERENCES `golivetest`.`tbPais` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `tbCodigoTelefonicoMunicipios_Id_UNIQUE` ON `golivetest`.`tbCodigoTelefonicoMunicipios_tbMunicipio` (`tbCodigoTelefonicoMunicipios_Id` ASC);

CREATE UNIQUE INDEX `tbMunicipio_Id_UNIQUE` ON `golivetest`.`tbCodigoTelefonicoMunicipios_tbMunicipio` (`tbMunicipio_Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbAuditoria_tbCodigoTelefonicoMunicipios`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbAuditoria_tbCodigoTelefonicoMunicipios` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbAuditoria_tbCodigoTelefonicoMunicipios` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCodigoTelefonicoMunicipios_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbCodigoTelefonicoMunicipios_Id`),
  CONSTRAINT `FK_tbAuditoria0042`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golivetest`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0042`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golivetest`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0046`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCodigoTelefonicoMunicipios0002`
    FOREIGN KEY (`tbCodigoTelefonicoMunicipios_Id`)
    REFERENCES `golivetest`.`tbCodigoTelefonicoMunicipios` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golivetest`.`tbAuditoria_tbCodigoTelefonicoMunicipios` (`tbAuditoriaItem_Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbAuditoria_tbRegiao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbAuditoria_tbRegiao` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbAuditoria_tbRegiao` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbRegiao_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbRegiao_Id`),
  CONSTRAINT `FK_tbAuditoria0043`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golivetest`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0043`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golivetest`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0047`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbRegiao0001`
    FOREIGN KEY (`tbRegiao_Id`)
    REFERENCES `golivetest`.`tbRegiao` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golivetest`.`tbAuditoria_tbRegiao` (`tbAuditoriaItem_Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbAuditoria_tbEstado`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbAuditoria_tbEstado` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbAuditoria_tbEstado` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbEstado_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbEstado_Id`),
  CONSTRAINT `FK_tbAuditoria0044`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golivetest`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0044`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golivetest`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0048`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbEstado0001`
    FOREIGN KEY (`tbEstado_Id`)
    REFERENCES `golivetest`.`tbEstado` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golivetest`.`tbAuditoria_tbEstado` (`tbAuditoriaItem_Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbEstado_tbPais`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbEstado_tbPais` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbEstado_tbPais` (
  `tbEstado_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbPais_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbRegiao_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbEstado_Id`, `tbPais_Id`, `tbRegiao_Id`),
  CONSTRAINT `FK_tbEstado0002`
    FOREIGN KEY (`tbEstado_Id`)
    REFERENCES `golivetest`.`tbEstado` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbRegiao0003`
    FOREIGN KEY (`tbRegiao_Id`)
    REFERENCES `golivetest`.`tbRegiao` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbPais0004`
    FOREIGN KEY (`tbPais_Id`)
    REFERENCES `golivetest`.`tbPais` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `tbEstado_Id_UNIQUE` ON `golivetest`.`tbEstado_tbPais` (`tbEstado_Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbAuditoria_tbMunicipio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbAuditoria_tbMunicipio` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbAuditoria_tbMunicipio` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbMunicipio_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbMunicipio_Id`),
  CONSTRAINT `FK_tbAuditoria0045`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golivetest`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0045`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golivetest`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0049`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_FK_tbMunicipio0001`
    FOREIGN KEY (`tbMunicipio_Id`)
    REFERENCES `golivetest`.`tbMunicipio` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golivetest`.`tbAuditoria_tbMunicipio` (`tbAuditoriaItem_Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbMunicipio_tbPais`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbMunicipio_tbPais` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbMunicipio_tbPais` (
  `tbMunicipio_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbPais_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbEstado_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbRegiao_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbMunicipio_Id`, `tbPais_Id`, `tbEstado_Id`, `tbRegiao_Id`),
  CONSTRAINT `FK_tbMunicipio0002`
    FOREIGN KEY (`tbMunicipio_Id`)
    REFERENCES `golivetest`.`tbMunicipio` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbEstado0004`
    FOREIGN KEY (`tbEstado_Id`)
    REFERENCES `golivetest`.`tbEstado` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbRegiao0004`
    FOREIGN KEY (`tbRegiao_Id`)
    REFERENCES `golivetest`.`tbRegiao` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbPais0005`
    FOREIGN KEY (`tbPais_Id`)
    REFERENCES `golivetest`.`tbPais` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `tbMunicipio_Id_UNIQUE` ON `golivetest`.`tbMunicipio_tbPais` (`tbMunicipio_Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbTipoLogradouro`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbTipoLogradouro` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbTipoLogradouro` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `Abreviacao` VARCHAR(4) NOT NULL,
  `TipoLogradouro` VARCHAR(120) NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetest`.`tbTipoLogradouro` (`Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbAuditoria_tbTipoLogradouro`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbAuditoria_tbTipoLogradouro` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbAuditoria_tbTipoLogradouro` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbTipoLogradouro_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbTipoLogradouro_Id`),
  CONSTRAINT `FK_tbAuditoria0046`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golivetest`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0046`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golivetest`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0050`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbTipoLogradouro0001`
    FOREIGN KEY (`tbTipoLogradouro_Id`)
    REFERENCES `golivetest`.`tbTipoLogradouro` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golivetest`.`tbAuditoria_tbTipoLogradouro` (`tbAuditoriaItem_Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbAuditoria_tbPais`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbAuditoria_tbPais` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbAuditoria_tbPais` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbPais_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbPais_Id`),
  CONSTRAINT `FK_tbAuditoria0047`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golivetest`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0047`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golivetest`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0051`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbPais0001`
    FOREIGN KEY (`tbPais_Id`)
    REFERENCES `golivetest`.`tbPais` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golivetest`.`tbAuditoria_tbPais` (`tbAuditoriaItem_Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbPais_Dependecies`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbPais_Dependecies` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbPais_Dependecies` (
  `tbPais_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCodigoPaisesBacen_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCodigoPaisesIso3161_1_Alfa_3_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCodigoPaisesFips_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbMoeda_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbLinguas_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCodigoTelefonicoPaises_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCodigoInternet_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbPais_Id`, `tbCodigoPaisesBacen_Id`, `tbCodigoPaisesIso3161_1_Alfa_3_Id`, `tbCodigoPaisesFips_Id`, `tbMoeda_Id`, `tbLinguas_Id`, `tbCodigoTelefonicoPaises_Id`, `tbCodigoInternet_Id`),
  CONSTRAINT `FK_tbPais0002`
    FOREIGN KEY (`tbPais_Id`)
    REFERENCES `golivetest`.`tbPais` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCodigoPaisesBacen0002`
    FOREIGN KEY (`tbCodigoPaisesBacen_Id`)
    REFERENCES `golivetest`.`tbCodigoPaisesBacen` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCodigoPaisesIso3161_1_Alfa_3_0002`
    FOREIGN KEY (`tbCodigoPaisesIso3161_1_Alfa_3_Id`)
    REFERENCES `golivetest`.`tbCodigoPaisesIso3161_1_Alfa_3` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCodigoPaisesFips0002`
    FOREIGN KEY (`tbCodigoPaisesFips_Id`)
    REFERENCES `golivetest`.`tbCodigoPaisesFips` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbMoeda0003`
    FOREIGN KEY (`tbMoeda_Id`)
    REFERENCES `golivetest`.`tbMoeda` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbLinguas0002`
    FOREIGN KEY (`tbLinguas_Id`)
    REFERENCES `golivetest`.`tbLinguas` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCodigoTelefonicoPaises0002`
    FOREIGN KEY (`tbCodigoTelefonicoPaises_Id`)
    REFERENCES `golivetest`.`tbCodigoTelefonicoPaises` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCodigoInternet0002`
    FOREIGN KEY (`tbCodigoInternet_Id`)
    REFERENCES `golivetest`.`tbCodigoInternet` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `tbPais_Id_UNIQUE` ON `golivetest`.`tbPais_Dependecies` (`tbPais_Id` ASC);

CREATE UNIQUE INDEX `tbCodigoPaisesBacen_Id_UNIQUE` ON `golivetest`.`tbPais_Dependecies` (`tbCodigoPaisesBacen_Id` ASC);

CREATE UNIQUE INDEX `tbCodigoPaisesIso3161_1_Alfa_3_Id_UNIQUE` ON `golivetest`.`tbPais_Dependecies` (`tbCodigoPaisesIso3161_1_Alfa_3_Id` ASC);

CREATE UNIQUE INDEX `tbCodigoPaisesFips_Id_UNIQUE` ON `golivetest`.`tbPais_Dependecies` (`tbCodigoPaisesFips_Id` ASC);

CREATE UNIQUE INDEX `tbCodigoTelefonicoPaises_Id_UNIQUE` ON `golivetest`.`tbPais_Dependecies` (`tbCodigoTelefonicoPaises_Id` ASC);

CREATE UNIQUE INDEX `tbCodigoInternet_Id_UNIQUE` ON `golivetest`.`tbPais_Dependecies` (`tbCodigoInternet_Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbEmpresa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbEmpresa` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbEmpresa` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `Cnpj` BIGINT(14) UNSIGNED ZEROFILL NOT NULL,
  `NomeFantasia` VARCHAR(120) NOT NULL,
  `RazaoSocial` VARCHAR(120) NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetest`.`tbEmpresa` (`Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbAuditoria_tbEmpresa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbAuditoria_tbEmpresa` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbAuditoria_tbEmpresa` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbEmpresa_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbEmpresa_Id`),
  CONSTRAINT `FK_tbAuditoria0048`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golivetest`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0048`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golivetest`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0052`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbEmpresa0001`
    FOREIGN KEY (`tbEmpresa_Id`)
    REFERENCES `golivetest`.`tbEmpresa` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golivetest`.`tbAuditoria_tbEmpresa` (`tbAuditoriaItem_Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbDataTable`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbDataTable` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbDataTable` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `Ordenation` INT UNSIGNED ZEROFILL NOT NULL,
  `TableName` VARCHAR(120) NOT NULL,
  `ColumnName` VARCHAR(120) NOT NULL,
  `PatternFilter` VARCHAR(120) NOT NULL,
  `Visible` BIT NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetest`.`tbDataTable` (`Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbDataTable_tbUsuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbDataTable_tbUsuario` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbDataTable_tbUsuario` (
  `tbDataTable_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT ZEROFILL NOT NULL,
  PRIMARY KEY (`tbDataTable_Id`, `tbUsuario_Id`),
  CONSTRAINT `FK_tbDataTable0001`
    FOREIGN KEY (`tbDataTable_Id`)
    REFERENCES `golivetest`.`tbDataTable` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0053`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golivecentral`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `tbDataTable_Id_UNIQUE` ON `golivetest`.`tbDataTable_tbUsuario` (`tbDataTable_Id` ASC);

CREATE UNIQUE INDEX `tbUsuario_Id_UNIQUE` ON `golivetest`.`tbDataTable_tbUsuario` (`tbUsuario_Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbFornecedor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbFornecedor` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbFornecedor` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `FornecedorDesde` DATETIME NULL,
  `TipoPessoa` VARCHAR(25) NOT NULL,
  `CNPJ` BIGINT(14) UNSIGNED ZEROFILL NOT NULL,
  `InscricaoEstadual` VARCHAR(14) NULL,
  `InscricaoEstadualIsento` BIT NOT NULL,
  `InscricaoMunicipal` VARCHAR(14) NULL,
  `InscricaoSuframa` VARCHAR(14) NULL,
  `NomeFantasia` VARCHAR(120) NOT NULL,
  `RazaoSocial` VARCHAR(120) NOT NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetest`.`tbFornecedor` (`Id` ASC);

CREATE UNIQUE INDEX `CNPJ_UNIQUE` ON `golivetest`.`tbFornecedor` (`CNPJ` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbFornecedor_tbCnaeSubClasse`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbFornecedor_tbCnaeSubClasse` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbFornecedor_tbCnaeSubClasse` (
  `tbFornecedor_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCnaeSubClasse_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `CnaePrincipal` BIT NOT NULL,
  `CnaeSecundario` BIT NOT NULL,
  PRIMARY KEY (`tbFornecedor_Id`, `tbCnaeSubClasse_Id`),
  CONSTRAINT `FK_tbFornecedor0001`
    FOREIGN KEY (`tbFornecedor_Id`)
    REFERENCES `golivetest`.`tbFornecedor` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCnaeSubClasse0004`
    FOREIGN KEY (`tbCnaeSubClasse_Id`)
    REFERENCES `golivetest`.`tbCnaeSubClasse` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `golivetest`.`tbFornecedor_tbNaturezaJuridica`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbFornecedor_tbNaturezaJuridica` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbFornecedor_tbNaturezaJuridica` (
  `tbFornecedor_Id` INT ZEROFILL UNSIGNED NOT NULL,
  `tbNaturezaJuridica_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbFornecedor_Id`, `tbNaturezaJuridica_Id`),
  CONSTRAINT `FK_tbFornecedor0002`
    FOREIGN KEY (`tbFornecedor_Id`)
    REFERENCES `golivetest`.`tbFornecedor` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbNaturezaJuridica0002`
    FOREIGN KEY (`tbNaturezaJuridica_Id`)
    REFERENCES `golivetest`.`tbNaturezaJuridica` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `tbFornecedor_Id_UNIQUE` ON `golivetest`.`tbFornecedor_tbNaturezaJuridica` (`tbFornecedor_Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbFornecedor_tbRegimeApuracao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbFornecedor_tbRegimeApuracao` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbFornecedor_tbRegimeApuracao` (
  `tbFornecedor_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbRegimeApuracao_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbFornecedor_Id`, `tbRegimeApuracao_Id`),
  CONSTRAINT `FK_tbFornecedor0003`
    FOREIGN KEY (`tbFornecedor_Id`)
    REFERENCES `golivetest`.`tbFornecedor` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbRegimeApuracao0002`
    FOREIGN KEY (`tbRegimeApuracao_Id`)
    REFERENCES `golivetest`.`tbRegimeApuracao` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `tbFornecedor_Id_UNIQUE` ON `golivetest`.`tbFornecedor_tbRegimeApuracao` (`tbFornecedor_Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbFornecedorEnderecoPrincipal`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbFornecedorEnderecoPrincipal` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbFornecedorEnderecoPrincipal` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `Logradouro` VARCHAR(50) NOT NULL,
  `LogradouroNumero` VARCHAR(10) NULL,
  `LogradouroComplemento` VARCHAR(50) NULL,
  `Cep` VARCHAR(8) NOT NULL,
  `Bairro` VARCHAR(40) NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetest`.`tbFornecedorEnderecoPrincipal` (`Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbFornecedorEnderecoPrincipal_Dependencies`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbFornecedorEnderecoPrincipal_Dependencies` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbFornecedorEnderecoPrincipal_Dependencies` (
  `tbFornecedorEnderecoPrincipal_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbFornecedor_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbTipoLogradouro_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbMunicipio_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbEstado_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbPais_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbFornecedorEnderecoPrincipal_Id`, `tbFornecedor_Id`, `tbTipoLogradouro_Id`, `tbMunicipio_Id`, `tbEstado_Id`, `tbPais_Id`),
  CONSTRAINT `FK_tbFornecedor0004`
    FOREIGN KEY (`tbFornecedor_Id`)
    REFERENCES `golivetest`.`tbFornecedor` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbMunicipio0004`
    FOREIGN KEY (`tbMunicipio_Id`)
    REFERENCES `golivetest`.`tbMunicipio` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbFornecedorEnderecoPrincipal0001`
    FOREIGN KEY (`tbFornecedorEnderecoPrincipal_Id`)
    REFERENCES `golivetest`.`tbFornecedorEnderecoPrincipal` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbEstado0005`
    FOREIGN KEY (`tbEstado_Id`)
    REFERENCES `golivetest`.`tbEstado` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbPais0006`
    FOREIGN KEY (`tbPais_Id`)
    REFERENCES `golivetest`.`tbPais` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbTipoLogradouro0002`
    FOREIGN KEY (`tbTipoLogradouro_Id`)
    REFERENCES `golivetest`.`tbTipoLogradouro` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `tbFornecedor_Id_UNIQUE` ON `golivetest`.`tbFornecedorEnderecoPrincipal_Dependencies` (`tbFornecedor_Id` ASC);

CREATE UNIQUE INDEX `tbFornecedorEnderecoPrincipal_Id_UNIQUE` ON `golivetest`.`tbFornecedorEnderecoPrincipal_Dependencies` (`tbFornecedorEnderecoPrincipal_Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbFornecedorEnderecoEntrega`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbFornecedorEnderecoEntrega` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbFornecedorEnderecoEntrega` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `LogradouroTipo` VARCHAR(15) NOT NULL,
  `Logradouro` VARCHAR(50) NOT NULL,
  `LogradouroNumero` VARCHAR(10) NULL,
  `LogradouroComplemento` VARCHAR(50) NULL,
  `Cep` VARCHAR(8) NOT NULL,
  `Bairro` VARCHAR(40) NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetest`.`tbFornecedorEnderecoEntrega` (`Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbFornecedorEnderecoEntrega_tbFornecedor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbFornecedorEnderecoEntrega_tbFornecedor` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbFornecedorEnderecoEntrega_tbFornecedor` (
  `tbFornecedorEnderecoEntrega_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbFornecedor_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbFornecedorEnderecoEntrega_Id`, `tbFornecedor_Id`),
  CONSTRAINT `FK_tbFornecedorEnderecoEntrega0001`
    FOREIGN KEY (`tbFornecedorEnderecoEntrega_Id`)
    REFERENCES `golivetest`.`tbFornecedorEnderecoEntrega` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbFornecedor0005`
    FOREIGN KEY (`tbFornecedor_Id`)
    REFERENCES `golivetest`.`tbFornecedor` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `tbFornecedorEnderecoEntrega_Id_UNIQUE` ON `golivetest`.`tbFornecedorEnderecoEntrega_tbFornecedor` (`tbFornecedorEnderecoEntrega_Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbFornecedorEnderecoEntrega_tbTransportadora`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbFornecedorEnderecoEntrega_tbTransportadora` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbFornecedorEnderecoEntrega_tbTransportadora` (
  `tbFornecedorEnderecoEntrega_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbTransportadora_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbFornecedorEnderecoEntrega_Id`, `tbTransportadora_Id`),
  CONSTRAINT `FK_tbFornecedorEnderecoEntrega0002`
    FOREIGN KEY (`tbFornecedorEnderecoEntrega_Id`)
    REFERENCES `golivetest`.`tbFornecedorEnderecoEntrega` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `tbFornecedorEnderecoEntrega_Id_UNIQUE` ON `golivetest`.`tbFornecedorEnderecoEntrega_tbTransportadora` (`tbFornecedorEnderecoEntrega_Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbFornecedorEnderecoEntrega_Dependencies`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbFornecedorEnderecoEntrega_Dependencies` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbFornecedorEnderecoEntrega_Dependencies` (
  `tbFornecedorEnderecoEntrega_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbFornecedor_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbTipoLogradouro_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbMunicipio_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbEstado_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbPais_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbFornecedorEnderecoEntrega_Id`, `tbFornecedor_Id`, `tbTipoLogradouro_Id`, `tbMunicipio_Id`, `tbEstado_Id`, `tbPais_Id`),
  CONSTRAINT `FK_tbFornecedorEnderecoEntrega0003`
    FOREIGN KEY (`tbFornecedorEnderecoEntrega_Id`)
    REFERENCES `golivetest`.`tbFornecedorEnderecoEntrega` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbFornecedor0006`
    FOREIGN KEY (`tbFornecedor_Id`)
    REFERENCES `golivetest`.`tbFornecedor` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbTipoLogradouro0003`
    FOREIGN KEY (`tbTipoLogradouro_Id`)
    REFERENCES `golivetest`.`tbTipoLogradouro` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbMunicipio0005`
    FOREIGN KEY (`tbMunicipio_Id`)
    REFERENCES `golivetest`.`tbMunicipio` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbEstado0006`
    FOREIGN KEY (`tbEstado_Id`)
    REFERENCES `golivetest`.`tbEstado` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbPais0007`
    FOREIGN KEY (`tbPais_Id`)
    REFERENCES `golivetest`.`tbPais` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `tbFornecedorEnderecoEntrega_Id_UNIQUE` ON `golivetest`.`tbFornecedorEnderecoEntrega_Dependencies` (`tbFornecedorEnderecoEntrega_Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbFornecedorEnderecoCobranca`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbFornecedorEnderecoCobranca` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbFornecedorEnderecoCobranca` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `LogradouroTipo` VARCHAR(15) NOT NULL,
  `Logradouro` VARCHAR(50) NOT NULL,
  `LogradouroNumero` VARCHAR(10) NULL,
  `LogradouroComplemento` VARCHAR(50) NULL,
  `Cep` VARCHAR(8) NOT NULL,
  `Bairro` VARCHAR(40) NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `Id_UNIQUE` ON `golivetest`.`tbFornecedorEnderecoCobranca` (`Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbFornecedorEnderecoCobranca_tbFornecedor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbFornecedorEnderecoCobranca_tbFornecedor` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbFornecedorEnderecoCobranca_tbFornecedor` (
  `tbFornecedorEnderecoCobranca_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbFornecedor_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbFornecedorEnderecoCobranca_Id`, `tbFornecedor_Id`),
  CONSTRAINT `FK_tbFornecedorEnderecoCobranca0001`
    FOREIGN KEY (`tbFornecedorEnderecoCobranca_Id`)
    REFERENCES `golivetest`.`tbFornecedorEnderecoCobranca` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbFornecedor0007`
    FOREIGN KEY (`tbFornecedor_Id`)
    REFERENCES `golivetest`.`tbFornecedor` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `tbFornecedorEnderecoCobranca_Id_UNIQUE` ON `golivetest`.`tbFornecedorEnderecoCobranca_tbFornecedor` (`tbFornecedorEnderecoCobranca_Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbFornecedorEnderecoCobranca_Dependencies`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbFornecedorEnderecoCobranca_Dependencies` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbFornecedorEnderecoCobranca_Dependencies` (
  `tbFornecedorEnderecoCobranca_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbFornecedor_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbTipoLogradouro_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbMunicipio_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbEstado_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbPais_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbFornecedorEnderecoCobranca_Id`, `tbFornecedor_Id`, `tbTipoLogradouro_Id`, `tbMunicipio_Id`, `tbEstado_Id`, `tbPais_Id`),
  CONSTRAINT `FK_tbFornecedorEnderecoCobranca0002`
    FOREIGN KEY (`tbFornecedorEnderecoCobranca_Id`)
    REFERENCES `golivetest`.`tbFornecedorEnderecoCobranca` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbFornecedor0008`
    FOREIGN KEY (`tbFornecedor_Id`)
    REFERENCES `golivetest`.`tbFornecedor` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbTipoLogradouro0004`
    FOREIGN KEY (`tbTipoLogradouro_Id`)
    REFERENCES `golivetest`.`tbTipoLogradouro` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbMunicipio0006`
    FOREIGN KEY (`tbMunicipio_Id`)
    REFERENCES `golivetest`.`tbMunicipio` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbEstado0007`
    FOREIGN KEY (`tbEstado_Id`)
    REFERENCES `golivetest`.`tbEstado` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbPais0008`
    FOREIGN KEY (`tbPais_Id`)
    REFERENCES `golivetest`.`tbPais` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `tbFornecedorEnderecoCobranca_Id_UNIQUE` ON `golivetest`.`tbFornecedorEnderecoCobranca_Dependencies` (`tbFornecedorEnderecoCobranca_Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbPadroesEspessuraProduto_tbUnidade`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbPadroesEspessuraProduto_tbUnidade` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbPadroesEspessuraProduto_tbUnidade` (
  `tbPadroesEspessuraProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUnidade_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbPadroesEspessuraProduto_Id`, `tbUnidade_Id`),
  CONSTRAINT `FK_tbPadroesEspessuraProduto0008`
    FOREIGN KEY (`tbPadroesEspessuraProduto_Id`)
    REFERENCES `golivetest`.`tbPadroesEspessuraProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUnidade0007`
    FOREIGN KEY (`tbUnidade_Id`)
    REFERENCES `golivetest`.`tbUnidade` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `tbPadroesEspessuraProduto_Id_UNIQUE` ON `golivetest`.`tbPadroesEspessuraProduto_tbUnidade` (`tbPadroesEspessuraProduto_Id` ASC);


-- -----------------------------------------------------
-- Table `golivetest`.`tbPadroesLarguraProduto_tbUnidade`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golivetest`.`tbPadroesLarguraProduto_tbUnidade` ;

CREATE TABLE IF NOT EXISTS `golivetest`.`tbPadroesLarguraProduto_tbUnidade` (
  `tbPadroesLarguraProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUnidade_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbPadroesLarguraProduto_Id`, `tbUnidade_Id`),
  CONSTRAINT `FK_tbPadroesLarguraProduto0008`
    FOREIGN KEY (`tbPadroesLarguraProduto_Id`)
    REFERENCES `golivetest`.`tbPadroesLarguraProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUnidade0008`
    FOREIGN KEY (`tbUnidade_Id`)
    REFERENCES `golivetest`.`tbUnidade` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `tbPadroesLarguraProduto_Id_UNIQUE` ON `golivetest`.`tbPadroesLarguraProduto_tbUnidade` (`tbPadroesLarguraProduto_Id` ASC);


CREATE TABLE IF NOT EXISTS `golivetest`.`tbConfiguracaoColunaPagina` (
  `tbUsuario_Id` INT UNSIGNED NOT NULL,
  `Ordernation` INT UNSIGNED NOT NULL,
  `PageBeanName` VARCHAR(45),
  `TableName` VARCHAR(45),
  `ColumnName` VARCHAR(45),
  `PatternFilter` VARCHAR(45),
  `WidthColumn` INT UNSIGNED,
  `Visible` BIT(1))
ENGINE = InnoDB;






SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
