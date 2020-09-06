package com.funcionario;

public class Funcionario {

  private String nome;
  private double valorHora;
  private int horas;

  // public Funcionario(String n, double v, int h) {
  // nome = n;
  // valorHora = v;
  // horas = h;
  // }

  public Funcionario() {

  }

  public String getNome() {
    return nome;
  }

  public void setNome(String n) {
    nome = n;
  }

  public double getValorHora() {
    return valorHora;
  }

  public void setValorHora(double v) {
    valorHora = v;
  }

  public int getHoras() {
    return horas;
  }

  public void setHoras(int h) {
    horas = h;
  }

  public String toString() {
    return "Funcionário: " + nome + "\nValor da hora: " + valorHora + "\n Quantidade de horas de trabalho: " + horas;
  }

  public double calculaSalario() {
    double salario = horas * 4.5 * valorHora;
    return salario;
  }
}