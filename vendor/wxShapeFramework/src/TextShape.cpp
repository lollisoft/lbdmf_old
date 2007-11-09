/***************************************************************
 * Name:      TextShape.cpp
 * Purpose:   Implements static text shape class
 * Author:    Michal Bližňák (michal.bliznak@tiscali.cz)
 * Created:   2007-07-22
 * Copyright: Michal Bližňák
 * License:   wxWidgets license (www.wxwidgets.org)
 * Notes:
 **************************************************************/

#include <wx/dataobj.h>
#include "TextShape.h"
#include "ShapeCanvas.h"

IMPLEMENT_DYNAMIC_CLASS(wxSFTextShape, wxSFRectShape);

wxSFTextShape::wxSFTextShape(void)
: wxSFRectShape()
{
    m_Font = sfdvTEXTSHAPE_FONT;
    m_Font.SetPointSize(12);

	m_nLineHeight = 12;

    m_TextColor = sfdvTEXTSHAPE_TEXTCOLOR;
    m_sText = wxT("Text");

    m_Fill = *wxTRANSPARENT_BRUSH;
    m_Border = *wxTRANSPARENT_PEN;

    XS_SERIALIZE_EX(m_Font, wxT("font"), sfdvTEXTSHAPE_FONT);
    XS_SERIALIZE_EX(m_TextColor, wxT("color"), sfdvTEXTSHAPE_TEXTCOLOR);
    XS_SERIALIZE(m_sText, wxT("text"));

    UpdateRectSize();
}

wxSFTextShape::wxSFTextShape(const wxRealPoint& pos, const wxString& txt, wxSFDiagramManager* manager)
: wxSFRectShape(pos, wxRealPoint(1, 1), manager)
{
    m_Font = sfdvTEXTSHAPE_FONT;
    m_Font.SetPointSize(12);

	m_nLineHeight = 12;

    m_TextColor = sfdvTEXTSHAPE_TEXTCOLOR;
    m_sText = txt;

    m_Fill = *wxTRANSPARENT_BRUSH;
    m_Border = *wxTRANSPARENT_PEN;

    XS_SERIALIZE_EX(m_Font, wxT("font"), sfdvTEXTSHAPE_FONT);
    XS_SERIALIZE_EX(m_TextColor, wxT("color"), sfdvTEXTSHAPE_TEXTCOLOR);
    XS_SERIALIZE(m_sText, wxT("text"));

    UpdateRectSize();
}

wxSFTextShape::wxSFTextShape(wxSFTextShape& obj)
: wxSFRectShape(obj)
{
    m_Font = obj.m_Font;

    m_TextColor = obj.m_TextColor;
    m_sText = obj.m_sText;

    UpdateRectSize();
}

wxSFTextShape::~wxSFTextShape()
{

}

//----------------------------------------------------------------------------------//
// public virtual functions
//----------------------------------------------------------------------------------//

void wxSFTextShape::Update()
{
    UpdateRectSize();
    wxSFShapeBase::Update();
}

void wxSFTextShape::Scale(double x, double y, bool children)
{
    // HINT: overload it for custom actions...

	if((x > 0) && (y > 0))
	{
	    double s = 1;

        if(x == 1) s = y;
        else if (y == 1) s = x;
	    else if(x >= y) s = x;
	    else
            s = y;

        double size = (double)m_Font.GetPointSize()*s;
        if(size < 5)size = 5;

		m_Font.SetPointSize((int)size);
		UpdateRectSize();

        // call default function implementation (needed for scaling of shape's children)
		wxSFShapeBase::Scale(x, y, children);
	}
}

void wxSFTextShape::OnHandle(wxSFShapeHandle& handle)
{
    // HINT: overload it for custom actions...

    wxRealPoint prevSize = GetRectSize();

    // perform standard operations
	switch(handle.GetType())
	{
	case wxSFShapeHandle::hndLEFT:
		OnLeftHandle(handle);
		break;

	case wxSFShapeHandle::hndRIGHT:
		OnRightHandle(handle);
		break;

	case wxSFShapeHandle::hndTOP:
		OnTopHandle(handle);
		break;

	case wxSFShapeHandle::hndBOTTOM:
		OnBottomHandle(handle);
		break;

    default:
        break;
	}

    wxRealPoint newSize = m_nRectSize;

    double sx = newSize.x / prevSize.x;
    double sy = newSize.y / prevSize.y;
    Scale(sx, sy);

	switch(handle.GetType())
	{
	case wxSFShapeHandle::hndLEFT:
		{
		    double dx = m_nRectSize.x - prevSize.x;

            // update position of children
            /*ShapeList m_lstChildren;
            GetChildren(m_lstChildren);
            m_lstChildren.Insert(this);*/

            //wxShapeListNode *node = m_lstChildren.GetFirst();
            MoveBy(-dx, 0);

            wxShapeListNode *node = (wxShapeListNode*)GetFirstChildNode();
            while(node)
            {
                node->GetData()->MoveBy(-dx, 0);
                node = node->GetNext();
            }
		}
		break;

	case wxSFShapeHandle::hndTOP:
		{
		    double dy = m_nRectSize.y - prevSize.y;

            // update position of children
            /*ShapeList m_lstChildren;
            GetChildren(m_lstChildren);
            m_lstChildren.Insert(this);

            wxShapeListNode *node = m_lstChildren.GetFirst();*/
            MoveBy(0, -dy);

            wxShapeListNode *node = (wxShapeListNode*)GetFirstChildNode();
            while(node)
            {
                node->GetData()->MoveBy(0, -dy);
                node = node->GetNext();
            }
		}
		break;

    default:
        break;
	}
}

