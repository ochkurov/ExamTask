report 50130 "Incentive Payment Report"
{
    Caption = 'Incentive Payment Report';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    ProcessingOnly = true;
    dataset
    {

    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(Filters)
                {
                    field(PeriodStart; PeriodStart)
                    {
                        ApplicationArea = All;
                        Caption = 'PeriodStart';
                    }
                    field(PeriodEnd; PeriodEnd)
                    {
                        ApplicationArea = All;
                        Caption = 'PeriodEnd';
                    }
                }
            }
        }
    }
    trigger OnPostReport()

    var
        Salesperson: Record "Salesperson/Purchaser";
        Ledger: Record "Incentive Ledger Entry";
        ExcelBuf: Record "Excel Buffer";
        TotalBonus: Decimal;


    begin
        ExcelBuf.Reset();
        ExcelBuf.DeleteAll();
        ExcelBuf.CreateNewBook('Incentive_Payments');

        if Salesperson.FindSet() then
            repeat
                Ledger.Reset();
                Ledger.SetRange("Salesperson Code", Salesperson.Code);
                if PeriodStart > PeriodEnd then
                    Error('PeriodStart cannot be later than Period End');
                if (PeriodStart <> 0D) and (PeriodEnd <> 0D) then
                    Ledger.SetRange("Posting Date", PeriodStart, PeriodEnd);
                if Ledger.FindSet() then begin
                    //Header name of Manager
                    ExcelBuf.AddColumn('Salesperson:', false, '', true, false, false, '', ExcelBuf."Cell Type"::Text);
                    ExcelBuf.AddColumn(Salesperson."Code", false, '', false, false, false, '', ExcelBuf."Cell Type"::Text);
                    ExcelBuf.NewRow();
                    ExcelBuf.NewRow();

                    // Header of Table
                    ExcelBuf.AddColumn('Document No.', false, '', true, false, false, '', ExcelBuf."Cell Type"::Text);
                    ExcelBuf.AddColumn('Posting Date', false, '', true, false, false, '', ExcelBuf."Cell Type"::Text);
                    ExcelBuf.AddColumn('Amount', false, '', true, false, false, '', ExcelBuf."Cell Type"::Text);
                    ExcelBuf.NewRow();

                    // Strings this data
                    TotalBonus := 0;
                    repeat
                        ExcelBuf.AddColumn(Ledger."Document No.", false, '', false, false, false, '', ExcelBuf."Cell Type"::Text);
                        ExcelBuf.AddColumn(Ledger."Posting Date", false, '', false, false, false, 'dd.mm.yyyy', ExcelBuf."Cell Type"::Date);
                        ExcelBuf.AddColumn(Ledger.Amount, false, '', false, false, false, '0.00', ExcelBuf."Cell Type"::Number);
                        ExcelBuf.NewRow();
                        //Calculate total bonus
                        TotalBonus += Ledger.Amount
                    until Ledger.Next() = 0;


                    // Finally strings

                    ExcelBuf.NewRow();
                    ExcelBuf.AddColumn('Total Bonus:', false, '', true, false, false, '', ExcelBuf."Cell Type"::Text);
                    ExcelBuf.AddColumn(TotalBonus, false, '', true, false, false, '0.00', ExcelBuf."Cell Type"::Number);
                    ExcelBuf.NewRow();

                    ExcelBuf.AddColumn('Monthly Salary:', false, '', true, false, false, '', ExcelBuf."Cell Type"::Text);
                    ExcelBuf.AddColumn(Salesperson."Salary Amount", false, '', true, false, false, '0.00', ExcelBuf."Cell Type"::Number);
                    ExcelBuf.NewRow();

                    ExcelBuf.AddColumn('Total Salary:', false, '', true, false, false, '', ExcelBuf."Cell Type"::Text);
                    ExcelBuf.AddColumn(TotalBonus + Salesperson."Salary Amount", false, '', true, false, false, '0.00', ExcelBuf."Cell Type"::Number);
                    //Create a separate sheet for the current manager
                    ExcelBuf.WriteSheet(CopyStr(Salesperson."Code", 1, 31), '', '');

                    ExcelBuf.DeleteAll();
                end;
            until Salesperson.Next() = 0;


        ExcelBuf.CloseBook();
        ExcelBuf.OpenExcel();

    end;

    var
        PeriodStart: Date;
        PeriodEnd: Date;
}