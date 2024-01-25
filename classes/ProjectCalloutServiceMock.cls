public class ProjectCalloutServiceMock implements HTTPCalloutMock 
{
   //Implement http mock callout here

   public HttpResponse respond(HttpRequest request)
   {
      HTTPResponse resp = new HTTPResponse();
      resp.setHeader('Content-Type', 'application/json');
      resp.setStatusCode(201);
      return resp;
   }
}