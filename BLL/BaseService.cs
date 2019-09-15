using System;
using System.Linq;
using System.Linq.Expressions;
using IBLL;
using IDAL;

namespace BLL
{
    public abstract partial class BaseService<T>  where T : class, new() 
    {
        protected IBaseDAL<T> DAL;
        

       

        public virtual bool Add(T t)
        {
            DAL.Add(t);

            return DAL.SaveChanges() > 0;
        }

        public virtual bool Delete(T t)
        {
             DAL.Tel(t);
            return DAL.SaveChanges() > 0;
        }
        public virtual bool Update(T t)
        {
             DAL.Upd(t);
            return DAL.SaveChanges() > 0;
        }

        public virtual T GetModel(params object[] id)
        {
            return DAL.GetModel(id);
        }

        public virtual T GetModel(Expression<Func<T, bool>> whereLambda)
        {
            return DAL.GetModel(whereLambda);
        }

        public virtual IQueryable<T> ListModels(Expression<Func<T, bool>> whereLambda)
        {
            return DAL.ListModels(whereLambda);
        }

        public virtual IQueryable<T> ListModelsByPage<type>(int pageSize, int pageIndex, bool isAsc, Expression<Func<T, type>> OrderByLambda, Expression<Func<T, bool>> WhereLambda)
        {
            return DAL.ListModelsByPage(pageSize, pageIndex, isAsc, OrderByLambda, WhereLambda);
        }

        public virtual IQueryable<T> ListModelsByPage<type>(int pageSize, int pageIndex, bool isAsc, Expression<Func<T, type>> OrderByLambda, Expression<Func<T, bool>> WhereLambda, out int total)
        {
            return DAL.ListModelsByPage(pageSize, pageIndex, isAsc, OrderByLambda, WhereLambda, out total);
        }


    }
}
