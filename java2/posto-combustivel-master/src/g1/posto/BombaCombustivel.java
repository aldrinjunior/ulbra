/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package g1.posto;

/**
 *
 * @author Aluno
 */
public class BombaCombustivel {
    
    private int numeroBomba;
    private String tipoDeCombustivel;
    private double valorPorLitro;
    private double quantidadeDeCombustivel;
    
    public BombaCombustivel(){
        
    };
    
    public BombaCombustivel(int numero, String tipo, double valor, double quantidade){
        numeroBomba = numero;
        tipoDeCombustivel = tipo;
        valorPorLitro = valor;
        quantidadeDeCombustivel = quantidade;
    }
    
    public void setTipoDeCombustivel(String tipo){
        this.tipoDeCombustivel = tipo;
    }
    
    public void setValorPorLitro(double novoValor, int numero){
        this.valorPorLitro = novoValor;
    }
    
    public double getQtCombustivel(){
        return this.quantidadeDeCombustivel;
    }
    
    public double abastecerPorValor(double valor){
        double litros = 0;
        if(valor < 0){
            litros = 0;
        }else if((valor/this.valorPorLitro) > this.quantidadeDeCombustivel){
            litros = 0;
        }
        else {
            litros = valor/this.valorPorLitro;            
        }
        
        this.quantidadeDeCombustivel = this.quantidadeDeCombustivel - litros;
        
        return litros;
    }
    
    public double abastecerPorLitro(double litros){
        double valorAbastecido = 0;
        
        if(litros < 0){
            valorAbastecido = 0;
        }else if(litros > this.quantidadeDeCombustivel){
            valorAbastecido = 0;
        }
        else{
            valorAbastecido = litros * this.valorPorLitro;
        }
        
        this.quantidadeDeCombustivel = this.quantidadeDeCombustivel - litros;
        
        return valorAbastecido;
    }
    
}