using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;
using Shanu_QuizWcfService.Model;
namespace Shanu_QuizWcfService
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "Service1" in code, svc and config file together.
    // NOTE: In order to launch WCF Test Client for testing this service, please select Service1.svc or Service1.svc.cs at the Solution Explorer and start debugging.
    public class Service1 : IService1
    {
        shanuQuizEntities OME;

        public Service1()
        {
            OME = new shanuQuizEntities();
        }

        public List<whosInYourMinDataContract.CharacterTypeDataContract> GetCharacterType()
        {
            var query = (from a in OME.Character_Type
                         select a).Distinct();

            List<whosInYourMinDataContract.CharacterTypeDataContract> CharacterTypeList = new List<whosInYourMinDataContract.CharacterTypeDataContract>();

            query.ToList().ForEach(rec =>
            {
                CharacterTypeList.Add(new whosInYourMinDataContract.CharacterTypeDataContract
                {
                    Char_ID = rec.Char_ID,
                    Character_Type = rec.Char_Type
                });
            });
            return CharacterTypeList;
        }
        public List<whosInYourMinDataContract.CharacterNameDataContract> getCharacterNames()
        {

            List<whosInYourMinDataContract.CharacterNameDataContract> CharacterNameList = new List<whosInYourMinDataContract.CharacterNameDataContract>();

            try
            {
               
                var query = (from a in OME.Character_Name
                             select a).ToList().OrderBy(q => Int32.Parse(q.Char_Name_ID));


                query.ToList().ForEach(rec =>
                {
                    CharacterNameList.Add(new whosInYourMinDataContract.CharacterNameDataContract
                    {
                        Char_Name_ID = rec.Char_Name_ID,
                        Char_ID = rec.Char_ID,
                        Char_Name = rec.Char_Name,
                        Char_Status = rec.Char_Status
                    });
                });
                return CharacterNameList;


            }
            catch (Exception ex)
            {
                throw new FaultException<string>
                       (ex.Message);
            }

        }

        public List<whosInYourMinDataContract.questionAnswersDataContract> questionAnswers(string Char_ID)
        {
           
            var query = (from A in OME.Questions
                         join B in OME.Character_Name on A.Char_Name_ID equals B.Char_Name_ID
                         where B.Char_ID.Equals(Char_ID)
                         select new
                         {
                             A.Question_ID,
                             A.Char_Name_ID,
                             B.Char_ID,
                             A.Question,
                             A.Answer,
                             B.Char_Name,
                             B.Char_Status
                         }).ToList().OrderBy(q => Int32.Parse(q.Question_ID));


            List<whosInYourMinDataContract.questionAnswersDataContract> questionAnswersList = new List<whosInYourMinDataContract.questionAnswersDataContract>();

            query.ToList().ForEach(rec =>
            {
                questionAnswersList.Add(new whosInYourMinDataContract.questionAnswersDataContract
                {
                    Question_ID =rec.Question_ID,
                    Char_Name_ID = rec.Char_Name_ID,
                    Char_ID = rec.Char_ID,
                    Question = rec.Question,
                    Answer = rec.Answer,
                    Char_Name = rec.Char_Name,
                    Char_Status = rec.Char_Status
                });
            });
            return questionAnswersList;
        }
      
    }
}
