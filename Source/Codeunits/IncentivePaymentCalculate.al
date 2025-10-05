codeunit 50128 "Incentive Payment Calculate"
{
    procedure Run(var PaymentHeader: Record "Incentive Payment Header")
    var
        PaymentLine: Record "Incentive Payment Line";
        IncentiveLedger: Record "Incentive Ledger Entry";
        Salesperson: Record "Salesperson/Purchaser";
        BonusSum: Decimal;
        EntryNo: Integer;
    begin
        PaymentHeader.TestField(Status, PaymentHeader.Status::Open);
        if (PaymentHeader."Period Begin" > PaymentHeader."Period End") or (PaymentHeader."Period Begin" = 0D) then
            Error('Period End must be before than Period Begin.');
        if IncentiveLedger.FindLast() then
            EntryNo := IncentiveLedger."Entry No." + 1;
        Salesperson.SetRange(Blocked, false);
        if Salesperson.FindSet() then
            repeat
                BonusSum := 0;
                IncentiveLedger.SetRange("Document Type", "Document Type Enum"::"Sales Invoice"); // find only not payed Document

                IncentiveLedger.SetRange("Salesperson Code", Salesperson.Code);
                IncentiveLedger.SetRange("Posting Date", PaymentHeader."Period Begin", PaymentHeader."Period End");
                IncentiveLedger.CalcSums(Amount);
                BonusSum := IncentiveLedger.Amount;
                if (BonusSum <> 0) or (Salesperson."Salary Amount" <> 0) then begin
                    PaymentLine.Init();
                    PaymentLine."Document No." := PaymentHeader."No.";
                    PaymentLine."Salesperson Code" := Salesperson.Code;
                    PaymentLine."Incentive Amount" := BonusSum;
                    PaymentLine."Salary Amount" := Salesperson."Salary Amount";
                    PaymentLine."Total Amount" := PaymentLine."Incentive Amount" + Salesperson."Salary Amount";
                    PaymentLine.Insert(true);

                    EntryNo += 1;
                    IncentiveLedger.Init();
                    IncentiveLedger."Entry No." := EntryNo;
                    IncentiveLedger."Document Type" := "Document Type Enum"::"Incentive Payment";
                    IncentiveLedger."Document No." := PaymentHeader."No.";
                    IncentiveLedger."Salesperson Code" := PaymentLine."Salesperson Code";
                    IncentiveLedger."Posting Date" := PaymentHeader."Posting Date";
                    IncentiveLedger.Amount := PaymentLine."Total Amount";
                    IncentiveLedger.Insert(true);
                end;
            until Salesperson.Next() = 0;
        PaymentHeader.Status := "Incentive Payment Status"::Posted;
        PaymentHeader.Modify(true);
    end;

}