using Battleships.Data.Dto;
using SendGrid.Helpers.Errors.Model;

namespace Battleships.ChainOfResponsibility;

public class PasswordSqlValidator : LoginValidator
{
    public override void ProcessData(UserCredentialsDto loginRequest)
    {
        if (loginRequest.Password.Contains("DELETE") || loginRequest.Password.Contains("delete")
                                                     || loginRequest.Password.Contains("UPDATE") || loginRequest.Password.Contains("update")
                                                     || loginRequest.Password.Contains("INSERT") || loginRequest.Password.Contains("insert"))
            throw new BadRequestException("Haha better try next time!");
        
        if(NextValidator != null)
            NextValidator.ProcessData(loginRequest);
    }
}