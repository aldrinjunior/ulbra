-- 1) Desenvolva 2 triggers que controlem a geração automática do código do usuário e do código da mensagem, tendo como base as sequences criadas no script. Desta forma, toda vez que for inserido um registro nestas tabelas o sistema seleciona um código para ser colocado na chave primária das tabelas.
create or replace
trigger TBMENSAGEM_I
before insert on TBMENSAGEM
for each row
declare
xcod TBMENSAGEM.PKCODMENSAGEM%type;
begin
select PKMENSAGEM.NEXTVAL into xcod from dual;
:new.PKCODMENSAGEM:=xcod;
end;

create or replace
trigger TBUSUARIO_I
before insert on TBUSUARIO
for each row
declare
xcod TBUSUARIO.PKCODUSU%type;
begin
select PKUSUARIO.NEXTVAL into xcod from dual;
:new.PKCODUSU:=xcod;
end;

-- 2) Crie uma rotina que todas as vezes que for inserido uma nova mensagem, removida uma mensagem, ou alterado o campo statuslida o campo quantmsgnaolidas da tabela usuário seja atualizado.
CREATE or replace Trigger tgpkmensagem
after insert or delete or update
ON tbmensagem
FOR EACH ROW
declare

v_aux number;

Begin
if (inserting) then
select count(pkcodmensagem) into v_aux
from tbmensagem
where fkcodusudestino =:new.fkcodusudestino
and statuslida =0;
	update Tbusuario set quantmsgnaolidas = (v_aux+1) where pkcodusu = :new.fkcodusudestino;
elsif (deleting) then
select count(pkcodmensagem ) into v_aux
from tbmensagem
where fkcodusudestino =:old.fkcodusudestino
and statuslida =0;
	update Tbusuario set quantmsgnaolidas = (v_aux-1) where pkcodusu = :old.fkcodusudestino;
else
select count(pkcodmensagem ) into v_aux
from tbmensagem
where fkcodusudestino =:new.fkcodusudestino
and statuslida =0;
if (:new.statuslida = 1) then
update Tbusuario set quantmsgnaolidas = (v_aux-1) where pkcodusu = :new.fkcodusudestino;
else
update Tbusuario set quantmsgnaolidas = (v_aux+1) where pkcodusu = :new.fkcodusudestino;
end if;
end if;
End;
-- 3) Faça um procedimento que informado o código de um usuário (destino), liste em tela o nome do usuário destinatário e a listagem contendo as mensagens do destinatário. Esta listagem deve conter o nome do remetente, o status da mensagem e o conteúdo da mensagem
create or replace
procedure pr_lista (coddestino number) is

cursor cmensagem is
select tu.nomeusu, tm.statuslida,tm.conteudo from tbmensagem tm
left join tbusuario tu on tm.fkcodusuorigem = tu.pkcodusu
where fkcodusudestino = coddestino;
v_aux varchar(80);
begin
select nomeusu into v_aux from tbusuario
where pkcodusu = coddestino;
dbms_output.put_line(v_aux);
for x in cmensagem loop
dbms_output.put_line('Remetente: ' || x.nomeusu || ' ' || x.statuslida || ' ' || x.conteudo);
end loop;
end;

-- 4) Crie uma rotina automática que assim que um usuário de código A (fkcodusua) for bloquear (bloqueado) um usuário B(fkcodusub) (na tabela de amigos), as mensagens que possuírem o usuário B como destino e usuário A como remetente, sejam removidas para a tabela tbmensagem e adicionadas na tabela tbmensagembloqueada. Caso o usuário “A” torne o usuário “B” ativo novamente , as mensagens devem estar novamente disponíveis na tabela tbmensagem, e removidas da tabela tbmensagembloqueada. Na inserção de um novo registro na tabela tbmensagembloqueada, chame a sequence criada

CREATE or replace Trigger tgamigos
 before update
 ON tbamigos
FOR EACH ROW
declare
  cursor bloqueia is
  select * from tbmensagem where FKCODUSUDESTINO = :new.fkcodusub
  and fkcodusuorigem = :new.fkcodusua;
  
  cursor desbloqueia is
  select * from tbmensagembloqueada where FKCODUSUDESTINOb = :new.fkcodusub
  and fkcodusuorigemb = :new.fkcodusua;
  
  v_aux number;
begin
  if(:new.bloqueado != :old.bloqueado and :new.bloqueado = 0) then
    for x in bloqueia loop
      select pkcodmensagemb into v_aux from dual;
      insert into tbmensagembloqueada(pkcodmensagemb,conteudob,fkcodusuorigemb,fkcodusudestinob,statuslidab) 
      values(v_aux,x.conteudo,x.fkcodusuorigem,x.fkcodusudestino,x.statuslida);
      delete from tbmensagem where pkcodmensagem = x.pkcodmensagem;
    end loop;
  elsif(:new.bloqueado != :old.bloqueado and :new.bloqueado = 1) then
    for y in desbloqueia loop
      select pkcodmensagem into v_aux from dual;
      insert into tbmensagem(pkcodmensagem,conteudo,fkcodusuorigem,fkcodusudestino,statuslida) 
      values(v_aux,y.conteudob,y.fkcodusuorigemb,y.fkcodusudestinob,y.statuslidab);
      delete from tbmensagembloqueada where pkcodmensagemb = y.pkcodmensagemb;
    end loop;
  end if;
end;


-- 5) Faça um procedimento que informado o código de um usuário, mostre em tela uma listagem contendo o nome dos amigos do usuário e o nome dos amigos dos amigos do destinatário. Por exemplo, se for informado o código de usuário 1 (“Xuxa”) , o sistema deverá listar

-- Gugu é amigo de Xuxa
-- Eliana é amiga de Xuxa
-- Bozo é amigo de Eliana
-- Gugu é amigo de Eliana
-- Patata é amigo de xuxa
-- Patati é amigo Patata
-- Bozo é amigo Patata
-- Gugu é amigo Patata

create or replace
procedure pr_amigo (autor number) is
	cursor camigo is 
 		select tu.nomeusu 
		from tbamigos ta
    left join tbusuario tu on ta.fkcodusub = tu.pkcodusu
		where ta.fkcodusua = autor;
    
	cursor camigodeamigo is 
 		select fkcodusub 
		from tbamigos 
		where fkcodusua = autor;
    
    vamigo varchar(40);
begin
select nomeusu into vamigo from tbusuario where pkcodusu = autor;
 	for x in camigo loop 
		dbms_output.put_line(x.nomeusu|| ' é amigo de '||vamigo);

 		for y in camigodeamigo loop
    
    end loop;
 		--
  		--
 	end loop;

end;
