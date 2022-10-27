using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;
using Battleships.Data;
using Battleships.Models;
using Microsoft.EntityFrameworkCore;

namespace Battleships.Repositories
{
    public class BaseRepository<TModel> : IRepository<TModel> where TModel : BaseModel
    {
        protected readonly ApplicationDbContext _context;

        protected DbSet<TModel> ItemSet => _context.Set<TModel>();

        public BaseRepository(ApplicationDbContext context)
        {
            _context = context;
        }

        public virtual async Task<TModel> GetById(Guid id)
        {
            return await ItemSet.FirstOrDefaultAsync(m => m.Id == id);
        }

        public virtual async Task<List<TModel>> GetAll()
        {
            return await ItemSet.ToListAsync();
        }

        public async Task<Guid> Create(TModel model)
        {
            await ItemSet.AddAsync(model);
            await SaveChanges();

            return model.Id;
        }

        public async Task Update(TModel model)
        {
            ItemSet.Update(model);
            await SaveChanges();
        }

        public async Task Delete(TModel model)
        {
            ItemSet.Remove(model);
            await SaveChanges();
        }

        public async Task<List<Guid>> CreateMany(List<TModel> models)
        {
            await ItemSet.AddRangeAsync(models);
            await SaveChanges();

            return models.Select(m => m.Id).ToList();
        }

        public async Task UpdateMany(List<TModel> models)
        {
            ItemSet.UpdateRange(models);
            await SaveChanges();
        }

        public async Task DeleteMany(List<TModel> models)
        {
            ItemSet.RemoveRange(models);
            await SaveChanges();
        }

        public bool IsEmpty()
        {
            var anyExist = ItemSet.Any();
            return !anyExist;
        }
        
        private async Task SaveChanges()
        {
            await _context.SaveChangesAsync();
        }
        
        protected async Task<List<TModel>> GetWhere(Expression<Func<TModel, bool>> filter)
        {
            return await ItemSet.Where(filter).ToListAsync();
        }

        protected async Task<TModel> GetSingle(Expression<Func<TModel, bool>> filter)
        {
            return (await _context.Set<TModel>().Where(filter).ToArrayAsync()).SingleOrDefault();
        }

        protected async Task<TProjection> GetSingle<TProjection>(
            Expression<Func<TModel, bool>> filter,
            Expression<Func<TModel, TProjection>> projectionExpression
        )
        {
            return (await _context
                    .Set<TModel>()
                    .Where(filter)
                    .Select(projectionExpression)
                    .ToArrayAsync()
                ).SingleOrDefault();
        }
        
        protected async Task<TProjection> GetById<TProjection>(Guid id, Expression<Func<TModel, TProjection>> projectionExpression)
        {
            return await ItemSet
                .Where(item => item.Id == id)
                .Select(projectionExpression)
                .FirstOrDefaultAsync();
        }
    }
}