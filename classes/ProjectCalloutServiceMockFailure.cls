public class ProjectCalloutServiceMockFailure {
   //Implement http mock callout failure here 
   public HttpResponse respond(HttpRequest request)
   {
      HTTPResponse resp = new HTTPResponse();
      resp.setHeader('Content-Type', 'application/json');
      resp.setStatusCode(500);
      return resp;
   }
}