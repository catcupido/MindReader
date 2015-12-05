/// <reference path="../angular.js" />  
/// <reference path="../angular.min.js" />   

/// <reference path="Modules.js" />   

app.service("AngularJs_WCFService", function ($http) {
  
    //Get Order Master Records  
    this.GetCharacterType = function () {
        return $http.get("http://localhost:4194/Service1.svc/GetCharacterType");
    };

    //Search Order Master Records   
    this.getCharacterNames = function () {
        return $http.get("http://localhost:4194/Service1.svc/getCharacterNames/");
    }

    this.getquestionAnswers = function (Char_ID) {
        return $http.get("http://localhost:4194/Service1.svc/questionAnswers/" + Char_ID);
    }

});
