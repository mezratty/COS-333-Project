// var page = require('webpage').create();

// address = "https://tickets.princeton.edu/Online/";
// page.open(address, function(status) {
//   if (status !== 'success') {
//     console.log('FAIL to load the address');
//   } else {
//     console.log('Loading ' + address);
//     var title = page.evaluate(function() {
//     	return document.getElementById('searchItems').click();
//   	});

//   	console.log(title);
//   }
//   phantom.exit();
// });

var page = new WebPage(), testindex = 0, loadInProgress = false;

page.onConsoleMessage = function(msg) {
  console.log(msg);
};

page.onLoadStarted = function() {
  loadInProgress = true;
  //console.log("load started");
};

page.onLoadFinished = function() {
  loadInProgress = false;
  //console.log("load finished");
};

var steps = [
  function() {
    //Load Login Page
    page.open("https://tickets.princeton.edu/Online/");
  },
  function() {
    //Enter Credentials
    page.evaluate(function() {

      var search = document.getElementById("searchItems");
      var i;
      //console.log(search.getAttribute('method'));
      search.elements.namedItem("BOset::WScontent::SearchCriteria::search_from::0").setAttribute('value', '4/28/16, 12:00 AM');
      search.elements.namedItem("BOset::WScontent::SearchCriteria::search_to::0").setAttribute('value', '5/28/16, 12:00 AM');
      
      button = document.getElementsByName("Go")[0];
      button.click();

      // for (i=0; i < arr.length; i++) { 
      //   if (arr[i].getAttribute('method') == "post") {
      //     // arr[i].elements["item-search"].value="mylogin";
      //     // arr[i].elements["password"].value="mypassword";
      //     // return;
      //     console.log("hi");
      //   }
      // }
    });
  }, 
  function() {
    //Login
    page.evaluate(function() {

      // var arr = document.getElementsByClassName("login-form");
      // var i;

      // for (i=0; i < arr.length; i++) {
      //   if (arr[i].getAttribute('method') == "POST") {
      //     arr[i].submit();
      //     return;
      //   }
      // }

    });
  }, 
  function() {
    //Output content of page to stdout after form has been submitted
    page.evaluate(function() {
      //console.log(document.querySelectorAll('html')[0].outerHTML);
      console.log(document.scripts.item(20).outerHTML);
    });
  }
];


interval = setInterval(function() {
  if (!loadInProgress && typeof steps[testindex] == "function") {
    //console.log("step " + (testindex + 1));
    steps[testindex]();
    testindex++;
  }
  if (typeof steps[testindex] != "function") {
    //console.log("test complete!");
    phantom.exit();
  }
}, 50);