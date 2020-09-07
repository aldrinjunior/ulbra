import java.util.ArrayList;
import java.util.Scanner;

import com.Entity.Aluno;

// O exercício de hoje baseia-se nos exemplos 
//contidos no Material de Apoio (Texto).
// Neste material foi apresentada a 
//classe Aluno e, com base nela, 
//foi criado um ArrayList e um LinkedList 
//de Alunos. 
//Você deve testar estes ArrayList e LinkedList,
// instanciando objetos da classe Aluno e,
// a partir disso para cada lista:

// - inserir um objeto **
// - inserir um objeto em uma posição **
// - buscar um objeto
// - listar todos os objetos
// - remover um objeto
// - remover um objeto de uma posição

public class Main {
  public static void main(String[] args) {

    ArrayList<Aluno> vetor = new ArrayList<Aluno>();

    Aluno aluno1 = new Aluno();
    aluno1.setnome("aldrin");
    vetor.add(aluno1);

    Aluno aluno2 = new Aluno();
    aluno2.setnome("fulano");
    vetor.add(0, aluno2); // insere em uma posição

    Aluno aluno3 = new Aluno();
    aluno3.setnome("ciclano");
    vetor.add(aluno3);

    System.out.println("Vetor completo: " + vetor.toString() + "\n");

    System.out.println("Retornar true se contém o Aluno 1");
    System.out.println(vetor.contains(aluno1));

    System.out.println("Retornar true se remover o Aluno 3");
    System.out.println(vetor.remove(aluno3));

    System.out.println("Retornar true se remover o Aluno 2 que está na posição 0");
    System.out.println(vetor.remove(0));

    System.out.println("Vetor depois de executar os métodos \n");
    System.out.println(vetor.toString());

  }
}