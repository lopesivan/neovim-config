\#ifndef ${define_name}
\#define ${define_name}

/*!
 * Includes
 */

////@begin includes
\#include "wx/xrc/xmlres.h"
\#include "wx/image.h"
//\#include "MyWizard.h"
//\#include "WizardPage.h"
//\#include "WizardPage1.h"
////@end includes

/*!
 * ${class_name} class declaration
 */

class ${class_name}: public wxApp
{
    DECLARE_CLASS( ${class_name} )
    DECLARE_EVENT_TABLE()

public:
    /// Constructor
    ${class_name}();

    void Init();

    /// Initialises the application
    virtual bool OnInit();

    /// Called on exit
    virtual int OnExit();

////@begin ${class_name} event handler declarations

////@end ${class_name} event handler declarations

////@begin ${class_name} member function declarations

////@end ${class_name} member function declarations

////@begin ${class_name} member variables
////@end ${class_name} member variables
};

/*!
 * Application instance declaration
 */

////@begin declare app
DECLARE_APP(${class_name})
////@end declare app

\#endif
