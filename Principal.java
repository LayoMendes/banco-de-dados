public class Principal{
    public static void main(String[] args){

        Pessoa obj1 = new Pessoa();
        Pessoa obj2 = new Pessoa("Joaquim", 1);
        Pessoa obj3 = new Pessoa("Cecilia", 2, 777777l);
        Professor objP = new Professor("Rafael", 34, 888888888l, 579);
        Aluno objA = new Aluno("Gabriel", 28, 55555555l, 779);

        System.out.println(obj1.toString());
        System.out.println(obj2.toString());
        System.out.println(obj3.toString());
        System.out.println(objP.toString());
        System.out.println(objA.toString());
    }
}