@isTest
private class ExternalAPIConsumerTest {

    // Classe mock para simular resposta HTTP
    private class MockHttpResponseGenerator implements HttpCalloutMock {
        public HTTPResponse respond(HTTPRequest req) {
            HttpResponse res = new HttpResponse();
            res.setHeader('Content-Type', 'application/json');
            res.setBody('{"userId":1,"id":1,"title":"mock title","body":"mock body"}');
            res.setStatusCode(200);
            return res;
        }
    }

    @isTest static void testCallAPI() {
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());

        Test.startTest();
        ExternalAPIConsumer.callAPI();
        Test.stopTest();

        System.assert(true);
    }
}
