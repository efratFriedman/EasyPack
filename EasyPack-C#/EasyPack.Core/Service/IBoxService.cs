﻿using EasyPack.Core.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EasyPack.Core.Service
{
    public interface IBoxService
    {
        List<Box> GetBoxList();
        Box GetBoxById(int id);
        void DeleteBox(int id);
        Box UpdateBox(Box box, int BoxId);
        Box AddBox(Box box);
    }
}
