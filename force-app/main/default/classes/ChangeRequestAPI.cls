@RestResource(urlMapping='/changerequests/*')
global with sharing class ChangeRequestAPI {

    @HttpGet
    global static ChangeRequest__c getChange() {
        RestRequest req = RestContext.request;
        String recId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        return [SELECT Id, Name, Status__c FROM ChangeRequest__c WHERE Id = :recId];
    }

    @HttpPost
    global static String createChange(ChangeRequest__c newCR) {
        insert newCR;
        return newCR.Id;
    }
}
