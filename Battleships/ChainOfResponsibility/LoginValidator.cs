using Battleships.Data.Dto;

namespace Battleships.ChainOfResponsibility;

public abstract class LoginValidator
{
    protected LoginValidator NextValidator;
    
    public void SetNextValidator(LoginValidator nextValidator)
    {
        this.NextValidator = nextValidator;
    }
    
    public abstract void ProcessData(UserCredentialsDto loginRequest);
}