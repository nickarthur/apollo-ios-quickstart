//  This file was automatically generated and should not be edited.

import Apollo

public class AllPostsQuery: GraphQLQuery {
  public init() {}
  
  public let operationDefinition =
    "query allPosts {" +
    "  posts {" +
    "    id" +
    "    title" +
    "    votes" +
    "    author {" +
    "      id" +
    "      firstName" +
    "      lastName" +
    "    }" +
    "  }" +
    "}"
  
  public struct Data: GraphQLMapConvertible {
    public let posts: [Posts]
    
    public init(map: GraphQLMap) throws {
      posts = try map.list(forKey: "posts")
    }
    
    public struct Posts: GraphQLMapConvertible {
      public let id: Int
      public let title: String?
      public let votes: Int?
      public let author: Author?
      
      public init(map: GraphQLMap) throws {
        id = try map.value(forKey: "id")
        title = try map.value(forKey: "title")
        votes = try map.value(forKey: "votes")
        author = try map.value(forKey: "author")
      }
      
      public struct Author: GraphQLMapConvertible {
        public let id: Int
        public let firstName: String?
        public let lastName: String?
        
        public init(map: GraphQLMap) throws {
          id = try map.value(forKey: "id")
          firstName = try map.value(forKey: "firstName")
          lastName = try map.value(forKey: "lastName")
        }
      }
    }
  }
}
