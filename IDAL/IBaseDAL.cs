using System;
using System.Linq;
using System.Linq.Expressions;

namespace IDAL
{

    /// <summary>
    /// 每次提示基本都有增删改  成一个接口 基接口
    /// </summary>
    /// <typeparam name="T"></typeparam>
    public partial interface IBaseDAL<T> where T:class,new ()
    {
        //新增
        void Add(T t);
        //修改
        void Upd(T t);
        //删除
        void Tel(T t);
        //执行SQL
        int SaveChanges();

        //查询单个
        T GetModel(Expression<Func<T, bool>> whereLambda);
        //主键查询单个
        T GetModel(params object [] id);

        //条件查询
        IQueryable<T> ListModels(Expression<Func<T, bool>> whereLambda);
        //分页 排序 查询
        IQueryable<T> ListModelsByPage<type>(int pageSize, int pageIndex, bool isAsc, Expression<Func<T, type>> OrderByLambda, Expression<Func<T, bool>> WhereLambda);



    }
}
