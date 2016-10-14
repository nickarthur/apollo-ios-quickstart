# Apollo iOS Quickstart

A collection of sample Xcode projects to quickly get started with [Apollo iOS](https://github.com/apollostack/apollo-ios).

These projects have been set up to integrate with [`apollo-codegen`](https://github.com/apollostack/apollo-codegen), which generates query-specific return types from a GraphQL schema and a set of query documents.

## Hello World app

You may also be interested in trying out [Front Page](https://github.com/apollostack/frontpage-ios-app), the iOS version of the simple "Hello World" app that lives on our [developer site](http://dev.apollodata.com).

## Installation

This project requires Xcode 8, which you can install from the [Mac App Store](https://itunes.apple.com/en/app/xcode/id497799835?mt=12).

To clone the Git repository to your local machine, including submodules:

```sh
git clone --recursive https://github.com/apollostack/frontpage-ios-app.git
```

You will also have to install the `apollo-codegen` command globally through npm:

```sh
npm -g install apollo-codegen
```

You can then open `ApolloQuickstart.xcworkspace`, which contains the sample projects and the Apollo iOS dependency.

If you want syntax highlighting for your .graphql files in Xcode, you can install our [Xcode add-ons](https://github.com/apollostack/xcode-apollo).

## Star Wars API playground

The Star Wars API playground runs against [an example GraphQL server](https://github.com/jahewson/graphql-starwars) (see installation instructions there) using the Star Wars data bundled with Facebook's reference implementation, [GraphQL.js](https://github.com/graphql/graphql-js).

Open `StarWarsAPI.playground` to experiment with using typed query results. Pass any of the generated query classes to `client.fetch()` to change which query gets executed.

If you want to run on a device, change `localhost` to your machine's local IP address in the playground.

> You'll have to build the `StarWarsAPI` framework before running the playground, and whenever you make changes to `.graphql` files.

You can use GraphiQL to construct your own queries against the Star Wars API and put these in a new `.graphql` file.

## MyAPI playground – Using your own schema

The MyAPI playground allows you to run queries against your own schema.

You can download a GraphQL schema by sending an introspection query to the server:

```sh
apollo-codegen download-schema http://localhost:8080/graphql --output MyAPI/MyAPI/schema.json
```

If needed, you can use the `header` option to add additional HTTP headers to the request. For example, to include an authentication token, use `--header "Authorization: Bearer <token>"`:

```sh
apollo-codegen download-schema https://api.github.com/graphql --output MyAPI/MyAPI/schema.json --header "Authorization: Bearer <token>"
```

Add queries to `MyQueries.graphql` or add additional `.graphql` files and rebuild the target. Then pass one of the generated query classes to `client.fetch()` in `MyAPI.playground`.
