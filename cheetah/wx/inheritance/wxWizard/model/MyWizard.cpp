// For compilers that support precompilation, includes "wx/wx.h".
\#include "wx/wxprec.h"

\#ifndef WX_PRECOMP
\#include "wx/wx.h"
\#endif

////@begin includes
\#include "wx/imaglist.h"
////@end includes

\#include "${class_name}.h"

////@begin XPM images
////@end XPM images

/*
 * ${class_name} type definition
 */

IMPLEMENT_DYNAMIC_CLASS(${class_name}, wxWizard)

/*
 * ${class_name} event table definition
 */

BEGIN_EVENT_TABLE(${class_name}, wxWizard)

////@begin ${class_name} event table entries
////@end ${class_name} event table entries

END_EVENT_TABLE()

/*
 * ${class_name} constructors
 */

${class_name}::${class_name}()
{
	Init();
}

${class_name}::${class_name}(wxWindow *parent, wxWindowID id, const wxPoint &pos)
{
	Init();
	Create(parent, id, pos);
}

/*
 * ${class_name} creator
 */

bool ${class_name}::Create(wxWindow *parent, wxWindowID id, const wxPoint &pos)
{
////@begin ${class_name} creation
	SetExtraStyle(wxWS_EX_BLOCK_EVENTS | wxWIZARD_EX_HELPBUTTON);
	SetParent(parent);
	CreateControls();
////@end ${class_name} creation
	return true;
}

/*
 * ${class_name} destructor
 */

${class_name}::~${class_name}()
{
////@begin ${class_name} destruction
////@end ${class_name} destruction
}

/*
 * Member initialisation
 */

void ${class_name}::Init()
{
////@begin ${class_name} member initialisation
////@end ${class_name} member initialisation
}

/*
 * Control creation for ${class_name}
 */

void ${class_name}::CreateControls()
{
////@begin ${class_name} content construction

	bool isLoadWizard =
			wxXmlResource::Get()->LoadObject(
					this,
					GetParent(),
					_T("ID_${class_name_upper}"),
					wxT("wxWizard")
			);

	if (!isLoadWizard) {
		wxLogError(wxT("Missing wxXmlResource::Get()->Load() in OnInit()?"));
	}

	for (wxWindowList::Node *node = GetChildren().GetFirst(); node; node = node->GetNext())
	{

		wxWizardPage *page = wxDynamicCast(node->GetData(), wxWizardPage);

		if (page)
		{
			GetPageAreaSizer()->Add(page);
		}

	}

////@end ${class_name} content construction

	// Create custom windows not generated automatically here.
////@begin ${class_name} content initialisation
////@end ${class_name} content initialisation
}

/*
 * Runs the wizard.
 */

bool ${class_name}::Run()
{
	wxWindowList::compatibility_iterator node = GetChildren().GetFirst();

	while (node) {
		wxWizardPage *startPage = wxDynamicCast(node->GetData(), wxWizardPage);

		if (startPage) {
			return RunWizard(startPage);
		}

		node = node->GetNext();
	}

	return false;
}

/*
 * Should we show tooltips?
 */

bool ${class_name}::ShowToolTips()
{
	return true;
}

/*
 * Get bitmap resources
 */

wxBitmap ${class_name}::GetBitmapResource(const wxString &name)
{
	// Bitmap retrieval
////@begin ${class_name} bitmap retrieval
	wxUnusedVar(name);
	return wxNullBitmap;
////@end ${class_name} bitmap retrieval
}

/*
 * Get icon resources
 */

wxIcon ${class_name}::GetIconResource(const wxString &name)
{
	// Icon retrieval
////@begin ${class_name} icon retrieval
	wxUnusedVar(name);
	return wxNullIcon;
////@end ${class_name} icon retrieval
}
