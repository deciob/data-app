define
  
  # Load a basic theme. This is just a CSS file, and since a moduleLoader is
  # configured in run.js, curl knows to load this as CSS.
  theme:
    module: "theme/foundation.css"


  # Create a simple view by rendering html, replacing some i18n strings
  # and loading CSS.  Then, insert into the DOM
  admin:
    render:
      template:
        module: "text!app/app_admin/template.html"
      #replace:
      #  module: "i18n!title/strings"
      #css:
      #  module: "css!title/structure.css"
    insert:
      at: {$ref: 'dom!admin'}
    ready:
      insert:
        first: 
          $ref: 'admin_menu'

  admin_menu:
    render:
      template:
        module: "text!app/admin_menu/template.html"
      #replace:
      #  module: "i18n!title/strings"
      #css:
      #  module: "css!title/structure.css"
    #insert:
    #  first: {$ref: 'dom!admin_sidebar'}

  
  # Wire.js plugins
  plugins: [
    module: "wire/dom"
    classes:
      init: "loading"
  ,
    module: "wire/dom/render"
  ]
