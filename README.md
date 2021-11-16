## User Stories (Part One)

The following **required** functionality is completed:

- [X] Users can sign up for the app.
- [X] Parse server configured for sign ups.

## Video Walkthrough

Here's a walkthrough of implemented user stories:

![ezgif-7-d8771ec813d4](https://user-images.githubusercontent.com/70527398/141922414-d483e04c-60a0-4357-8832-0c7d164cf8fc.gif)


Original App Design Project - README Template
===

# NoteTaker (Placeholder)

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
Notetaker is an app that allows students from past and current semesters upload notes for courses that they have taken or currently are taken.

### App Evaluation
[Evaluation of your app across the following attributes]
- **Category:** Education/Social Media
- **Mobile:** Primarily for mobile, since we want users to take pictures however website functionality would also be easily available with examples like Chegg as one of them.
- **Story:** Analyzing user stories of students in classes and how a typical lecture is held. Being able to friend users in the same classes, or alumni of a course.
- **Market:** Mainly college students would use these notes to either make decisions on whether to take the course or just look at notes that are better than theirs
- **Habit:** This app would be looked at perhaps a couple times per week for long sessions at time due to how long reading notes would take.
- **Scope:** We would initially start with one college campus being UB, and then being able to branch out into more colleges with their courses and having them affiliate themselves with us.

## Product Spec

### 1. Business Problem and User Base
What problem are you solving and who will use the solution?

We are solving the problem where students may need good notes for particular classes in their college courses. (This can also serve the user base who have accessibility issues to notetaking).


### 2. Description
What will the app do?

The app will have past or current students upload lecture notes so that students who are also in the class or planning to be in the class may be able to access them for study purposes or to see how the class is.


### 3. User Stories

**Required User Stories**

* Users can create accounts
* Users can login
* Users can upload photos
* Users can search for notes?
* Users can like notes
* Users can follow/unfollow courses they're in
* Users can view a feed of notes

**Optional User Stories**

* Users can leave comments under notes
* Users can tap photos to see more details about notes
* Users can search up notes
* User can be notified for when their notes are liked
* Users can upload due dates for current semester on the side

### 2. Screen Archetypes

What screens will the user see?

Login/Register screen, Stream screen, Detail screen, Creation screen

### 3. Navigation

**Flow Navigation** (Screen to Screen)

* (Examples) 
    * Launch Screen
        * Login/Register
            * Navigation/Main Screen
            * Can look at notes on here, post notes or look up courses
               * Creation Screen
               * Post Notes Here

## Wireframes
![Screen Shot 2021-11-01 at 10 24 31 PM](https://user-images.githubusercontent.com/70527398/139776584-7c549243-19ea-49ea-852d-0391ecf926e0.png)


## Schema 
[This section will be completed in Unit 9]
### Models
| Property      | Type     | Description |
   | ------------- | -------- | ------------|
   | User          | String   | unique id for the user (default field) |
   | authorOfPost  | Pointer to User| image author |
   | userImage     | File     | Image of user that user uploads |
   | notesImage    | File     | image of notes that user posts |
   | caption       | String   | image caption by author |
   | likesCount    | Number   | number of likes for the post |
   | createdAt     | DateTime | date when post is created (default field) |
   | updatedAt     | DateTime | date when post is last updated (default field) |
   | courseCode    | String   | unique id for course numbers |
   | Following     | Array    | List of following |
   
### Networking
- [Add list of network requests by screen ]
- #### List of network requests by screen
   - Home Feed Screen
      - (Read/GET) Query all posts of users/courses that user follows  
      - (Create/POST) Create a new like on a post
      - (Delete) Delete existing like
   - Create Post Screen
      - (Create/POST) Create a new post object
   - Profile Screen
      - (Read/GET) Query logged in user object
      - (Update/PUT) Update user profile image [Create basic snippets for each Parse network request]
      - (Read/GET) Query all posts where user is author
   - Navigation Screen
      - (Read/GET) Query all posts of topic/course/content user searched for
      -  


