# Apollo iOS Quickstart

A sample Xcode project to quickly get started with [Apollo iOS](https://github.com/apollostack/apollo-ios).

It currently only generates code for a subset of GraphQL queries. Most importantly, fragments and mutations are not yet supported.

## Installation

This project requires Xcode 8, which you can install from the [Mac App Store](https://itunes.apple.com/en/app/xcode/id497799835?mt=12).

You will also have to install the `apollo-codegen` command globally through npm:

```sh
npm install apollo-codegen -g
```

To clone the Git repository to your local machine:

```sh
git clone --recursive git://github.com/apollostack/apollo-ios-quickstart.git
cd apollo-ios-quickstart
```

You can then open `ApolloQuickstart.xcodeproj`.

In order to run `ApolloQuickstartAPI.playground`, you will first have to build the `ApolloQuickstartAPI` target.

You will also have to rebuild the target after making changes to `.graphql` files or `schema.json`.

To download a GraphQL schema by sending an introspection query to a server:

```sh
apollo-codegen download-schema http://localhost:8080/graphql --output ApolloQuickstartAPI/Definitions/schema.json
```
