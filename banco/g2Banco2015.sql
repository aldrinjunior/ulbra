-- 10 – Com base no diagrama ER abaixo, crie uma trigger que após a inserção 
-- de um novo registro na tabela “TbRelFilmeLoc” incremente um elemento no atributo “locações”
-- da tabela “tbcliente”. Nesta mesma trigger se o status informado for 8, altere o campo “acréscimo” 
-- para o valor de multa (“valormulta”, relacionado ao filme que está em locação.
 
Create or replace trigger novo_registro
After insert on tbRelFilmeLoc
For each row
Declare
Cod_cli tbcliente.pkcodcli%type;
Valor_mul tbclassificacao.valormulta%type;
Begin
Select p.pkcodcli into cod_cli from tbcliente p
Inner join tblocacao k on k.fkcodcli = p.pkcodcli
Where k.fkcodcli = p.pkcodcli;

Update tbcliente set
locacoes = locacoes + 1;
where pkcodcli = cod_cli;

If (:new.status =8) then
Select v.valormulta into valor_mul from tbclassificacao v
Inner join fkcodfilme = pkcodfilme inner joint tbclassificação on fkcodclass = pkcodclass
:new.acrescimo :=valormulta;
Enf if;
End novo registro;
