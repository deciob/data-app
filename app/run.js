(function(curl) {
  var config, fail, success;
  console.log('@@@@@@@');
  success = function() {
    var msg;
    msg = "Looking good!";
    return console.log(msg);
  };
  fail = function(ex) {
    var el, msg;
    console.log("an error happened during loading :'(");
    console.log(ex.message);
    if (ex.stack) {
      console.log(ex.stack);
    }
    el = document.getElementById("errout");
    msg = "An error occurred while loading: " + ex.message + ". See the console for more information.";
    if (el) {
      if ("textContent" in el) {
        el.textContent = msg;
      } else {
        el.innerText = msg;
      }
      el.style.display = "";
      return document.documentElement.className = "";
    } else {
      throw msg;
    }
  };
  config = {
    packages: [
      {
        name: "app-admin",
        location: "app/app_admin"
      }, {
        name: "admin-menu",
        location: "app/admin_menu"
      }, {
        name: "admin-sidebar",
        location: "app/data_sidebar"
      }, {
        name: "data-sidebar",
        location: "app/data_sidebar"
      }, {
        name: "project-sidebar",
        location: "app/project_sidebar"
      }, {
        name: "data-content",
        location: "app/data_content"
      }, {
        name: "project-content",
        location: "app/project_content"
      }, {
        name: "theme",
        location: "theme/css",
        config: {
          moduleLoader: "curl/plugin/css"
        }
      }, {
        name: "curl",
        location: "components/curl/src/curl"
      }, {
        name: "wire",
        location: "components/wire",
        main: "wire"
      }, {
        name: "cola",
        location: "components/cola",
        main: "cola"
      }, {
        name: "when",
        location: "components/when",
        main: "when"
      }, {
        name: "meld",
        location: "components/meld",
        main: "meld"
      }
    ],
    locale: false
  };
  return curl(config, ["wire!app/main"]).then(success, fail);
})(curl);
