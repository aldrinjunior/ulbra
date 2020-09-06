import java.util.ArrayList;
import java.util.List;

import com.entidades.*;

public class Main {

  public static void main(String[] args) {

    List<String> listaPedido = new ArrayList<String>();

    Cliente cliente01 = new Cliente();

    cliente01.setIdade(20);
    cliente01.setNome("Aldrin");

    Cliente cliente02 = new Cliente();

    cliente02.setIdade(50);
    cliente02.setNome("Fulano");

    Cliente cliente03 = new Cliente();

    cliente03.setIdade(33);
    cliente03.setNome("Ciclano");

    Mesa mesa01 = new Mesa();
    listaPedido.add("Pedido do aldrin");
    mesa01.setListaPedido(listaPedido);
    System.out.println(mesa01.toString());
  }

}