pageextension 50110 ItemCardPageExt extends "Item Card"
{
    layout
    {
        addafter(Blocked)
        {
            field("Quality"; Rec.Quality)
            {
                ApplicationArea = All;
                ToolTip = 'Shows whether the item is new or used.';
            }
        }
    }
}