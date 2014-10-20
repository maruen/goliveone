SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `golive` ;
CREATE SCHEMA IF NOT EXISTS `golive` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
SHOW WARNINGS;
USE `golive` ;

-- -----------------------------------------------------
-- Table `golive`.`tbTipoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbTipoProduto` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbTipoProduto` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `TipoProduto` VARCHAR(45) NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `Id_UNIQUE` ON `golive`.`tbTipoProduto` (`Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbAuditoria`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbAuditoria` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbAuditoria` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `FormularioNome` VARCHAR(120) NOT NULL,
  `AcaoUsuario` VARCHAR(2500) NOT NULL,
  `Observacao` VARCHAR(2500) NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `Id_UNIQUE` ON `golive`.`tbAuditoria` (`Id` ASC);

SHOW WARNINGS;
-- -----------------------------------------------------
-- Table `golive`.`tbAuditoriaItem`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbAuditoriaItem` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbAuditoriaItem` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `Campo` VARCHAR(2500) NOT NULL,
  `InformacaoAnterior` VARCHAR(2500) NOT NULL,
  `InformacaoAtual` VARCHAR(2500) NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `Id_UNIQUE` ON `golive`.`tbAuditoriaItem` (`Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbAuditoria_tbTipoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbAuditoria_tbTipoProduto` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbAuditoria_tbTipoProduto` (
  `tbAuditoria_Id` INT ZEROFILL UNSIGNED NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT ZEROFILL UNSIGNED NOT NULL,
  `tbTipoProduto_Id` INT ZEROFILL UNSIGNED NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbTipoProduto_Id`),
  CONSTRAINT `FK_tbAuditoria0010`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golive`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbTipoProduto0002`
    FOREIGN KEY (`tbTipoProduto_Id`)
    REFERENCES `golive`.`tbTipoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0024`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golive`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0020`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golive`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golive`.`tbAuditoria_tbTipoProduto` (`tbAuditoriaItem_Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbFinalidadeCodigoBarrasProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbFinalidadeCodigoBarrasProduto` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbFinalidadeCodigoBarrasProduto` (
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

SHOW WARNINGS;
CREATE UNIQUE INDEX `Id_UNIQUE` ON `golive`.`tbFinalidadeCodigoBarrasProduto` (`Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbAuditoria_tbFinalidadeCodigoBarrasProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbAuditoria_tbFinalidadeCodigoBarrasProduto` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbAuditoria_tbFinalidadeCodigoBarrasProduto` (
  `tbAuditoria_Id` INT ZEROFILL UNSIGNED NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT ZEROFILL UNSIGNED NOT NULL,
  `tbFinalidadeCodigoBarrasProduto_Id` INT ZEROFILL UNSIGNED NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbFinalidadeCodigoBarrasProduto_Id`),
  CONSTRAINT `FK_tbAuditoria0020`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golive`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbFinalidadeCodigoBarrasProduto0003`
    FOREIGN KEY (`tbFinalidadeCodigoBarrasProduto_Id`)
    REFERENCES `golive`.`tbFinalidadeCodigoBarrasProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0034`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golive`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0030`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golive`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golive`.`tbAuditoria_tbFinalidadeCodigoBarrasProduto` (`tbAuditoriaItem_Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbAuditoria_tbUnidade`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbAuditoria_tbUnidade` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbAuditoria_tbUnidade` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUnidade_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbUnidade_Id`),
  CONSTRAINT `FK_tbAuditoria0009`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golive`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUnidade0006`
    FOREIGN KEY (`tbUnidade_Id`)
    REFERENCES `golive`.`tbUnidade` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0023`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golive`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0019`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golive`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golive`.`tbAuditoria_tbUnidade` (`tbAuditoriaItem_Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbFinalidadePadraoEspessuraProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbFinalidadePadraoEspessuraProduto` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbFinalidadePadraoEspessuraProduto` (
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

SHOW WARNINGS;
CREATE UNIQUE INDEX `Id_UNIQUE` ON `golive`.`tbFinalidadePadraoEspessuraProduto` (`Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbFinalidadePadraoEspessuraProduto_tbUnidade`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbFinalidadePadraoEspessuraProduto_tbUnidade` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbFinalidadePadraoEspessuraProduto_tbUnidade` (
  `tbFinalidadePadraoEspessuraProduto_Id` INT UNSIGNED NOT NULL,
  `tbUnidade_Id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`tbFinalidadePadraoEspessuraProduto_Id`, `tbUnidade_Id`),
  CONSTRAINT `FK_tbFinalidadePadraoEspessuraProduto0001`
    FOREIGN KEY (`tbFinalidadePadraoEspessuraProduto_Id`)
    REFERENCES `golive`.`tbFinalidadePadraoEspessuraProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUnidade0002`
    FOREIGN KEY (`tbUnidade_Id`)
    REFERENCES `golive`.`tbUnidade` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `tbFinalidadePadraoEspessuraProduto_Id_UNIQUE` ON `golive`.`tbFinalidadePadraoEspessuraProduto_tbUnidade` (`tbFinalidadePadraoEspessuraProduto_Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbFinalidadePadraoLarguraProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbFinalidadePadraoLarguraProduto` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbFinalidadePadraoLarguraProduto` (
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

SHOW WARNINGS;
CREATE UNIQUE INDEX `Id_UNIQUE` ON `golive`.`tbFinalidadePadraoLarguraProduto` (`Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbFinalidadePadraoLarguraProduto_tbUnidade`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbFinalidadePadraoLarguraProduto_tbUnidade` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbFinalidadePadraoLarguraProduto_tbUnidade` (
  `tbFinalidadePadraoLarguraProduto_Id` INT UNSIGNED NOT NULL,
  `tbUnidade_Id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`tbFinalidadePadraoLarguraProduto_Id`, `tbUnidade_Id`),
  CONSTRAINT `FK_tbFinalidadePadraoLarguraProduto0001`
    FOREIGN KEY (`tbFinalidadePadraoLarguraProduto_Id`)
    REFERENCES `golive`.`tbFinalidadePadraoLarguraProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUnidade0003`
    FOREIGN KEY (`tbUnidade_Id`)
    REFERENCES `golive`.`tbUnidade` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `tbFinalidadeCodigoBarrasProduto_Id_UNIQUE` ON `golive`.`tbFinalidadePadraoLarguraProduto_tbUnidade` (`tbFinalidadePadraoLarguraProduto_Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbUnidade`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbUnidade` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbUnidade` (
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
    REFERENCES `golive`.`tbFinalidadeCodigoBarrasProduto_tbUnidade` (`tbUnidade_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUnidade_tbAuditoria_tbUnidade`
    FOREIGN KEY (`Id`)
    REFERENCES `golive`.`tbAuditoria_tbUnidade` (`tbUnidade_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUnidade_tbFinalidadePadraoEspessuraProduto_tbUnidade`
    FOREIGN KEY (`Id`)
    REFERENCES `golive`.`tbFinalidadePadraoEspessuraProduto_tbUnidade` (`tbUnidade_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUnidade_tbFinalidadePadraoLarguraProduto_tbUnidade`
    FOREIGN KEY (`Id`)
    REFERENCES `golive`.`tbFinalidadePadraoLarguraProduto_tbUnidade` (`tbUnidade_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `Id_UNIQUE` ON `golive`.`tbUnidade` (`Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbFinalidadeCodigoBarrasProduto_tbUnidade`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbFinalidadeCodigoBarrasProduto_tbUnidade` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbFinalidadeCodigoBarrasProduto_tbUnidade` (
  `tbFinalidadeCodigoBarrasProduto_Id` INT UNSIGNED NOT NULL,
  `tbUnidade_Id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`tbFinalidadeCodigoBarrasProduto_Id`, `tbUnidade_Id`),
  CONSTRAINT `FK_tbFinalidadeCodigoBarrasProduto0001`
    FOREIGN KEY (`tbFinalidadeCodigoBarrasProduto_Id`)
    REFERENCES `golive`.`tbFinalidadeCodigoBarrasProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUnidade0001`
    FOREIGN KEY (`tbUnidade_Id`)
    REFERENCES `golive`.`tbUnidade` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `tbFinalidadeCodigoBarrasProduto_Id_UNIQUE` ON `golive`.`tbFinalidadeCodigoBarrasProduto_tbUnidade` (`tbFinalidadeCodigoBarrasProduto_Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbFinalidadeCodigoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbFinalidadeCodigoProduto` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbFinalidadeCodigoProduto` (
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

SHOW WARNINGS;
CREATE UNIQUE INDEX `Id_UNIQUE` ON `golive`.`tbFinalidadeCodigoProduto` (`Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbAuditoria_tbFinalidadeCodigoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbAuditoria_tbFinalidadeCodigoProduto` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbAuditoria_tbFinalidadeCodigoProduto` (
  `tbAuditoria_Id` INT ZEROFILL UNSIGNED NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT ZEROFILL UNSIGNED NOT NULL,
  `tbFinalidadeCodigoProduto_Id` INT ZEROFILL UNSIGNED NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbFinalidadeCodigoProduto_Id`),
  CONSTRAINT `FK_tbAuditoria0018`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golive`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbFinalidadeCodigoProduto0002`
    FOREIGN KEY (`tbFinalidadeCodigoProduto_Id`)
    REFERENCES `golive`.`tbFinalidadeCodigoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0032`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golive`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0028`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golive`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golive`.`tbAuditoria_tbFinalidadeCodigoProduto` (`tbAuditoriaItem_Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbFinalidadeColecaoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbFinalidadeColecaoProduto` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbFinalidadeColecaoProduto` (
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

SHOW WARNINGS;
CREATE UNIQUE INDEX `Id_UNIQUE` ON `golive`.`tbFinalidadeColecaoProduto` (`Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbAuditoria_tbFinalidadeColecaoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbAuditoria_tbFinalidadeColecaoProduto` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbAuditoria_tbFinalidadeColecaoProduto` (
  `tbAuditoria_Id` INT ZEROFILL UNSIGNED NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT ZEROFILL UNSIGNED NOT NULL,
  `tbFinalidadeColecaoProduto_Id` INT ZEROFILL UNSIGNED NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbFinalidadeColecaoProduto_Id`),
  CONSTRAINT `FK_tbAuditoria0019`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golive`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbFinalidadeColecaoProduto0002`
    FOREIGN KEY (`tbFinalidadeColecaoProduto_Id`)
    REFERENCES `golive`.`tbFinalidadeColecaoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0033`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golive`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0029`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golive`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golive`.`tbAuditoria_tbFinalidadeColecaoProduto` (`tbAuditoriaItem_Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbFinalidadeCorProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbFinalidadeCorProduto` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbFinalidadeCorProduto` (
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

SHOW WARNINGS;
CREATE UNIQUE INDEX `Id_UNIQUE` ON `golive`.`tbFinalidadeCorProduto` (`Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbAuditoria_tbFinalidadeCorProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbAuditoria_tbFinalidadeCorProduto` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbAuditoria_tbFinalidadeCorProduto` (
  `tbAuditoria_Id` INT ZEROFILL UNSIGNED NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT ZEROFILL UNSIGNED NOT NULL,
  `tbFinalidadeCorProduto_Id` INT ZEROFILL UNSIGNED NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbFinalidadeCorProduto_Id`),
  CONSTRAINT `FK_tbAuditoria0021`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golive`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbFinalidadeCorProduto0002`
    FOREIGN KEY (`tbFinalidadeCorProduto_Id`)
    REFERENCES `golive`.`tbFinalidadeCorProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0035`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golive`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0031`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golive`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golive`.`tbAuditoria_tbFinalidadeCorProduto` (`tbAuditoriaItem_Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbFinalidadeDescricaoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbFinalidadeDescricaoProduto` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbFinalidadeDescricaoProduto` (
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

SHOW WARNINGS;
CREATE UNIQUE INDEX `Id_UNIQUE` ON `golive`.`tbFinalidadeDescricaoProduto` (`Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbAuditoria_tbFinalidadeDescricaoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbAuditoria_tbFinalidadeDescricaoProduto` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbAuditoria_tbFinalidadeDescricaoProduto` (
  `tbAuditoria_Id` INT ZEROFILL UNSIGNED NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT ZEROFILL UNSIGNED NOT NULL,
  `tbFinalidadeDescricaoProduto_Id` INT ZEROFILL UNSIGNED NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbFinalidadeDescricaoProduto_Id`),
  CONSTRAINT `FK_tbAuditoria0022`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golive`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbFinalidadeDescricaoProduto0002`
    FOREIGN KEY (`tbFinalidadeDescricaoProduto_Id`)
    REFERENCES `golive`.`tbFinalidadeDescricaoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0036`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golive`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0032`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golive`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golive`.`tbAuditoria_tbFinalidadeDescricaoProduto` (`tbAuditoriaItem_Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbAuditoria_tbFinalidadePadraoEspessuraProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbAuditoria_tbFinalidadePadraoEspessuraProduto` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbAuditoria_tbFinalidadePadraoEspessuraProduto` (
  `tbAuditoria_Id` INT ZEROFILL UNSIGNED NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT ZEROFILL UNSIGNED NOT NULL,
  `tbFinalidadePadraoEspessuraProduto_Id` INT ZEROFILL UNSIGNED NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbFinalidadePadraoEspessuraProduto_Id`),
  CONSTRAINT `FK_tbAuditoria0023`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golive`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbFinalidadePadraoEspessuraProduto0003`
    FOREIGN KEY (`tbFinalidadePadraoEspessuraProduto_Id`)
    REFERENCES `golive`.`tbFinalidadePadraoEspessuraProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0037`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golive`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0033`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golive`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golive`.`tbAuditoria_tbFinalidadePadraoEspessuraProduto` (`tbAuditoriaItem_Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbAuditoria_tbFinalidadePadraoLarguraProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbAuditoria_tbFinalidadePadraoLarguraProduto` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbAuditoria_tbFinalidadePadraoLarguraProduto` (
  `tbAuditoria_Id` INT ZEROFILL UNSIGNED NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT ZEROFILL UNSIGNED NOT NULL,
  `tbFinalidadePadraoLarguraProduto_Id` INT ZEROFILL UNSIGNED NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbFinalidadePadraoLarguraProduto_Id`),
  CONSTRAINT `FK_tbAuditoria0024`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golive`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbFinalidadePadraoLarguraProduto0003`
    FOREIGN KEY (`tbFinalidadePadraoLarguraProduto_Id`)
    REFERENCES `golive`.`tbFinalidadePadraoLarguraProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0038`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golive`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0034`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golive`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golive`.`tbAuditoria_tbFinalidadePadraoLarguraProduto` (`tbAuditoriaItem_Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbFinalidadeTipoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbFinalidadeTipoProduto` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbFinalidadeTipoProduto` (
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

SHOW WARNINGS;
CREATE UNIQUE INDEX `Id_UNIQUE` ON `golive`.`tbFinalidadeTipoProduto` (`Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbAuditoria_tbFinalidadeTipoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbAuditoria_tbFinalidadeTipoProduto` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbAuditoria_tbFinalidadeTipoProduto` (
  `tbAuditoria_Id` INT ZEROFILL UNSIGNED NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT ZEROFILL UNSIGNED NOT NULL,
  `tbFinalidadeTipoProduto_Id` INT ZEROFILL UNSIGNED NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbFinalidadeTipoProduto_Id`),
  CONSTRAINT `FK_tbAuditoria0025`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golive`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbFinalidadeTipoProduto0002`
    FOREIGN KEY (`tbFinalidadeTipoProduto_Id`)
    REFERENCES `golive`.`tbFinalidadeTipoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0039`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golive`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0035`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golive`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golive`.`tbAuditoria_tbFinalidadeTipoProduto` (`tbAuditoriaItem_Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbFinalidadeUnidadeProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbFinalidadeUnidadeProduto` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbFinalidadeUnidadeProduto` (
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

SHOW WARNINGS;
CREATE UNIQUE INDEX `Id_UNIQUE` ON `golive`.`tbFinalidadeUnidadeProduto` (`Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbAuditoria_tbFinalidadeUnidadeProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbAuditoria_tbFinalidadeUnidadeProduto` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbAuditoria_tbFinalidadeUnidadeProduto` (
  `tbAuditoria_Id` INT ZEROFILL UNSIGNED NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT ZEROFILL UNSIGNED NOT NULL,
  `tbFinalidadeUnidadeProduto_Id` INT ZEROFILL UNSIGNED NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbFinalidadeUnidadeProduto_Id`),
  CONSTRAINT `FK_tbAuditoria0026`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golive`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbFinalidadeUnidadeProduto0003`
    FOREIGN KEY (`tbFinalidadeUnidadeProduto_Id`)
    REFERENCES `golive`.`tbFinalidadeUnidadeProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0040`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golive`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0036`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golive`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golive`.`tbAuditoria_tbFinalidadeUnidadeProduto` (`tbAuditoriaItem_Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbDepartamentoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbDepartamentoProduto` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbDepartamentoProduto` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `DepartamentoProduto` VARCHAR(120) NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `Id_UNIQUE` ON `golive`.`tbDepartamentoProduto` (`Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbAuditoria_tbDepartamentoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbAuditoria_tbDepartamentoProduto` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbAuditoria_tbDepartamentoProduto` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbDepartamentoProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbDepartamentoProduto_Id`),
  CONSTRAINT `FK_tbAuditoria0011`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golive`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbDepartamentoProduto0008`
    FOREIGN KEY (`tbDepartamentoProduto_Id`)
    REFERENCES `golive`.`tbDepartamentoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0025`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golive`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0021`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golive`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golive`.`tbAuditoria_tbDepartamentoProduto` (`tbAuditoriaItem_Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbGrupoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbGrupoProduto` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbGrupoProduto` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `GrupoProduto` VARCHAR(120) NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `Id_UNIQUE` ON `golive`.`tbGrupoProduto` (`Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbGrupoProduto_tbDepartamentoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbGrupoProduto_tbDepartamentoProduto` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbGrupoProduto_tbDepartamentoProduto` (
  `tbGrupoProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbDepartamentoProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbGrupoProduto_Id`, `tbDepartamentoProduto_Id`),
  CONSTRAINT `FK_tbGrupoProduto0002`
    FOREIGN KEY (`tbGrupoProduto_Id`)
    REFERENCES `golive`.`tbGrupoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbDepartamentoProduto0002`
    FOREIGN KEY (`tbDepartamentoProduto_Id`)
    REFERENCES `golive`.`tbDepartamentoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbAuditoria_tbGrupoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbAuditoria_tbGrupoProduto` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbAuditoria_tbGrupoProduto` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbGrupoProduto` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbGrupoProduto`),
  CONSTRAINT `FK_tbAuditoria0012`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golive`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbGrupoProduto0008`
    FOREIGN KEY (`tbGrupoProduto`)
    REFERENCES `golive`.`tbGrupoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0026`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golive`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0022`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golive`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golive`.`tbAuditoria_tbGrupoProduto` (`tbAuditoriaItem_Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbSubGrupoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbSubGrupoProduto` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbSubGrupoProduto` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `SubGrupoProduto` VARCHAR(120) NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `Id_UNIQUE` ON `golive`.`tbSubGrupoProduto` (`Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbSubGrupoProduto_tbGrupoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbSubGrupoProduto_tbGrupoProduto` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbSubGrupoProduto_tbGrupoProduto` (
  `tbSubGrupoProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbGrupoProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbSubGrupoProduto_Id`, `tbGrupoProduto_Id`),
  CONSTRAINT `FK_tbSubGrupoProduto0002`
    FOREIGN KEY (`tbSubGrupoProduto_Id`)
    REFERENCES `golive`.`tbSubGrupoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbGrupoProduto0003`
    FOREIGN KEY (`tbGrupoProduto_Id`)
    REFERENCES `golive`.`tbGrupoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbSubGrupoProduto_tbDepartamentoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbSubGrupoProduto_tbDepartamentoProduto` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbSubGrupoProduto_tbDepartamentoProduto` (
  `tbSubGrupoProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbDepartamentoProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbSubGrupoProduto_Id`, `tbDepartamentoProduto_Id`),
  CONSTRAINT `FK_tbSubGrupoProduto0003`
    FOREIGN KEY (`tbSubGrupoProduto_Id`)
    REFERENCES `golive`.`tbSubGrupoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbDepartamentoProduto0003`
    FOREIGN KEY (`tbDepartamentoProduto_Id`)
    REFERENCES `golive`.`tbDepartamentoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbAuditoria_tbSubGrupoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbAuditoria_tbSubGrupoProduto` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbAuditoria_tbSubGrupoProduto` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbSubGrupoProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbSubGrupoProduto_Id`),
  CONSTRAINT `FK_tbAuditoria0013`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golive`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbSubGrupoProduto0009`
    FOREIGN KEY (`tbSubGrupoProduto_Id`)
    REFERENCES `golive`.`tbSubGrupoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0027`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golive`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0023`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golive`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golive`.`tbAuditoria_tbSubGrupoProduto` (`tbAuditoriaItem_Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbPadroesEspessuraProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbPadroesEspessuraProduto` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbPadroesEspessuraProduto` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `Espessura` DECIMAL(6,3) NOT NULL,
  `EspessuraDescricao` VARCHAR(120) NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `Id_UNIQUE` ON `golive`.`tbPadroesEspessuraProduto` (`Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbPadroesEspessuraProduto_tbDepartamento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbPadroesEspessuraProduto_tbDepartamento` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbPadroesEspessuraProduto_tbDepartamento` (
  `tbPadroesEspessurasProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbDepartamentoProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbPadroesEspessurasProduto_Id`, `tbDepartamentoProduto_Id`),
  CONSTRAINT `FK_tbPadroesEspessurasProduto0002`
    FOREIGN KEY (`tbPadroesEspessurasProduto_Id`)
    REFERENCES `golive`.`tbPadroesEspessuraProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbDepartamentoProduto0004`
    FOREIGN KEY (`tbDepartamentoProduto_Id`)
    REFERENCES `golive`.`tbDepartamentoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbPadroesEspessuraProduto_tbGrupoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbPadroesEspessuraProduto_tbGrupoProduto` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbPadroesEspessuraProduto_tbGrupoProduto` (
  `tbPadroesEspessuraProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbGrupoProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbPadroesEspessuraProduto_Id`, `tbGrupoProduto_Id`),
  CONSTRAINT `FK_tbPradroesEspessuraProduto0003`
    FOREIGN KEY (`tbPadroesEspessuraProduto_Id`)
    REFERENCES `golive`.`tbPadroesEspessuraProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbGrupoProduto0004`
    FOREIGN KEY (`tbGrupoProduto_Id`)
    REFERENCES `golive`.`tbGrupoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbPadroesEspessuraProduto_tbSubGrupoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbPadroesEspessuraProduto_tbSubGrupoProduto` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbPadroesEspessuraProduto_tbSubGrupoProduto` (
  `tbPadroesEspessuraProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbSubGrupoProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbPadroesEspessuraProduto_Id`, `tbSubGrupoProduto_Id`),
  CONSTRAINT `FK_tbPadroesEspessuraProduto0004`
    FOREIGN KEY (`tbPadroesEspessuraProduto_Id`)
    REFERENCES `golive`.`tbPadroesEspessuraProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbSubGrupoProduto0004`
    FOREIGN KEY (`tbSubGrupoProduto_Id`)
    REFERENCES `golive`.`tbSubGrupoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbColecoesProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbColecoesProduto` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbColecoesProduto` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL,
  `Colecao` VARCHAR(120) NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `Id_UNIQUE` ON `golive`.`tbColecoesProduto` (`Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbPadroesEspessuraProduto_tbColecoesProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbPadroesEspessuraProduto_tbColecoesProduto` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbPadroesEspessuraProduto_tbColecoesProduto` (
  `tbPadroesEspessuraProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbColecoesProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbPadroesEspessuraProduto_Id`, `tbColecoesProduto_Id`),
  CONSTRAINT `FK_tbPadroesEspessuraProduto0005`
    FOREIGN KEY (`tbPadroesEspessuraProduto_Id`)
    REFERENCES `golive`.`tbPadroesEspessuraProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbColecoesProduto0002`
    FOREIGN KEY (`tbColecoesProduto_Id`)
    REFERENCES `golive`.`tbColecoesProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbCorProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbCorProduto` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbCorProduto` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `CorCodigo` VARCHAR(15) NULL,
  `CorDescricao` VARCHAR(45) NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `Id_UNIQUE` ON `golive`.`tbCorProduto` (`Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbPadroesEspessuraProduto_tbCorProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbPadroesEspessuraProduto_tbCorProduto` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbPadroesEspessuraProduto_tbCorProduto` (
  `tbPadoresEspessuraProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCorProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbPadoresEspessuraProduto_Id`, `tbCorProduto_Id`),
  CONSTRAINT `FK_tbPadroesEspessuraProduto0006`
    FOREIGN KEY (`tbPadoresEspessuraProduto_Id`)
    REFERENCES `golive`.`tbPadroesEspessuraProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCorProduto0002`
    FOREIGN KEY (`tbCorProduto_Id`)
    REFERENCES `golive`.`tbCorProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `tbCorProduto_Id_UNIQUE` ON `golive`.`tbPadroesEspessuraProduto_tbCorProduto` (`tbCorProduto_Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbAuditoria_tbPadroesEspessuraProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbAuditoria_tbPadroesEspessuraProduto` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbAuditoria_tbPadroesEspessuraProduto` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbPadroesEspessuraProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbPadroesEspessuraProduto_Id`),
  CONSTRAINT `FK_tbAuditoria0014`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golive`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbPadroesEspessuraProduto0007`
    FOREIGN KEY (`tbPadroesEspessuraProduto_Id`)
    REFERENCES `golive`.`tbPadroesEspessuraProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0028`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golive`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0024`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golive`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golive`.`tbAuditoria_tbPadroesEspessuraProduto` (`tbAuditoriaItem_Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbPadroesLarguraProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbPadroesLarguraProduto` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbPadroesLarguraProduto` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `Largura` DECIMAL(6,3) NOT NULL,
  `LarguraDescricao` VARCHAR(120) NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `Id_UNIQUE` ON `golive`.`tbPadroesLarguraProduto` (`Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbPadroesLarguraProduto_tbDepartamentoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbPadroesLarguraProduto_tbDepartamentoProduto` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbPadroesLarguraProduto_tbDepartamentoProduto` (
  `tbPadroesLarguraProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbDepartamentoProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbPadroesLarguraProduto_Id`, `tbDepartamentoProduto_Id`),
  CONSTRAINT `FK_tbPadroesLarguraProduto0002`
    FOREIGN KEY (`tbPadroesLarguraProduto_Id`)
    REFERENCES `golive`.`tbPadroesLarguraProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbDepartamentoProduto0005`
    FOREIGN KEY (`tbDepartamentoProduto_Id`)
    REFERENCES `golive`.`tbDepartamentoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbPadroesLarguraProduto_tbGrupoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbPadroesLarguraProduto_tbGrupoProduto` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbPadroesLarguraProduto_tbGrupoProduto` (
  `tbPadroesLarguraProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbGrupoProduto` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbPadroesLarguraProduto_Id`, `tbGrupoProduto`),
  CONSTRAINT `FK_tbPadroesLarguraProduto0003`
    FOREIGN KEY (`tbPadroesLarguraProduto_Id`)
    REFERENCES `golive`.`tbPadroesLarguraProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbGrupoProduto0005`
    FOREIGN KEY (`tbGrupoProduto`)
    REFERENCES `golive`.`tbGrupoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbPadroesLarguraProduto_tbSubGrupoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbPadroesLarguraProduto_tbSubGrupoProduto` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbPadroesLarguraProduto_tbSubGrupoProduto` (
  `tbPadroesLarguraProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbSubGrupoProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbPadroesLarguraProduto_Id`, `tbSubGrupoProduto_Id`),
  CONSTRAINT `FK_tbPadroesLarguraProduto0004`
    FOREIGN KEY (`tbPadroesLarguraProduto_Id`)
    REFERENCES `golive`.`tbPadroesLarguraProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbSubGrupoProduto0005`
    FOREIGN KEY (`tbSubGrupoProduto_Id`)
    REFERENCES `golive`.`tbSubGrupoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbPadroesLarguraProduto_tbColecoesProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbPadroesLarguraProduto_tbColecoesProduto` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbPadroesLarguraProduto_tbColecoesProduto` (
  `tbPadroesLarguraProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbColecoesProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbPadroesLarguraProduto_Id`, `tbColecoesProduto_Id`),
  CONSTRAINT `FK_tbPadroesLarguraProduto0005`
    FOREIGN KEY (`tbPadroesLarguraProduto_Id`)
    REFERENCES `golive`.`tbPadroesLarguraProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbColecoesProduto0003`
    FOREIGN KEY (`tbColecoesProduto_Id`)
    REFERENCES `golive`.`tbColecoesProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbPadroesLarguraProduto_tbCorProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbPadroesLarguraProduto_tbCorProduto` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbPadroesLarguraProduto_tbCorProduto` (
  `tbPadroesLarguraProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCorProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbPadroesLarguraProduto_Id`, `tbCorProduto_Id`),
  CONSTRAINT `FK_tbPadroesLarguraProduto0006`
    FOREIGN KEY (`tbPadroesLarguraProduto_Id`)
    REFERENCES `golive`.`tbPadroesLarguraProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCorProduto0003`
    FOREIGN KEY (`tbCorProduto_Id`)
    REFERENCES `golive`.`tbCorProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `tbCorProduto_Id_UNIQUE` ON `golive`.`tbPadroesLarguraProduto_tbCorProduto` (`tbCorProduto_Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbAuditoria_tbPadroesLarguraProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbAuditoria_tbPadroesLarguraProduto` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbAuditoria_tbPadroesLarguraProduto` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbPadroesLarguraProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbPadroesLarguraProduto_Id`),
  CONSTRAINT `FK_tbAuditoria0015`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golive`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbPadroesLarguraProduto0007`
    FOREIGN KEY (`tbPadroesLarguraProduto_Id`)
    REFERENCES `golive`.`tbPadroesLarguraProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0029`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golive`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0025`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golive`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golive`.`tbAuditoria_tbPadroesLarguraProduto` (`tbAuditoriaItem_Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbColecoesProduto_tbDepartamentoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbColecoesProduto_tbDepartamentoProduto` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbColecoesProduto_tbDepartamentoProduto` (
  `tbColecoesProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbDepartamentoProduto_Id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`tbColecoesProduto_Id`, `tbDepartamentoProduto_Id`),
  CONSTRAINT `FK_tbColecoesProduto0004`
    FOREIGN KEY (`tbColecoesProduto_Id`)
    REFERENCES `golive`.`tbColecoesProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbDepartamentoProduto0006`
    FOREIGN KEY (`tbDepartamentoProduto_Id`)
    REFERENCES `golive`.`tbDepartamentoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbColecoesProduto_tbGrupoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbColecoesProduto_tbGrupoProduto` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbColecoesProduto_tbGrupoProduto` (
  `tbColecoesProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbGrupoProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbColecoesProduto_Id`, `tbGrupoProduto_Id`),
  CONSTRAINT `FK_tbColecoesProduto0005`
    FOREIGN KEY (`tbColecoesProduto_Id`)
    REFERENCES `golive`.`tbColecoesProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbGrupoProduto0006`
    FOREIGN KEY (`tbGrupoProduto_Id`)
    REFERENCES `golive`.`tbGrupoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbColecoesProduto_tbSubGrupoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbColecoesProduto_tbSubGrupoProduto` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbColecoesProduto_tbSubGrupoProduto` (
  `tbColecoesProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbSubGrupoProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbColecoesProduto_Id`, `tbSubGrupoProduto_Id`),
  CONSTRAINT `FK_tbColecoesProduto0006`
    FOREIGN KEY (`tbColecoesProduto_Id`)
    REFERENCES `golive`.`tbColecoesProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbSubGrupoProduto0006`
    FOREIGN KEY (`tbSubGrupoProduto_Id`)
    REFERENCES `golive`.`tbSubGrupoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbAuditoria_tbColecoesProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbAuditoria_tbColecoesProduto` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbAuditoria_tbColecoesProduto` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbColecoesProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbColecoesProduto_Id`),
  CONSTRAINT `FK_tbAuditoria0016`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golive`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbColecoesProduto0008`
    FOREIGN KEY (`tbColecoesProduto_Id`)
    REFERENCES `golive`.`tbColecoesProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0030`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golive`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0026`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golive`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golive`.`tbAuditoria_tbColecoesProduto` (`tbAuditoriaItem_Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbCorProduto_tbDepartamentoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbCorProduto_tbDepartamentoProduto` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbCorProduto_tbDepartamentoProduto` (
  `tbCorProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbDepartamentoProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbCorProduto_Id`, `tbDepartamentoProduto_Id`),
  CONSTRAINT `FK_tbCorProduto0004`
    FOREIGN KEY (`tbCorProduto_Id`)
    REFERENCES `golive`.`tbCorProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbDepartamentoProduto0007`
    FOREIGN KEY (`tbDepartamentoProduto_Id`)
    REFERENCES `golive`.`tbDepartamentoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbCorProduto_tbGrupoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbCorProduto_tbGrupoProduto` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbCorProduto_tbGrupoProduto` (
  `tbCorProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbGrupoProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbCorProduto_Id`, `tbGrupoProduto_Id`),
  CONSTRAINT `FK_tbCorProduto0005`
    FOREIGN KEY (`tbCorProduto_Id`)
    REFERENCES `golive`.`tbCorProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbGrupoProduto0007`
    FOREIGN KEY (`tbGrupoProduto_Id`)
    REFERENCES `golive`.`tbGrupoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbCorProduto_tbSubGrupoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbCorProduto_tbSubGrupoProduto` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbCorProduto_tbSubGrupoProduto` (
  `tbCorProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbSubGrupoProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbCorProduto_Id`, `tbSubGrupoProduto_Id`),
  CONSTRAINT `FK_tbCorProduto0006`
    FOREIGN KEY (`tbCorProduto_Id`)
    REFERENCES `golive`.`tbCorProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbSubGrupoProduto0007`
    FOREIGN KEY (`tbSubGrupoProduto_Id`)
    REFERENCES `golive`.`tbSubGrupoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbCorProduto_tbColecoesProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbCorProduto_tbColecoesProduto` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbCorProduto_tbColecoesProduto` (
  `tbCorProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbColecoesProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbCorProduto_Id`, `tbColecoesProduto_Id`),
  CONSTRAINT `FK_tbCorProduto0007`
    FOREIGN KEY (`tbCorProduto_Id`)
    REFERENCES `golive`.`tbCorProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbColecoesProduto0007`
    FOREIGN KEY (`tbColecoesProduto_Id`)
    REFERENCES `golive`.`tbColecoesProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `tbCorProduto_Id_UNIQUE` ON `golive`.`tbCorProduto_tbColecoesProduto` (`tbCorProduto_Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbAuditoria_tbCorProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbAuditoria_tbCorProduto` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbAuditoria_tbCorProduto` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCorProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbCorProduto_Id`),
  CONSTRAINT `FK_tbAuditoria0017`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golive`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCorProduto0008`
    FOREIGN KEY (`tbCorProduto_Id`)
    REFERENCES `golive`.`tbCorProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0031`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golive`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0027`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golive`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golive`.`tbAuditoria_tbCorProduto` (`tbAuditoriaItem_Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbProduto` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbProduto` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `Observacao` VARCHAR(8000) NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `Id_UNIQUE` ON `golive`.`tbProduto` (`Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbProdutoCodigo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbProdutoCodigo` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbProdutoCodigo` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL,
  `Codigo` VARCHAR(8000) NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `Id_UNIQUE` ON `golive`.`tbProdutoCodigo` (`Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbProduto_tbProdutoCodigo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbProduto_tbProdutoCodigo` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbProduto_tbProdutoCodigo` (
  `tbProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbProdutoCodigo_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbFinalidadeCodigoProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbProduto_Id`, `tbProdutoCodigo_Id`, `tbFinalidadeCodigoProduto_Id`),
  CONSTRAINT `FK_tbProduto0001`
    FOREIGN KEY (`tbProduto_Id`)
    REFERENCES `golive`.`tbProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbProdutoCodigo0001`
    FOREIGN KEY (`tbProdutoCodigo_Id`)
    REFERENCES `golive`.`tbProdutoCodigo` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbFinalidadeCodigoProduto0001`
    FOREIGN KEY (`tbFinalidadeCodigoProduto_Id`)
    REFERENCES `golive`.`tbFinalidadeCodigoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `tbProdutoCodigo_Id_UNIQUE` ON `golive`.`tbProduto_tbProdutoCodigo` (`tbProdutoCodigo_Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbAuditoria_tbProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbAuditoria_tbProduto` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbAuditoria_tbProduto` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbProduto_Id`),
  CONSTRAINT `FK_tbAuditoria0001`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golive`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbProduto0015`
    FOREIGN KEY (`tbProduto_Id`)
    REFERENCES `golive`.`tbProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0009`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golive`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0008`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golive`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golive`.`tbAuditoria_tbProduto` (`tbAuditoriaItem_Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbAuditoria_tbProdutoCodigo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbAuditoria_tbProdutoCodigo` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbAuditoria_tbProdutoCodigo` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbProdutoCodigo_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbProdutoCodigo_Id`),
  CONSTRAINT `FK_tbAuditoria0002`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golive`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbProdutoCodigo0002`
    FOREIGN KEY (`tbProdutoCodigo_Id`)
    REFERENCES `golive`.`tbProdutoCodigo` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0010`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golive`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0009`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golive`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golive`.`tbAuditoria_tbProdutoCodigo` (`tbAuditoriaItem_Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbProdutoDescricao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbProdutoDescricao` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbProdutoDescricao` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `Descricao` VARCHAR(8000) NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `Id_UNIQUE` ON `golive`.`tbProdutoDescricao` (`Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbProduto_tbProdutoDescricao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbProduto_tbProdutoDescricao` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbProduto_tbProdutoDescricao` (
  `tbProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbProdutoDescricao_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbFinalidadeDescricaoProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbProduto_Id`, `tbProdutoDescricao_Id`, `tbFinalidadeDescricaoProduto_Id`),
  CONSTRAINT `FK_tbProduto0002`
    FOREIGN KEY (`tbProduto_Id`)
    REFERENCES `golive`.`tbProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbProdutoDescricao0001`
    FOREIGN KEY (`tbProdutoDescricao_Id`)
    REFERENCES `golive`.`tbProdutoDescricao` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbFinalidadeDescricaoProduto0001`
    FOREIGN KEY (`tbFinalidadeDescricaoProduto_Id`)
    REFERENCES `golive`.`tbFinalidadeDescricaoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `tbProdutoDescricao_Id_UNIQUE` ON `golive`.`tbProduto_tbProdutoDescricao` (`tbProdutoDescricao_Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbAuditoria_tbProdutoDescricao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbAuditoria_tbProdutoDescricao` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbAuditoria_tbProdutoDescricao` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbProdutoDescricao_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbProdutoDescricao_Id`),
  CONSTRAINT `FK_tbAuditoria0003`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golive`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbProdutoDescricao0002`
    FOREIGN KEY (`tbProdutoDescricao_Id`)
    REFERENCES `golive`.`tbProdutoDescricao` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0011`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golive`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0010`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golive`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golive`.`tbAuditoria_tbProdutoDescricao` (`tbAuditoriaItem_Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbProduto_tbDepartamentoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbProduto_tbDepartamentoProduto` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbProduto_tbDepartamentoProduto` (
  `tbProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbDepartamentoProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbProduto_Id`, `tbDepartamentoProduto_Id`),
  CONSTRAINT `FK_tbProduto0003`
    FOREIGN KEY (`tbProduto_Id`)
    REFERENCES `golive`.`tbProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbDepartamentoProduto0001`
    FOREIGN KEY (`tbDepartamentoProduto_Id`)
    REFERENCES `golive`.`tbDepartamentoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `tbProduto_Id_UNIQUE` ON `golive`.`tbProduto_tbDepartamentoProduto` (`tbProduto_Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbProduto_tbGrupoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbProduto_tbGrupoProduto` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbProduto_tbGrupoProduto` (
  `tbProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbGrupoProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbProduto_Id`, `tbGrupoProduto_Id`),
  CONSTRAINT `FK_tbProduto0004`
    FOREIGN KEY (`tbProduto_Id`)
    REFERENCES `golive`.`tbProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbGrupoProduto0001`
    FOREIGN KEY (`tbGrupoProduto_Id`)
    REFERENCES `golive`.`tbGrupoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `tbProduto_Id_UNIQUE` ON `golive`.`tbProduto_tbGrupoProduto` (`tbProduto_Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbProduto_tbSubGrupoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbProduto_tbSubGrupoProduto` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbProduto_tbSubGrupoProduto` (
  `tbProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbSubGrupoProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbProduto_Id`, `tbSubGrupoProduto_Id`),
  CONSTRAINT `FK_tbProduto00005`
    FOREIGN KEY (`tbProduto_Id`)
    REFERENCES `golive`.`tbProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbSubGrupoProduto0001`
    FOREIGN KEY (`tbSubGrupoProduto_Id`)
    REFERENCES `golive`.`tbSubGrupoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `tbProduto_Id_UNIQUE` ON `golive`.`tbProduto_tbSubGrupoProduto` (`tbProduto_Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbProduto_tbColecoesProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbProduto_tbColecoesProduto` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbProduto_tbColecoesProduto` (
  `tbProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbColecoesProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbFinalidadeColecaoProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbProduto_Id`, `tbColecoesProduto_Id`, `tbFinalidadeColecaoProduto_Id`),
  CONSTRAINT `FK_tbProduto000006`
    FOREIGN KEY (`tbProduto_Id`)
    REFERENCES `golive`.`tbProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbColecoesProduto0001`
    FOREIGN KEY (`tbColecoesProduto_Id`)
    REFERENCES `golive`.`tbColecoesProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbFinalidadeColecaoProduto0001`
    FOREIGN KEY (`tbFinalidadeColecaoProduto_Id`)
    REFERENCES `golive`.`tbFinalidadeColecaoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbProduto_tbCorProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbProduto_tbCorProduto` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbProduto_tbCorProduto` (
  `tbProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCorProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbFinalidadeCorProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbProduto_Id`, `tbCorProduto_Id`, `tbFinalidadeCorProduto_Id`),
  CONSTRAINT `FK_tbProduto0007`
    FOREIGN KEY (`tbProduto_Id`)
    REFERENCES `golive`.`tbProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCorProduto0001`
    FOREIGN KEY (`tbCorProduto_Id`)
    REFERENCES `golive`.`tbCorProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbFinalidadeCorProduto0001`
    FOREIGN KEY (`tbFinalidadeCorProduto_Id`)
    REFERENCES `golive`.`tbFinalidadeCorProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbProduto_tbPadroesLarguraProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbProduto_tbPadroesLarguraProduto` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbProduto_tbPadroesLarguraProduto` (
  `tbProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbPadroesLarguraProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbFinalidadePadraoLarguraProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbProduto_Id`, `tbPadroesLarguraProduto_Id`, `tbFinalidadePadraoLarguraProduto_Id`),
  CONSTRAINT `FK_tbProduto0008`
    FOREIGN KEY (`tbProduto_Id`)
    REFERENCES `golive`.`tbProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbPadroesLarguraProduto0001`
    FOREIGN KEY (`tbPadroesLarguraProduto_Id`)
    REFERENCES `golive`.`tbPadroesLarguraProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbFinalidadePadraoLarguraProduto0002`
    FOREIGN KEY (`tbFinalidadePadraoLarguraProduto_Id`)
    REFERENCES `golive`.`tbFinalidadePadraoLarguraProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbProduto_tbPadroesEspessuraProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbProduto_tbPadroesEspessuraProduto` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbProduto_tbPadroesEspessuraProduto` (
  `tbProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbPadroesEspessuraProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbFinalidadePadraoEspessuraProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbProduto_Id`, `tbPadroesEspessuraProduto_Id`, `tbFinalidadePadraoEspessuraProduto_Id`),
  CONSTRAINT `FK_tbProduto0009`
    FOREIGN KEY (`tbProduto_Id`)
    REFERENCES `golive`.`tbProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbPadroesEspessuraProduto0001`
    FOREIGN KEY (`tbPadroesEspessuraProduto_Id`)
    REFERENCES `golive`.`tbPadroesEspessuraProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbFinalidadePadraoEspessuraProduto0002`
    FOREIGN KEY (`tbFinalidadePadraoEspessuraProduto_Id`)
    REFERENCES `golive`.`tbFinalidadePadraoEspessuraProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbProduto_tbTipoProduto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbProduto_tbTipoProduto` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbProduto_tbTipoProduto` (
  `tbProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbTipoProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbFinalidadeTipoProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbProduto_Id`, `tbTipoProduto_Id`, `tbFinalidadeTipoProduto_Id`),
  CONSTRAINT `FK_tbProduto0010`
    FOREIGN KEY (`tbProduto_Id`)
    REFERENCES `golive`.`tbProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbTipoProduto0001`
    FOREIGN KEY (`tbTipoProduto_Id`)
    REFERENCES `golive`.`tbTipoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_FinalidadeTipoProduto0001`
    FOREIGN KEY (`tbFinalidadeTipoProduto_Id`)
    REFERENCES `golive`.`tbFinalidadeTipoProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbProdutoUnidade`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbProdutoUnidade` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbProdutoUnidade` (
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

SHOW WARNINGS;
CREATE UNIQUE INDEX `Id_UNIQUE` ON `golive`.`tbProdutoUnidade` (`Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbProduto_tbProdutoUnidade`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbProduto_tbProdutoUnidade` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbProduto_tbProdutoUnidade` (
  `tbProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUnidade_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbProdutoUnidade_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbFinalidadeUnidadeProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbProduto_Id`, `tbUnidade_Id`, `tbProdutoUnidade_Id`, `tbFinalidadeUnidadeProduto_Id`),
  CONSTRAINT `FK_tbProduto0011`
    FOREIGN KEY (`tbProduto_Id`)
    REFERENCES `golive`.`tbProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbProdutoUnidade0001`
    FOREIGN KEY (`tbProdutoUnidade_Id`)
    REFERENCES `golive`.`tbProdutoUnidade` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbFinalidadeUnidadeProduto0001`
    FOREIGN KEY (`tbFinalidadeUnidadeProduto_Id`)
    REFERENCES `golive`.`tbFinalidadeUnidadeProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUnidade0004`
    FOREIGN KEY (`tbUnidade_Id`)
    REFERENCES `golive`.`tbUnidade` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `tbProduto_Id_UNIQUE` ON `golive`.`tbProduto_tbProdutoUnidade` (`tbProduto_Id` ASC);

SHOW WARNINGS;
CREATE UNIQUE INDEX `tbProdutoUnidade_Id_UNIQUE` ON `golive`.`tbProduto_tbProdutoUnidade` (`tbProdutoUnidade_Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbAuditoria_tbProdutoUnidade`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbAuditoria_tbProdutoUnidade` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbAuditoria_tbProdutoUnidade` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbProdutoUnidade_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbProdutoUnidade_Id`),
  CONSTRAINT `FK_tbAuditoria0004`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golive`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbProdutoUnidade0002`
    FOREIGN KEY (`tbProdutoUnidade_Id`)
    REFERENCES `golive`.`tbProdutoUnidade` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0012`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golive`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0011`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golive`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golive`.`tbAuditoria_tbProdutoUnidade` (`tbAuditoriaItem_Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbProdutoCodigoBarras`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbProdutoCodigoBarras` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbProdutoCodigoBarras` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `CodigoBarras` BIGINT(14) ZEROFILL NOT NULL,
  `FatorMultiplicacao` DECIMAL(18,3) NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `Id_UNIQUE` ON `golive`.`tbProdutoCodigoBarras` (`Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbProduto_tbProdutoCodigoBarras`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbProduto_tbProdutoCodigoBarras` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbProduto_tbProdutoCodigoBarras` (
  `tbProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbProdutoCodigoBarras_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbFinalidadeCodigoBarras_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbProduto_Id`, `tbProdutoCodigoBarras_Id`, `tbFinalidadeCodigoBarras_Id`),
  CONSTRAINT `FK_tbProduto0012`
    FOREIGN KEY (`tbProduto_Id`)
    REFERENCES `golive`.`tbProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbProdutoCodigoBarras0001`
    FOREIGN KEY (`tbProdutoCodigoBarras_Id`)
    REFERENCES `golive`.`tbProdutoCodigoBarras` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbFinalidadeCodigoBarrasProduto0002`
    FOREIGN KEY (`tbFinalidadeCodigoBarras_Id`)
    REFERENCES `golive`.`tbFinalidadeCodigoBarrasProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbProdutoCodigoBarras_tbUnidade`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbProdutoCodigoBarras_tbUnidade` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbProdutoCodigoBarras_tbUnidade` (
  `tbProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbProdutoCodigoBarras_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUnidade_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbFinalidadeUnidadeProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbProduto_Id`, `tbProdutoCodigoBarras_Id`, `tbUnidade_Id`, `tbFinalidadeUnidadeProduto_Id`),
  CONSTRAINT `FK_tbProduto0013`
    FOREIGN KEY (`tbProduto_Id`)
    REFERENCES `golive`.`tbProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbProdutoCodigoBarras0002`
    FOREIGN KEY (`tbProdutoCodigoBarras_Id`)
    REFERENCES `golive`.`tbProdutoCodigoBarras` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUnidade0005`
    FOREIGN KEY (`tbUnidade_Id`)
    REFERENCES `golive`.`tbUnidade` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbFinalidadeUnidadeProduto0002`
    FOREIGN KEY (`tbFinalidadeUnidadeProduto_Id`)
    REFERENCES `golive`.`tbFinalidadeUnidadeProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `tbProdutoCodigoBarras_Id_UNIQUE` ON `golive`.`tbProdutoCodigoBarras_tbUnidade` (`tbProdutoCodigoBarras_Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbAuditoria_tbProdutoCodigoBarras`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbAuditoria_tbProdutoCodigoBarras` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbAuditoria_tbProdutoCodigoBarras` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbProdutoCodigoBarras_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbProdutoCodigoBarras_Id`),
  CONSTRAINT `FK_tbAuditoria0005`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golive`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbProdutoCodigoBarras0003`
    FOREIGN KEY (`tbProdutoCodigoBarras_Id`)
    REFERENCES `golive`.`tbProdutoCodigoBarras` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0013`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golive`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0012`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golive`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golive`.`tbAuditoria_tbProdutoCodigoBarras` (`tbAuditoriaItem_Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbProduto_tbFornecedor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbProduto_tbFornecedor` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbProduto_tbFornecedor` (
  `tbProduto_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbFornecedor_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbProduto_Id`, `tbFornecedor_Id`),
  CONSTRAINT `FK_tbProduto0014`
    FOREIGN KEY (`tbProduto_Id`)
    REFERENCES `golive`.`tbProduto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbCategoriaNaturezaJuridica`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbCategoriaNaturezaJuridica` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbCategoriaNaturezaJuridica` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `CategoriaNaturezaJuridica` VARCHAR(120) NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `Id_UNIQUE` ON `golive`.`tbCategoriaNaturezaJuridica` (`Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbAuditoria_tbCategoriaNaturezaJuridica`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbAuditoria_tbCategoriaNaturezaJuridica` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbAuditoria_tbCategoriaNaturezaJuridica` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCategoriaNaturezaJuridica_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbCategoriaNaturezaJuridica_Id`),
  CONSTRAINT `FK_tbAuditoria0006`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golive`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCategoriaNaturezaJuridica0001`
    FOREIGN KEY (`tbCategoriaNaturezaJuridica_Id`)
    REFERENCES `golive`.`tbCategoriaNaturezaJuridica` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0014`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golive`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0037`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golive`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golive`.`tbAuditoria_tbCategoriaNaturezaJuridica` (`tbAuditoriaItem_Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbNaturezaJuridica`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbNaturezaJuridica` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbNaturezaJuridica` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `CodigoNaturezaJuridica` INT UNSIGNED ZEROFILL NOT NULL,
  `NaturezaJuridica` VARCHAR(120) NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `Id_UNIQUE` ON `golive`.`tbNaturezaJuridica` (`Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbNaturezaJuridica_tbCategoriaNaturezaJuridica`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbNaturezaJuridica_tbCategoriaNaturezaJuridica` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbNaturezaJuridica_tbCategoriaNaturezaJuridica` (
  `tbNaturezaJuridica_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCategoriaNaturezaJuridica_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbNaturezaJuridica_Id`, `tbCategoriaNaturezaJuridica_Id`),
  CONSTRAINT `FK_tbNaturezaJuridica`
    FOREIGN KEY (`tbNaturezaJuridica_Id`)
    REFERENCES `golive`.`tbNaturezaJuridica` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCategoriaNaturezaJuridica`
    FOREIGN KEY (`tbCategoriaNaturezaJuridica_Id`)
    REFERENCES `golive`.`tbCategoriaNaturezaJuridica` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `tbNaturezaJuridica_Id_UNIQUE` ON `golive`.`tbNaturezaJuridica_tbCategoriaNaturezaJuridica` (`tbNaturezaJuridica_Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbAuditoria_tbNaturezaJuridica`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbAuditoria_tbNaturezaJuridica` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbAuditoria_tbNaturezaJuridica` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbNaturezaJuridica_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbNaturezaJuridica_Id`),
  CONSTRAINT `FK_tbAuditoria0007`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golive`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbNaturezaJuridica0001`
    FOREIGN KEY (`tbNaturezaJuridica_Id`)
    REFERENCES `golive`.`tbNaturezaJuridica` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0015`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golive`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0038`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golive`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golive`.`tbAuditoria_tbNaturezaJuridica` (`tbAuditoriaItem_Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbRegimeApuracao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbRegimeApuracao` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbRegimeApuracao` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `RegimeApuracao` VARCHAR(120) NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `Id_UNIQUE` ON `golive`.`tbRegimeApuracao` (`Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbAuditoria_tbRegimeApuracao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbAuditoria_tbRegimeApuracao` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbAuditoria_tbRegimeApuracao` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbRegimeApuracao_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbRegimeApuracao_Id`),
  CONSTRAINT `FK_tbAuditoria0008`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golive`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbRegimeApuracao0001`
    FOREIGN KEY (`tbRegimeApuracao_Id`)
    REFERENCES `golive`.`tbRegimeApuracao` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0016`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golive`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0039`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golive`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golive`.`tbAuditoria_tbRegimeApuracao` (`tbAuditoriaItem_Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbCnaeSecao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbCnaeSecao` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbCnaeSecao` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `CodigoSecao` CHAR(1) NOT NULL,
  `DenominacaoSecao` VARCHAR(250) NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `Id_UNIQUE` ON `golive`.`tbCnaeSecao` (`Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbAuditoria_tbCnaeSecao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbAuditoria_tbCnaeSecao` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbAuditoria_tbCnaeSecao` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCnaeSecao_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbCnaeSecao_Id`),
  CONSTRAINT `FK_tbAuditoria0027`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golive`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCnaeSecao0001`
    FOREIGN KEY (`tbCnaeSecao_Id`)
    REFERENCES `golive`.`tbCnaeSecao` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0017`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golive`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0013`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golive`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golive`.`tbAuditoria_tbCnaeSecao` (`tbAuditoriaItem_Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbCnaeDivisao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbCnaeDivisao` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbCnaeDivisao` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `CodigoDivisao` INT(2) UNSIGNED ZEROFILL NOT NULL,
  `DenominacaoDivisao` VARCHAR(250) NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `Id_UNIQUE` ON `golive`.`tbCnaeDivisao` (`Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbCnaeDivisao_tbCnaeSecao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbCnaeDivisao_tbCnaeSecao` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbCnaeDivisao_tbCnaeSecao` (
  `tbCnaeDivisao_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCnaeSecao_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbCnaeDivisao_Id`, `tbCnaeSecao_Id`),
  CONSTRAINT `FK_tbCnaeDivisao0001`
    FOREIGN KEY (`tbCnaeDivisao_Id`)
    REFERENCES `golive`.`tbCnaeDivisao` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCnaeSecao0002`
    FOREIGN KEY (`tbCnaeSecao_Id`)
    REFERENCES `golive`.`tbCnaeSecao` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `tbCnaeDivisao_Id_UNIQUE` ON `golive`.`tbCnaeDivisao_tbCnaeSecao` (`tbCnaeDivisao_Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbAuditoria_tbCnaeDivisao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbAuditoria_tbCnaeDivisao` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbAuditoria_tbCnaeDivisao` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCnaeDivisao_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbCnaeDivisao_Id`),
  CONSTRAINT `FK_tbAuditoria00028`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golive`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCnaeDivisao0002`
    FOREIGN KEY (`tbCnaeDivisao_Id`)
    REFERENCES `golive`.`tbCnaeDivisao` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0018`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golive`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0014`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golive`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golive`.`tbAuditoria_tbCnaeDivisao` (`tbAuditoriaItem_Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbCnaeGrupo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbCnaeGrupo` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbCnaeGrupo` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `CodigoGrupo` INT(1) UNSIGNED ZEROFILL NOT NULL,
  `DenominacaoGrupo` VARCHAR(250) NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`, `CodigoGrupo`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `Id_UNIQUE` ON `golive`.`tbCnaeGrupo` (`Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbCnaeGrupo_Dependencies`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbCnaeGrupo_Dependencies` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbCnaeGrupo_Dependencies` (
  `tbCnaeGrupo_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCnaeSecao_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCnaeDivisao_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbCnaeGrupo_Id`, `tbCnaeSecao_Id`, `tbCnaeDivisao_Id`),
  CONSTRAINT `FK_tbCnaeGrupo0001`
    FOREIGN KEY (`tbCnaeGrupo_Id`)
    REFERENCES `golive`.`tbCnaeGrupo` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCnaeSecao0003`
    FOREIGN KEY (`tbCnaeSecao_Id`)
    REFERENCES `golive`.`tbCnaeSecao` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCnaeDivisao0003`
    FOREIGN KEY (`tbCnaeDivisao_Id`)
    REFERENCES `golive`.`tbCnaeDivisao` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `tbCnaeGrupo_Id_UNIQUE` ON `golive`.`tbCnaeGrupo_Dependencies` (`tbCnaeGrupo_Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbAuditoria_tbCnaeGrupo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbAuditoria_tbCnaeGrupo` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbAuditoria_tbCnaeGrupo` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCnaeGrupo_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbCnaeGrupo_Id`),
  CONSTRAINT `FK_tbAuditoria0029`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golive`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCnaeGrupo0003`
    FOREIGN KEY (`tbCnaeGrupo_Id`)
    REFERENCES `golive`.`tbCnaeGrupo` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0019`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golive`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0015`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golive`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golive`.`tbAuditoria_tbCnaeGrupo` (`tbAuditoriaItem_Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbCnaeClasse`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbCnaeClasse` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbCnaeClasse` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `CodigoClasse` INT(2) ZEROFILL UNSIGNED NOT NULL,
  `DenominacaoClasse` VARCHAR(250) NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `Id_UNIQUE` ON `golive`.`tbCnaeClasse` (`Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbCnaeClasse_Dependencies`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbCnaeClasse_Dependencies` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbCnaeClasse_Dependencies` (
  `tbCnaeClasse_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCnaeSecao_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCnaeDivisao_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCnaeGrupo_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbCnaeClasse_Id`, `tbCnaeSecao_Id`, `tbCnaeDivisao_Id`, `tbCnaeGrupo_Id`),
  CONSTRAINT `FK_tbCnaeClasse0001`
    FOREIGN KEY (`tbCnaeClasse_Id`)
    REFERENCES `golive`.`tbCnaeClasse` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCnaeSecao0004`
    FOREIGN KEY (`tbCnaeSecao_Id`)
    REFERENCES `golive`.`tbCnaeSecao` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCnaeDivisao0004`
    FOREIGN KEY (`tbCnaeDivisao_Id`)
    REFERENCES `golive`.`tbCnaeDivisao` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCnaeGrupo0002`
    FOREIGN KEY (`tbCnaeGrupo_Id`)
    REFERENCES `golive`.`tbCnaeGrupo` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `tbCnaeClasse_Id_UNIQUE` ON `golive`.`tbCnaeClasse_Dependencies` (`tbCnaeClasse_Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbAuditoria_tbCnaeClasse`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbAuditoria_tbCnaeClasse` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbAuditoria_tbCnaeClasse` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCnaeClasse_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbCnaeClasse_Id`),
  CONSTRAINT `FK_tbAuditoria0030`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golive`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCnaeClasse0002`
    FOREIGN KEY (`tbCnaeClasse_Id`)
    REFERENCES `golive`.`tbCnaeClasse` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0020`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golive`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0016`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golive`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golive`.`tbAuditoria_tbCnaeClasse` (`tbAuditoriaItem_Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbCnaeSubClasse`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbCnaeSubClasse` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbCnaeSubClasse` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `CodigoSubClasse` INT(2) UNSIGNED ZEROFILL NOT NULL,
  `DenominacaoSubClasse` VARCHAR(250) NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `Id_UNIQUE` ON `golive`.`tbCnaeSubClasse` (`Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbCnaeSubClasse_Dependencies`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbCnaeSubClasse_Dependencies` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbCnaeSubClasse_Dependencies` (
  `tbCnaeSubClasse_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCnaeSecao_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCnaeDivisao_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCnaeGrupo_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCnaeClasse_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbCnaeSubClasse_Id`, `tbCnaeSecao_Id`, `tbCnaeDivisao_Id`, `tbCnaeGrupo_Id`, `tbCnaeClasse_Id`),
  CONSTRAINT `FK_tbCnaeSubClasse0001`
    FOREIGN KEY (`tbCnaeSubClasse_Id`)
    REFERENCES `golive`.`tbCnaeSubClasse` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCnaeSecao0005`
    FOREIGN KEY (`tbCnaeSecao_Id`)
    REFERENCES `golive`.`tbCnaeSecao` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCnaeDivisao0005`
    FOREIGN KEY (`tbCnaeDivisao_Id`)
    REFERENCES `golive`.`tbCnaeDivisao` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tb_CnaeGrupo0003`
    FOREIGN KEY (`tbCnaeGrupo_Id`)
    REFERENCES `golive`.`tbCnaeGrupo` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tb_CnaeClasse0003`
    FOREIGN KEY (`tbCnaeClasse_Id`)
    REFERENCES `golive`.`tbCnaeClasse` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `tbCnaeSubClasse_Id_UNIQUE` ON `golive`.`tbCnaeSubClasse_Dependencies` (`tbCnaeSubClasse_Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbAuditoria_tbCnaeSubClasse`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbAuditoria_tbCnaeSubClasse` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbAuditoria_tbCnaeSubClasse` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCnaeSubClasse_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbCnaeSubClasse_Id`),
  CONSTRAINT `FK_tbAuditoria0031`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golive`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCnaeSubClasse0002`
    FOREIGN KEY (`tbCnaeSubClasse_Id`)
    REFERENCES `golive`.`tbCnaeSubClasse` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0021`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golive`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0017`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golive`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golive`.`tbAuditoria_tbCnaeSubClasse` (`tbAuditoriaItem_Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbCnaeImpeditivoSimplesNacional`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbCnaeImpeditivoSimplesNacional` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbCnaeImpeditivoSimplesNacional` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `Id_UNIQUE` ON `golive`.`tbCnaeImpeditivoSimplesNacional` (`Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbCnaeImpeditivoSimplesNacional_tbCnaeSubClasse`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbCnaeImpeditivoSimplesNacional_tbCnaeSubClasse` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbCnaeImpeditivoSimplesNacional_tbCnaeSubClasse` (
  `tbCnaeImpeditivoSimplesNacional_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCnaeSubClasse_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbCnaeImpeditivoSimplesNacional_Id`, `tbCnaeSubClasse_Id`),
  CONSTRAINT `FK_tbCnaeImpeditivoSimplesNacional0001`
    FOREIGN KEY (`tbCnaeImpeditivoSimplesNacional_Id`)
    REFERENCES `golive`.`tbCnaeImpeditivoSimplesNacional` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCnaeSubClasse0003`
    FOREIGN KEY (`tbCnaeSubClasse_Id`)
    REFERENCES `golive`.`tbCnaeSubClasse` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `tbCnaeImpeditivoSimplesNacional_Id_UNIQUE` ON `golive`.`tbCnaeImpeditivoSimplesNacional_tbCnaeSubClasse` (`tbCnaeImpeditivoSimplesNacional_Id` ASC);

SHOW WARNINGS;
CREATE UNIQUE INDEX `tbCnaeSubClasse_Id_UNIQUE` ON `golive`.`tbCnaeImpeditivoSimplesNacional_tbCnaeSubClasse` (`tbCnaeSubClasse_Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbAuditoria_tbCnaeImpeditivoSimplesNacional`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbAuditoria_tbCnaeImpeditivoSimplesNacional` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbAuditoria_tbCnaeImpeditivoSimplesNacional` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCnaeImpeditivoSimplesNacional_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbCnaeImpeditivoSimplesNacional_Id`),
  CONSTRAINT `FK_tbAuditoria0032`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golive`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCnaeImpeditivoSimplesNacional0002`
    FOREIGN KEY (`tbCnaeImpeditivoSimplesNacional_Id`)
    REFERENCES `golive`.`tbCnaeImpeditivoSimplesNacional` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0022`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golive`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0018`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golive`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golive`.`tbAuditoria_tbCnaeImpeditivoSimplesNacional` (`tbAuditoriaItem_Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbCodigoInternet`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbCodigoInternet` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbCodigoInternet` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `CodigoTld` CHAR(2) NOT NULL,
  `PaisEmPortugues` VARCHAR(120) NOT NULL,
  `PaisEmIngles` VARCHAR(120) NOT NULL,
  `PaisEmNativo` VARCHAR(120) NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `Id_UNIQUE` ON `golive`.`tbCodigoInternet` (`Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbAuditoria_tbCodigoInternet`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbAuditoria_tbCodigoInternet` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbAuditoria_tbCodigoInternet` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCodigoInternet_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbCodigoInternet_Id`),
  CONSTRAINT `FK_tbAuditoria0033`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golive`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCodigoInternet0001`
    FOREIGN KEY (`tbCodigoInternet_Id`)
    REFERENCES `golive`.`tbCodigoInternet` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0004`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golive`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0003`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golive`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golive`.`tbAuditoria_tbCodigoInternet` (`tbAuditoriaItem_Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbLinguas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbLinguas` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbLinguas` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `CodigoISO639-1` CHAR(2) NOT NULL,
  `LinguaEmPortugues` VARCHAR(120) NOT NULL,
  `LinguaEmIngles` VARCHAR(120) NOT NULL,
  `LinguaEmNativo` VARCHAR(120) NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `Id_UNIQUE` ON `golive`.`tbLinguas` (`Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbAuditoria_tbLinguas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbAuditoria_tbLinguas` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbAuditoria_tbLinguas` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbLinguas_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbLinguas_Id`),
  CONSTRAINT `FK_tbAuditoria0034`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golive`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbLinguas0001`
    FOREIGN KEY (`tbLinguas_Id`)
    REFERENCES `golive`.`tbLinguas` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0005`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golive`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0004`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golive`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golive`.`tbAuditoria_tbLinguas` (`tbAuditoriaItem_Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbMoeda`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbMoeda` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbMoeda` (
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

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbMoeda_tbPais`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbMoeda_tbPais` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbMoeda_tbPais` (
  `tbMoeda_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbPais_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbMoeda_Id`, `tbPais_Id`),
  CONSTRAINT `FK_tbMoeda0001`
    FOREIGN KEY (`tbMoeda_Id`)
    REFERENCES `golive`.`tbMoeda` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbAuditoria_tbMoeda`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbAuditoria_tbMoeda` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbAuditoria_tbMoeda` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbMoeda_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbMoeda_Id`),
  CONSTRAINT `FK_tbAuditoria0035`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golive`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbMoeda0002`
    FOREIGN KEY (`tbMoeda_Id`)
    REFERENCES `golive`.`tbMoeda` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0006`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golive`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0005`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golive`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golive`.`tbAuditoria_tbMoeda` (`tbAuditoriaItem_Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbCodigoPaisesFips`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbCodigoPaisesFips` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbCodigoPaisesFips` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `CodigoFips` CHAR(2) NOT NULL,
  `PaisEmPortugues` VARCHAR(120) NOT NULL,
  `PaisEmIngles` VARCHAR(120) NOT NULL,
  `PaisEmNativo` VARCHAR(120) NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `Id_UNIQUE` ON `golive`.`tbCodigoPaisesFips` (`Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbAuditoria_tbCodigoPaisesFips`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbAuditoria_tbCodigoPaisesFips` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbAuditoria_tbCodigoPaisesFips` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCodigoPaisesFips_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbCodigoPaisesFips_Id`),
  CONSTRAINT `FK_tbAuditoria0036`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golive`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCodigoPaisesFips0001`
    FOREIGN KEY (`tbCodigoPaisesFips_Id`)
    REFERENCES `golive`.`tbCodigoPaisesFips` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0007`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golive`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0006`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golive`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golive`.`tbAuditoria_tbCodigoPaisesFips` (`tbAuditoriaItem_Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbCodigoPaisesIso3161_1_Alfa_3`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbCodigoPaisesIso3161_1_Alfa_3` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbCodigoPaisesIso3161_1_Alfa_3` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `CodigoISO3161_1_Alfa_3` CHAR(3) NOT NULL,
  `PaisEmPortugues` VARCHAR(120) NOT NULL,
  `PaisEmIngles` VARCHAR(120) NOT NULL,
  `PaisEmNativo` VARCHAR(120) NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `Id_UNIQUE` ON `golive`.`tbCodigoPaisesIso3161_1_Alfa_3` (`Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbAuditoria_tbCodigoPaisesIso3161_1_Alfa_3`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbAuditoria_tbCodigoPaisesIso3161_1_Alfa_3` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbAuditoria_tbCodigoPaisesIso3161_1_Alfa_3` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCodigoPaisesIso3161_1_Alfa_3_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbCodigoPaisesIso3161_1_Alfa_3_Id`),
  CONSTRAINT `FK_tbAuditoria0037`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golive`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCodigoPaisesIso3161_1_Alfa_3_0001`
    FOREIGN KEY (`tbCodigoPaisesIso3161_1_Alfa_3_Id`)
    REFERENCES `golive`.`tbCodigoPaisesIso3161_1_Alfa_3` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0008`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golive`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0007`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golive`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golive`.`tbAuditoria_tbCodigoPaisesIso3161_1_Alfa_3` (`tbAuditoriaItem_Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbAuditoriaItem_tbAuditoria`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbAuditoriaItem_tbAuditoria` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbAuditoriaItem_tbAuditoria` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`),
  CONSTRAINT `FK_tbAuditoria0038`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golive`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0001`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golive`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0003`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golive`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golive`.`tbAuditoriaItem_tbAuditoria` (`tbAuditoriaItem_Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbAuditoria_tbUsuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbAuditoria_tbUsuario` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbAuditoria_tbUsuario` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`),
  CONSTRAINT `FK_tbAuditoria0039`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golive`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0002`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golive`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0001`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golive`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0002`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golive`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golive`.`tbAuditoria_tbUsuario` (`tbAuditoriaItem_Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbUsuario_tbFuncionario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbUsuario_tbFuncionario` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbUsuario_tbFuncionario` (
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbFuncionario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbUsuario_Id`, `tbFuncionario_Id`),
  CONSTRAINT `FK_tbUsuario0041`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golive`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `tbUsuario_Id_UNIQUE` ON `golive`.`tbUsuario_tbFuncionario` (`tbUsuario_Id` ASC);

SHOW WARNINGS;
CREATE UNIQUE INDEX `tbFuncionario_Id_UNIQUE` ON `golive`.`tbUsuario_tbFuncionario` (`tbFuncionario_Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbUsuario_tbCliente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbUsuario_tbCliente` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbUsuario_tbCliente` (
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCliente_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbClienteContato_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbUsuario_Id`, `tbCliente_Id`, `tbClienteContato_Id`),
  CONSTRAINT `FK_tbUsuario0042`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golive`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `tbUsuario_Id_UNIQUE` ON `golive`.`tbUsuario_tbCliente` (`tbUsuario_Id` ASC);

SHOW WARNINGS;
CREATE UNIQUE INDEX `tbClienteContato_Id_UNIQUE` ON `golive`.`tbUsuario_tbCliente` (`tbClienteContato_Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbUsuario_tbFornecedor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbUsuario_tbFornecedor` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbUsuario_tbFornecedor` (
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbFornecedor_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbFornecedorContato_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbUsuario_Id`, `tbFornecedor_Id`, `tbFornecedorContato_Id`),
  CONSTRAINT `FK_tbUsuario0043`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golive`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `tbUsuario_Id_UNIQUE` ON `golive`.`tbUsuario_tbFornecedor` (`tbUsuario_Id` ASC);

SHOW WARNINGS;
CREATE UNIQUE INDEX `tbFornecedorContato_Id_UNIQUE` ON `golive`.`tbUsuario_tbFornecedor` (`tbFornecedorContato_Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbCodigoPaisesBacen`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbCodigoPaisesBacen` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbCodigoPaisesBacen` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `CodigoBacen` INT(5) UNSIGNED ZEROFILL NOT NULL,
  `PaisEmPortugues` VARCHAR(120) NOT NULL,
  `PaisEmIngles` VARCHAR(120) NOT NULL,
  `PaisEmNativo` VARCHAR(120) NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `Id_UNIQUE` ON `golive`.`tbCodigoPaisesBacen` (`Id` ASC);

SHOW WARNINGS;
CREATE UNIQUE INDEX `CodigoBacen_UNIQUE` ON `golive`.`tbCodigoPaisesBacen` (`CodigoBacen` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbAuditoria_tbCodigoPaisesBacen`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbAuditoria_tbCodigoPaisesBacen` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbAuditoria_tbCodigoPaisesBacen` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCodigoPaisesBacen_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbCodigoPaisesBacen_Id`),
  CONSTRAINT `FK_tbAuditoria0040`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golive`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0044`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golive`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCodigoPaisesBacen0001`
    FOREIGN KEY (`tbCodigoPaisesBacen_Id`)
    REFERENCES `golive`.`tbCodigoPaisesBacen` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0040`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golive`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golive`.`tbAuditoria_tbCodigoPaisesBacen` (`tbAuditoriaItem_Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbCodigoTelefonicoPaises`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbCodigoTelefonicoPaises` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbCodigoTelefonicoPaises` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `CodigoTelefonicoPais` INT(3) UNSIGNED NOT NULL,
  `PaisEmPortugues` VARCHAR(120) NOT NULL,
  `PaisEmIngles` VARCHAR(120) NOT NULL,
  `PaisEmNativo` VARCHAR(120) NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `Id_UNIQUE` ON `golive`.`tbCodigoTelefonicoPaises` (`Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbAuditoria_tbCodigoTelefonicoPaises`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbAuditoria_tbCodigoTelefonicoPaises` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbAuditoria_tbCodigoTelefonicoPaises` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCodigoTelefonicoPaises_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbCodigoTelefonicoPaises_Id`),
  CONSTRAINT `FK_tbAuditoria0041`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golive`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0041`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golive`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0045`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golive`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCodigoTelefonicoPaises0001`
    FOREIGN KEY (`tbCodigoTelefonicoPaises_Id`)
    REFERENCES `golive`.`tbCodigoTelefonicoPaises` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golive`.`tbAuditoria_tbCodigoTelefonicoPaises` (`tbAuditoriaItem_Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbCodigoTelefonicoMunicipios`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbCodigoTelefonicoMunicipios` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbCodigoTelefonicoMunicipios` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `CodigoTelefonicoMunicipio` INT(3) UNSIGNED NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `Id_UNIQUE` ON `golive`.`tbCodigoTelefonicoMunicipios` (`Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbRegiao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbRegiao` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbRegiao` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `Regiao` VARCHAR(120) NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `Id_UNIQUE` ON `golive`.`tbRegiao` (`Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbEstado`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbEstado` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbEstado` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `CodigoIbge` INT(2) UNSIGNED NOT NULL,
  `Abreviacao` CHAR(2) NOT NULL,
  `Estado` VARCHAR(120) NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `Id_UNIQUE` ON `golive`.`tbEstado` (`Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbCodigoTelefonicoMunicipios_tbMunicipio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbCodigoTelefonicoMunicipios_tbMunicipio` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbCodigoTelefonicoMunicipios_tbMunicipio` (
  `tbCodigoTelefonicoMunicipios_Id` INT ZEROFILL UNSIGNED NOT NULL,
  `tbMunicipio_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbEstado_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbRegiao_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbPais_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbCodigoTelefonicoMunicipios_Id`, `tbMunicipio_Id`, `tbEstado_Id`, `tbRegiao_Id`, `tbPais_Id`),
  CONSTRAINT `FK_tbCodigoTelefonicoMunicipios0001`
    FOREIGN KEY (`tbCodigoTelefonicoMunicipios_Id`)
    REFERENCES `golive`.`tbCodigoTelefonicoMunicipios` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbRegiao0002`
    FOREIGN KEY (`tbRegiao_Id`)
    REFERENCES `golive`.`tbRegiao` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbEstado0003`
    FOREIGN KEY (`tbEstado_Id`)
    REFERENCES `golive`.`tbEstado` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `tbCodigoTelefonicoMunicipios_Id_UNIQUE` ON `golive`.`tbCodigoTelefonicoMunicipios_tbMunicipio` (`tbCodigoTelefonicoMunicipios_Id` ASC);

SHOW WARNINGS;
CREATE UNIQUE INDEX `tbMunicipio_Id_UNIQUE` ON `golive`.`tbCodigoTelefonicoMunicipios_tbMunicipio` (`tbMunicipio_Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbAuditoria_tbCodigoTelefonicoMunicipios`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbAuditoria_tbCodigoTelefonicoMunicipios` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbAuditoria_tbCodigoTelefonicoMunicipios` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCodigoTelefonicoMunicipios_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbCodigoTelefonicoMunicipios_Id`),
  CONSTRAINT `FK_tbAuditoria0042`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golive`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0042`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golive`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0046`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golive`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbCodigoTelefonicoMunicipios0002`
    FOREIGN KEY (`tbCodigoTelefonicoMunicipios_Id`)
    REFERENCES `golive`.`tbCodigoTelefonicoMunicipios` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golive`.`tbAuditoria_tbCodigoTelefonicoMunicipios` (`tbAuditoriaItem_Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbAuditoria_tbRegiao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbAuditoria_tbRegiao` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbAuditoria_tbRegiao` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbRegiao_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbRegiao_Id`),
  CONSTRAINT `FK_tbAuditoria0043`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golive`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0043`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golive`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0047`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golive`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbRegiao0001`
    FOREIGN KEY (`tbRegiao_Id`)
    REFERENCES `golive`.`tbRegiao` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golive`.`tbAuditoria_tbRegiao` (`tbAuditoriaItem_Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbAuditoria_tbEstado`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbAuditoria_tbEstado` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbAuditoria_tbEstado` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbEstado_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbEstado_Id`),
  CONSTRAINT `FK_tbAuditoria0044`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golive`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0044`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golive`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0048`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golive`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbEstado0001`
    FOREIGN KEY (`tbEstado_Id`)
    REFERENCES `golive`.`tbEstado` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golive`.`tbAuditoria_tbEstado` (`tbAuditoriaItem_Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbEstado_tbPais`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbEstado_tbPais` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbEstado_tbPais` (
  `tbEstado_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbPais_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbRegiao_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbEstado_Id`, `tbPais_Id`, `tbRegiao_Id`),
  CONSTRAINT `FK_tbEstado0002`
    FOREIGN KEY (`tbEstado_Id`)
    REFERENCES `golive`.`tbEstado` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbRegiao0003`
    FOREIGN KEY (`tbRegiao_Id`)
    REFERENCES `golive`.`tbRegiao` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `tbEstado_Id_UNIQUE` ON `golive`.`tbEstado_tbPais` (`tbEstado_Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbMunicipio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbMunicipio` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbMunicipio` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `CodigoIbge` INT(7) UNSIGNED NOT NULL,
  `Municipio` VARCHAR(120) NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `Id_UNIQUE` ON `golive`.`tbMunicipio` (`Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbAuditoria_tbMunicipio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbAuditoria_tbMunicipio` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbAuditoria_tbMunicipio` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbMunicipio_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbMunicipio_Id`),
  CONSTRAINT `FK_tbAuditoria0045`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golive`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0045`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golive`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0049`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golive`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_FK_tbMunicipio0001`
    FOREIGN KEY (`tbMunicipio_Id`)
    REFERENCES `golive`.`tbMunicipio` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golive`.`tbAuditoria_tbMunicipio` (`tbAuditoriaItem_Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbMunicipio_tbPais`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbMunicipio_tbPais` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbMunicipio_tbPais` (
  `tbMunicipio_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbPais_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbEstado_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbRegiao_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbMunicipio_Id`, `tbPais_Id`, `tbEstado_Id`, `tbRegiao_Id`),
  CONSTRAINT `FK_tbMunicipio0002`
    FOREIGN KEY (`tbMunicipio_Id`)
    REFERENCES `golive`.`tbMunicipio` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbEstado0004`
    FOREIGN KEY (`tbEstado_Id`)
    REFERENCES `golive`.`tbEstado` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbRegiao0004`
    FOREIGN KEY (`tbRegiao_Id`)
    REFERENCES `golive`.`tbRegiao` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `tbMunicipio_Id_UNIQUE` ON `golive`.`tbMunicipio_tbPais` (`tbMunicipio_Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbTipoLogradouro`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbTipoLogradouro` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbTipoLogradouro` (
  `Id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `Abreviacao` VARCHAR(4) NOT NULL,
  `TipoLogradouro` VARCHAR(120) NOT NULL,
  `SystemIncludeDateTime` DATETIME NOT NULL,
  `SystemChangeDateTime` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `Id_UNIQUE` ON `golive`.`tbTipoLogradouro` (`Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbAuditoria_tbTipoLogradouro`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbAuditoria_tbTipoLogradouro` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbAuditoria_tbTipoLogradouro` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbTipoLogradouro_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbTipoLogradouro_Id`),
  CONSTRAINT `FK_tbAuditoria0046`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golive`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0046`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golive`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0050`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golive`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbTipoLogradouro0001`
    FOREIGN KEY (`tbTipoLogradouro_Id`)
    REFERENCES `golive`.`tbTipoLogradouro` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golive`.`tbAuditoria_tbTipoLogradouro` (`tbAuditoriaItem_Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbPais`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbPais` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbPais` (
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

SHOW WARNINGS;
CREATE UNIQUE INDEX `Id_UNIQUE` ON `golive`.`tbPais` (`Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbAuditoria_tbPais`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbAuditoria_tbPais` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbAuditoria_tbPais` (
  `tbAuditoria_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbAuditoriaItem_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbUsuario_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbPais_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbAuditoria_Id`, `tbAuditoriaItem_Id`, `tbUsuario_Id`, `tbPais_Id`),
  CONSTRAINT `FK_tbAuditoria0047`
    FOREIGN KEY (`tbAuditoria_Id`)
    REFERENCES `golive`.`tbAuditoria` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbAuditoriaItem0047`
    FOREIGN KEY (`tbAuditoriaItem_Id`)
    REFERENCES `golive`.`tbAuditoriaItem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbUsuario0051`
    FOREIGN KEY (`tbUsuario_Id`)
    REFERENCES `golive`.`tbUsuario` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbPais0001`
    FOREIGN KEY (`tbPais_Id`)
    REFERENCES `golive`.`tbPais` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `tbAuditoriaItem_Id_UNIQUE` ON `golive`.`tbAuditoria_tbPais` (`tbAuditoriaItem_Id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `golive`.`tbPais_Dependecies`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `golive`.`tbPais_Dependecies` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `golive`.`tbPais_Dependecies` (
  `tbPais_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCodigoPaisesBacen_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCodigoPaisesIso3161_1_Alfa_3_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbCodigoPaisesFips_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbMoeda_Id` INT UNSIGNED ZEROFILL NOT NULL,
  `tbLinguas_Id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`tbPais_Id`, `tbCodigoPaisesBacen_Id`, `tbCodigoPaisesIso3161_1_Alfa_3_Id`, `tbCodigoPaisesFips_Id`, `tbMoeda_Id`, `tbLinguas_Id`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `tbPais_Id_UNIQUE` ON `golive`.`tbPais_Dependecies` (`tbPais_Id` ASC);

SHOW WARNINGS;
CREATE UNIQUE INDEX `tbCodigoPaisesBacen_Id_UNIQUE` ON `golive`.`tbPais_Dependecies` (`tbCodigoPaisesBacen_Id` ASC);

SHOW WARNINGS;
CREATE UNIQUE INDEX `tbCodigoPaisesIso3161_1_Alfa_3_Id_UNIQUE` ON `golive`.`tbPais_Dependecies` (`tbCodigoPaisesIso3161_1_Alfa_3_Id` ASC);

SHOW WARNINGS;
CREATE UNIQUE INDEX `tbCodigoPaisesFips_Id_UNIQUE` ON `golive`.`tbPais_Dependecies` (`tbCodigoPaisesFips_Id` ASC);

SHOW WARNINGS;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

