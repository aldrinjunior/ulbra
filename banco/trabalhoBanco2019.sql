-- 1)	Desenvolva 3 triggers que controlem a geração automática do código do produto, código de matéria prima e código de composição de produto, tendo como base as sequences criadas no script. Desta forma, toda vez que for inserido um registro nestas tabelas o sistema seleciona um código para ser colocado na chave primária das tabelas.

create or replace trigger TBMATERIAPRIMA_BI
before insert on TBMATERIAPRIMA
for each row
declare
xcod TBMATERIAPRIMA.PKCODMAT%type;
begin
select PKMATEIRA.NEXTVAL into xcod from dual;
:new.PKCODMAT :=xcod;
end;

create or replace trigger TBPRODUTO_BI
before insert on TBPRODUTO
for each row
declare
xcod TBPRODUTO.PKCODPROD%type;
begin
select PKPRODUTO.NEXTVAL into xcod from dual;
:new.PKCODPROD:=xcod;
end;

create or replace trigger TBCOMPRODUTO_BI
before insert on TBCOMPRODUTO
for each row
declare
xcod TBCOMPRODUTO.PKCOMPROD%type;
begin
select PKCOMPOSICAO.NEXTVAL into xcod from dual;
:new.PKCOMPROD:=xcod;
end;

-- 2) Crie uma trigger que após inserir,alterar ou remover um item da composição de produto o campo  seja atulizado os seguintes campos da tabela tbproduto
-- •	“quantitensprod”, deverá ser incrementado ou decrementado em +1 ou -1 item.
-- •	“custoprod”, deverá ser recalculado. O mesmo representa o somatório das quantidades (quant) multiplicado pelo valor unitário(valorunit) de cada matéria  que  compõe o produto
-- •	“valorvendaprod”, deverá ser recalculado com base no novo valor de custo “custoprod” acrescido da margem de lucro (margemprod).
       				 
create or replace trigger TRIGGERUPDATEPROD_BI
AFTER update or insert or delete on tbcomproduto
FOR EACH ROW
declare custoTotal tbproduto.custoprod%TYPE;
BEGIN
    IF deleting = true then
        update tbproduto set 
            quantitensprod = (quantitensprod - 1)
        where pkcodprod = :OLD.fkcodprod;
        
        select SUM(tcp.quant * tmp.valorunit) INTO custoTotal from tbcomproduto tcp
        inner join tbmateriaprima tmp on tcp.fkcodmat = tmp.pkcodmat
        inner join tbproduto tp on tp.pkcodprod = tcp.fkcodprod
        where tp.pkcodprod = :OLD.FKCODPROD;
        
        update tbproduto
        set
            custoprod = custoTotal
        where pkcodprod = :OLD.fkcodprod;
        
        update tbproduto 
        set
            valorvendaprod = Margemprod + custoTotal
        where pkcodprod = :OLD.fkcodprod;
        
    elsif inserting = true then
        update tbproduto set 
            quantitensprod = (quantitensprod + 1)
        where pkcodprod = :NEW.fkcodprod;
        
        select NVL(SUM(tcp.quant * tmp.valorunit),0) INTO custoTotal from tbcomproduto tcp
        inner join tbmateriaprima tmp on tcp.fkcodmat = tmp.pkcodmat
        inner join tbproduto tp on tp.pkcodprod = tcp.fkcodprod
        where tp.pkcodprod = :NEW.FKCODPROD;
        
        update tbproduto
        set
            custoprod = custoTotal
        where pkcodprod = :NEW.fkcodprod;
        
        update tbproduto 
        set
            valorvendaprod = Margemprod + custoTotal
        where pkcodprod = :NEW.fkcodprod;
    
    ELSIF updating = true THEN 
        IF (:OLD.fKCODPROD != :NEW.fKCODPROD) THEN
            update tbproduto set 
                quantitensprod = (quantitensprod - 1)
            where pkcodprod = :OLD.fkcodprod;
            
            update tbproduto set 
                quantitensprod = (quantitensprod + 1)
            where pkcodprod = :NEW.fkcodprod;
            
            select NVL(SUM(tcp.quant * tmp.valorunit),0) INTO custoTotal from tbcomproduto tcp
            inner join tbmateriaprima tmp on tcp.fkcodmat = tmp.pkcodmat
            inner join tbproduto tp on tp.pkcodprod = tcp.fkcodprod
            where tp.pkcodprod = :OLD.FKCODPROD;
            
            update tbproduto
            set
                custoprod = custoTotal
            where pkcodprod = :OLD.fkcodprod;
            
            update tbproduto 
            set
                valorvendaprod = Margemprod + custoTotal
            where pkcodprod = :OLD.fkcodprod;
        END IF;
            select NVL(SUM(tcp.quant * tmp.valorunit),0) INTO custoTotal from tbcomproduto tcp
            inner join tbmateriaprima tmp on tcp.fkcodmat = tmp.pkcodmat
            inner join tbproduto tp on tp.pkcodprod = tcp.fkcodprod
            where tp.pkcodprod = :NEW.FKCODPROD;
            
            update tbproduto
            set
                custoprod = custoTotal
            where pkcodprod = :NEW.fkcodprod;
            
            update tbproduto 
            set
                valorvendaprod = Margemprod + custoTotal
            where pkcodprod = :NEW.fkcodprod;
        
    END IF;
