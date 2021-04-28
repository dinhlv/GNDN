﻿using System;
using System.Collections.Generic;
using SystemManageService;
using DevExpress.Web.ASPxTreeList;
using Entity;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Data;
using DevExpress.Web;
using System.IO;
using CBDN.Class;
namespace MTCSYT
{
    //sCAP_DDIEN
    //sLoaiSoDoCapDien
    //DCS, LM,DT,NR
    public partial class rq_BaoCaoTTKD : BasePage
    {
        DataAccess.clTTTT db = new DataAccess.clTTTT();
        private const string funcid = "61";
        private SYS_Right rightOfUser = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            MTCSYT.SYS_Session session = (MTCSYT.SYS_Session)Session["SYS_Session"];
            if (session == null || session.User.USERNAME == "Guest")
            {
                Response.Redirect("~\\Login.aspx");
            }
            else if (session.XacNhanPass == 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", "alert('Mật Khẩu Không Hợp Lệ. Yêu Cầu Đổi Mật Khẩu'); window.location='" +
                Request.ApplicationPath + "HeThong/ChangePassword.aspx';", true);
            }
            else if (session.DatePass > 90)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", "alert('Mật Khẩu Quá 90 Ngày. Yêu Cầu Đổi Mật Khẩu'); window.location='" +
                Request.ApplicationPath + "HeThong/ChangePassword.aspx';", true);
            }
            Session["SYS_Session"] = session;
            if (!IsPostBack)
            {
                laodDVCapCha();
                loadDSNgay();
                LoadTyLeTT();
                TyLEBT();
                LoadDataDV();
                _DataBind();
                InBienBanTonThat();

            }
            else
            {
                InBienBanTonThat();


            }
        }
        private void _DataBind()
        {
            List<DM_DS> List = new List<DM_DS>();
            DM_DS Dvi = new DM_DS();

            Dvi.MA_DVIQLY = Request["MATRAM_V"] + "";
            Dvi.NAME_DVIQLY = Request["MATRAM_T"] + "";
            List.Add(Dvi);
            cmbMaTram.DataSource = List;
            cmbMaTram.TextField = "NAME_DVIQLY";
            cmbMaTram.ValueField = "MA_DVIQLY";
            cmbMaTram.DataBind();

        }
        private void TyLEBT()
        {
            MTCSYT.SYS_Session session = (MTCSYT.SYS_Session)Session["SYS_Session"];
            string madvi = session.User.ma_dviqlyDN;
            var kh = db.SELECT_TTTT_PT_BT_KHANG(madvi,0);
            int t = kh.Rows.Count;
            if (t != 0)
            {
                string tlbt = kh.Rows[0]["PT_BT"] + "";
                txtTyLeBT.Text = tlbt;
            }
            else
            {
                txtTyLeBT.Text = "30";
            }
        }

        private void InBienBanTonThat()
        {
            if (cmbMaTram.Value == null) return;
            MTCSYT.SYS_Session session = (MTCSYT.SYS_Session)Session["SYS_Session"];
            int strMadviqly = int.Parse(session.User.ma_dviqly);
            DataAccess.clTTTT db = new DataAccess.clTTTT();

            CBDN.TonThatKyThuatReport.DuyetCanhBaoTTKD DuyetKH = new CBDN.TonThatKyThuatReport.DuyetCanhBaoTTKD();

            DataTable dttram = new DataTable();
            DataTable dtKhang = new DataTable();
            DataTable dtKhangD = new DataTable();
            int thang = 0, thang1 = 0, thang2 = 0, thang3 = 0, nam = 0, nam1 = 0, nam2 = 0, nam3 = 0;
            string Ma_dvi = cmMaDvi.Value + "";

            string Matram = cmbMaTram.Value + "";
            thang = int.Parse(cmbThang.Value + "");
            nam = int.Parse(cmbNam.Value + "");
            if (thang == 1) { thang1 = 12; thang2 = 11; thang3 = 10; nam1 = nam - 1; nam2 = nam - 1; nam3 = nam - 1; }
            else if (thang == 2) { thang1 = 1; thang2 = 12; thang3 = 11; nam1 = nam; nam2 = nam - 1; nam3 = nam - 1; }
            else if (thang == 3) { thang1 = 2; thang2 = 1; thang3 = 12; nam1 = nam; nam2 = nam; nam3 = nam - 1; }
            else { thang1 = thang - 1; thang2 = thang - 2; thang3 = thang - 3; nam1 = nam; nam2 = nam; nam3 = nam; }

            float tylebt = float.Parse(txtTyLeBT.Text + "");
            dttram = db.SELECT_THONGTIN_TRAM_BCKD(Ma_dvi, Matram, thang, nam, thang1, nam1, thang2, nam2, thang3, nam3);
            dtKhang = db.SELECT_THONGTIN_KHANG_BCKD(Ma_dvi, Matram, thang, nam);
            if (int.Parse(rdTinhToan.Value + "") == 0)
            {
                dtKhangD = DuyetKH.DCB_TKD(dtKhang, tylebt,0, thang, nam, Ma_dvi, Matram);
            }
            else
            {
                dtKhangD = DuyetKH.DCB_TKD(dtKhang, tylebt, 1, thang, nam, Ma_dvi, Matram);
            }
            if (dtKhang.Rows.Count ==0 || dttram.Rows.Count == 0)
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "", "alert('Trạm không có dữ liệu theo điều kiện chọn.');", true);
                return;
            }
            else
            {
                TonThatKyThuatReport.InBienTTKD report = new TonThatKyThuatReport.InBienTTKD(dttram, dtKhangD, "" + cmbThang.Value, "" + cmbNam.Value, Ma_dvi);
                ReportViewer2.Report = report;
                ReportToolbar2.ReportViewer = ReportViewer2;
            }
        }
        protected void cbAll_Init(object sender, EventArgs e)
        {

            ASPxCheckBox chk = sender as ASPxCheckBox;
            ASPxGridView grid = (chk.NamingContainer as GridViewHeaderTemplateContainer).Grid;
            chk.Checked = (grid.Selection.Count == grid.VisibleRowCount);
        }
        private void loadDSNgay()
        {

                cmbThang.Value = Request["THANG"] + "";
            cmbNam.Value = Request["NAM"] + "";
        }
        private void laodDVCapCha()
        {
            List<DM_DS> List = new List<DM_DS>();
            DM_DS Dvi = new DM_DS();

            Dvi.MA_DVIQLY = Request["MADL_V"] + "";
            Dvi.NAME_DVIQLY = Request["MADL_T"] + "";
            List.Add(Dvi);

            MaDienLuc.DataSource = List;
            MaDienLuc.TextField = "NAME_DVIQLY";
            MaDienLuc.ValueField = "MA_DVIQLY";
                MaDienLuc.DataBind();

        }
        private void LoadDataDV()
        {
            List<DM_DS> List = new List<DM_DS>();
            DM_DS Dvi = new DM_DS();

            Dvi.MA_DVIQLY = Request["MADV_V"] + "";
            Dvi.NAME_DVIQLY = Request["MADV_T"] + "";
            List.Add(Dvi);

            cmMaDvi.DataSource = List;
            cmMaDvi.TextField = "NAME_DVIQLY";
            cmMaDvi.ValueField = "MA_DVIQLY";
                cmMaDvi.DataBind();

        }
        //Load tỷ lệ tổn thất của trạm
        private void LoadTyLeTT()
        {
            MTCSYT.SYS_Session session = (MTCSYT.SYS_Session)Session["SYS_Session"];
            string madvi = session.User.ma_dviqlyDN;
            var kh = db.SELECT_TTTT_PT_BT_KHANG(madvi, 2);
            int t = kh.Rows.Count;
            if (t != 0)
            {
                string tlbt = kh.Rows[0]["PT_BT"] + "";
                TLTT_Tram.Text = tlbt;
            }
            else
            {
                TLTT_Tram.Text = "0";
            }
        }
        protected void grdGiao_Callback(object sender, EventArgs e)
        {

        }

        public class DM_DS
        {

            public string MA_DVIQLY { get; set; }
            public string NAME_DVIQLY { get; set; }
        }

        protected void btnLoc_Click(object sender, EventArgs e)
        {

            InBienBanTonThat();
        }
    }
}