# iFood

Example project created to test the combination of concepts applied in Swift technology.

##  Application Screenshots

<img src="https://github.com/LucasCarvalho00/iFood-ViewCode/assets/30445599/396a9ad1-3754-4e28-843b-4805583f18fd" width="200" height="395">
<img src="https://github.com/LucasCarvalho00/iFood-ViewCode/assets/30445599/5eda6adb-580a-4db0-b83b-99a77ef80a04" width="200" height="395">
<img src="https://github.com/LucasCarvalho00/iFood-ViewCode/assets/30445599/a3a53969-47b7-4bc4-971b-cf8490efdafb" width="200" height="395">
<img src="https://github.com/LucasCarvalho00/iFood-ViewCode/assets/30445599/6aa4fbac-6260-45ff-a47e-018155b90a3a" width="200" height="395">

## Architectural base

This project uses MVVM as an architectural base.

![mvvm-pattern](https://user-images.githubusercontent.com/30445599/187041175-2fe7b8ac-b81a-414f-ba9c-2e3bb14f7a76.png)

Where each layer of the architecture has its responsibility defined.

### UseCases

* These are ways to query external data to Scena, whether in API, Database, etc.

### ViewModel

  * Single layer with the responsibility of knowing the UseCases.
  * Transforms the Responses received into models, treating the data
  * Contains the business rules
  * Forwards the data to the ViewController

### ViewController

  * Single layer that knows the View, ViewModel and FlowController.
  * It has the characteristic of being a layer of passages managing the flow of information within the scene.

### View

  * Layer containing Layout rules and states for each screen
  
### Vantages of Architecture:

  As the proposal of this architecture was that each layer had a well-defined function. the implementation of tests will be facilitated and the maintenance of the architecture as well.
  Since each module only expects one result to be loaded. I can, for example, change the way the networking layer makes HTTPS calls with minimal impact within the viewmodels, I can change data persistence, return mocks to do tests and etc. All this with minimal effort.

## Application Modules

* App

AppDelegate, SceneDelegate and Info.Plist

* Foundation

The Foundation Layer is responsible for creating and making available to the application the basic resources for it to exist.

* DependencyInjection:

In order to uncouple ViewModels within ViewControllers, the Dependency Injecton layer registers and resolves all dependencies of all Application classes.

* FlowController:

Similar to a flow controller, the FlowController layer calls and manages application flows. With the crucial difference that the FlowController doesn't register any ViewController, it just asks for the instance to be resolved.

* Services

The Services layer is responsible for storing all the UseCases and Requests of the application, it is the only layer of the project that can know the Network and offers the ViewModel a way to consume APIs

* UIKit

Application UIKit layer, where all components and resources for creating Layouts are located.

* Scenes

All Scenes/Screens of the application.

## Protocol Oriented Programming - POP

A protocol defines a schema of methods, properties, and other requirements that fulfill a particular task or part of functionality. The protocol can then be adopted by a class, struct, or enum to provide an actual implementation of these requirements.

> Any type that satisfies the requirements of a protocol is considered to conform to that protocol.

### Positives:
* Any class that conforms to the same protocol can be a replacement in the constructor making it easy to replace layers!
* It will facilitate the implementation of unit tests
* Classes will only have knowledge of what is necessary for them to execute their steps.

### Negatives:
* Initial complexity.
* Borderplate.

**Documentation link:** https://docs.swift.org/swift-book/LanguageGuide/Protocols.html

## Scene state design pattern

Scenes work as a "State Machine", where the view through the "setupUI" offers the possibility for the ViewController and ViewModel layers to change what is being displayed to the user.

![Captura de Tela 2023-12-07 às 15 46 01](https://github.com/LucasCarvalho00/iFood-ViewCode/assets/30445599/ad1cdad3-2764-420e-b94e-103b6059841b)

![Captura de Tela 2023-12-07 às 15 45 55](https://github.com/LucasCarvalho00/iFood-ViewCode/assets/30445599/803991f7-ca55-4746-af5d-05bcdb26c50d)

Let's see the example of Scene below:

![Captura de Tela 2023-12-07 às 15 45 05](https://github.com/LucasCarvalho00/iFood-ViewCode/assets/30445599/2e166fb1-4f72-4f88-948a-6340059ab7d1)

We can already initially notice that the screen construction already reflects the states it has, this construction is important because it helps to avoid "Massive Classes", making the layout of each state is separated and organized by file, being called on demand.

When initiating the API call, the ViewModel already notifies that the screen needs to enter the Load state, which visually reflects to the user.

![Captura de Tela 2023-12-07 às 15 43 36](https://github.com/LucasCarvalho00/iFood-ViewCode/assets/30445599/1a163de0-1373-4ea4-8f1b-6f3a0076b920)

And when receiving the result, if it is successful, it will update the user's layout again, showing the data received or it will show an error screen.

![Captura de Tela 2023-12-07 às 15 43 44](https://github.com/LucasCarvalho00/iFood-ViewCode/assets/30445599/3117c0cc-8c2b-4f55-9c73-119456723fcb)

> The state pattern is a behavioral pattern that allows an object to change its behavior at runtime. It does so by changing its current state. Here, “state” means the set of data that describes how a given object should behave at a given time.

You can read more about this Design Pattern at the link: https://www.raywenderlich.com/books/design-patterns-by-tutorials/v3.0/chapters/15-state-pattern

## Design System

![Captura de Tela 2023-12-07 às 15 41 39](https://github.com/LucasCarvalho00/iFood-ViewCode/assets/30445599/3046b60e-8064-4fda-a62c-5e3cfa06b60e)

### Which is?
Design System is a set of a company's design and content libraries created and maintained by the Design and Technology teams.

### Because it's important?
With all the components defined and implemented in our UIKit, we will be able to facilitate the creation of screens on a daily basis, respecting minimum qualities of work between them, for example: All buttons have the same size, all screens have the same lateral spacing, use the same sources for the same components

> In order to meet the expectations of the Design System creation, we built screens to use ViewCode and started implementing some components within our project.

Currently we have in the Design System:
* Definition of spacing metrics between objects
* Fonts and styles
* Color palette used by the project
* Some components already implemented
* Translations

## Network

When we create an application, we need to work with data. This data can come from some external source, for example an API.

However, they are returned in a different style: typically, as JSON. JSON stands for Javascript Object Notation, basically a lightweight format for exchanging information/data between systems.

The problem is that the Swift language cannot use, that is, it does not “understand” JSON data, as it is a textual format.

So we perform the conversion of this JSON data into some kind of data that we can use in Swift. Working with Codables

https://developer.apple.com/documentation/swift/codable

Codables conform to Decodables and Encodables protocols, each with its own particular property.

* Decodables are the types that we can transform JSON into Objects
* Encodables are the types that we can transform Objects into JSON

Below is an example of the Decodable type.

![Captura de Tela 2023-12-07 às 15 40 41](https://github.com/LucasCarvalho00/iFood-ViewCode/assets/30445599/076034d7-3524-4426-bfa6-7ef0a659649b)

But we still have a problem, we couldn't create a specific network layer per API call, so it would need to be generic to the point of accepting and knowing how to convert any JSON into any Decodable object within our project.

For this we use functions with Opaque Types in Swift

![Captura de Tela 2022-08-27 às 15 46 02](https://user-images.githubusercontent.com/30445599/187044117-f59e5f89-d328-4230-a450-421c26e8bc23.png)

Documentation link: https://docs.swift.org/swift-book/LanguageGuide/OpaqueTypes.html#:~:text=An%20opaque%20type%20refers%20to,that%20conforms%20to%20the%20protocol.

Where the Network protocol accepts any object "Represented by the T in the picture above" of type Decodable, this way it will know that any object delivered will have properties of type Decodable.

And for UseCase to know exactly which object it will receive, just inform the expected object in the protocol response above.

![Captura de Tela 2023-12-07 às 15 39 29](https://github.com/LucasCarvalho00/iFood-ViewCode/assets/30445599/8a7f6023-d6e4-42ff-8a56-5df09274173f)

## Modularization strategy

As a modularization strategy for this application, each layer of this project has only a single responsibility and to know its pre-marked peers.

We can see this concept more clearly being applied to the layers where protocols are injected at startup.

Taking the ViewModel as an example, within a Scena it is the only one that can know the Services layer, as it has direct contact with the UseCases.

But when receiving a response from the Service layer, it transforms this object into an internal object before sending it to the ViewController and then to the View.

This happens because if it were to directly pass the Response received from the Service layer forward, it would create the need for each layer that received this object to also know the Service layer.

With this type of strategy, we prevent layers from knowing only the parts that suit them in the project, removing dependency coupling and making it easier to replace layers.

## Test Project

The Test Project seeks to be a mirror of the main project's architecture, taking advantage of the condition that all project classes only know each other through an interface.

Tests are performed by overriding which layer implements interface X or Y to handle the expected result.

![Captura de Tela 2023-12-07 às 15 37 50](https://github.com/LucasCarvalho00/iFood-ViewCode/assets/30445599/cc8abe32-7c98-41b2-b647-90a82b04a015)

As in the example above, where the UseCase receives a new layer of Network at its initialization, allowing its function to be executed without undergoing code changes and we have a controlled result
