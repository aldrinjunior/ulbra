package com.app;

/*
* Classe Carro
* @params
*/
public class Carro extends Veiculo {
    
    private static float tarifa = (float) 3.50;
    
    // Construtor padrão
    public Carro() {

    }

    // Construtor
    public Carro(String placa, int passagens, float saldo) {
        this.placa = placa;
        this.passagens = passagens;
        this.saldo = saldo;
    }

    public float getTarifa() {
        return this.tarifa;
    }
}
