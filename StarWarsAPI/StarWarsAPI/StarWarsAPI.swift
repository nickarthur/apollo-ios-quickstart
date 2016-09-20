//  This file was automatically generated and should not be edited.

import Apollo

/// The episodes in the Star Wars trilogy
public enum Episode: String {
  case newhope = "NEWHOPE" /// Star Wars Episode IV: A New Hope, released in 1977.
  case empire = "EMPIRE" /// Star Wars Episode V: The Empire Strikes Back, released in 1980.
  case jedi = "JEDI" /// Star Wars Episode VI: Return of the Jedi, released in 1983.
}

extension Episode: JSONDecodable, JSONEncodable {}

public class HeroAndFriendsQuery: GraphQLQuery {
  public let episode: Episode?
  
  public init(episode: Episode?) {
    self.episode = episode
  }
  
  public let operationDefinition =
    "query HeroAndFriends($episode: Episode) {" +
    "  hero(episode: $episode) {" +
    "    name" +
    "    appearsIn" +
    "    friends {" +
    "      name" +
    "    }" +
    "  }" +
    "}"
  
  public var variables: GraphQLMap? {
    return ["episode": episode]
  }
  
  public struct Data: GraphQLMapConvertible {
    public let hero: Hero?
    
    public init(map: GraphQLMap) throws {
      hero = try map.value(forKey: "hero")
    }
    
    public struct Hero: GraphQLMapConvertible {
      public let name: String
      public let appearsIn: [Episode?]
      public let friends: [Friend?]?
      
      public init(map: GraphQLMap) throws {
        name = try map.value(forKey: "name")
        appearsIn = try map.list(forKey: "appearsIn")
        friends = try map.list(forKey: "friends")
      }
      
      public struct Friend: GraphQLMapConvertible {
        public let name: String
        
        public init(map: GraphQLMap) throws {
          name = try map.value(forKey: "name")
        }
      }
    }
  }
}

public class HeroNameQuery: GraphQLQuery {
  public init() {}
  
  public let operationDefinition =
    "query HeroName {" +
    "  hero {" +
    "    name" +
    "  }" +
    "}"
  
  public struct Data: GraphQLMapConvertible {
    public let hero: Hero?
    
    public init(map: GraphQLMap) throws {
      hero = try map.value(forKey: "hero")
    }
    
    public struct Hero: GraphQLMapConvertible {
      public let name: String
      
      public init(map: GraphQLMap) throws {
        name = try map.value(forKey: "name")
      }
    }
  }
}

public class TwoHeroesQuery: GraphQLQuery {
  public init() {}
  
  public let operationDefinition =
    "query TwoHeroes {" +
    "  r2: hero {" +
    "    name" +
    "  }" +
    "  luke: hero(episode: EMPIRE) {" +
    "    name" +
    "  }" +
    "}"
  
  public struct Data: GraphQLMapConvertible {
    public let r2: R2?
    public let luke: Luke?
    
    public init(map: GraphQLMap) throws {
      r2 = try map.value(forKey: "r2")
      luke = try map.value(forKey: "luke")
    }
    
    public struct R2: GraphQLMapConvertible {
      public let name: String
      
      public init(map: GraphQLMap) throws {
        name = try map.value(forKey: "name")
      }
    }
    
    public struct Luke: GraphQLMapConvertible {
      public let name: String
      
      public init(map: GraphQLMap) throws {
        name = try map.value(forKey: "name")
      }
    }
  }
}
