-- trabalho banco 2020 para entregar no dia da prova

-- 1) Desenvolva 3 triggers que controlem a geração automática do 
-- código do produto, código de matéria prima e código de composição
-- de produto, tendo como base as sequences criadas no script. 
--Desta forma, toda vez que for inserido (BEFORE-ANTES DE INSERIR) um registro nestas tabelas 
--o sistema seleciona um código para ser colocado na chave primária das tabelas.

CREATE TRIGGER TBPRODUTO_BI
BEFORE INSERT ON TBPRODUTO
FOR EACH ROW

DECLARE
xcodprod TBPRODUTO.PKCODPROD%TYPE;

BEGIN
   select PKPRODUTO.NEXTVAL INTO xcodprod from dual;  
   :new.PKCODPROD:=xcodprod;
END;


CREATE TRIGGER TBMATERIAPRIMA_BI
BEFORE INSERT ON TBMATERIAPRIMA
FOR EACH ROW

DECLARE
xcodmat TBMATERIAPRIMA.PKCODMAT%TYPE;

BEGIN
   SELECT PKMATEIRA.NEXTVAL INTO xcodmat from dual;
   :new.PKCODMAT:=xcodmat;
END;

CREATE TRIGGER TBCOMPRODUTO_BI
BEFORE INSERT ON TBCOMPRODUTO
FOR EACH ROW

DECLARE
xcodcompro TBCOMPRODUTO.PKCOMPROD%TYPE;
BEGIN
   SELECT PKCOMPOSICAO.NEXTVAL INTO xcodcompro from dual;
   :new.PKCOMPROD:=xcodcompro;
END;

-- testes
insert into tbmateriaprima(nomemat , estoquemat , valorunit ) values ('mat 1',10,2.00 );
SELECT * FROM TBMATERIAPRIMA
insert into tbproduto(nomeprod , estoqueprod ,custoprod , margemprod , valorvendaprod , quantitensprod ) values ('produto 1',3,  8.00,50.00,12.00,2);
SELECT * FROM tbproduto
insert into tbcomproduto(fkcodmat , fkcodprod , quant) values (2,1,2);
SELECT * FROM tbcomproduto

-- 2) Crie uma trigger que após inserir,alterar ou remover um item da composição de produto o campo  seja atulizado os seguintes campos da tabela tbproduto
-- •	“quantitensprod”, deverá ser incrementado ou decrementado em +1 ou -1 item.
-- •	“custoprod”, deverá ser recalculado. O mesmo representa o somatório das quantidades (quant) multiplicado pelo valor unitário(valorunit) de cada matéria  que  compõe o produto
-- •	“valorvendaprod”, deverá ser recalculado com base no novo valor de custo “custoprod” acrescido da margem de lucro (margemprod).

-- Create a new trigger on LOGON

CREATE TRIGGER TGCOMPRODUTO_AI
AFTER INSERT OR UPDATE OR DELETE ON TBCOMPRODUTO
FOR EACH ROW -- Delete rows from a Table

DECLARE
  XCUSTPROD TBPRODUTO.CUSTOPROD%TYPE;
IS
BEGIN
   IF (INSERTING)
   END IF
END TGCOMPRODUTO_AI;

-- 3) Crie uma trigger que antes alterar ou remover um item da tabela de matéria prima realize as seguintes rotinas:
--    - Se for alterado o valor unitário da matéria prima, deverá ser alterado os seguintes campos em produto
-- •	 “custoprod”, deverá ser recalculado. O mesmo representa o somatório das quantidades (quant) multiplicado pelo valor unitário(valorunit) de cada matéria  que  compõe o produto
-- •	“valorvendaprod”, deverá ser recalculado com base no novo valor de custo “custoprod” acrescido da margem de lucro (margemprod).
-- - Se for Removido um item de matéria prima:
-- •	“quantitensprod”, deverá ser incrementado ou decrementado em -1 item se o item foi removido
-- •	Deverá remover os registros da tabela de composição de produto que possuem a matéria prima removida
-- •	Recalcular o “custoprod” e o “valorvendaprod” da tabela de produto

-- 4) Faça um procedimento que possua somente 2 parâmetros,o primeiro o código do produto e o segundo a quantidade a ser produzida do produto. . O procedimento deverá :
-- •	Listar em tela o nome do produto, e em seguida uma listagem contendo a relação de componentes que compõem o respectivo produto;
-- •	Aumentar o estoque o produto na quantidade especificada;
-- •	Diminuir a quantidade de estoque das matérias primas que compões o produto de forma proporcional a quantidade informada para ser produzida

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

