package com.app;

/*
* Classe Moto
* @params 
*/
public class Moto extends Veiculo {

    private static float tarifa = (float) 1.50;
    
    // Construtor padrão
    public Moto() {

    }

    // Construtor
    public Moto(String placa, int passagens, float saldo) {
        this.placa = placa;
        this.passagens = passagens;
        this.saldo = saldo;
    }
    
    public float getTarifa() {
        return this.tarifa;
    }
}
