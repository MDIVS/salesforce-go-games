trigger CriaContratoConta on Account (after insert) {
    Account contaSendoAtualizada = Trigger.new[0];
    
    Contract meuNovoContrato; // = null
    meuNovoContrato = new Contract();
    meuNovoContrato.AccountId = contaSendoAtualizada.Id;
    meuNovoContrato.TipoResidencia__c = 'Não informada';
    
    Datetime agora = System.now(); // 2022-05-19T20:02:30.5555-03:00:00
    Date agoraConvertidoEmDate = Date.newInstance(agora.year(), agora.month(), agora.day()); // 2022-05-19
    
    meuNovoContrato.StartDate = agoraConvertidoEmDate;
    meuNovoContrato.ContractTerm = 12;
    meuNovoContrato.Description = 'O cliente autoriza o uso da sua imagem em nossa marketing.';
	insert meuNovoContrato;
}