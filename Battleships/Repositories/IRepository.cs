using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Threading.Tasks;
using Battleships.Models;

namespace Battleships.Repositories
{
    public interface IRepository<TModel> where TModel : BaseModel
    {
        Task<TModel> GetById(Guid id);
        Task<List<TModel>> GetAll();
        Task<List<TModel>> GetWhere(Expression<Func<TModel, bool>> filter);
        Task<Guid> Create(TModel model);
        Task Update(TModel model);
        Task Delete(TModel model);
        
        Task<List<Guid>> CreateMany(List<TModel> models);
        Task UpdateMany(List<TModel> models);
        Task DeleteMany(List<TModel> models);

        bool IsEmpty();
    }
}