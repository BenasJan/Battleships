using Battleships.Data.Dto;
using SendGrid.Helpers.Errors.Model;

namespace Battleships.ChainOfResponsibility;

public class EmailValidator : LoginValidator
{
    public override void ProcessData(UserCredentialsDto loginRequest)
    {
        if (loginRequest.Email == "" || loginRequest.Email == null)
            throw new BadRequestException("Email is empty or null!");

        if(NextValidator != null)
            NextValidator.ProcessData(loginRequest);
    }
}