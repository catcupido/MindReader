/// <reference path="../angular.js" />  
/// <reference path="../angular.min.js" />   
/// <reference path="Modules.js" />   
/// <reference path="Services.js" />   


app.controller("AngularJs_WCFController", function ($scope, $rootScope, $window, AngularJs_WCFService) {

    $scope.date = new Date();

    // 1) To Store the user selected Character Profession
    $scope.CharacterID = 4;
    $scope.CharacterType = 'kollywood Actor';

    // 2) To show and Hide the Table to display  Character Type Selection and Question
    var firstbool = true;
    var secondbool = false;
    var thirdbool = false;
    // * 3) Question and Answer final Judgement Local Variables
    $scope.Question_ID;
    $scope.Char_Name_ID;
    $scope.Char_ID;
    $scope.Question;
    $scope.Answer;
    $scope.Char_Name;
    $scope.Char_Status;
    $scope.User_Selected_Result = 'Yes';
    $scope.loopCount = 0;
    $scope.resultCount = 0;
    $scope.finalresultCount = 3;  // This is very important variable here if the Questions per Star Increases the count should be same here
    $scope.NextStar = 0;
    $scope.totalQuestionCount = 0;
    $scope.QuestionIncrement = 0;
    $scope.YourDreamStarName = "";
    // end 3)

    Hidetables()
    function Hidetables() {
     
        if ($scope.firstbool == false) {
            $scope.firstbool = true;
            $scope.secondbool = false;
            $scope.thirdbool = true
        }
        else
        {
            $scope.firstbool = false;
            $scope.secondbool = true;
            $scope.thirdbool = true;
        }    
    }
    hideresult()
    function hideresult() {
        if ($scope.thirdbool == false) {
            $scope.thirdbool = true;
        }
    }

    GetCharacterType();
    getCharacterNames();
  
 
    //To Get All Records   
    function GetCharacterType() {

        var promiseGet = AngularJs_WCFService.GetCharacterType();
        promiseGet.then(function (pl) {
            $scope.getCharacterTypeDisp = pl.data

        },

             function (errorPl) {

             });
    }
   
    //To Get Student Detail on the Base of Student ID   
    function getCharacterNames() {
      
        var promiseGet = AngularJs_WCFService.getCharacterNames();
            promiseGet.then(function (pl) {
                $scope.getCharacterNamesDisp = pl.data;
               
             //   alert(res.Char_Name);
            },
                 function (errorPl) {
                 });
      

    }
    $scope.radioCheckValue = function (CharID, CharType) {
      
        $scope.CharacterID = CharID;
        $scope.CharacterType = CharType;
    };

 

    $scope.get = function () {
     
        $scope.firstbool = true;
        $scope.secondbool = false;
        $scope.NextStar = 0;
        $scope.loopCount = 0;
        findYourAnswer();
    }

    function findYourAnswer()
    {
         
        var promiseGet = AngularJs_WCFService.getquestionAnswers($scope.CharacterID);
        promiseGet.then(function (pl) {
            $scope.questionAnswersDisp = pl.data

            $scope.totalQuestionCount = $scope.questionAnswersDisp.length;
            
            
            for (x in $scope.questionAnswersDisp) {

                if (x == $scope.loopCount) {
                 
                   
                    $scope.Question_ID = $scope.questionAnswersDisp[x].Question_ID;
                    $scope.Char_Name_ID = $scope.questionAnswersDisp[x].Char_Name_ID;
                    $scope.Char_ID = $scope.questionAnswersDisp[x].Char_ID;
                    $scope.Question = $scope.questionAnswersDisp[x].Question;
                    $scope.Answer = $scope.questionAnswersDisp[x].Answer;
                    $scope.Char_Name = $scope.questionAnswersDisp[x].Char_Name;
                    $scope.Char_Status = $scope.questionAnswersDisp[x].Char_Status;

                    $scope.QuestionIncrement = $scope.QuestionIncrement + 1;

                }

            }

        },
             function (errorPl) {

             });
    }

    $scope.rdoAnschk = function (chkResult) {
      
        $scope.User_Selected_Result = chkResult;
      
    };

    $scope.findAnswers = function () {
      
      
        if ($scope.User_Selected_Result == 'Yes')
        {

            $scope.resultCount = $scope.resultCount + 1;
        }
        else
        {
          
               
                if ($scope.Answer == 'No') {
                
                        $scope.resultCount = $scope.resultCount + 1;  
                    if ($scope.NextStar > 0) {
                        $scope.NextStar = $scope.NextStar - 1;
                    }
                }
                else {
                    if ($scope.resultCount > 0) {
                        $scope.resultCount = $scope.resultCount - 1;
                    }
                    $scope.NextStar = $scope.NextStar + 1;
                }
                
          
        }
        if ($scope.NextStar == $scope.finalresultCount)
        {
            alert('Hope my guess was Wrong! lets start for other Star ')
            $scope.NextStar = 0;
        }
        if ($scope.resultCount == $scope.finalresultCount) {
            $scope.secondbool = true;
            $scope.thirdbool = false;
            $scope.YourDreamStarName = $scope.Char_Name;
            alert('Your Dream Star in your mind is ' + $scope.YourDreamStarName)
            return;
        }

        $scope.loopCount = $scope.loopCount + 1;
      
        findYourAnswer();

        if($scope.QuestionIncrement>= $scope.totalQuestionCount)
        {
            $scope.secondbool = true;
            $scope.thirdbool = false;
            $scope.YourDreamStarName = "Sorry My Dear Friend. All the Questions are Completed. I couldn't find your answer. Shall we try again?"
            alert($scope.YourDreamStarName);
            return;
        }
    }
 

});