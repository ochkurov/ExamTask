codeunit 50118 "Quality Transfer Sales"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", OnBeforeSalesShptLineInsert, '', true, true)]
    local procedure OnBeforeSalesShptLineInsert(
        var SalesShptLine: Record "Sales Shipment Line";
        SalesLine: Record "Sales Line"
    )
    begin
        SalesShptLine.Validate("Quality", SalesLine.Quality);
    end;
}