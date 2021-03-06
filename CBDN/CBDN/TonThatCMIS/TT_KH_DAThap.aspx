﻿<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage/MasterPageMTCSYT.Master"
    CodeBehind="TT_KH_DAThap.aspx.cs" Inherits="MTCSYT.TT_KH_DAThap" %>

<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>





<%--<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dxrp" %>
<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dxp" %>--%>

<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v17.1, Version=17.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTreeList" TagPrefix="dxwtl" %>


<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
        <h4 class="page-title"> BẢNG TỔNG HỢP TBA, KHÁCH HÀNG CÓ ĐIỆN ÁP THẤP</h4>
    </div>
    <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
        <ol class="breadcrumb">
            <li><a href="../Default.aspx">Trang chủ</a></li>
            <li><a href="TT_TBA.aspx">Tổn thất điện năng CMIS</a></li>
            <li><a href="TT_TBA.aspx"> BẢNG TỔNG HỢP TBA, KHÁCH HÀNG CÓ ĐIỆN ÁP THẤP </a></li>
        </ol>
    </div>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Category" runat="server">
    <div class="col-md-12">

        <div class="white-box">
            <h1 class="m-b-0 box-title"> BẢNG TỔNG HỢP TBA, KHÁCH HÀNG CÓ ĐIỆN ÁP THẤP</h1>
            <div class="col-lg-12 m-t-30">
                <hr />
            </div>
            <table>
                <tr>
                    <td>
                        <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" Width="100%" HeaderText="Lọc dữ liệu" Theme="Aqua">
                            <PanelCollection>
                                <dx:PanelContent runat="server" SupportsDisabledAttribute="True">
                                    <table>
                                        <tr>
                                            <td>
                                                <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Tháng" Width="100px">
                                                </dx:ASPxLabel>
                                            </td>
                                            <td>
                                                <dx:ASPxComboBox ID="cmbThang" runat="server" Width="120px">
                                                    <Items>
                                                        <dx:ListEditItem Text="1" Value="1" />
                                                        <dx:ListEditItem Text="2" Value="2" />
                                                        <dx:ListEditItem Text="3" Value="3" />
                                                        <dx:ListEditItem Text="4" Value="4" />
                                                        <dx:ListEditItem Text="5" Value="5" />
                                                        <dx:ListEditItem Text="6" Value="6" />
                                                        <dx:ListEditItem Text="7" Value="7" />
                                                        <dx:ListEditItem Text="8" Value="8" />
                                                        <dx:ListEditItem Text="9" Value="9" />
                                                        <dx:ListEditItem Text="10" Value="10" />
                                                        <dx:ListEditItem Text="11" Value="11" />
                                                        <dx:ListEditItem Text="12" Value="12" />
                                                    </Items>
                                                </dx:ASPxComboBox>
                                            </td>
                                             
                                            <td>
                                                <dx:ASPxLabel ID="ASPxLabel9" runat="server" Text="Năm" Width="100px">
                                                </dx:ASPxLabel>
                                            </td>
                                            <td>
                                                <dx:ASPxComboBox ID="cmbNam" runat="server" Width="120px">
                                                    <Items>
                                                        <dx:ListEditItem Text="2016" Value="2016" />
                                                        <dx:ListEditItem Text="2017" Value="2017" />
                                                        <dx:ListEditItem Text="2018" Value="2018" />
                                                        <dx:ListEditItem Text="2019" Value="2019" />
                                                        <dx:ListEditItem Text="2020" Value="2020" />
                                                        <dx:ListEditItem Text="2021" Value="2021" />
                                                        <dx:ListEditItem Text="2022" Value="2022" />
                                                        <dx:ListEditItem Text="2023" Value="2023" />
                                                        <dx:ListEditItem Text="2024" Value="2024" />
                                                        <dx:ListEditItem Text="2025" Value="2025" />
                                                    </Items>
                                                </dx:ASPxComboBox>

                                            </td>
                                            <td>
                                                <dx:ASPxButton ID="btnXuat" runat="server" Text="In báo cáo" Width="120px" Theme="Aqua" OnClick="btnXuat_Click">
                                                </dx:ASPxButton>
                                            </td>
                                            <td>
                                                <dx:ASPxButton ID="btnLoc" runat="server" Text="Lọc" Width="120px" Theme="Aqua" OnClick="btnLoc_Click">
                                                </dx:ASPxButton>
                                            </td>
                                        </tr>
                                    </table>
                                </dx:PanelContent>
                            </PanelCollection>
                        </dx:ASPxRoundPanel>
                    </td>
                </tr>
            </table>
            <table width="100%">
                <tr>
                    <td width="100%" valign="Top" colspan="2">
                        <dx:ASPxGridView runat="server" AutoGenerateColumns="False" ID="grdDVT"
                            KeyFieldName="ID" OnHtmlCommandCellPrepared="grdDVT_HtmlCommandCellPrepared" Caption="Tổng hợp TTĐN lũy kế các TBA phân phối tháng"
                                        OnRowDeleting="grdDVT_RowDeleting" 
                                        OnCellEditorInitialize="grdDVT_CellEditorInitialize1" OnCustomColumnDisplayText="grdDVT_CustomColumnDisplayText"
                                        OnStartRowEditing="grdDVT_StartRowEditing"  ClientIDMode="AutoID" Theme="Aqua" Width="100%">
                            <Columns>
                                <dx:GridViewCommandColumn Caption=" " VisibleIndex="15" Width="60px" ShowDeleteButton="true">
                                                
                                            </dx:GridViewCommandColumn>
                                  <dx:GridViewDataTextColumn Caption="Tên đơn vị" FieldName="TEN_DVIQLY" VisibleIndex="0">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Số TBA  đang có điện áp thấp" FieldName="SoTBA" VisibleIndex="1">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Giải Pháp" FieldName="GiaiPhap" VisibleIndex="6">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Tiến độ thực hiện" FieldName="TienDoThucHien" VisibleIndex="8">
                                </dx:GridViewDataTextColumn>
                                 <dx:GridViewBandColumn Caption="Số Khách hàng sinh hoạt có điện áp thấp" VisibleIndex="2">
                                    <Columns>
                                        <dx:GridViewDataTextColumn FieldName="KH160" Caption="&lt;160V" VisibleIndex="3" />
                                        <dx:GridViewDataTextColumn Caption="160V đến &lt;180V" FieldName="KH180" VisibleIndex="4">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="180V - 200V" FieldName="KH200" VisibleIndex="5">
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                            </Columns>
                            <SettingsPager PageSize="20">
                                <Summary Text="Trang {0} của {1} ({2} bản ghi)" />
                            </SettingsPager>
                            <Settings ShowFooter="True" ShowFilterRow="True" ShowFilterRowMenu="True" />
                            <SettingsBehavior AllowFocusedRow="True" />
                            <Settings GridLines="None" />
                            <TotalSummary>
                                <dx:ASPxSummaryItem FieldName="IDCanBo" SummaryType="Count" />
                            </TotalSummary>
                            <SettingsText CommandCancel="Thoát" CommandDelete="Xóa" CommandEdit="Sửa" CommandNew="Thêm"
                                CommandUpdate="Cập Nhật" ConfirmDelete="Bạn Muốn Xóa Chứ ?" />
                        </dx:ASPxGridView>
                    </td>

                </tr>
               <tr>
                    <td align="left" width="10%" valign="top">
                        <span style="float: Left; padding-top: 2px; margin-left: 5px;">
                            <dx:ASPxButton ID="btnThem" runat="server" Text="Thêm mới" Height="22px" Width="120px" ClientIDMode="AutoID" Theme="Aqua" OnClick="btnThem_Click">
                            </dx:ASPxButton>
                        </span>
                    </td>
                    <td align="left" valign="top" width="130px">
                        <span style="float: Left; padding-top: 2px; margin-left: 5px;">
                            <dx:ASPxButton ID="btnSua" runat="server" Text="Sửa" Height="22px" Width="120px" ClientIDMode="AutoID" Theme="Aqua" OnClick="btnSua_Click">
                            </dx:ASPxButton>
                        </span>
                    </td>
                    <td align="left" valign="top">
                        &nbsp;</td>
                 </tr>
            </table>
              <dx:ASPxPopupControl ID="pcAddRoles" runat="server" ClientInstanceName="pcAddRoles"
                        CloseAction="CloseButton" HeaderText="Cập nhật khách hàng có điện áp thấp" PopupHorizontalAlign="WindowCenter"
                        PopupVerticalAlign="WindowCenter" ShowCloseButton="true" Width="400px" Modal="True"
                        ClientIDMode="AutoID" Theme="Aqua">
                        <ContentCollection>
                            <dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server" SupportsDisabledAttribute="True">
                                <table width="100%" class="tbl_Write">                                   
                                   
                                  
                                    <tr>
                                        <td>
                                            <dx:ASPxLabel ID="ASPxLabel17" runat="server" Text="Đơn vị: ">
                                            </dx:ASPxLabel>
                                        </td>
                                        <td>
                                            <dx:ASPxComboBox ID="cmbCuoiNguon" runat="server" IncrementalFilteringMode="Contains" ValueType="System.String" Width="220px"  >
                                            </dx:ASPxComboBox>
                                        </td>
                                    </tr>
                                  <tr>
                                        <td>
                                            <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Số trạm biến áp có điện áp thấp:">
                                            </dx:ASPxLabel><span style="color:red">*</span>
                                        </td>
                                        <td>
                                            <dx:ASPxTextBox ID="txtSoTram" runat="server" Width="220px" >
                                            </dx:ASPxTextBox>
                                        </td>
                                    </tr>
                                   <tr>
                                        <td>
                                            <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Số khách hàng SH có điện áp thấp &lt; 160kV">
                                            </dx:ASPxLabel>
                                        </td>
                                        <td>
                                            <dx:ASPxTextBox ID="txtSoKh160" runat="server" Width="220px">
                                            </dx:ASPxTextBox>
                                        </td>
                                    </tr>
                                  <tr>
                                        <td>
                                            <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Số khách hàng SH có điện áp thấp từ 160kV -180kV">
                                            </dx:ASPxLabel>
                                        </td>
                                        <td>
                                            <dx:ASPxTextBox ID="txtSoKH180" runat="server" Width="220px">
                                            </dx:ASPxTextBox>
                                        </td>
                                    </tr>
                                  <tr>
                                        <td>
                                            <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="Số khách hàng SH có điện áp thấp trên 200kV">
                                            </dx:ASPxLabel>
                                        </td>
                                        <td>
                                            <dx:ASPxTextBox ID="txtSoKH200" runat="server" Width="220px">
                                            </dx:ASPxTextBox>
                                        </td>
                                    </tr>
                                      <tr>
                                        <td>
                                            <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="Giải pháp">
                                            </dx:ASPxLabel>
                                        </td>
                                        <td>
                                            <dx:ASPxTextBox ID="txtGiaiPhap" runat="server" Width="220px">
                                            </dx:ASPxTextBox>
                                        </td>
                                    </tr>
                                      <tr>
                                        <td>
                                            <dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="Tiến độ thực hiện ">
                                            </dx:ASPxLabel>
                                        </td>
                                        <td>
                                            <dx:ASPxTextBox ID="txtTienDo" runat="server" Width="220px">
                                            </dx:ASPxTextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <dx:ASPxButton ID="btnCapNhat" runat="server" Text="Cập nhật" Width="150px" Theme="Aqua" OnClick="btnCapNhat_Click">
                                            </dx:ASPxButton>
                                        </td>
                                        <td>
                                            <dx:ASPxButton ID="btnDong" runat="server" Width="150px" Text="Đóng" Theme="Aqua" OnClick="btnDong_Click">
                                            </dx:ASPxButton>
                                        </td>
                                    </tr>
                                </table>
                            </dx:PopupControlContentControl>
                        </ContentCollection>
                    </dx:ASPxPopupControl>
        </div>
    </div>
</asp:Content>
