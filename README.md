Mobile Context Framework
========================

The progressive spreading of wireless networks and increasingly powerful mobile computers creates a big potential for a wide spectrum of innovative applications. Context-aware applications adapt the circumstances of the user's current situation which enables new and intelligent user interfaces. Nevertheless, the sheer diversity of exploitable contexts and the plethora of sensing technologies are actually working against the deployment of context-aware systems. A framework for context retrieval should enable the development of context-aware applications without considering details of context acquisition and context management. Moreover, exchange and reusability of context information should be allowed between applications and users.

The *Mobile Context Framework* tries to solve the described issues. It consists of three components:

* The [Mobile Context Server](http://github.com/flxmllr/mobile-context-server/)
* The [Mobile Context iPhone Library](http://github.com/flxmllr/mobile-context-iphone-lib/)
* The Mobile Context iPhone Demo App (this project)

The Mobile Context iPhone Demo App
----------------------------------

### Installation notes ###

The *Mobile Context iPhone Demo App* is a sample iPhone application that uses the context library to to demonstrate the key features of the mobile context framework. It requires the [Mobile Context iPhone Library](http://github.com/flxmllr/mobile-context-iphone-lib/).

#### 1. Download the source files and library ####

1. Download or checkout the source files of this project and save the folder `mobile-context-iphone-demo` to your hard drive.

2. Download or checkout the source files of the [Mobile Context iPhone Library](http://github.com/flxmllr/mobile-context-iphone-lib/) and save the folder `mobile-context-iphone-lib` into the same top level directory as `mobile-context-iphone-demo`.

#### 2. Build and run the demo application ####

1. Open the Xcode project included in this project.

2. Choose the appropriate configuration, either *Simulator* or *Device*

3. Build and run the application



Copyright (c) 2010 Felix Mueller, released under the [MIT license](http://github.com/flxmllr/mobile-context-iphone-demo/blob/master/MIT-LICENSE)
