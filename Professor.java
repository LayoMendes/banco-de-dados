public class Professor extends Pessoa{
    private int idProfessor;

    public Professor(){
        this("",0,0l,0);
    }

    public Professor(String nome, int idade, long cpf, int idProfessor){
        super(nome, idade, cpf);
        setIdProfessor(idProfessor);
    }

    public int getIdProfessor(){
        return this.idProfessor;
    }

    public void setIdProfessor(int idProfessor){
        this.idProfessor = idProfessor;
    }

    public String toString(){
        return super.toString() + " Id Professor: " + getIdProfessor();
    }
}