# Feelng

## Technologies Used

### Backend
- Javascript
- Rails

### Frontend
- CSS

## Why it was created
Sometimes when people have a certain feeling they want to just sink into, Feelng provides the user with a music, background image, event, and poem, all matching the mood. Feelng also provides a space for people experiencing the same emotion to chat with each other in real time.

## How it Works

### Backend
Rails was the backend framework that was chosen to make it easy to organize the models and views and the controller logic. The app does not feature many models or views though, so it is possible a microframework may have been better. 

API calls are made to the Foursquare, Unsplash, and Spotify API to provide the user with dynamically generated content to match their mood. Poems from poetryDB were classified to match moods.

There is no user registration required as the app uses the Spotify login as the user's profile. If a user enjoys the content given to them, they already have a profile to save the random content to look back to later.

The Web Playback SDK was used in conjunction with the Spotify API to create an asynchronous player that plays the playlist once the API calls are complete.

ActionCable is used to subscribe the user to the chatroom for the particular mood page. Users can chat in real time and input is sanitized in order to prevent XSS.

### Frontend
Vanilla CSS was used to style the views. Media queries were utilized for a responsive design that would allow the user to use the website on mobile devices.

### Hosting
Feelng is hosted on Heroku for quick development that provides a home for the database and server side API calls.
