//  This file was automatically generated and should not be edited.

import Apollo

/// The episodes in the Star Wars trilogy
public enum Episode: String {
  case newhope = "NEWHOPE" /// Star Wars Episode IV: A New Hope, released in 1977.
  case empire = "EMPIRE" /// Star Wars Episode V: The Empire Strikes Back, released in 1980.
  case jedi = "JEDI" /// Star Wars Episode VI: Return of the Jedi, released in 1983.
}

extension Episode: JSONDecodable, JSONEncodable {}

public final class HeroAndFriendsQuery: GraphQLQuery {
  public static let operationDefinition =
    "query HeroAndFriends($episode: Episode) {" +
    "  hero(episode: $episode) {" +
    "    __typename" +
    "    name" +
    "    ... on Droid {" +
    "      appearsIn" +
    "    }" +
    "    ...HeroDetails" +
    "    friends {" +
    "      __typename" +
    "      name" +
    "      ...HeroDetails" +
    "    }" +
    "  }" +
    "}"
  public static let queryDocument = operationDefinition.appending(HeroDetails.fragmentDefinition)

  public let episode: Episode?

  public init(episode: Episode? = nil) {
    self.episode = episode
  }

  public var variables: GraphQLMap? {
    return ["episode": episode]
  }

  public struct Data: GraphQLMappable {
    public let hero: Hero?

    public init(reader: GraphQLResultReader) throws {
      hero = try reader.optionalValue(for: Field(responseName: "hero", arguments: ["episode": reader.variables["episode"]]))
    }

    public struct Hero: GraphQLMappable {
      public let __typename: String
      public let name: String
      public let friends: [Friend?]?

      public let fragments: Fragments

      public let asDroid: AsDroid?

      public init(reader: GraphQLResultReader) throws {
        __typename = try reader.value(for: Field(responseName: "__typename"))
        name = try reader.value(for: Field(responseName: "name"))
        friends = try reader.optionalList(for: Field(responseName: "friends"))

        let heroDetails = try HeroDetails(reader: reader)
        fragments = Fragments(heroDetails: heroDetails)

        asDroid = try AsDroid(reader: reader, ifTypeMatches: __typename)
      }

      public struct Fragments {
        public let heroDetails: HeroDetails
      }

      public struct AsDroid: GraphQLConditionalFragment {
        public static let possibleTypes = ["Droid"]

        public let __typename = "Droid"
        public let name: String
        public let appearsIn: [Episode?]
        public let friends: [Friend?]?

        public let fragments: Fragments

        public init(reader: GraphQLResultReader) throws {
          name = try reader.value(for: Field(responseName: "name"))
          appearsIn = try reader.list(for: Field(responseName: "appearsIn"))
          friends = try reader.optionalList(for: Field(responseName: "friends"))

          let heroDetails = try HeroDetails(reader: reader)
          fragments = Fragments(heroDetails: heroDetails)
        }

        public struct Fragments {
          public let heroDetails: HeroDetails
        }

        public struct Friend: GraphQLMappable {
          public let __typename: String
          public let name: String

          public let fragments: Fragments

          public init(reader: GraphQLResultReader) throws {
            __typename = try reader.value(for: Field(responseName: "__typename"))
            name = try reader.value(for: Field(responseName: "name"))

            let heroDetails = try HeroDetails(reader: reader)
            fragments = Fragments(heroDetails: heroDetails)
          }

          public struct Fragments {
            public let heroDetails: HeroDetails
          }
        }
      }

      public struct Friend: GraphQLMappable {
        public let __typename: String
        public let name: String

        public let fragments: Fragments

        public init(reader: GraphQLResultReader) throws {
          __typename = try reader.value(for: Field(responseName: "__typename"))
          name = try reader.value(for: Field(responseName: "name"))

          let heroDetails = try HeroDetails(reader: reader)
          fragments = Fragments(heroDetails: heroDetails)
        }

        public struct Fragments {
          public let heroDetails: HeroDetails
        }
      }
    }
  }
}

public final class HeroNameQuery: GraphQLQuery {
  public static let operationDefinition =
    "query HeroName {" +
    "  hero {" +
    "    __typename" +
    "    name" +
    "  }" +
    "}"
  public init() {
  }

  public struct Data: GraphQLMappable {
    public let hero: Hero?

    public init(reader: GraphQLResultReader) throws {
      hero = try reader.optionalValue(for: Field(responseName: "hero"))
    }

    public struct Hero: GraphQLMappable {
      public let __typename: String
      public let name: String

      public init(reader: GraphQLResultReader) throws {
        __typename = try reader.value(for: Field(responseName: "__typename"))
        name = try reader.value(for: Field(responseName: "name"))
      }
    }
  }
}

public final class TwoHeroesQuery: GraphQLQuery {
  public static let operationDefinition =
    "query TwoHeroes {" +
    "  r2: hero {" +
    "    __typename" +
    "    name" +
    "  }" +
    "  luke: hero(episode: EMPIRE) {" +
    "    __typename" +
    "    name" +
    "  }" +
    "}"
  public init() {
  }

  public struct Data: GraphQLMappable {
    public let r2: R2?
    public let luke: Luke?

    public init(reader: GraphQLResultReader) throws {
      r2 = try reader.optionalValue(for: Field(responseName: "r2", fieldName: "hero"))
      luke = try reader.optionalValue(for: Field(responseName: "luke", fieldName: "hero", arguments: ["episode": "EMPIRE"]))
    }

    public struct R2: GraphQLMappable {
      public let __typename: String
      public let name: String

      public init(reader: GraphQLResultReader) throws {
        __typename = try reader.value(for: Field(responseName: "__typename"))
        name = try reader.value(for: Field(responseName: "name"))
      }
    }

    public struct Luke: GraphQLMappable {
      public let __typename: String
      public let name: String

      public init(reader: GraphQLResultReader) throws {
        __typename = try reader.value(for: Field(responseName: "__typename"))
        name = try reader.value(for: Field(responseName: "name"))
      }
    }
  }
}

public struct HeroDetails: GraphQLNamedFragment {
  public static let fragmentDefinition =
    "fragment HeroDetails on Character {" +
    "  __typename" +
    "  name" +
    "  ... on Droid {" +
    "    primaryFunction" +
    "  }" +
    "  ... on Human {" +
    "    height" +
    "  }" +
    "}"

  public static let possibleTypes = ["Human", "Droid"]

  public let __typename: String
  public let name: String

  public let asDroid: AsDroid?
  public let asHuman: AsHuman?

  public init(reader: GraphQLResultReader) throws {
    __typename = try reader.value(for: Field(responseName: "__typename"))
    name = try reader.value(for: Field(responseName: "name"))

    asDroid = try AsDroid(reader: reader, ifTypeMatches: __typename)
    asHuman = try AsHuman(reader: reader, ifTypeMatches: __typename)
  }

  public struct AsDroid: GraphQLConditionalFragment {
    public static let possibleTypes = ["Droid"]

    public let __typename = "Droid"
    public let name: String
    public let primaryFunction: String?

    public init(reader: GraphQLResultReader) throws {
      name = try reader.value(for: Field(responseName: "name"))
      primaryFunction = try reader.optionalValue(for: Field(responseName: "primaryFunction"))
    }
  }

  public struct AsHuman: GraphQLConditionalFragment {
    public static let possibleTypes = ["Human"]

    public let __typename = "Human"
    public let name: String
    public let height: Double?

    public init(reader: GraphQLResultReader) throws {
      name = try reader.value(for: Field(responseName: "name"))
      height = try reader.optionalValue(for: Field(responseName: "height"))
    }
  }
}