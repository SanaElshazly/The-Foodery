# The Foodery

![image](https://user-images.githubusercontent.com/6953604/59660901-f193b300-91a9-11e9-8139-008d30b041d2.png)

![](https://img.shields.io/badge/Swift-4.2-orange.svg)

A sample app created in Swift 4.2 showcasing loading, list of products in UICollectionView. The list contains different grocery items along with their image, price, and name. And you can tap on any grocery item to view the details of it.

## Architecture

Applying VIPER architecture, this allowed me to move some responsibility from the presenter to the Interactor. Leaving the presenter with UI events handling and preparing the data that comes from the Interactor to be displayed on the View. Then, the Interactor is only responsible for the business logic and fetching data from any source available. Taking into consideration that the view controller has a reference that conform routing protocols for the navigation logic and data passing between views. In VIPER architecture, communication between objects is based on protocols, which helps to create class spy to test the abstracted functionality for each layer.



![image](https://user-images.githubusercontent.com/6953604/57993716-79f33b00-7aba-11e9-9421-7144341990cd.png)

In VIPER, the communication between Interactor and Presenter, and View and Presenter is bidirectional.

## Running the App 

To run The Foodery app, follow these steps:
1. Check out this repo: `git clone https://github.com/SanaElshazly/The-Foodery.git`
2. Go to the terminal, go to podfile folder and write the command `pod install`
3. Build and run.

## Third Party Libraries

[Reusable](https://github.com/AliSoftware/Reusable): A swift mixin for reusing views easily and in a type-safe way.

[SDWebImage](https://github.com/SDWebImage/SDWebImage): Asynchronous image downloader as a UIImageView category, used for easily downloading and fetching the images in the UITableView.

### Todos

 - Write Unit Tests and UI Tests
 - Support landscape and portrait orientation
