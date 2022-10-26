import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.InetSocketAddress;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.List;
import java.util.Scanner;

import com.sun.net.httpserver.Headers;
import com.sun.net.httpserver.HttpExchange;
import com.sun.net.httpserver.HttpHandler;
import com.sun.net.httpserver.HttpServer;

public class Server {

  public static void main(String[] args) throws Exception {
    HttpServer server = HttpServer.create(new InetSocketAddress(8000), 0);
    server.createContext("/test", new Handler());
    server.setExecutor(null); // creates a default executor
    server.start();
    System.out.println("Server started");
}

  static class Handler implements HttpHandler {
      @Override
      public void handle(HttpExchange exchange) throws IOException {
        String method = exchange.getRequestMethod();
        System.out.println(method + " " + exchange.getRequestURI());

        if (method.equals("GET")) {
          File file = new File("./post.html");
          byte[] body = Files.readAllBytes(file.toPath());

          exchange.sendResponseHeaders(200, body.length);
          OutputStream os = exchange.getResponseBody();
          os.write(body);
          os.flush();
          os.close();

        } else if (method.equals("POST")) {
          // Headers headers = exchange.getRequestHeaders();
          // System.out.println(headers.get("content-type"));
          // String boundary = headers.get("content-type").get(0).split(" ")[1].split("=")[1];
          // System.out.println(boundary);
         
          InputStream is = exchange.getRequestBody();

          File targetFile = new File("./test.json");
          Files.copy(is, targetFile.toPath(), StandardCopyOption.REPLACE_EXISTING);
          
          File file = new File("./success.html");
          byte[] body = Files.readAllBytes(file.toPath());

          exchange.sendResponseHeaders(201, body.length);
          OutputStream os = exchange.getResponseBody();
          os.write(body);
          os.flush();
          os.close();
        }
      }
  }
}
