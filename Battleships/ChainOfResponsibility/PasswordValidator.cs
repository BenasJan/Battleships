using Battleships.Data.Dto;
using SendGrid.Helpers.Errors.Model;

namespace Battleships.ChainOfResponsibility;

public class PasswordValidator : LoginValidator
{
    public override void ProcessData(UserCredentialsDto loginRequest)
    {
        if (loginRequest.Password == "" || loginRequest.Password == null)
            throw new BadRequestException("Password is empty or null!");

        if(NextValidator != null)
            NextValidator.ProcessData(loginRequest);
    }
}