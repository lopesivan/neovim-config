\#ifndef ${define_name}
\#define ${define_name}

/*!
 * Includes
 */

////@begin includes
\#include "wx/xrc/xmlres.h"
\#include "wx/wizard.h"
////@end includes

/*!
 * Control identifiers
 */

////@begin control identifiers
\#define ID_${class_name_upper} ${class_id}
\#define SYMBOL_${class_name_upper}_IDNAME ID_${class_name_upper}
////@end control identifiers

/*!
 * ${class_name} class declaration
 */

class ${class_name}: public wxWizard {
	DECLARE_DYNAMIC_CLASS(${class_name})
	DECLARE_EVENT_TABLE()

public:
	/// Constructors
	${class_name}();
	${class_name}(wxWindow *parent, wxWindowID id = SYMBOL_${class_name_upper}_IDNAME, const wxPoint &pos = wxDefaultPosition);

	/// Creation
	bool Create(wxWindow *parent, wxWindowID id = SYMBOL_${class_name_upper}_IDNAME, const wxPoint &pos = wxDefaultPosition);

	/// Destructor
	~${class_name}();

	/// Initialises member variables
	void Init();

	/// Creates the controls and sizers
	void CreateControls();

////@begin ${class_name} event handler declarations

////@end ${class_name} event handler declarations

////@begin ${class_name} member function declarations

	/// Runs the wizard
	bool Run();

	/// Retrieves bitmap resources
	wxBitmap GetBitmapResource(const wxString &name);

	/// Retrieves icon resources
	wxIcon GetIconResource(const wxString &name);
////@end ${class_name} member function declarations

	/// Should we show tooltips?
	static bool ShowToolTips();

////@begin ${class_name} member variables
////@end ${class_name} member variables
};

\#endif
