﻿using EasyPack.Core.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EasyPack.Core.Service
{
    public interface IRoomService
    {
        List<Room> GetRoomList();
        Room GetRoomById(int id);
        void DeleteRoom(int id);
        Room UpdateRoom(Room room, int roomId);
        Room AddRoom(Room room);
    }
}
