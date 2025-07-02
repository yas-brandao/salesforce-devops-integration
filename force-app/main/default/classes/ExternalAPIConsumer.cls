public class ExternalAPIConsumer {
    public static void callAPI() {
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://jsonplaceholder.typicode.com/posts/1');
        req.setMethod('GET');
        HttpResponse res = http.send(req);
        System.debug('Resposta: ' + res.getBody());
    }
}
