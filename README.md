# WORDSTOCK

<https://wordstock.herokuapp.com/>


A full-stack Rails app that provides a personal dictionary for users based off a chosen topic. Users can create new words to help them organize their learning and remember words more easily.

##### Demo Login Info

Email: demo@demo.com

Password: qwerty

##### About Me

My name is Meg, I'm a full stack web developer out of San Francisco CA.
Checkout my GitHub [page](https://github.com/mehgellan)

## Motivation

The purpose of this app is organized vocab accessibility. I wanted to create an app where users could bring their word lists and store them all in one place. For instance, if someone was studying a certain topic or needed to prepare for a project, they could store all those related words under that topic. In this way, a user could review the terms as needed as well as manage the lists they had.

## Code Examples
#### Using Angular and Rails

In order to use AngularJS as a dynamic client-side framework with RoR on the server-side I had to use rails routes to generate JSON API endpoints.

```
# config/routes.rb
namespace :api, defaults: { format: :json } do
  resources :topics do
    resources :words, shallow: true
  end
end
```

All my Angular controllers were stored in a controller directory in my assets/javascripts directory, as well as the templates for my Angular views. Here's a throwback to how Angular works in my Topic show page.

```
<!-- assets/javascripts/templates/topics/show.html -->
<tbody class="table-striped" ng-repeat="word in topicShowCtrl.words | orderBy:sortType:sortReverse | filter:searchWords">
  <tr data-id="{{word.id}}">
    <td>
      <span ng-hide="editing">{{ word.term}}</span>
      <input ng-show="editing" ng-model="word.term" type="text" class="form-control input-md">
    </td>
    <td>
    ...
```    

## Technologies Used

* Ruby 2.3.0, RoR 5.0.0
* JavaScript ES5, AJAX, AngularJS 1.5.5
* HTML5/CSS3, Bootstrap 3.2.0

## Setup

1. Fork & clone this [repo](https://github.com/mehgellan/wordstock)
2. Run ``` bundle install ``` to gain access to the following gems:
  * bcrypt - User Authentication
  * emmet - HTML tool
  * angular-rails-templates - use Angular templates with rails' asset pipeline
  * ffaker - generate dummy data
3. Run ``` rails s ``` to start rails server and visit your http://localhost:3000/

## Angular & Rails - Rangular

#### PROS
* Seamless integration with the Rails asset pipeline with the help of various gems.
* Full-featured framework that comes with data-binding, dependency injection, extensibility, etc.
* The Rails ERB template can be used in an Angular project so that both all of the Rails controller variables and the helper method can be availed in the template.
* Deployment is easy – as all setup is – via Rails, so there is no need for any other run time environment or the JavaScript task runner for Angular project.

#### CONS
* Both Angular and Rails are very opinionated and the code can get rather heavier than using vanilla Rails or even another frontend library like React.
* This is tightly coupled with the Rails application and if too many Rails helper methods are used in the Angular app, then scalability will be a concern due to difficulty with code segregation in Rails and Angular apps.
* External libraries managed by Bower are in the Rails vendor folder, while JavaScript and CSS are scattered in an assets folder at different places. This means that the Angular app assets are scattered across the Rails application, which will be difficult to manage.

## Planned Features

* Integrate into Mobile friendly app
* Hit Dictionary api for Word of the Day Feature
* Add Example model so user can create multi-media examples to a word making the word more interactive and easier to remember.
* Use materialize styling framework

## Planning

Wireframes
![alt text](http://i.imgur.com/j78U762.png "Wireframes")

Entity Relationship Diagram
![alt text](http://i.imgur.com/DxVxSnQ.png "ERD")
