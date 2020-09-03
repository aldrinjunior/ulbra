/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package g1.posto;
import java.util.Scanner;

/**
 *
 * @author Aluno
 */
public class Posto {
    
    private BombaCombustivel Bomba1 = new BombaCombustivel(1, "V-Power", 3.29, 100);
    private BombaCombustivel Bomba2 = new BombaCombustivel(2, "Comum", 3.21, 100);
    
    public static void main(String[] args) {
        
        Posto Internacional = new Posto();
        Scanner Tipo = new Scanner(System.in);
        Scanner Valor = new Scanner(System.in);
        Scanner Litros = new Scanner(System.in);
        
        int tipoAbastecimento;
        double valorAbastecimento, retornoBomba, numeroLitros;
        
        BombaCombustivel bomba;
        
        mostraMenu();
        
        tipoAbastecimento = Tipo.nextInt();
        bomba = Internacional.escolheBomba();
        
        switch (tipoAbastecimento){
            case 1:
                
                System.out.println("Qual valor a ser abastecido?");
                valorAbastecimento = Valor.nextDouble();
                
                retornoBomba = bomba.abastecerPorValor(valorAbastecimento);
                
                if(retornoBomba == 0){
                    System.out.println("Valor informado inválido ou bomba com combústivel insuficiente.");
                }
                else{
                    System.out.println("Litros abastecidos: " + retornoBomba + ".");
                }
                break;
            case 2:
                System.out.println("Qual a quantidade de litros a serem abastecidos?");
                numeroLitros = Litros.nextDouble();
                retornoBomba = bomba.abastecerPorLitro(numeroLitros);
                if(retornoBomba == 0){
                    System.out.println("Valor informado inválido ou bomba com combústivel insuficiente.");                    
                }
                else{
                    System.out.println("Valor a ser cobrado: R$" + retornoBomba + ".");
                }
                break;
            case 3:
                System.out.println("Operação cancelada com sucesso! Aguardamos seu retorno.");
                System.exit(0);
        }
    }
    
    private static void mostraMenu(){
        System.out.println("Bem vindo ao posto Internacional\n");
        System.out.println("Escolha a sua opção para abastecimento:");
        
        System.out.println("1 - Abastecimento por valor (R$).");
        System.out.println("2 - Abastecimento por quantidade de litros.");
        System.out.println("3 - Cancelar.");
    }
    
    private BombaCombustivel escolheBomba(){
        if(Bomba1.getQtCombustivel() > Bomba2.getQtCombustivel()){
            return Bomba1;
        }
        else{
            return Bomba2;
        }
    }
}