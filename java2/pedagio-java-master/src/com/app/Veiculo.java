package com.app;

/*
* Classe Veiculo
* @params String placa
*/
public class Veiculo implements VerCreditos {
    
    protected String    placa;
    protected int       passagens;
    protected float     saldo;
    protected String    tipo;

    // Construtor padrão
    public Veiculo() {

    }

    // Construtor
    public Veiculo(String placa, int passagens, float saldo) {
        this.placa = placa;
        this.passagens = passagens;
        this.saldo = saldo;
    }

    // Getters & Setters
    public String getPlaca() {
        return placa;
    }

    public void setPlaca(String placa) {
        this.placa = placa;
    }
    
    public int getPassagens() {
        return passagens;
    }

    public void setPassagens(int passagens) {
        this.passagens = passagens;
    }
    
    void setSaldo(float saldo) {
        this.saldo = saldo;
    }

    @Override
    public Float verSaldo() {
        return this.saldo;
    }
}
