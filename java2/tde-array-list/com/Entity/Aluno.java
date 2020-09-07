package com.Entity;

public class Aluno {
  private String nome;

  public String getNome(String procurarNomeAluno) {
    return nome;
  }

  public void setnome(String nome) {
    this.nome = nome;
  }

  public boolean equals(Object o) {
    Aluno outro = (Aluno) o;
    return this.nome.equals(outro.nome);
  }

  public String toString() {
    return "Aluno:" + nome;
  }

}
