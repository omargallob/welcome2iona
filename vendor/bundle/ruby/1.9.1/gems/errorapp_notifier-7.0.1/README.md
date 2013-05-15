ErrorappNotifier
================
This is the notifier gem for integrating apps with ErrorApp.

When an exception occurs, ErrorappNotifier will POST the relevant data to the ErrorApp server specified in your environment.

Rails Installation
------------------
To use ErrorApp from Rails 3 application, add this to your Gemfile:

<code>gem 'errorapp_notifier'</code>

Next you need to add the following under config/errorapp_notifier.yml:


<code>
  api-key: PASTE_YOUR_PRODUCTION_PROJECT_API_KEY_HERE
</code>

To use ErrorApp from Rails 2X application, add this to your Environment file:

<code>config.gem 'errorapp_notifier'</code>

Next you need to add the following under config/errorapp_notifier.yml:

<code>
  api-key: PASTE_YOUR_PRODUCTION_PROJECT_API_KEY_HERE
</code>


Code Submit
------------

Feel free to submit patchs and pull request for this notifier. 
