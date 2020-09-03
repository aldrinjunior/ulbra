-- 6 – Crie um procedimento que passado uma data, gere uma lista que mostre o nome do cliente, o número do pedido e o valor do pedido. Para cada pedido listado, gere uma outra lista contendo a relação de produtos do respectivo pedido. (Utilize o conceito de cursores para solucionar a questão)

Create or replace procedure mostra_cli
(datacon in date)
as
TYPE tipoCursor IS REF CURSOR;
    listaitens tipoCursor;
    xnomecli tbcliente.nomecli%type;
    xpkcodped tbpedido.pkcodped%type;
    xtotalpedido tbpedido.totalpedido%type;
    xnomeprod tbproduto.nomeprod%type;

cursor listapedido is select c.nomecli, p.pkcodped, p.totalpedido from tbpedido p
inner join tbcliente c on c.pkcodcli = p.pkcodcli where p.datapedido=datacon;
begin

open listapedido;
dbms_output.put_line('pedidos do dia:'|| datacon);

loop 
    FETCH listapedido INTO xnomecli, xpkcodped, xtotalpedido;
    if ( not listapedido%found) then
    exit;
    end if;

dbms_output.put_line('Cliente :'||xnomecli||'número pedido:'||xpkcodped||'total pedido:'||xtotalpedido);

OPEN listaitens FOR 'select p.nomeprod from tbitensped i inner join tbproduto p on p.pkcodprod = i.fkcodprod where i.fkcodped='||xpkcodped||'';
    loop
        FETCH listaitens INTO xnomeprod;
        if (not listaitens%found) then 
    exit;
        end if;
        dbms_output.put_line('            '||xnomeprod);
    end loop;
    close listaitens;
    end loop;
close listapedido;End mostra_cli;
end mostra_cli;

-- 7 – Crie uma rotina (trigger) que atualize automaticamente a movimentação de estoque (estoqueprod) dos produtos que estão vinculados a um pedido. Não esqueça que pode ocorrer:
-- •	Inclusão de um item no pedido
-- •	Alteração da quantidade do mesmo item do pedido
-- •	Alteração do produto (troca de item: no lugar do produto XXXX foi colocado o produto YYYY)
-- •	Remoção do produto

Create or replace trigger atualiza
after insert or update or delete on tbitensped
FOR EACH ROW
IF ((inserting) or ((updating) and (:old.fkcodprod<>:new.fkcodprod))) then
  update tbproduto p set p.estoqueprod=p.estoqueprod-:new.quantidade where p.pkcodprod =:new.fkcodprod;
  end if;
  IF (deleting) or ((updating) and (:old.fkcodprod<>:new.fkcodprod)) then 
  update tbproduto p set p.estoqueprod=p.estoqueprod+:old.quantidade where p.pkcodprod=:old.fkcodprod;
  end if;
  IF (updating) and (:old.fkcodprod=:new.fkcodprod) and (:old.quantidade<>:new.quantidade) then
    update tbproduto p set p.estoqueprod=p.estoqueprod-:new.quantidade+:old.quantidade where p.pkcodprod=:new.fkcodprod;
  end if;
end atualiza;

