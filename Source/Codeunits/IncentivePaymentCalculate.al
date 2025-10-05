codeunit 50128 "Incentive Payment Calculate"
{
    procedure Run(var PaymentHeader: Record "Incentive Payment Header")
    var
        PaymentLine: Record "Incentive Payment Line";
        IncentiveLedger: Record "Incentive Ledger Entry";
        Salesperson: Record "Salesperson/Purchaser";
        BonusSum: Decimal;
    begin
        PaymentHeader.TestField(Status, PaymentHeader.Status::Open);
        if (PaymentHeader."Period Begin" < PaymentHeader."Period End") and (PaymentHeader."Period Begin" > 0D) then
            Error('Period End must be before than Period Begin.');
        PaymentHeader.Reset();

        PaymentLine.Reset();

        PaymentLine.SetRange("Document No.", PaymentHeader."No.");

        if PaymentLine.FindSet() then
            repeat
                BonusSum := 0;
                IncentiveLedger.Reset();
                IncentiveLedger.SetRange("Document Type", "Document Type Enum"::"Sales Invoice"); // find only not payed Document

                IncentiveLedger.SetRange("Salesperson Code", PaymentLine."Salesperson Code");
                IncentiveLedger.SetRange("Posting Date", PaymentHeader."Period Begin", PaymentHeader."Period End");
                IncentiveLedger.CalcSums(Amount);
                BonusSum := IncentiveLedger.Amount;

                PaymentLine."Incentive Amount" := BonusSum;
                Salesperson.Get(PaymentLine."Salesperson Code");
                PaymentLine."Salary Amount" := Salesperson."Salary Amount";
                PaymentLine."Total Amount" := PaymentLine."Incentive Amount" + Salesperson."Salary Amount";
                PaymentLine.Modify();

                IncentiveLedger.Init();
                IncentiveLedger."Document Type" := "Document Type Enum"::"Incentive Payment";
                IncentiveLedger."Document No." := PaymentHeader."No.";
                IncentiveLedger."Salesperson Code" := PaymentLine."Salesperson Code";
                IncentiveLedger."Posting Date" := PaymentHeader."Posting Date";
                IncentiveLedger.Amount := PaymentLine."Total Amount";
                IncentiveLedger.Insert();
            until PaymentLine.Next() = 0;
        PaymentHeader.Status := "Incentive Payment Status"::Posted;
        PaymentHeader.Modify();
    end;

}