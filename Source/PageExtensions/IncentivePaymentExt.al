pageextension 50129 "Incentive Payment Extension" extends "Incentive Payment"
{
    actions
    {
        addlast(Processing)
        {
            action(ExportToExcel)
            {
                Caption = 'Export To Excel';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                Image = ActivateDiscounts;
                trigger OnAction()
                begin
                    Report.SaveAsExcel(Report::"Incentive Payment Report", 'IncentiveReport.xlsx');
                end;
            }
        }
    }


}