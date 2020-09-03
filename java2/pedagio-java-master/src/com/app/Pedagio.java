/*
 * Trabalho T1G2
 * Pédagio - Freeway
 * Maicon Esperafico
 * Carlos Kasper
 */
package com.app;

import java.util.Scanner;

/*
* Classe Principal
* Pedagio
*/
public class Pedagio extends Veiculo {

    private static Carro[] novoCarro    = new Carro[9999];
    private static Moto[]  novaMoto     = new Moto[9999];
    
    public static void main(String[] args) {
        System.out.println("Bem vindo ao Pedágio \n");
        // Chama método mostraMenu
        mostraMenuPrincipal();
    }

    private static void mostraMenuPrincipal() {
        boolean sair = true;

        Scanner Menu = new Scanner(System.in);
        
        while (sair) {
            int menu;
            System.out.println("\nEscolha a sua opção desejada:");

            do {
                System.out.println("1 – Saldo de Veículo"); 
                System.out.println("2 – Cancela Automática");
                System.out.println("3 – Recarga de Veículo");
                System.out.println("4 – Cadastro de Veículo");
                System.out.println("99 - Sair do programa.");

                menu = Menu.nextInt();
            
                if (menu < 1 || (menu > 4 && menu != 99)) {
                    System.out.println("Opção Inválida, tente novamente.");
                }

            } while (menu < 1 || (menu > 4 && menu != 99));
            
            // Menu
            switch (menu) {
                case 1: // Saldo de Veículo
                    saldoVeiculo();
                    break;
                case 2: // Cancela Automática
                    cancelaAutomatica();
                    break;
                case 3: // Recarga de Veículo
                    recargaVeiculo();
                    break;
                case 4: // Cadastro de Veículo
                    cadastraVeiculo();
                    break;
                case 99: // Cancelar
                    System.out.println("Obrigado por utulizar nosso pedágio.");
                    System.exit(0);
            }
        }
    }
    
    private static void saldoVeiculo() {
        Scanner entrada = new Scanner(System.in);
        
        // Obtem os dados para o veículo.
        String  placa;
        System.out.println("\nInforme a placa:");
        placa = entrada.nextLine();
        
        for (Carro novoCarro1 : novoCarro) {
            /* Verifica se já tem um veículo cadastrado com a placa.
             */
            if (novoCarro1 != null && novoCarro1.getPlaca().equals(placa)) {
                System.out.println("\nSaldo:" + novoCarro1.verSaldo());
                System.out.println("Passagens:" + novoCarro1.getPassagens() + "\n");
                return;
            }
        }
        
        for (Moto novaMoto1 : novaMoto) {
            /* Verifica se já tem um veículo cadastrado com a placa.
             */
            if (novaMoto1 != null && novaMoto1.getPlaca().equals(placa)) {
                System.out.println("\nSaldo:" + novaMoto1.verSaldo());
                System.out.println("Passagens:" + novaMoto1.getPassagens() + "\n");
                return;
            }
        }
        
        System.out.println("Nenhum veículo encontrado!");
    }
    
    private static void cancelaAutomatica() {
        Scanner entrada = new Scanner(System.in);
        
        // Obtem os dados para o veículo.
        String  placa;
        System.out.println("\nInforme a placa:");
        placa = entrada.nextLine();
        
        for (Carro novoCarro1 : novoCarro) {
            /* Verifica se já tem um veículo cadastrado com a placa.
             */
            if (novoCarro1 != null && novoCarro1.getPlaca().equals(placa)) {
                if(novoCarro1.verSaldo() > novoCarro1.getTarifa()) {
                    float saldo = novoCarro1.verSaldo() - novoCarro1.getTarifa();
                    novoCarro1.setSaldo(saldo);
                    novoCarro1.setPassagens(novoCarro1.getPassagens()+1);
                    return; 
                }
                System.out.println("NÃO HÁ SALDO SUFICIENTE!");
                return;
            }
        }
        
        for (Moto novaMoto1 : novaMoto) {
            /* Verifica se já tem um veículo cadastrado com a placa.
             */
            if(novaMoto1.verSaldo() > novaMoto1.getTarifa()) {
                float saldo = novaMoto1.verSaldo() - novaMoto1.getTarifa();
                novaMoto1.setSaldo(saldo);
                novaMoto1.setPassagens(novaMoto1.getPassagens()+1);
                return; 
            }
            System.out.println("NÃO HÁ SALDO SUFICIENTE!");
            return;
        }
        
        System.out.println("Nenhum veículo encontrado!");
    }
    
