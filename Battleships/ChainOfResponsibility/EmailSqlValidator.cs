using Battleships.Data.Dto;
using SendGrid.Helpers.Errors.Model;

namespace Battleships.ChainOfResponsibility;

public class EmailSqlValidator : LoginValidator
{
    public override void ProcessData(UserCredentialsDto loginRequest)
    {
        if (loginRequest.Email.Contains("DELETE") || loginRequest.Email.Contains("delete")
                                                  || loginRequest.Email.Contains("UPDATE") || loginRequest.Email.Contains("update")
                                                  || loginRequest.Email.Contains("INSERT") || loginRequest.Email.Contains("insert"))
            throw new BadRequestException("Haha better try next time!");
        
        if(NextValidator != null)
            NextValidator.ProcessData(loginRequest);
    }
}