//----------------------------------------------------------------------------------//
// public functions
//----------------------------------------------------------------------------------//

wxSize wxSFTextShape::GetTextExtent()
{
    wxCoord w = -1, h = -1;

    if(m_pParentManager && GetParentCanvas())
    {
        wxClientDC dc((wxWindow*)GetParentCanvas());

        // calculate text extent
        dc.SetFont(m_Font);
        dc.GetMultiLineTextExtent(m_sText, &w, &h, &m_nLineHeight);
        dc.SetFont(wxNullFont);
    }
    else
    {
        w = (int)m_nRectSize.x;
        h = (int)m_nRectSize.y;

        wxStringTokenizer tokens(m_sText, wxT("\n\r"), wxTOKEN_RET_EMPTY);
        m_nLineHeight = int(m_nRectSize.y/tokens.CountTokens());
    }

    return wxSize(w, h);
}

void wxSFTextShape::UpdateRectSize()
{
    wxSize tsize = GetTextExtent();

	if(tsize.IsFullySpecified())
	{
		if(tsize.x <= 0) tsize.x = 1;
		if(tsize.y <= 0) tsize.y = 1;

		m_nRectSize.x = (double)tsize.x;
		m_nRectSize.y = (double)tsize.y;
	}
}

void wxSFTextShape::SetText(const wxString& txt)
{
    m_sText = txt;
    UpdateRectSize();
}

void wxSFTextShape::SetFont(const wxFont& font)
{
    m_Font = font;
    UpdateRectSize();
}

//----------------------------------------------------------------------------------//
// protected virtual functions
//----------------------------------------------------------------------------------//

void wxSFTextShape::DrawNormal(wxSFScaledPaintDC& dc)
{
    wxSFRectShape::DrawNormal(dc);
    DrawTextContent(dc);
}

void wxSFTextShape::DrawHover(wxSFScaledPaintDC& dc)
{
    wxSFRectShape::DrawHover(dc);
    DrawTextContent(dc);
}

void wxSFTextShape::DrawHighlighted(wxSFScaledPaintDC& dc)
{
    wxSFRectShape::DrawHighlighted(dc);
    DrawTextContent(dc);
}

void wxSFTextShape::OnLeftHandle(wxSFShapeHandle& handle)
{
	// HINT: overload it for custom actions...

    m_nRectSize.x -= ((double)handle.GetPosition().x - GetAbsolutePosition().x);
}

void wxSFTextShape::OnTopHandle(wxSFShapeHandle& handle)
{
	// HINT: overload it for custom actions...

	m_nRectSize.y -= ((double)handle.GetPosition().y - GetAbsolutePosition().y);
}

//----------------------------------------------------------------------------------//
// protected functions
//----------------------------------------------------------------------------------//

void wxSFTextShape::DrawTextContent(wxSFScaledPaintDC& dc)
{
	wxString line;
	int i = 0;

    if(m_Fill.GetStyle() == wxTRANSPARENT)
    {
        dc.SetBackgroundMode(wxTRANSPARENT);
    }
    else
    {
        dc.SetBackgroundMode(wxSOLID);
        dc.SetTextBackground(m_Fill.GetColour());
    }

    dc.SetTextForeground(m_TextColor);
	dc.SetFont(m_Font);

    wxRealPoint pos = GetAbsolutePosition();

	// draw all text lines
	wxStringTokenizer tokens(m_sText, wxT("\n\r"), wxTOKEN_RET_EMPTY);
    while(tokens.HasMoreTokens())
    {
        line = tokens.GetNextToken();
		dc.DrawText(line, pos.x, pos.y + i*m_nLineHeight);
		i++;
	}

    dc.SetFont(wxNullFont);
}