import java.awt.*;
import javax.swing.*;
import javax.swing.border.EmptyBorder;

public class CorongaApp extends JFrame {

  JLabel title = new JLabel("Vamos avaliar como está a sua saúde mental nesse periodo de isolamento");
  JLabel userData = new JLabel("Digite os seus dados a baixo e responda as perguntas");

  JLabel userName = new JLabel("Nome");
  JTextField userNameInput = new JTextField();

  JLabel userAge = new JLabel("Idade");
  JTextField userAgeInput = new JTextField();

  JLabel depression = new JLabel("Você já tem ou teve algum quadro de depressão");
  String[] depressionChoises = { "Sim", "Não", "Não tenho certeza" };
  final JComboBox<String> comboBoxDepression = new JComboBox<String>(depressionChoises);

  JLabel careHealth = new JLabel(
      "Você e sua família estão seguindo o isolamento social e os cuidados para prevenção ?");
  String[] careHealthChoises = { "Sim", "Não", "Mais ou menos" };
  final JComboBox<String> comboBoxCareHealth = new JComboBox<String>(careHealthChoises);

  JLabel mentalHealth = new JLabel("Como você considera a sua saúde mental durante esse periodo de isolamento ? ");
  String[] mentalHealthChoises = { "Crises de ansiedade", "Estresse intenso", "Tranquilo", "Muito Tranquilo" };
  final JComboBox<String> comboBoxMentalHealth = new JComboBox<String>(mentalHealthChoises);

  JLabel onlineContacts = new JLabel("Você está mantendo contato online com as pessoas ? ");
  String[] onlineContactsChoises = { "Sim, através de grupos de what's app ou redes sociais", "Nenhum pouco",
      "Sou youtuber, faço altas lives" };
  final JComboBox<String> comboBoxOnlineContacts = new JComboBox<String>(onlineContactsChoises);

  JLabel sendForm = new JLabel("Clique em enviar para avaliarmos a sua saúde mental");
  JButton sendButton = new JButton("Enviar");

  public CorongaApp() {
    setLayout(new GridLayout(33, 5));
    JPanel panel = new JPanel();
    panel.setBorder(new EmptyBorder(30, 30, 30, 30));

    Container container = getContentPane();
    setTitle("Questionário sobre saúde mental na pandemia");
    container.add(title);
    container.add(userData);
    container.add(userName);
    container.add(userNameInput);
    container.add(userAge);
    container.add(userAgeInput);

    container.add(depression);
    container.add(comboBoxDepression);

    container.add(careHealth);
    container.add(comboBoxCareHealth);

    container.add(mentalHealth);
    container.add(comboBoxMentalHealth);

    container.add(onlineContacts);
    container.add(comboBoxOnlineContacts);

    container.add(sendForm);
    container.add(sendButton);

    setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
    setVisible(true);
  }

}