namespace AulaClassroomEF.Models {
    public class Person {

        //incializar construtores
        public Person() //o EF precisa de um construtor vazio para trabalhar alguamas coisas
        {
        }

        public Person (int id, string name, string address) {
            this.id = id;
            this.name = name;
            this.address = address;

        }
        public int id { get; set; }

        public string name { get; set; }

        public string address { get; set; }

    }
}