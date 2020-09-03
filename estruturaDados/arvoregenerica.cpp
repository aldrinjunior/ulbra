#include <stdlib.h>
#include <stdio.h>
#include <malloc.h>

struct arvoregenerica *crianodo(int ch);
void insere_direita (struct nodo **lista, struct nodo **fim, struct arvoregenerica *st);
void remove (struct nodo **lista, struct nodo **fim, struct arvoregenerica *st);
void adicionasubarvore (struct arvoregenerica *arvore, struct arvoregenerica *st);
void removesubarvore (struct arvoregenerica *arvore, struct arvoregenerica *st);
void mostra_arvore(struct arvoregenerica *raiz);
int conta_nodos(struct arvoregenerica *raiz);
void libera_arvore(struct arvoregenerica *raiz);

struct arvoregenerica{
	int chave;
	int grau;
	struct nodo *lista;
	struct nodo *fim;
};

struct nodo{
	struct arvoregenerica *filho;
	struct nodo *prox;
};

struct arvoregenerica *crianodo(int ch){
	struct arvoregenerica *p;
	p = (struct arvoregenerica *) malloc(sizeof(struct arvoregenerica));
	if (p!=NULL){
		p->chave = ch;
		p->grau = 0;
		p->lista = NULL;
		p->fim=NULL;
	}
	return p;
}

void insere_direita (struct nodo **lista, struct nodo **fim, struct arvoregenerica *st)
{
	struct nodo *aux;
	aux = (struct nodo *) malloc (sizeof(struct nodo));
	if (aux!=NULL) {
		aux->filho = st;
		aux->prox = NULL;
		if (*lista == NULL)
			*lista  = aux;
		else
			(*fim)->prox = aux;
		*fim = aux;
	} 
}

void remove (struct nodo **lista, struct nodo **fim, struct arvoregenerica *st)
{
	struct nodo *aux, *ant=NULL;
	aux=*lista;
	while (aux!=NULL && aux->filho!=st){
		ant = aux;
		aux=aux->prox;
	}
	if (aux!=NULL){
		if(ant!=NULL) ant->prox = aux->prox;
		else *lista=aux->prox;
		if(aux==*fim) *fim=ant;
		free(aux);
	}
}

void adicionasubarvore (struct arvoregenerica *arvore, struct arvoregenerica *st){
	insere_direita(&arvore->lista, &arvore->fim, st);
	arvore->grau = arvore->grau +1;
}

void removesubarvore (struct arvoregenerica *arvore, struct arvoregenerica *st){
	remove(&arvore->lista, &arvore->fim, st);
	arvore->grau--;	
}

void mostra_arvore(struct arvoregenerica *raiz){
	struct nodo *p;
	if (raiz==NULL) return;
	printf("%i", raiz->chave);
	p=raiz->lista;
	while(p!=NULL){
		mostra_arvore(p->filho);
		p=p->prox;
	}
}
//Criar um método que conte os nodos de uma árvore genérica
int conta_nodos(struct arvoregenerica *raiz){
struct nodo *p;
int c = 0;
if (raiz==NULL) return c;
c++;
p=raiz->lista;
while(p!=NULL){
c = c + conta_nodos(p->filho);
p=p->prox;
}
return c;
}
void libera_arvore(struct arvoregenerica *raiz){
	struct nodo *p, *f;
	if (raiz==NULL) return;
	if (raiz->lista==NULL) {
		free(raiz);
		//raiz==NULL;
	}
	else {
	p=raiz->lista;
	while(p!=NULL){
		libera_arvore(p->filho);
		f=p;
		p=p->prox;
		free(f);
	} raiz->lista = NULL;
	}
}

int main() {
	struct nodo *p;
	struct arvoregenerica *raiz = crianodo(1);
	struct arvoregenerica *t1 = crianodo(2);
	struct arvoregenerica *t2 = crianodo(3);
    adicionasubarvore(raiz, t1);
    adicionasubarvore(raiz, t2);
    adicionasubarvore(t1, crianodo(4)); 
	adicionasubarvore(t2, crianodo(5));
	adicionasubarvore(t2, crianodo(6));
	adicionasubarvore(t2, crianodo(7));
    p=t2->lista;
    adicionasubarvore(p->filho, crianodo(8));
    p=p->prox;
    adicionasubarvore(p->filho, crianodo(9));
    adicionasubarvore(p->filho, crianodo(10));

	printf("mostra arvore\n");
    mostra_arvore(raiz);
	
	printf("\nConta nodos");
	    printf("\n%d", conta_nodos(raiz));
	printf("\n");
    libera_arvore(raiz);

   
   	return 0;
}



