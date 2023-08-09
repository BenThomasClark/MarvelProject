# MarvelProject
Project using the Marvel Developer API as an introduction to Swift Development.

### Done:
 - Basic calls to the API endpoint in order to get the first 100 alphabetical characters.
   - Using: `https://gateway.marvel.com//v1/public/characters`
   - Displaying the results of this call in a list-type view.

 - Created an inspect-level view for all characters, in which more data from the endpoint is comsumed.
       - including: `External URLs`, `Comics`, `Stories` and `Events` datatypes.
       - all of which are formatted and diaplyed correctly within the view.

 - Showcase call to the endpoint `https://gateway.marvel.com//v1/public/characters/000000` for a specific characters' data endpoint, using their `id` value.
   - An additional call to the endpoint, used in the 'home' view - referred to as 'Featured'.
   - This functionality can be expanded upon for calls to the endpoints for each characters' specific information surrounding Comics, Stories and Events.
  
 - Basic search functionality.
   - Search queries are carried out using the `nameStartsWith=` parameter.
   - Displaying results functionality needs some work.

### To Do:
 - General code cleanup and closer MVVM structuring required.
 - Search functionality mostly implemented however bug needs to be resolved.
 - Adding functionality for calls to endpoints for Comics, Events and Stories - with supplementary views.
 - Unit tests.