    private static void recargaVeiculo() {
        Scanner entrada = new Scanner(System.in);
        
        // Obtem os dados para o veículo.
        String  placa;
        float  regarga;
        System.out.println("\nInforme a placa:");
        placa = entrada.nextLine();
        
        for (Carro novoCarro1 : novoCarro) {
            /* Verifica se já tem um veículo cadastrado com a placa.
             */
            if (novoCarro1 != null && novoCarro1.getPlaca().equals(placa)) {
                System.out.println("\nInforme o valor de recarga:");
                regarga = entrada.nextInt();
                novoCarro1.setSaldo(regarga);
                return;
            }
        }
        
        for (Moto novaMoto1 : novaMoto) {
            /* Verifica se já tem um veículo cadastrado com a placa.
             */
            if (novaMoto1 != null && novaMoto1.getPlaca().equals(placa)) {
                System.out.println("\nInforme o valor de recarga:");
                regarga = entrada.nextInt();
                novaMoto1.setSaldo(regarga);
                return;
            }
        }
        
        System.out.println("Nenhum veículo encontrado!");
    }
    
    private static void cadastraVeiculo() {
        Scanner entrada = new Scanner(System.in);
        
        // Obtem os dados para o veículo.
        String  placa;
        int     passagens = 0;
        float   saldo = 0;
        
        System.out.println("Cadastrando novo veículo.");
        
        boolean sair = true;

        Scanner Menu = new Scanner(System.in);
        
        while (sair) {
            int menu;
            System.out.println("\nInforme o tipo de veículo:");

            do {
                System.out.println("1 – Carro"); 
                System.out.println("2 – Moto");

                menu = Menu.nextInt();
            
                if (menu < 1 || menu > 2) {
                    System.out.println("Opção Inválida, tente novamente.");
                }

            } while (menu < 1 || menu > 2);
            
            // Menu Veiculo
            switch (menu) {
                case 1: // Cadastra Carro
                    System.out.println("\nInforme a placa:");
                    placa = entrada.nextLine();
        
                    for(int i = 0; i < novoCarro.length; i++) {
                        /* Verifica se já tem um veículo cadastrado com a placa.
                         * Caso exista retorna mensagem de veículo já cadastrado.
                         */
                        if(novoCarro[i] != null && novoCarro[i].getPlaca().equals(placa)) {
                            System.out.println("\nVeículo já cadastrado!\n");
                            return;
                        }
                        /* Cria um novo veiculo.
                         * Verifica se o valor do array é nulo, então aloca.
                         */
                        if(novoCarro[i] == null) {
                            novoCarro[i] = new Carro(placa, passagens, saldo);
                            System.out.println("\nVeículo cadastrado com sucesso!\n");
                            System.out.println("Placa: " + novoCarro[i].getPlaca());
                            break;
                        }
                    }
                    break;
                case 2: // Cadastra Moto
                    System.out.println("\nInforme a placa:");
                    placa = entrada.nextLine();
                    for(int i = 0; i < novaMoto.length; i++) {
                        /* Verifica se já tem um veículo cadastrado com a placa.
                         * Caso exista retorna mensagem de veículo já cadastrado.
                         */
                        if(novaMoto[i] != null && novaMoto[i].getPlaca().equals(placa)) {
                            System.out.println("\nVeículo já cadastrado!\n");
                            return;
                        }
                        /* Cria um novo veiculo.
                         * Verifica se o valor do array é nulo, então aloca.
                         */
                        if(novaMoto[i] == null) {
                            novaMoto[i] = new Moto(placa, passagens, saldo);
                            System.out.println("\nVeículo cadastrado com sucesso!\n");
                            System.out.println("Placa: " + novaMoto[i].getPlaca());
                            break;
                        }
                    }
                    break;
            }
            sair = false;
        }
    }
    
}