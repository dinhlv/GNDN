//------------------------------------------------------------------------------------------------------------------------
//-- Generated By:   TrungVK using CodeSmith 4.0.0.0
//-- Template:       Service.cst
//-- Date Generated: Friday, September 19, 2014
//------------------------------------------------------------------------------------------------------------------------
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DataAccess;
using Entity;
using System.ComponentModel;
using System.Data;

namespace SystemManageService
{
    public partial class DM_DVQLYService
    {
        public DataTable DM_DVQLY_SelectByLever(int Ma_dviqly,int level)
        {
            return _dm_dvqlyDataAccess.DM_DVQLY_SelectByLever(Ma_dviqly, level);
        }
        public DataTable DM_DVQLY_SelectReturnCha(string Ma_dviqly)
        {
            return _dm_dvqlyDataAccess.DM_DVQLY_SelectReturnCha(Ma_dviqly);
        }
        public List<DM_DVQLY> DM_DVQLYandLEVER_BYDV(string Ma_dv)
        {
            return _dm_dvqlyDataAccess.DM_DVQLYandLEVER_BYDV(Ma_dv);
        }
        public DM_DVQLY DM_DVQLY_SelectAll_byMaDVi(string Ma_DVi)
        {
            return _dm_dvqlyDataAccess.DM_DVQLY_SelectAll_byMaDVi(Ma_DVi);
        }
        public DataTable DM_DVQLY_SelectAllCapCha()
        {
            return _dm_dvqlyDataAccess.DM_DVQLY_SelectAllCapCha();
        }
        public DataTable SelectAll_DVI_ByChild(int Ma_dviqly)
        {
            return _dm_dvqlyDataAccess.SelectAll_DVI_ByChild(Ma_dviqly);
        }
        public DataTable Select_DVI_Cha_ByChild(int Ma_dviqly)
        {
            return _dm_dvqlyDataAccess.Select_DVI_Cha_ByChild(Ma_dviqly);
        }
    }
}


