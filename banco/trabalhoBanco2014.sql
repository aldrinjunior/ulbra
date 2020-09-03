--Trabalho igual ao video de revisão do cadoná
--Tudo comentado até pra anta poder entender

-- Exercicio 1 

-- Crie uma sequence para geração automática do código do pedido
-- e chame uma trigger de forma que o código do pedido possua o elemento
-- contido na sequence, ao inserir um novo registro

CREATE SEQUENCE TBPEDIDO_SE
             START WITH 10;

CREATE TRIGGER TGPEDIDO_BI
BEFORE INSERT ON TBPEDIDO   
-- trigger após inserir algo em tbpedido
  FOR EACH ROW 
-- para cada elemento, declarar uma variavel xcod que pega 
-- de dentro da tabela tbpedido o pkcodped (tem que usar a porra to %type)
  declare xcod tbpedido.pkcodped%type;
  
  BEGIN 
    select TBPEDIDO_SE.nextval into xcod from dual; --faz um select chamando a sequence e o proximo valor de xcod
    :new.pkcodped:=xcod;  --new para fazer o pkcodped receber o valor de xcod 
  END;             

-- para verificar rode o comando abaixo
select * from tbpedido
--depois 
insert into tbpedido(datapedido, pkcodcli, totalpedido) values('02/01/2019', 2, 5.55);
-- ai roda o select novamente pra ver a mudança

-------
-------
-------
-------
-------
-------
-------
-------

-- Exercicio 2 : Crie um procedimento que passado uma data, gere uma lista que mostre
-- o nome do cliente, o numero do pedido e o valor total do pedido.
-- Para cada pedido listado, gere uma outra lista contendo a relação de produtos do respectivo
-- pedido. Utilize o maldito conceito de cursores para essa questão.

CREATE PROCEDURE exercicio2 (
  datacon IN DATE) AS
    --cursor dinamico para a segunda parte do enunciado, listar a relação do pedido, para cada pedido que existir nessa data
      TYPE tipoCursor IS REF CURSOR;
      listaitens tipoCursor -- criado um cursor dinamico chamado listaitens que é do tipo cursor

    -- quando pesquisar por uma data, vai criar variaveis que receberam os valores referenciados no enunciado
    xnomecli     tbcliente.nomecli%type; -- da tbcliente vamos pegar o nomecli (type para manter o tipo da var)
    xpkcodped      tbpedido.pkcodped%type; -- da tbpedido vamos pegar o pkcodped (tem que usar a porra do type dnv)
    xtotalpedido tbpedido.totalpedido%type; -- da tbpedido vamos pegar o totalpedido (não esquece o type caralho)
    xnomeprod tbproduto.nomeprod%type -- variavel para o cursor dinamico ter o produto que quer imprimir
  --cursor do demonio vai se chamar listapedido e executar o select abaixo 

  cursor listapedido is 

  SELECT c.nomecli, p.pkcodped, p.totalpedido FROM tbpedido p

  INNER JOIN tbcliente c on c.pkcodcli = p.pkcodcli

  WHERE p.datapedido=datacon; --o select vai bombar aonde a datapedido da tabela produto for igual a datacon da procedure 

-- Iniciando o terror 
BEGIN
  open listapedido;
  dbms_output.put_line('Pedidos do dia ' ||datacon); -- listar fora do loop pra mostra uma ver só
        -- aqui começa a pegar o conteudo do cursor e atribuir as variaveis pra ele
  loop
    FETCH listapedido INTO xnomecli, xpkcodped, xtotalpedido;
    if (not listapedido%found) THEN -- se ele não listar nada então termina
      exit;
  end if;

  dbms_output.put_line('cliente:' ||xnomecli||' numero do pedido:' ||xpkcodped|| 'total do pedido:' ||xtotalpedido);
   
    -- depois de imprimir listapedido, vamos criar outro sql com o cursor dinamico
    open listaitens FOR 'select p.nomeprod from tbitensped i inner joint tbproduto p on p.pkcodprod=i.fkcodprod where i.fkcodped='||xpkcodped||'';
    -- esse cursor faz um select, concatenando com o xpkcodped para poder mostrar tudo que pertence a mesma linha
    loop
      FETCH listaitens INTO xnomeprod;
      if (not listaitens%found) THEN -- se ele não listar nada então termina
        exit;
      end if; 
      dbms_output.put_line('       '||xnomeprod); 
    end loop
    close listaitens;
  end loop;
