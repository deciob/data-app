((curl) ->

  console.log '@@@@@@@'
  
  # baseUrl: '',
  #paths: {
  # Configure paths here
  #},
  
  # Define application-level packages
  
  # Define a theme package, and configure it to always use the css module
  # loader. No need to use AMD 'css!' plugin to load things in this package, 
  # it will happen automatigally.
  # WARNING: The moduleLoader config syntax will be changing in an upcoming 
  # version of curl.
  
  # Add third-party packages here
  
  # Turn off i18n locale sniffing. Change or remove this line if you want
  # to test specific locales or try automatic locale-sniffing.
  
  # Success! curl.js indicates that your app loaded successfully!
  success = ->
    # When using wire, the success callback is typically not needed since
    # wire will compose and initialize the app from the main spec.
    # However, this callback can be useful for executing startup tasks
    # you don't want inside of a wire spec, such as this:
    msg = "Looking good!"
    console.log msg
  
  # Oops. curl.js indicates that your app failed to load correctly.
  fail = (ex) ->
    # There are many ways to handle errors. This is just a simple example.
    # Note: you cannot rely on any specific library or shim to be
    # loaded at this point.  Therefore, you must use standard DOM
    # manipulation and legacy IE equivalents.
    console.log "an error happened during loading :'("
    console.log ex.message
    console.log ex.stack  if ex.stack
    el = document.getElementById("errout")
    msg = "An error occurred while loading: " + 
      ex.message + ". See the console for more information."
    if el
      # inject the error message
      if "textContent" of el
        el.textContent = msg
      else
        el.innerText = msg
      # clear styling that may be hiding the error message
      el.style.display = ""
      document.documentElement.className = ""
    else
      throw msg
      
  config =
    packages: [
      name: "app-admin"
      location: "app/app_admin"
    ,
      name: "admin-menu"
      location: "app/admin_menu"
    ,
      name: "admin-sidebar"
      location: "app/data_sidebar"  
    ,
      name: "data-sidebar"
      location: "app/data_sidebar"
    ,
      name: "project-sidebar"
      location: "app/project_sidebar"
    ,
      name: "data-content"
      location: "app/data_content"
    ,
      name: "project-content"
      location: "app/project_content"
    ,
    #
      name: "theme"
      location: "theme/css"
      config:
        moduleLoader: "curl/plugin/css"
    ,
      name: "curl"
      location: "components/curl/src/curl"
    ,
      name: "wire"
      location: "components/wire"
      main: "wire"
    ,
      name: "cola"
      location: "components/cola"
      main: "cola"
    ,
      name: "when"
      location: "components/when"
      main: "when"
    ,
      name: "meld"
      location: "components/meld"
      main: "meld"
    ]
    locale: false
    #preloads: ["poly/all"]

  curl(config, ["wire!app/main"]).then success, fail

) curl