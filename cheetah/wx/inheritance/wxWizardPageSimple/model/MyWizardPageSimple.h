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
 * Forward declarations
 */

////@begin forward declarations
class ${class_name};
////@end forward declarations

/*!
 * Control identifiers
 */

////@begin control identifiers
\#define ID_${class_name_upper}_FIRST ${class_id}
//\#define ID_${class_name_upper}_SECOND ${class_id}
////@end control identifiers

/*!
 * ${class_name} class declaration
 */

class ${class_name}: public wxWizardPageSimple
{
    DECLARE_DYNAMIC_CLASS( ${class_name} )
    DECLARE_EVENT_TABLE()

public:
    /// Constructors
    ${class_name}();

    ${class_name}( wxWizard* parent );

    /// Creation
    bool Create( wxWizard* parent );

    /// Destructor
    ~${class_name}();

    /// Initialises member variables
    void Init();

    /// Creates the controls and sizers
    void CreateControls();

////@begin ${class_name} event handler declarations

////@end ${class_name} event handler declarations

////@begin ${class_name} member function declarations

    /// Retrieves bitmap resources
    wxBitmap GetBitmapResource( const wxString& name );

    /// Retrieves icon resources
    wxIcon GetIconResource( const wxString& name );
////@end ${class_name} member function declarations

    /// Should we show tooltips?
    static bool ShowToolTips();

////@begin ${class_name} member variables
////@end ${class_name} member variables
};

\#endif
