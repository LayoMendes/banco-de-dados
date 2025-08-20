class No<t>{
    private T dado;
    private No<t> nextNo;

    public No(T dado){
        this(dado, null);

    }
    public No(T dado, No<t> no){
        this.dado = dado;
        this.nextNo = no;
    }
    public T getDado(){
        return this.dado;
    }

    public void setDado(T dado){
        this.dado = dado;
    }
}