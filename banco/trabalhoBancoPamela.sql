-- 1) Crie 3 Sequence que serão utilizadas para geração das chaves primárias de cada uma das tabelas. 
---Crie também 3 triggers uma para cada tabela que antes de inserir adicionem o valor das sequences criadas nas respectivas chaves primárias

create sequence ordem_func

create or replace trigger func
Before insert on tbfuncionario
for each row
declare
vSeq number;
Begin
select ordem_func.NEXTVAL into vSeq from dual;
:new.pkcodmat :=vSeq;
end func;

-- testes
insert into TBFUNCIONARIO(nome,cpf,carttrab,salariobase,numvalesemitidos,numvalesaberto,numvalesdescontados,valortotalvalesaberto)
values ('Ana Ferreira',76493827593,784537876, 1500.50,30,15,34,50);

create sequence ordem_comp

create or replace trigger compet

Before insert on tbcompetencia
for each row
declare
seq number;
Begin
select ordem_comp.NEXTVAL into seq from dual;
:new.pkcodcomp :=seq;
end compet;

-- testes
insert into tbcompetencia(descricao,dataini,datafim)
values ('Teste',TO_Date('20/10/2019'),TO_DATE('20/11/2019'));

create sequence ordem_vale
create or replace trigger vale
Before insert on tbvale
for each row
declare
pSeq number;
Begin
select ordem_comp.NEXTVAL into pSeq from dual;
:new.pkcodvale :=pSeq;
end vale;
insert into tbvale(fkcodmat,datageracao,datadesconto,valorvale,status,limite)
values (1,TO_Date('20/10/2019'),TO_DATE('20/11/2019'),1000,1,2000);

-- 2) Construa um procedimento que receba como parâmetros os dados de um funcionário 
-- e insira estes dados na tabela tbfuncionario. 
--O procedimento deverá colocar automaticamente um código para o mesmo, 
--alem de definir a quantidade de vales e o valor total de vales como ZERO.

create or replace procedure func_dados

(cod IN tbfuncionario.pkcodmat%TYPE,
nome_func IN tbfuncionario.nome%type,
cpf_func IN tbfuncionario.cpf%type,
cart IN tbfuncionario.carttrab%type,
sal IN tbfuncionario.salariobase%type,
vale_emi IN tbfuncionario.numvalesemitidos%type,
vales_abertos IN tbfuncionario.numvalesaberto%type,
vales_desc IN tbfuncionario.numvalesdescontados%type,
valor_aberto IN tbfuncionario.valortotalvalesaberto%type)

IS
xcod tbfuncionario.pkcodmat%type;
vale tbfuncionario.numvalesemitidos%type;
valor tbfuncionario.numvalesaberto%type;
BEGIN

select nvl(Max(pkcodmat),0) into xcod from tbfuncionario;
xcod:=xcod+1;
  select nvl(numvalesemitidos,0) into vale from tbfuncionario;
  select nvl(valortotalvalesaberto,0) into valor from tbfuncionario;
  insert into tbfuncionario(nome,cpf,carttrab,salariobase,numvalesemitidos,numvalesaberto,numvalesdescontados,valortotalvalesaberto)
values (nome_func,cpf_func,cart,sal,vale_emi,vales_abertos,vales_desc,valor_aberto);
END func_dados;

-- 3)Desenvolva uma função que receba como parâmetro uma data e devolva o código de competência que a data está associada.
create or replace function data_ret
(data_ini IN Date)
return integer
is
cod integer;
BEGIN
if (data_ini = '20/10/2019') then
return(cod);
else
return(null);
end if;
end data_ret;

-- 4) Faça uma função que receba como parâmetro o código do funcionário 
-- e o código da competência e retorne o limite de compra do mesmo. 
-- O limite de compra refere-se a 30% de seu salário menos o valor já utilizado como vale durante a competência informada.

create or replace procedure func_limite
(cod_func IN tbfuncionario.pkcodmat%type,
cod_comp IN tbcompetencia.pkcodcomp%type)
IS
limite integer;
sal integer;
total integer;
BEGIN
limite:=(sal * 0.3)-total;
END func_limite;


-- 5) Crie um procedimento que passe como parâmetro o funcionário e o valor do vale. O procedimento deverá :
-- ●	aumentar o número de vales emitidos;
-- ●	aumentar o número de vales em aberto;
-- ●	aumentar o valor total de vales.

create or replace procedure aumenta_vale
(nome_func IN tbfuncionario.nome%type,
vale IN tbvale.valorvale%type)
IS
BEGIN
update tbfuncionario
set numvalesemitidos = numvalesemitidos + 1
WHERE nome = nome_func;

update tbfuncionario
set numvalesaberto = numvalesaberto + 1
WHERE nome = nome_func;

update tbfuncionario
set valortotalvalesaberto = valortotalvalesaberto + 1
WHERE nome = nome_func;
END aumenta_vale; 

-- 6) Crie um procedimento que receba como parâmetro o código do funcionário, o valor do vale desejado, e a data em que está sendo realizado o solicitação do vale. O procedimento deverá inserir um registro na tabela de vale, onde:
-- ●	De posse da data de competência chamar uma função que retorne o código da tabela competência;
-- ●	Chame a função definida no exercício 4 e com base no resultado, teste se o valor do limite para a competência for inferior ao valor do vale desejado, armazenar somente o valor do limite disponível. 
-- ●	Armazenar o valor do limite de compra na tabela de vale
-- ●	Chamar a função definida no exercício 5 que atualiza os dados de vale na tabela de funcionário.

