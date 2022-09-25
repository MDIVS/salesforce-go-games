public class MinhaPrimeiraPaginaController {
    public List<Account> lstAcc {get;set;}
    
    public Integer minhaIdade {get;set;}
    public Decimal minhaAltura {get;set;}
    public Boolean choveuHoje {get;set;}
    public String meuNome {get;set;}
    public String sobrenome {get;set;}
    public String nomeCompleto {get;set;}
    
    
    public MinhaPrimeiraPaginaController() {
        minhaIdade = 19;
        minhaAltura = 1.83;
        choveuHoje = true;
        meuNome = 'Maicon';
        sobrenome = 'Douglas';
        nomeCompleto = meuNome+' '+sobrenome;
        
        lstAcc = new List<Account>();
        lstAcc = [SELECT Id, Name, Industry FROM Account LIMIT 10];
    }
}