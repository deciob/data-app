define({
  theme: {
    module: "theme/foundation.css"
  },
  admin: {
    render: {
      template: {
        module: "text!app/app_admin/template.html"
      }
    },
    insert: {
      at: {
        $ref: 'dom!admin'
      }
    },
    ready: {
      insert: {
        first: {
          $ref: 'admin_menu'
        }
      }
    }
  },
  admin_menu: {
    render: {
      template: {
        module: "text!app/admin_menu/template.html"
      }
    }
  },
  plugins: [
    {
      module: "wire/dom",
      classes: {
        init: "loading"
      }
    }, {
      module: "wire/dom/render"
    }
  ]
});
