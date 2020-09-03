-- 7 – Crie uma trigger que após incluir, alterar ou deletar um registro na tabela de produto(tbproduto), atualize o campo quantprod da tabela fornecedor. Não esqueça que as seguintes ações podem ocorrer:
-- •	Cadastrar um novo produto
-- •	Alterar o fornecedor do produto
-- •	Remover um produto

Create or replace trigger atualiza
Before insert or update or delete on tbproduto
For each row
If(inserting) then
Insert into tbproduto (CodProd, NomeProd, CodCat, CodForn, ValorProd) values (:new.codprod, :new.nomeprod, :new.codcar, :new.codforn, :new.valorprod);
End if;
If (updating) then
Update tbfornecedor p set p.quantiprod=p.quantprod where p.pkcodforn = p.fkcodforn;
End if;
If (deleting) then
Delete from tbproduto where p.pkcodpord = ‘1’;
End if
End atualiza;
 
--  Com base no diagrama ER, crie uma trigger 
--  que após a inserção, alteração e ou remoção de um registro na tabela “TbRelFilmeLoc” 
--  altere o atributo “filmeslocados” da tabela “TbCliente”. 
--  O atributo filmeslocados armazena a quantidade de filmes locados por um cliente
-- 

CREATE OR REPLACE TRIGGER tbrelfilmeloc_ai 
AFTER INSERT
OR
UPDATE
OR
DELETE ON tbrelfilmeloc

FOR EACH ROW 

BEGIN 

IF ((inserting)) or ((updating)) THEN
UPDATE tbcliente cli SET cli.filmeslocados = cli.filmeslocados + 1 
WHERE cli.pkcodcli IN
    (SELECT loc.fkcodcli FROM tblocacao loc
     WHERE loc.pkcodloc = :new.fkcodloc); 
     
     END IF;
     
  IF (deleting) THEN
  UPDATE tbcliente cli SET cli.filmeslocados = cli.filmeslocados - 1 
  WHERE cli.pkcodcli IN
      (SELECT loc.fkcodcli FROM tblocacao loc
      WHERE loc.pkcodloc = :new.fkcodloc); 
  END IF; 
END;

-- 10 – Com base no diagrama ER abaixo, crie uma trigger 
-- que após a inserção de um novo registro na tabela “TbRelFilmeLoc” 
-- incremente um elemento no atributo “locações” da tabela “tbcliente”. 
-- Nesta mesma trigger se o status informado for 8, altere o campo “acréscimo” 
-- para o valor de multa (“valormulta”, relacionado ao filme que está em locação.

-- 8 – Com base no diagrama ER abaixo crie uma trigger 
-- que antes da inserção ou alteração de um registro da tabela “TbRelFilmeLoc” 
-- altere o atributo “valordiariafilme”, pelo valor contido no campo “valordiaria” 
-- da tabela TbClassificacao do respectivo filme vinculado.
-- Nesta mesma trigger altere o atributo “totalitem” como sendo o valordiariafilme multiplicado pelo campo “diaslocados”. 
-- Com o resultado multiplicado, conclua a operação comando o valor do resultante com o valor contido no campo “multa”. 
-- Nesta mesma trigger incremente o campo “numerolocacoes” da tabela de filme e em caso de troca do atributo fkcodfilme decremente o atributo numerolocacoes.





Create or replace trigger novo_registro
After insert or update on tbRelFilmeLoc
For each row

Declare
Cod_filme tbfilme.pkcodfilme%type;
Valor_mul tbclassificacao.valormulta%type;
Valor_dia tbclassificacao.valordiaria%type;
Total_item tbRelFilmeLoc.valoritens%type;
Valor_filme tbRelFilmeLoc.valordiariafilme%type;
Dias_loc tbRelFilmeLoc.diaslocados%type;
Locacoes tbfilme.numerolocacoes%type;
Begin

If (inserting) or (updating) then
Update tbRelFilmeLoc set valor_filme := valor_dia where valordiaria = valor_filme;
End if;

Update tbRelFilmeLoc set total_item := (valor_dia * dias_loc) + valor_multa where totalitem = total_item;

Update tbfilme set
locacoes = locacoes + 1;
where numerolocacoes = locacoes;

Update tbfilme set
locacoes = locacoes - 1;
where fkcodfilme = cod_filme;

end novo_registro;
