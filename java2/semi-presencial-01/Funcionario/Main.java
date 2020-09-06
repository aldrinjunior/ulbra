import com.funcionario.*;

public class Main {
  public static void main(String[] args) {
    Funcionario funcionario = new Funcionario();

    funcionario.setNome("José");
    funcionario.setValorHora(50);
    funcionario.setHoras(30);

    System.out.println("Valor da hora do José: " + funcionario.getValorHora());
    System.out.println("Salário do José: " + funcionario.calculaSalario());
    System.out.println(funcionario.toString());
    System.out.println("\n");

    funcionario.setHoras(40);
    System.out.println("Novo salário do José 40 Horas: " + funcionario.calculaSalario());
    System.out.println(funcionario.toString());
  }
}
