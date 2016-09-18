import PlaygroundSupport
import Apollo
import MyAPI

PlaygroundPage.current.needsIndefiniteExecution = true

let configuration = URLSessionConfiguration.default
// Add additional headers as needed
// configuration.httpAdditionalHeaders = ["Authorization": "Bearer <token>"]

// Change to your server endpoint
let url = URL(string: "http://localhost:8080/graphql")!

let client = ApolloClient(networkTransport: HTTPNetworkTransport(url: url, configuration: configuration))

client.fetch(query: Query()) { (result, error) in
  defer { PlaygroundPage.current.finishExecution() }
  
  if let error = error { NSLog("Error while fetching query: \(error.localizedDescription)");  return }
  guard let result = result else { NSLog("No query result");  return }
  
  if let errors = result.errors {
    NSLog("Errors in query result: \(errors)")
  }
  
  guard let data = result.data else { NSLog("No query result data");  return }
  
  data
}
