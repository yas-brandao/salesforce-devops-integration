@isTest
private class ChangeRequestAPITest {

    @isTest static void testGetChange() {
        // Criar registro teste
        ChangeRequest__c cr = new ChangeRequest__c(Name = 'Teste CR', Status__c = 'Open');
        insert cr;

        // Montar requisição REST simulada
        RestRequest req = new RestRequest();
        RestResponse res = new RestResponse();
        req.requestUri = '/services/apexrest/changerequests/' + cr.Id;
        req.httpMethod = 'GET';
        RestContext.request = req;
        RestContext.response = res;

        // Chamar método GET
        ChangeRequest__c result = ChangeRequestAPI.getChange();

        System.assertEquals(cr.Id, result.Id);
        System.assertEquals('Open', result.Status__c);
    }

    @isTest static void testCreateChange() {
        ChangeRequest__c newCR = new ChangeRequest__c(Name = 'Nova Mudança', Status__c = 'New');

        Test.startTest();
        String newId = ChangeRequestAPI.createChange(newCR);
        Test.stopTest();

        ChangeRequest__c insertedCR = [SELECT Id, Name, Status__c FROM ChangeRequest__c WHERE Id = :newId];
        System.assertEquals('Nova Mudança', insertedCR.Name);
        System.assertEquals('New', insertedCR.Status__c);
    }
}
