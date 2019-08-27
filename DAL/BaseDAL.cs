using System;
using System.Data.Entity;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Linq.Expressions;
using IDAL;

namespace DAL
{
    public partial class BaseDAL<T> : IBaseDAL<T> where T : class, new()
    {
        private DbContext db = DbContextFactory.Create();

        /// <summary>
        /// 获取集合
        /// </summary>
        /// <param name="whereLambda"></param>
        /// <returns></returns>
        public IQueryable<T> ListModels(Expression<Func<T, bool>> whereLambda)
        {
                return db.Set<T>().Where(whereLambda);
         }

        /// <summary>
        /// 获取
        /// </summary>
        /// <typeparam name="type">类型</typeparam>
        /// <param name="pageSize">每页数据</param>
        /// <param name="pageIndex">页码</param>
        /// <param name="isAsc">是否升序</param>
        /// <param name="OrderByLambda">排序得列</param>
        /// <param name="WhereLambda">查询条件</param>
        /// <returns></returns>
        public IQueryable<T> ListModelsByPage<type>(int pageSize, int pageIndex, bool isAsc, Expression<Func<T, type>> OrderByLambda, Expression<Func<T, bool>> WhereLambda)
        {
           
                if (isAsc)
                    return db.Set<T>().Where(WhereLambda).OrderBy(OrderByLambda).Skip((pageIndex - 1) * pageSize).Take(pageSize);
                else
                    return db.Set<T>().Where(WhereLambda).OrderByDescending(OrderByLambda).Skip((pageIndex - 1) * pageSize).Take(pageSize);
            
              

        }


        public T GetModel(Expression<Func<T, bool>> whereLambda)
        {
            
                return db.Set<T>().Where(whereLambda).AsEnumerable().FirstOrDefault();

            
        }


        /// <summary>
        /// 新增实体
        /// </summary>
        /// <param name="t"></param>
        /// <returns></returns>
        public void Add(T t)
        {
           
                db.Set<T>().Add(t);
           


        }


        /// <summary>
        /// 删除
        /// </summary>
        /// <param name="t"></param>
        /// <returns></returns>
        public void Tel(T t)
        {
            
                db.Set<T>().Remove(t);
            
        }

        /// <summary>
        /// 修改
        /// </summary>
        /// <param name="t"></param>
        /// <returns></returns>
        public void Upd(T t)
        {
            
                db.Set<T>().AddOrUpdate(t);
            
        }

        /// <summary>
        /// 提交SQL
        /// </summary>
        /// <returns></returns>
        public int SaveChanges()
        {
            return db.SaveChanges();
        }
    }
}
