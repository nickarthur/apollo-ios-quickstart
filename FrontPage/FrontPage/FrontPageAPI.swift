//  This file was automatically generated and should not be edited.

import Apollo

public final class AllPostsQuery: GraphQLQuery {
  public static let operationDefinition =
    "query allPosts {" +
    "  posts {" +
    "    ...PostDetails" +
    "  }" +
    "}"
  public static let queryDocument = operationDefinition.appending(PostDetailsFragment.fragmentDefinition).appending(AuthorDetailsFragment.fragmentDefinition)

  public struct Data: GraphQLMapConvertible {
    public let posts: [Post]

    public init(map: GraphQLMap) throws {
      posts = try map.list(forKey: "posts")
    }

    public struct Post: GraphQLMapConvertible, PostDetails {
      public let id: Int
      public let title: String?
      public let votes: Int?
      public let author: Author?

      public init(map: GraphQLMap) throws {
        id = try map.value(forKey: "id")
        title = try map.optionalValue(forKey: "title")
        votes = try map.optionalValue(forKey: "votes")
        author = try map.optionalValue(forKey: "author")
      }

      public struct Author: GraphQLMapConvertible, AuthorDetails {
        public let id: Int
        public let firstName: String?
        public let lastName: String?

        public init(map: GraphQLMap) throws {
          id = try map.value(forKey: "id")
          firstName = try map.optionalValue(forKey: "firstName")
          lastName = try map.optionalValue(forKey: "lastName")
        }
      }
    }
  }
}

public final class PostDetailsFragment: GraphQLFragment {
  public static let fragmentDefinition =
    "fragment PostDetails on Post {" +
    "  id" +
    "  title" +
    "  votes" +
    "  author {" +
    "    ...AuthorDetails" +
    "  }" +
    "}"

  public typealias Data = PostDetails
}

public protocol PostDetails {
  var id: Int { get }
  var title: String? { get }
  var votes: Int? { get }
  var author: PostDetails_Author? { get }
}

public protocol PostDetails_Author {
  var id: Int { get }
  var firstName: String? { get }
  var lastName: String? { get }
}

public final class AuthorDetailsFragment: GraphQLFragment {
  public static let fragmentDefinition =
    "fragment AuthorDetails on Author {" +
    "  id" +
    "  firstName" +
    "  lastName" +
    "}"

  public typealias Data = AuthorDetails
}

public protocol AuthorDetails {
  var id: Int { get }
  var firstName: String? { get }
  var lastName: String? { get }
}