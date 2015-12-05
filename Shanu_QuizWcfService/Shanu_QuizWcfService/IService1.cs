using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

namespace Shanu_QuizWcfService
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IService1" in both code and config file together.
    [ServiceContract]
    public interface IService1
    {

        [OperationContract]
        [WebInvoke(Method = "GET",
           RequestFormat = WebMessageFormat.Json,
           ResponseFormat = WebMessageFormat.Json,
           UriTemplate = "/GetCharacterType/")]
        List<whosInYourMinDataContract.CharacterTypeDataContract> GetCharacterType();

        [OperationContract]
        [WebGet(RequestFormat = WebMessageFormat.Json,
           ResponseFormat = WebMessageFormat.Json,
           UriTemplate = "/getCharacterNames/")]
        List<whosInYourMinDataContract.CharacterNameDataContract> getCharacterNames();

        [OperationContract]
        [WebInvoke(Method = "GET",
           RequestFormat = WebMessageFormat.Json,
           ResponseFormat = WebMessageFormat.Json,
           UriTemplate = "/questionAnswers/{Char_ID}")]
        List<whosInYourMinDataContract.questionAnswersDataContract> questionAnswers(string Char_ID);
    }


    // Use a data contract as illustrated in the sample below to add composite types to service operations.
    public class whosInYourMinDataContract
    {
        [DataContract]
        public class CharacterTypeDataContract
        {
            [DataMember]
            public string Char_ID { get; set; }

            [DataMember]
            public string Character_Type { get; set; }
        }


        [DataContract]
        public class CharacterNameDataContract
        {
            [DataMember]
            public string Char_Name_ID { get; set; }

            [DataMember]
            public string Char_ID { get; set; }

            [DataMember]
            public string Char_Name { get; set; }

            [DataMember]
            public string Char_Status { get; set; }
        }


        [DataContract]
        public class questionAnswersDataContract
        {
            [DataMember]
            public string Question_ID { get; set; }

            [DataMember]
            public string Char_Name_ID { get; set; }

            [DataMember]
            public string Char_ID { get; set; }

            [DataMember]
            public string Question { get; set; }

            [DataMember]
            public string Answer { get; set; }

            [DataMember]
            public string Char_Name { get; set; }

            [DataMember]
            public string Char_Status { get; set; }
        }

    }
}
