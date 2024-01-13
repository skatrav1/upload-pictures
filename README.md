# Cat Photo Album Project

The Cat Photo Album is a Ruby on Rails application designed to manage cat photos. It allows users to perform CRUD (Create, Read, Update, Delete) operations on cat photos. Users can upload new photos, view them, update details, or delete them.

## Features

- **User Authentication:** Users can sign in and out. Only authenticated users can create, update, or delete photos.
- **Photo Management:** Users can upload photos with titles and descriptions. Each photo can be viewed, edited, or deleted.
- **Admin Functions:** Admin users have additional privileges, like deleting users.

## Getting Started

To get started with the Cat Photo Album, clone the repository and install the necessary dependencies:

```bash
git clone https://github.com/skatrav1/upload-pictures.git
cd cat-photo-album
bundle install
```
##Before running the application, create a super admin user by doing the following:
```rails db:migrate``` #to run the migrations for database to create the tables

```rails console
user = User.create(email: 'superuser@example.com', password: 'password', admin: true)``` (OR) something similar to create a super admin
#We can use the same method to create a regular user by setting the flag admin: false

Run the application:

```bash
rails server
```

The application will be available at `http://localhost:3000`.

## Key Components

### Controllers

- **`PhotosController`:** Manages CRUD operations for photos.
- **`UsersController`:** Handles user-related functionalities like showing and updating user profiles.

### Models

- **`Photo`:** Represents the photo with attributes like `title`, `description`, and `image`. It includes validations to ensure the presence of title and description.

### Views

- Photo views (`new.html.erb`, `show.html.erb`, `edit.html.erb`, `index.html.erb`) for displaying and managing photos.

### Tests

- **Model Tests (`photo_test.rb`):** Ensures that photos are valid with correct data and handles image uploads.
- **Controller Tests (`photos_controller_test.rb`):** Tests the photo management functionalities, including creating, viewing, updating, and deleting photos.
- **User Tests (`users_controller_test.rb`):** Verifies user update and deletion functionalities.

### Run Tests
```rails test``` 

## Uploading Photos

Users can upload photos using the form available at `http://localhost:3000/photos/new`. The form includes fields for the photo's title, description, and the image file.

## Admin Features

Admin users can manage user accounts. The `UsersController` and `user.rb` model include methods to check if a user is an admin and to perform admin-specific actions.