END TRIGGERUPDATEPROD_BI;

-- 3) Crie uma trigger que antes alterar ou remover um item da tabela de matéria prima realize as seguintes rotinas:
--    - Se for alterado o valor unitário da matéria prima, deverá ser alterado os seguintes campos em produto
-- •	 “custoprod”, deverá ser recalculado. O mesmo representa o somatório das quantidades (quant) multiplicado pelo valor unitário(valorunit) de cada matéria  que  compõe o produto
-- •	“valorvendaprod”, deverá ser recalculado com base no novo valor de custo “custoprod” acrescido da margem de lucro (margemprod).
-- - Se for Removido um item de matéria prima:
-- Deverá remover os registros da tabela de composição de produto que possuem a matéria prima removida

create or replace trigger TGUPDATEMATPRIMA
AFTER update of valorUnit or delete on tbmateriaprima
FOR EACH ROW
declare custoTotal tbproduto.custoprod%TYPE;
declare codprod tbproduto.pkcodprod%TYPE;
BEGIN
    IF deleting = true then
        DELETE FROM tbcomproduto where :OLD.pkcodmat = fkcodmat
        
        CURSOR C1 IS SELECT tcp.fkcodprod FROM tbcomproduto tcp
        inner join tbmateriaprime tmp on :OLD.pkcodmat = tcp.fkcodmat
        where tcp.fkcodmat = :OLD.pkcodmat
        
        begin
            OPEN C1;
            loop
                FETCH C2 INTO pkcodprod
                update tbproduto set
                    quantitensprod = (quantitensprod - 1)
                where pkcodprod = codprod;
                
                IF (not C1 %FOUND) then
                    EXIT;
                END IF;
            END LOOP;
            CLOSE C1;
        END;
         
    END IF;
END TGUPDATEMATPRIMA;


-- 4) Faça um procedimento que possua somente 2 parâmetros,o primeiro o código do produto e o segundo a quantidade a ser produzida do produto. . O procedimento deverá :
-- •	Listar em tela o nome do produto, e em seguida uma listagem contendo a relação de matéria prima que compõem o respectivo produto;
-- •	Aumentar o estoque o produto na quantidade especificada;
-- •	Diminuir a quantidade de estoque das matérias primas que compões o produto de forma proporcional a quantidade informada para ser produzida

create or replace
procedure TG_UPDATELISTA
(cod_prod in tbproduto.pkcodprod%type,
quant_prod in tbproduto.quantitensprod%type)
is

nome_prod varchar (40);

cursor C1 is
select c.fkcodmat, c.quant, m.nomemat, m.valorunit 
from tbcomproduto c 
inner join tbmateriaprima m on m.pkcodmat=c.fkcodmat 
where pkcodmat = fkcodmat and fkcodprod = cod_prod;

begin
select p.nomeprod into nome_prod from tbproduto p inner join tbcomproduto c on c.fkcodprod=p.pkcodprod;
dbms_output.put_line(quant_prod || ' ' );
update tbproduto
set estoqueprod  = estoqueprod  + quant_prod
WHERE pkcodprod = cod_prod;

