﻿using EasyPack.Core.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EasyPack.Core.Repositories
{
    public interface ICategoryRepository
    {
        List<Category> GetCategoryList();
        Category GetCategoryById(int id);
        void DeleteCategory(int category);
        Category UpdateCategory(Category category, int categoryId);
        Category AddCategory(Category category);
    }
}
