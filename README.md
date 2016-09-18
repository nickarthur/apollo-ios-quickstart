# Apollo iOS Quickstart

A collection of sample Xcode projects to quickly get started with [Apollo iOS](https://github.com/apollostack/apollo-ios).

These projects have been set up to integrate with [`apollo-codegen`](https://github.com/apollostack/apollo-codegen), which generates query-specific return types from a GraphQL schema and a set of query documents. (It currently only generates code for a subset of GraphQL queries however. Most importantly, fragments and mutations are not yet supported.)

## Installation

These projects require Xcode 8, which you can install from the [Mac App Store](https://itunes.apple.com/en/app/xcode/id497799835?mt=12).

You will also have to install the `apollo-codegen` command globally through npm:

```sh
npm install apollo-codegen -g
```

To clone the Git repository to your local machine:

```sh
git clone --recursive git://github.com/apollostack/apollo-ios-quickstart.git
cd apollo-ios-quickstart
```

You can then open `ApolloQuickstart.xcworkspace`, which contains the sample projects and the Apollo iOS dependency.

## Hello World app

This is a sample app that talks to the Hello World server, available [here](https://github.com/apollostack/frontpage-server). Follow the instructions there and start the server before running the iOS app. (You can find the equivalent React app [here](https://github.com/apollostack/frontpage-react-app) if you want to run them side by side.)

If you want to run on a device, change `localhost` to your machine's local IP address in `AppDelegate.swift`.

You can then select the `HelloWorld` scheme and press the run button to run the app. It should load a list of posts and display their titles and authors in a table view. (Showing the number of votes and adding the ability to upvote posts will be added later.)

This is a very basic app, but it does illustrate how you can hook up GraphQL query results to your UI. The code in `PostsViewController.swift` fetches data based on a GraphQL query defined in `PostsViewController.graphql`.

Building the target will run `apollo-codegen` against all `.graphql` files in your project and generate query-specific result types in `HelloWorldAPI.swift`.

Try commenting out (GraphQL uses `#` for comments) a post's `title` and rebuild the target. You should get a compile-time error because the code in our view controller accesses `post.title`. The type system guarantees at compile-time that the data we access from our code is actually specified as part of the query.

`apollo-codegen` also validates GraphQL query documents against the schema, and Xcode will show validation errors inline. Try adding an `email` field under `author` for instance, and rebuild to show the errors.

> Unfortunately, Xcode at this time does not allow adding support for additional file types. This means it treats `.graphql` files as text, which can make the editing experience a little awkward. So you may want to use Atom with the [`language-graphql` package](https://atom.io/packages/language-graphql) to edit these files instead.

## Star Wars API playground

The Star Wars API playground runs against [an example GraphQL server](https://github.com/jahewson/graphql-starwars) (see installation instructions there) using the Star Wars data bundled with Facebook's reference implementation, [GraphQL.js](https://github.com/graphql/graphql-js).

Open `StarWarsAPI.playground` to experiment with using typed query results. Pass any of the generated query classes to `client.fetch()` to change which query gets executed.

If you want to run on a device, change `localhost` to your machine's local IP address in the playground.

> You'll have to build the `StarWarsAPI` framework before running the playground, and whenever you make changes to `.graphql` files.

You can use GraphiQL to construct your own queries against the Star Wars API and put these in a new `.graphql` file.

> You may want to use 'Edit / Paste and Preserve Formatting' to paste the query in Xcode however, because for some reason Xcode will remove indentation when using a normal paste.

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
