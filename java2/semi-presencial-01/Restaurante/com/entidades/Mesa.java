package com.entidades;

import java.util.List;

public class Mesa {
  private int numero;
  private Cliente nome;
  private List<String> listaPedido;
  private double faturamento;

  public Mesa() {

  }

  public int getNumero() {
    return numero;
  }

  public void setNumero(int numero) {
    this.numero = numero;
  }

  public Cliente getNome() {
    return nome;
  }

  public void setNome(Cliente nome) {
    this.nome = nome;
  }

  public double getFaturamento() {
    return faturamento;
  }

  public void setFaturamento(double faturamento) {
    this.faturamento = faturamento;
  }

  public List<String> getListaPedido() {
    return listaPedido;
  }

  public void setListaPedido(List<String> listaPedido) {
    this.listaPedido = listaPedido;
  }

  public String toString() {
    return "Pedido completo do: " + nome + "\nLista do que foi pedido: " + listaPedido + "\n Valor total do pedido: "
        + faturamento;
  }
}