END exercicio2; 

--
--
--
--
--
--
--Exercicio 3 
--Crie uma rotina que atualize automaticamente a saida dos produtos (seu estoque)
-- da tabela de estoque caso ocorra a realização de um pedido (caso ocorra uma venda).
-- Não esqueça que pode ocorrer:
--    * inclusão de um item no pedido (insert)
--    * Alteração da quantidade do mesmo item no pedido (update)
--    * Alteração do produto ( troca de item: no lugar do prod xxx foi colocado o produto YYY) (update)
--    * Remoção do produto (delete né pai)

-- Create a new trigger on INSERT

CREATE TRIGGER TBITENSPED_AI
-- a trigger (rotina) vai executar sempre após inserir, alterar, ou deletar algo na tabela de itensped
AFTER INSERT or UPDATE or DELETE ON tbitensped
--começando a bagaça
BEGIN
  -- quando inserir um item no pedido, tem diminuir o estoque do produto subtraindo a quantidade nova
  if (inserting) or ((updating) and (:old.fkcodprod<>:new.fkcodprod)) THEN  -- e se tiver a troca de item, precisar ver se o cod da tabela é diferente do digitado agora
    update tbproduto p set p.estoqueprod = p.estoqueprod-:new.quantidade where p.pkcodprod=:new.fkcodprod;
  end if; --no update, o estoque do produto recebe o estoque menos a nova quantidade 
  
  -- quando estiver fazendo um update no mesmo item do pedido, e a quantidade for diferente da nova quantidade informada
  if (updating) and (:old.fkcodprod=:new.fkcodprod) and (:old.quantidade <>:new.quantidade) THEN  
    update tbproduto p set p.estoqueprod = p.estoqueprod-:new.quantidade+:old.quantidade where p.pkcodprod=:new.fkcodprod;
  end if; -- atualizar o estoque do produto, recebendo menos a nova quantidade + a quantidade que já tinha no pedido

  -- quando estiver deletando um item no pedido, precisa voltar a quantidade que estava no estoque.
  if (deleting) or ((updating) and (:old.fkcodprod<>:new.fkcodprod)) THEN
    update tbproduto p set p.estoqueprod = p.estoqueprod+:old.quantidade where p.pkcodprod=:old.fkcodprod;
  end if;
END;

--
--
--
--
--
--
-- Exercicio 4
-- Desenvolva uma rotina que atualize automaticamente a data da ultima compra realizada pelo cliente.
-- não esqueça que uma compra pode ser removida ou ter sua data alterada de forma que o sistema deve 
-- automaticamente atualizar a data na tabela de cliente

-- Create a new trigger on LOGON

CREATE TRIGGER TBPEDIDO_AIUD -- essa trigger vai executar automaticamente dps de inserir, alterar ou deletar tb pedido
AFTER insert or update or delete ON tbpedido
FOR EACH ROW -- precisamos da ultima data de compra (maior data)
  
declare 
  xultimadata tbcliente.ultimadatacompra%type; -- criar a variavel pegando o mesmo tipo que ela quer referenciar
BEGIN

  -- lembrando que o insert não tem old, só tem new

  if (inserting) THEN -- pegando a data do ultimo pedido do cliente (pq quando ele estiver inserindo n tem valores antigos)
    select max(p.datapedido) into xultimadata from tbpedido p where p.pkcodcli=:new.pkcodcli;
      -- se ele estiver atualizando, vai  atribuir a ultima data 
      update tbcliente  set ultimadatacompra=xultimadata where pkcodcli=:new.pkcodcli;

  -- e o delete não tem new, só tem old
    else -- agora é a alteração, se ele alterou, já vem com a ultima data 
      select max(p.datapedido) into xultimadata from tbpedido p where p.pkcodcli=:old.pkcodcli;
      update tbcliente  set ultimadatacompra=xultimadata where pkcodcli=:old.pkcodcli;
  end if;

END;