for x in C1 loop
      dbms_output.put_line('- ' || x.nomemat || ' ' || x.quant );
      update tbmateriaprima set estoquemat = estoquemat-(x.quant*quant_prod) where pkcodmat = x.fkcodmat;
    end loop;
end TG_UPDATELISTA;

-- 5) Faça um procedimento que informado o código de uma matéria prima, liste seu nome e quantidade de produtos que esta possui associada a ela. Em seguida, liste o nome dos produtos que possuem a matéria prima selecionada, e para cada produto listado, mostre todas as matérias primas que compões o produto. No exemplo que segue, o procedimento recebe como parâmetro o código 2 como sendo a matéria prima em pesquisa. Como resposta teremos: (esta atividade deverá obrigatoriamente ser resolvida com cursores, e pelo menos um deles deve ser dinâmico)

-- Matéria prima pesquisada: MAT 2
-- A matéria prima possui 2 produtos associados
-- Produtos que possuem a matéria prima são:
-- Produto: produto 1
--         MAT 2
--         MAT 3
-- Produto: produto 3
--         MAT 1
--         MAT 2

CREATE OR REPLACE PROCEDURE TBLISTAMATERIAS

(descMatPrim IN tbmateriaprima.nomemat%TYPE)
AS
 contaProd number;
 codProd tbproduto.pkcodprod%TYPE;
BEGIN

SELECT NVL(COUNT(tcp.fkcodprod), 0) into contaProd FROM tbcomproduto tcp
inner join tbmateriaprima tmp on tmp.pkcodmat = tcp.fkcodmat
where UPPER(tmp.nomemat) = UPPER(descMatPrim);

SELECT tcp.fkcodprod into codProd FROM tbcomproduto tcp
inner join tbmateriaprima tmp on tmp.pkcodmat = tcp.fkcodmat
where UPPER(tmp.nomemat) = UPPER(descMatPrim);

dbms_output.put_line('Matéria prima pesquisada: ' || descMatPrim);
dbms_output.put_line('A matéria prima possui: ' || contaProd || ' produtos associados');

CURSOR prodCur IS SELECT tcp.fkcodprod FROM tbcomproduto tcp
inner join tbmateriaprime tmp on :OLD.pkcodmat = tcp.fkcodmat
where tcp.fkcodmat = :OLD.pkcodmat

begin
OPEN prodCur;
    loop
        FETCH prodCur INTO codprod
        update tbproduto set
        quantitensprod = (quantitensprod - 1)
        where pkcodprod = codprod;
        
        IF (not C1%FOUND) then    
            EXIT;
        END IF;
    END LOOP;
CLOSE C1;


END TBLISTAMATERIAS;


-- Create a new trigger on LOGON

CREATE TRIGGER DATABASETRIGGER1
AFTER LOGON ON DATABASE
BEGIN
   NULL;
END;

--Create a new Database Procedure

-- Procedure definition

CREATE PROCEDURE PROCEDURE1 (
  PARAM1 IN NUMBER) IS

-- Declare constants and variables in this section.
-- Example: <Variable Identifier> <DATATYPE>
--          <Variable Identifier> CONSTANT <DATATYPE>
--          varEname  VARCHAR2(40);
--          varComm   REAL;
--          varSalary CONSTANT NUMBER:=1000;
--          comm_missing EXCEPTION;
  varSum NUMBER;

-- Executable part starts here
BEGIN

  -- Write PL/SQL and SQL statements to implement the processing logic
  -- of subprogram. Example:
  --     SELECT ENAME,
  --            COMM
  --     INTO   varEname,
  --            varComm
  --     FROM   EMP
  --     WHERE  EMPNO = 7369;
  --
  --     IF varComm IS NULL THEN
  --         RAISE comm_missing;
  --     END IF;

  NULL;

  -- EXCEPTION -- exception-handling part starts here
  -- WHEN comm_missing THEN
  --   dbms_output.put_line('Commision is NULL');

END PROCEDURE1;

dbms_output.put_line(' ');