public class LeadBO {

    public static void criarTarefa(List<Lead> lstLeadQueVemDaTrigger){

        // Boa pratica #2 > Inserir ou atualizar sempre LISTAS
        List<Task> tarefasParaAdicionar = new List<Task>(); 

        // Data Manipulation Language
        // Update, Insert, Upsert, Delete

        for(Lead itemLead : lstLeadQueVemDaTrigger){
            Task novaTarefa         = new Task();
            novaTarefa.Subject         = 'Marcar Reunião com ' + itemLead.FirstName;
            novaTarefa.Status         = 'Não iniciado';
            novaTarefa.OwnerId       = itemLead.OwnerId;
            novaTarefa.WhoId         = itemLead.Id;

            tarefasParaAdicionar.add( novaTarefa ); 
        }

        // 1 Ação de DML 
        if(!tarefasParaAdicionar.IsEmpty()){
            insert tarefasParaAdicionar; 
        }

    }
}