create or replace
procedure insere_dados
(cod_funci IN OUT tbfuncionario.pkcodmat%type,
vale_func OUT tbfuncionario.numvalesemitidos%type,
data_vale OUT tbvale.datageracao%type)
IS
cod integer;
data_comp Date;
valeSal integer;
limite integer;
BEGIN
IF (data_comp = '20/10/2019') then
dbms_output.put_line('cod');
cod:= cod_funci;
func_limite('cod_func','cod_comp');
IF (limite < vale_func) then
dbms_output.put_line('limite');

insert into tbvale (limite) values (limite);

valeSal:=vale_func;
aumenta_vale('nome_func','vale');

END IF;
END IF;
END insere_dados;

-- 7) Desenvolva um procedimento que receba o funcionário e uma data qualquer, e retorne por parâmetro a quantidade de vales e o valor total de vales existentes para a competência em que se refere a data informada
create or replace procedure quanti_vales
(pi_cod_cli IN number,
pi_data_comp IN date,
po_quanti_vales OUT number,
po_valor_vales OUT number)
is
  v_quant_vales number := 0;
  v_valor_vales number;

  cursor c_dados is
    select f.numvalesemitidos
         , sum(valorvale)  total_vale
      from tbfuncionario f
         , tbvale        v
         , tbcompetencia c
     where v.fkcodmat     = f.pkcodmat
       and v.fkcodcompemi = c.pkcodcomp
       and f.pkcodmat     = pi_cod_cli
       and pi_data_comp   between c.dataini and c.datafim
     group by f.numvalesemitidos ;

  r_dados  c_dados%rowtype;

begin

  open c_dados;
  fetch c_dados into r_dados;
  if c_dados%found then
    v_quant_vales := r_dados.numvalesemitidos;
    v_valor_vales := r_dados.total_vale;
  else
    v_quant_vales := 0;
    v_valor_vales := 0;
   
  end if;
  close c_dados;

  po_quanti_vales := v_quant_vales;  
  po_valor_vales := v_valor_vales;

end quanti_vales;

-- 8) Crie um procedimento que altere o status do vale para recebido, onde deve ocorrer as seguintes ações:
-- ●	Deve ser informado o número do vale, e a data de competência de recebimento
-- ●	O procedimento deverá trocar o status para recebido, e armazenar no vale a competência em que está sendo recebido o vale. 

create or replace procedure altera_vale
(pi_cod_vale IN number,
po_data_gere OUT number)
is
v_status number;
v_data date;

cursor c_altera is
select * from tbvale v
where v.status = v_status;

r_altera  c_altera%rowtype;

begin

 open c_altera;
fetch c_altera into r_altera;
if (c_altera%found) then
  v_status := 1;
else
  v_status := 0;
end if;
close c_altera;

po_data_gere := v_status;
end altera_vale;

-- 9) Crie uma trigger que verifique se o status do vale foi alterado. 
-- Caso seja alterado para 2 o banco deverá:
-- ●	aumentar a quantidade de vales recebidos na tabela de empregado,  
-- ●	diminuir a quantidade de vales em aberto e o 
-- ●	diminuir o total de vales em aberto do empregado.
-- Caso seja alterado para 1 o banco deverá:
-- ●	diminuir a quantidade de vales recebidos na tabela de empregado,  
-- ●	aumentar a quantidade de vales em aberto e o 
-- ●	aumentar o total de vales em aberto do empregado.

create or replace trigger verifica_vale
after update on tbvale
for each row
begin
if (status = 2) then
update tbfuncionario set numvalesemitidos = numvalesemitidos + 1;
update tbfuncionario set numvalesaberto = numvalesaberto - 1;
update tbfuncionatio set valortotalvalesaberto = valortotalvalesaberto - 1;

else
update tbfuncionario set numvalesemitidos = numvalesemitidos - 1;
update tbfuncionario set numvalesaberto = numvalesaberto + 1;
update tbfuncionario set valortotalvalesaberto = valortotalvalesaberto + 1;
end if;
end verifica_vale;

-- 10) Crie uma tigger que ao apagar um vale a trigger deva alterar o número de vales emitido, abertos, descontados e o valor de vales em aberto dos funcionários de acordo como status do vale. 
-- Se o status for 1 deverá:
-- ●	Diminuir o número de vales emitidos
-- ●	Diminuir o número de vales abertos 
-- ●	Diminuir o valor total de vales em aberto
-- Se o status for 2 deverá 
-- ●	Diminuir o número de vales emitidos
-- ●	Diminuir o número de vales descontados 

create or replace trigger exclui_vale
before delete on tbvale
for each row
begin

if(status = 1) then
update tbfuncionario set numvalesemitidos = numvalesemitidos - 1;
update tbfuncionario set numvalesaberto = numvalesaberto - 1;
update tbfuncionario set valortotalvalesaberto = valortotalvalesaberto - 1;

else
update tbfuncionario set numvalesemitidos = numvalesemitidos - 1;
update tbfuncionario set numvalesdescontados = numvalesdescontados - 1;
end if;
end exclui_vale;
