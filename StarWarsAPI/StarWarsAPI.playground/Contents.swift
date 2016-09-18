import PlaygroundSupport
import Apollo
import StarWarsAPI

PlaygroundPage.current.needsIndefiniteExecution = true

let client = ApolloClient(url: URL(string: "http://localhost:8080/graphql")!)

client.fetch(query: HeroAndFriendsQuery(episode: .jedi)) { (result, error) in
  defer { PlaygroundPage.current.finishExecution() }
  
  if let error = error { NSLog("Error while fetching query: \(error.localizedDescription)");  return }
  guard let result = result else { NSLog("No query result");  return }
  
  if let errors = result.errors {
    NSLog("Errors in query result: \(errors)")
  }
  
  guard let data = result.data else { NSLog("No query result data");  return }
  
  data.hero?.name
  
  data.hero?.appearsIn
  
  let friendsNames = data.hero?.friends?.flatMap { $0?.name }
  friendsNames
}
