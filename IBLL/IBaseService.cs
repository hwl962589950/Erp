using System;
using System.Linq;
using System.Linq.Expressions;

namespace IBLL
{
    public partial interface IBaseService<T>  where T : class,new ()
    {
        bool Add(T t);
        bool Delete(T t);
        bool Update(T t);
        T GetModel(Expression<Func<T, bool>> whereLambda);

        T GetModel(params object[] id);
        IQueryable<T> ListModels(Expression<Func<T, bool>> whereLambda);
        IQueryable<T> ListModelsByPage<type>(int pageSize, int pageIndex, bool isAsc, Expression<Func<T, type>> OrderByLambda, Expression<Func<T, bool>> WhereLambda);
    }
}
