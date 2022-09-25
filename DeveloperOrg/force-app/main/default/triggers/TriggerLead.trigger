trigger TriggerLead on Lead (after insert, before insert, after update, before update){

    if(Trigger.IsInsert){
        if(Trigger.IsAfter){
           LeadBO.criarTarefa(Trigger.new);
        }
    }else if(Trigger.IsUpdate){
           if(Trigger.IsBefore){
            for(Lead itemLead : Trigger.new){
                itemLead.MobilePhone = LeadBO.formataTelefone(itemLead);
            }
        }
    }


   // PESSIMA PRATICA > ID FIXO NO CODIGO
}